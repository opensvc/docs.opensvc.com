.. _agent.dns:

Cluster Domain Name Server
==========================

The agent daemon can act as a remote backend for PowerDNS, serving dynamic records for the services deployed. This is most interesting when services get their ip addresses on private backends with internal IPAM.

If set up, when the agent starts a container, it sets up its resolver (dns and search) so they make use of the internal name server.

This feature is not enabled by default.

Records
-------

* One A record for each resource with an expose keyword (80/tcp)
* One round-robin A record for <svcname>.<app>.svc.<clustername>. Each resource with an expose keyword (80/tcp) gets a slot in the RR.
* One SRV record for _<service>._<protocol>.<svcname>.<app>.svc.<clustername>. Each resource with an expose keyword matching <service> and <port> gets a slot in the RR.

Configure
---------

Preliminary steps
+++++++++++++++++

* Make sure the cluster.name is set to a meaningful, unique site-wide, value. It can be a fqdn like cluster1.my.org, or just a basename like cluster1.
* Choose at least 2 cluster nodes that will act as DNS backends.
* Choose a free port for the DNS to listen on (default is 1215).
* Note their ip address you want the DNS to listen on (public or private).
* Make sure these ip addresses are resolved to the nodename as declared in the cluster.nodes keyword (edit /etc/hosts if necessary).
* Make sure docker is installed and running on selected dns nodes
* Make sure you have access to pull from docker.io on selected dns nodes (you can pre-pull the gbolo/powerdns:4.0.0-rc2 for example)

Declare DNS backends
++++++++++++++++++++

::

	nodemgr set --kw cluster.dns+=192.168.100.11 --kw cluster.dns+=192.168.100.13

Deploy the DNS service
++++++++++++++++++++++

On the default port (1215)::

	svcmgr create -s opensvc-dns \
		--config http://www.opensvc.com/init/static/templates/opensvc-dns.conf \
		--provision

Or on a custom port (1216)::

	svcmgr create -s opensvc-dns \
		--config http://www.opensvc.com/init/static/templates/opensvc-dns.conf \
		--provision \
		--env port=1216

Unfreeze the service::

	svcmgr unfreeze -s opensvc-dns

Configure dnsmasq
+++++++++++++++++

Deploy the following configuration in ``/etc/dnsmasq.d/opensvc.conf``::

	server=/cluster1./192.168.100.11#1215
	server=/cluster1./192.168.100.13#1215
	server=192.168.121.1
	except-interface=weave
	except-interface=docker0
	bind-interfaces
	all-servers
	edns-packet-max=4096
	#log-queries

Replace server=192.168.121.1 with your own upstream DNS or remove and let dnsmasq use /etc/resolv.conf to provide the information.

::

	systemctl restart dnsmasq

Configure the resolver
++++++++++++++++++++++

This step is optional.

::

	$ cat /etc/resolv.conf 
	search default.svc.cluster1 svc.cluster1
	nameserver 127.0.0.1
	nameserver 192.168.121.1


Verify
------

Verify the backend
++++++++++++++++++

::

	echo '{"method": "lookup", "parameters": {"qname": "default.svc.cluster1.", "qtype": "SOA"}}' | socat - /var/lib/opensvc/dns/pdns.sock

	{"result": [{"ttl": 60, "qname": "default.svc.cluster1.", "qtype": "SOA", "domain_id": -1, "content": "dns.cluster1. contact@opensvc.com 1 7200 3600 432000 86400"}]}

Verify the DNS
++++++++++++++

::

	dig +short default.svc.cluster1. SOA @192.168.100.11 -p 1215

Verify dnsmasq
++++++++++++++

::

	dig +short default.svc.cluster1. SOA

