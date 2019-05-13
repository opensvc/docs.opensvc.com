.. _agent.cni:

Cluster Backend Networks
************************

These networks are only required for services private ip auto-allocation. If configured, the cluster DNS exposes the allocated ip addresses as predictible names, and the cluster Ingress Gateways or portmapping can expose the services to clients outside the cluster.

OpenSVC relies on CNI for this subsystem. Any CNI plugin can be used but some plugins can have dependencies like etcd or consul, which OpenSVC does not require for himself. The bridge and weave plugin, having no such dependencies, are simpler to setup.

Install CNI
===========

From package
------------

Some distributions ship CNI packages.

On Red Hat or CentOS 7, for example, CNI is served by the EPEL repositories ::

	# to activate epel repositories:
	# yum install -y epel-release

	yum install -y containernetworking-cni

Then tell OpenSVC where to find the CNI plugins and network configurations ::

	om cluster set --kw cni.plugins=/usr/libexec/cni --kw cni.config=/var/lib/opensvc/cni/net.d

From upstream
-------------

::

	cd /tmp
	wget https://github.com/containernetworking/cni/releases/download/v0.6.0/cni-amd64-v0.6.0.tgz
	wget https://github.com/containernetworking/plugins/releases/download/v0.6.0/cni-plugins-amd64-v0.6.0.tgz
	sudo mkdir -p /opt/cni/bin
	cd  /opt/cni/bin
	sudo tar xvf /tmp/cni-amd64-v0.6.0.tgz
	sudo tar xvf /tmp/cni-plugins-amd64-v0.6.0.tgz
	sudo mkdir -p /opt/cni/net.d

Here the plugins and network configurations directories are aligned with the OpenSVC defaults.


Configure networks
==================

Networks are declared in the OpenSVC node or cluster configuration.

The agent create the CNI configuration files as needed.

Local Bridge
------------

A local bridge network is always present and named ``default``.

To create another network of this type, named ``local1``, available on every cluster node ::

	$ om cluster set --kw network#local1.type=bridge --kw network#local1.network=10.10.10.0/24

To create another network of this type, named ``local1``, available on the current cluster node only::

	$ om node set --kw network#local1.type=bridge --kw network#local1.network=10.10.10.0/24

Routed Bridge
-------------

This network type split the subnet into per-node segments. Trafic is routed from node-to-node via static routes to each segment, and ipip tunnels are created if necessary.

The simple bridge CNI plugin is used for IPAM and plumbing in network namespaces, and OpenSVC is responsible for node-to-node routing and tunneling.

To create a network of this type, named ``backend1``, spanned on every cluster node ::

	$ om cluster set --kw network#backend1.type=routed_bridge \
	                 --kw network#backend1.network=10.11.0.0/16 \
	                 --kw network#backend1.ips_per_node=1024

In this example, the network is split like:

* node 1 : 10.11.0.0/22
* node 2 : 10.11.4.0/22
* node 3 : 10.11.8.0/22
* ...

Tunnel endpoints addresses are guessed using a lookup of the nodenames. Different addresses can be setup if necessary, using::

	$ om cluster set --kw network#backend1.addr@node1=1.2.3.4 \
	                 --kw network#backend1.addr@node2=1.2.3.5 \
	                 --kw network#backend1.addr@node3=1.2.4.4

Some hosting providers, like OVH, don't support static network routes from node to node, even if they have an ip address in a common subnet. For this situation, you can force OpenSVC to always use tunnels for this backend network::

	$ om cluster set --kw network#backend1.tunnel=always

Weave
-----

On each node::

	sudo curl -L git.io/weave -o /usr/local/bin/weave
	sudo chmod a+x /usr/local/bin/weave

The weave plugins runs daemons packaged as docker images. Before proceeding to the next weave installation step, make sure the docker daemon is started at boot and disable MountFlags.
Also make sure the OpenSVC Cluster is configured and joined before the next step, for the ``cluster.nodes`` reference to be resolved.

In this example, the package install plugins and config directories are used. Please adapt those paths as required.

On each node::

	sudo sed -i s/^MountFlags=slave/#MountFlags=slave/ /lib/systemd/system/docker.service
	sudo systemctl enable docker
	sudo systemctl start docker

	sudo weave setup
	sudo weave launch $(sudo nodemgr get --kw cluster.nodes)

If CNI was installed from package, the weave plugin needs to be referenced in the package plugin dir::

	cd /usr/libexec/cni/
	sudo ln -s /opt/cni/bin/weave-ipam weave-ipam
	sudo ln -s /opt/cni/bin/weave-net weave-net

Finally declare the network::

	$ om cluster set --kw network#weave1.type=weave --kw network#weave1.network=10.32.0.0/12

Use in service configurations
=============================

Here is a typical ip resource configuration, using the "weave" CNI network configured above.

::

	[ip#0]
	type = cni
	network = weave1
	netns = container#0
	expose = 80/tcp

The container pointed by ``netns`` can be a docker or lxc container. ``netns`` can also be left empty, causing the weave ip address to be assigned to the service cgroup.

The ``expose`` keyword is optional. If set, a SRV record is served by the cluster DNS (in this example _http._tcp.<svcname>.<namespace>.svc.<clustername>). If ``expose`` is set to portmapping expression, for example ``80:8001/tcp``, the portmap CNI plugin is will configure the portmapping and expose the 80/tcp backend server on the 8001 port of the node public ip addresses.

Useful commands
===============

List networks::

	# om net ls
	default
	lo
	backend2
	backend

Show networks status::

	# om net status
	name         type           network       size   used  free   pct    
	|- backend   routed_bridge  10.40.0.0/16  65536  4     65532  0.01%  
	|- backend2  routed_bridge  10.41.0.0/16  65536  1     65535  0.00%  
	|- default   bridge         10.22.0.0/16  65536  0     65536  0.00%  
	`- lo        loopback       127.0.0.1/32  1      0     1      0.00%  

Show a network detailled status::

	# om net status --verbose --name backend
	name                 type           network             size      used  free   pct    
	`- backend           routed_bridge  10.40.0.0/16        65536     4     65532  0.01%  
	   `- ip             node           service             resource  
	      |- 10.40.0.10  c1n1           testbackend/svc/s1  ip#0      
	      |- 10.40.12.7  c2n2           testbackend/svc/s4  ip#0      
	      |- 10.40.4.9   c1n2           testbackend/svc/s2  ip#0      
	      `- 10.40.8.7   c2n1           testbackend/svc/s3  ip#0      

