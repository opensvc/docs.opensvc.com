.. _agent.dns:

Cluster Domain Name Server
==========================

The agent daemon can act as a remote backend for PowerDNS, serving dynamic records for the services deployed. This is most interesting when services get their ip addresses on private backends with internal IPAM.

If set up, when the agent starts a container, it sets up its resolver (dns and search) so they make use of the internal name server.

This feature is not enabled by default.

Records
-------

* One A record ``<hostname>.<svcname>.<namespace>.svc.<clustername>`` for each resource embedding an ip address and a hostname in its "info".
* One round-robin A record for ``<svcname>.<namespace>.svc.<clustername>``. Each resource embedding an ip address in its "info" gets a slot in the RR.
* One SRV record for ``_<service>._<protocol>.<svcname>.<namespace>.svc.<clustername>``. Each resource with an expose keyword matching ``<service>`` and ``<port>`` gets a slot in the RR.

.. note:: A service created in no specific namespace gets a "root" namespace value.

Implementation
--------------

* A farmed (flex) service.
* Each instance runs an authoritative PowerDNS server, a PowerDNS recursor and a recursor cache janitoring daemon.
* Each component runs as a privileged docker instance to have r/w access to shared unix domain sockets.
* The DNS server and recursor share the node network namespace.
* The PowerDNS server uses the dns thread of the OpenSVC daemon as a remote backend. Communications go through the ``<var>/dns/pdns.sock`` unix domain socket.

Docker images
+++++++++++++

* opensvc/pdns_server
* opensvc/pdns_recursor
* opensvc/pdns_janitor

Configure
---------

Preliminary steps
+++++++++++++++++

* Make sure the node configuration :kw:`cluster.name` is set to a meaningful, unique site-wide, value. It can be a fqdn like ``cluster1.my.org``, or just a basename like ``cluster1``.
* Choose at least 2 cluster nodes that will act as DNS backends.
* Choose a free port for the DNS to listen on (default is ``5300``).
* Identify the ip addresses you want the DNS to listen on (public or private). In the following examples, ``192.168.100.11`` and ``192.168.100.14``.
* Make sure these ip addresses are resolved to the node name as declared in the :kw:`cluster.nodes` keyword (edit /etc/hosts if necessary).
* Make sure docker is installed and running on selected dns nodes.
* Make sure you have access to pull from docker.io on selected dns nodes (you can pre-pull or save/load the images if not).

Declare DNS backends
++++++++++++++++++++

On every cluster node::

	nodemgr set --kw cluster.dns+=192.168.100.11 --kw cluster.dns+=192.168.100.14

Deploy the DNS service
++++++++++++++++++++++

On the default port (5300)::

	svcmgr deploy -s odns \
		--config http://www.opensvc.com/init/static/templates/odns.conf

Or on a custom port (1216)::

	svcmgr deploy -s odns \
		--config http://www.opensvc.com/init/static/templates/odns.conf \
		--env port=1216

Unfreeze the service::

	svcmgr unfreeze -s odns

.. note:: Set ``--allow-from=<cidr>,<cidr>`` to the recursor run_args to allow subnets not trusted by default (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16).

Verify
------

Verify the backend
++++++++++++++++++

::

	nodemgr dns dump

::

	echo '{"method": "lookup", "parameters": {"qname": "cluster1.", "qtype": "SOA"}}' | socat - /var/lib/opensvc/dns/pdns.sock

	{"result": [{"ttl": 60, "qname": "cluster1.", "qtype": "SOA", "domain_id": -1, "content": "dns.cluster1. contact@opensvc.com 1 7200 3600 432000 86400"}]}

Verify the DNS authoritative server
+++++++++++++++++++++++++++++++++++

::

	dig +short cluster1. SOA @192.168.100.11 -p 5300

Verify the DNS recursor
+++++++++++++++++++++++

::

	dig +short cluster1. SOA @192.168.100.11

Dump the zone contents asking DNS
+++++++++++++++++++++++++++++++++

::

	dig +noall +answer cluster1. AXFR @192.168.100.11 -p 5300

Dump the zone contents asking agent socket
++++++++++++++++++++++++++++++++++++++++++

Same as ``nodemgr dns dump``

::

	echo '{"method": "list", "parameters": {"zonename": "cluster1."}}' | sudo socat - unix://var/lib/opensvc/dns/pdns.sock | jq

Administration
--------------

Add forwarding for the reverse zones
++++++++++++++++++++++++++++++++++++

Either switch to ``--forward-zones-file`` or add new elements to ``forward-zones``. In the later case, a ``env`` section key can help keeping the container resource definition reusable.

Example for the default weave network 10.32.0.0/12::

	[container#1]
	type = docker
	image = opensvc/pdns_recursor:latest
	netns = host
	userns = host
	privileged = true
	rm = true
	run_args = -v {var}/services/{svcname}/run:/var/run:rw
	run_command = --daemon=no --disable-syslog=yes --loglevel=9 --disable-packetcache=yes --max-cache-ttl=60 --max-negative-ttl=60 --local-port=53 --udp-truncation-threshold=4096 --local-address={dns[0]},{dns[1]} --non-local-bind --forward-zones={clustername}={env.dns_set},{env.rev_forward}

	[env]
	server_port = 5300
	dns_set = {dns[0]}:{env.server_port};{dns[1]}:{env.server_port}
	rev_forward = 32.10.in-addr.arpa={env.dns_set},33.10.in-addr.arpa={env.dns_set},34.10.in-addr.arpa={env.dns_set},35.10.in-addr.arpa={env.dns_set},36.10.in-addr.arpa={env.dns_set},37.10.in-addr.arpa={env.dns_set},38.10.in-addr.arpa={env.dns_set},39.10.in-addr.arpa={env.dns_set},40.10.in-addr.arpa={env.dns_set},41.10.in-addr.arpa={env.dns_set},42.10.in-addr.arpa={env.dns_set},43.10.in-addr.arpa={env.dns_set},44.10.in-addr.arpa={env.dns_set},45.10.in-addr.arpa={env.dns_set},46.10.in-addr.arpa={env.dns_set},47.10.in-addr.arpa={env.dns_set}

