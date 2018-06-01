Cluster Backend Networks
************************

These networks are only required for services private ip auto-allocation. If configured, the cluster DNS helps expose the allocated ip addresses through predictible names, and the cluster Ingress Gateways help expose the services to clients outside the cluster.

OpenSVC relies on CNI for this subsytem. Any CNI plugin can be used. Plugins can have depdendencies, like etcd or consul, which OpenSVC does not use nor package. The weave plugin, having no such dependencies, is used in this documentation.

Install CNI
===========

From package
------------

Some distributions already ship CNI packages.

On Red Hat or CentOS 7, for example, CNI is served by the EPEL repositories ::

	# to activate epel repositories:
	# yum install -y epel-release

	yum install -y containernetworking-cni

Then tell OpenSVC where to find the CNI plugins and network configurations ::

	nodemgr set --kw cni.plugins=/usr/libexec/cni --kw cni.config=/var/lib/opensvc/cni/net.d

From upstream
-------------

::

	cd /tmp
	wget https://github.com/containernetworking/cni/releases/download/v0.6.0/cni-amd64-v0.6.0.tgz
	wget https://github.com/containernetworking/plugins/releases/download/v0.6.0/cni-plugins-amd64-v0.6.0.tgz
	sudo mkdir -p /opt/cni/bin
	cd  /opt/cni/bin
	tar xvf /tmp/cni-amd64-v0.6.0.tgz
	tar xvf /tmp/cni-plugins-amd64-v0.6.0.tgz
	mkdir -p /opt/cni/net.d

Here the plugins and network configurations directories are aligned with the OpenSVC defaults.


Plugins
=======

Example Local Bridge CNI configuration
--------------------------------------

Just for reference. Creating such a network is usually not necessary.

::

	cat > /opt/cni/net.d/cbr0.conf <<EOF
	{
	    "cniVersion": "0.2.0",
	    "name": "cbr0",
	    "type": "bridge",
	    "bridge": "cbr0",
	    "isGateway": true,
	    "ipMasq": true,
	    "ipam": {
		"type": "host-local",
		"subnet": "10.15.20.0/24",
		"routes": [
		    { "dst": "0.0.0.0/0" },
		    { "dst": "1.1.1.1/32", "gw":"10.15.20.1"}
		]
	    }
	}
	EOF

Install the weave plugin
------------------------

::

	curl -L git.io/weave -o /usr/local/bin/weave
	chmod a+x /usr/local/bin/weave

The weave plugins runs daemons packaged as docker images. Before proceeding to the next weave installation step, make sure the docker daemon is started at boot and disable MountFlags.
Also make sure the OpenSVC Cluster is configured and joined before the next step, for the ``cluster.nodes`` reference to be resolved.

In this example, the package install plugins and config directories are used. Please adapt those paths as required.

On each node ::

	sed -i s/^MountFlags=slave/#MountFlags=slave/ /lib/systemd/system/docker.service
	systemctl enable docker
	systemctl start docker

	weave setup
	weave launch $(nodemgr get --kw cluster.nodes)

	mkdir -p /var/lib/opensvc/cni/net.d/
	cat > /var/lib/opensvc/cni/net.d/weave.conf <<EOF
	{
	    "cniVersion": "0.2.0",
	    "name": "weave",
	    "type": "weave-net"
	}
	EOF

If CNI was installed from package, the weave plugin needs to be referenced in the package plugin dir::

	cd /usr/libexec/cni/
	ln -s /opt/cni/bin/weave-ipam weave-ipam
	ln -s /opt/cni/bin/weave-net weave-net


Use in service configurations
=============================

Here is a typical ip resource configuration, using the "weave" CNI network configured above.

::

	[ip#0]
	type = cni
	network = weave
	container_rid = container#0
	expose = 80/tcp

The container pointed by ``container_rid`` can be a docker or lxc container. ``container_rid`` can also be left empty, causing the weave ip address to be assigned to the service cgroup.

The ``expose`` keyword is optional. If set, a SRV record is served by the cluster DNS (in this example _http._tcp.<svcname>.<app>.svc.<clustername>). If mapped port is also defined, for example ``80:8001/tcp``, the portmap CNI plugin is used to configure the portmapping and expose the 80/tcp backend server on the 8001 port of the node public ip addresses.


