.. _agent.gobtw:

Cluster Ingress Gateway, GoBetween L4 Load Balancer
===================================================

This feature is not enabled by default.

Role
----

Services with ip addresses allocated on cluster backend networks are exposable either through portmapping or through an ingress gateway.

The GoBetween ingress gateway is a L4 load-balancer configured by a OpenSVC-specific daemon to expose services through a public ip address.

Several ingress gateways can be running on the same cluster, and services can choose which gateway they want to be exposed through.

Implementation
--------------

* A failover service. The active instance runs a GoBetween load balancer process and a janitoring daemon.
* The GoBetween daemon is run as a docker container with an inital configuration enabling the Rest API.
* The janitoring daemon, also run as a docker container, listens to cluster events on the opensvc daemon unix socket (bind-mounted in the container) and configures the load balancer servers through the GoBetween Rest API.
* The janitorinf daemon docker instance runs "privileged" to have r/w access to the opensvc daemon unix socket. 
* The janitoring daemon depends on the Cluster DNS, as the servers backends are deduced from SRV records.

Docker images
+++++++++++++

* yyyar/gobetween
* opensvc/igw_gobetween

Configure
---------

Preliminary steps
+++++++++++++++++

See :ref:`agent.dns`


Deploy the GoBetween service
++++++++++++++++++++++++++++

Create the service using the following command. Change the ``--env`` options as appropriate::

	$ svcmgr create -s ogwl4 \
		--config http://www.opensvc.com/init/static/templates/ogwl4.conf \
		--provision \
		--env public_interface=br-prd \
		--env public_ipaddr=192.168.100.32 \
		--env public_netmask=24

Unfreeze the service::

	$ svcmgr unfreeze -s ogwl4


Expose services
+++++++++++++++

The :kw:`expose` ip resources keyword must be set for the cluster DNS to serve the necessary SRV records.

Service exposition through this ingress gateway is controlled through ``env`` section keywords. Most keywords are optional.

General
*******

* igw_gobtw_bind::

	required to configure lb servers.
	<exposed_port>-<addr>:<port> [<exposed_port>-<addr>:<port> ...]
	addr default=0.0.0.0, port default=*
	* = allocated automatically from a predefined range (1024-65535)

* igw_gobtw_target_lb::

	[<hostname> ...]
	optional (default : None)
	If set to a list of ingress gateway hostnames, only those gateways handle the binded servers.
	If not set, all gateways handle the binded servers.

* igw_gobtw_balance::

	the policy used by gobetween to select a backend slot to handle a new connection.
	'weight' is the default balance policy.
	you can also configure to :
		iphash : target backend will be calculated using hash function of client ip address mod backends count.
		leastconn : GoBetween will select backends with least connections to it. 
		roundrobin : each new connection will be proxies to next backend in the backends pool successively. 
		leastbandwidth : backends with least sum of rx/tx per second traffic will be selected for next request.

* igw_gobtw_protocol::

	default protocol for gobetween is tcp.

* igw_gobtw_max_connections::

	default : 0

* igw_gobtw_client_idle_timeout::

	default : 0

* igw_gobtw_backend_idle_timeout::

	default : 0

* igw_gobtw_sni::

	optional (default : None)
	
* igw_gobtw_proxy_protocol::

	optional (default : None)

* igw_gobtw_tls::

	required if protocol == "tls" (default : None)

* igw_gobtw_backends_tls::

	optional : backends tls options (if present -- connect to backends through tls) (default : None)

* igw_gobtw_udp::

	optional and only if protocol == "udp"  (default : None)

* igw_gobtw_access::

	optional (default : None)

Discovery
*********

The janitor forces GoBetween services backend discovery driver to SRV. The OpenSVC cluster DNS maintains the SRV recordsets up-to-date.

* igw_gobtw_discovery_kind::

	default : SRV (this discovery method uses DNS lookup to build backends list)

* igw_gobtw_discovery_srv_dns_protocol::

	default : tcp

* igw_gobtw_discovery_srv_lookup_server::

	ip default=<from get_node_config> & port default=53
        use the keyword 'dns_port' in the env section to change the default port.

* igw_gobtw_discovery_srv_lookup_pattern::

	auto configured by default

* igw_gobtw_discovery_failpolicy::

	optional : keeplast or setempty - what to do with backends if discovery fails
	default : keeplast

* igw_gobtw_discovery_interval::

	backends cache invalidation interval; 0 means never.
	default : 0

* igw_gobtw_discovery_timeout::

	optional : max time to wait for discover until falling to failpolicy
	default : 0

Healthchecks
************

Healthchecks are used for determine service status of backend nodes pool
If there are no healthcheck server section defined - backend nodes marked as "ok" can be deleted from backend according to discovery rules and intervals

* igw_gobtw_healthcheck_kind::

	ping : check connection to backend nodes by initiate new connection from GoBetween side to each backend node from discovery list. 

* igw_gobtw_healthcheck_interval::

	default : 2s

* igw_gobtw_healthcheck_timeout::

	max time for script to execute until mark as failed (this value should be lower than interval)
	default for ping : 500ms

* igw_gobtw_healthcheck_fails::
	
	optional
	default : 1

* igw_gobtw_healthcheck_passes::

	optional
	default : 1


Verify
------

Create a load-balanced service
++++++++++++++++++++++++++++++

Test with this simple scaler service::

	$ svcmgr create -s svcweb \
		--config http://www.opensvc.com/init/static/templates/svcweb.conf \
		--provision

	$ svcmgr -s svcweb unfreeze

	$ svcmgr scale -s ogwl4 --to 4

Verify the SRV record
+++++++++++++++++++++

This service exposes 80/tcp to DNS through the following directive

::

	$ svcmgr -s svcweb print config
	...
	[ip#1]
	expose = 80/tcp

	$ dig _http._tcp.svcweb.default.svc.cluster7 SRV @192.168.100.29 -p 5300
	
Adapt the DNS ip address for your context.

Verify the load-balanced server
+++++++++++++++++++++++++++++++

This service is exposed through the ogwl4 load-balancer port 1024::

	$ svcmgr -s svcweb print config
	...
	[env]
	igw_gobtw_bind = 80/tcp-0.0.0.0:1024 443/tcp

	$ wget -O- http://192.168.100.32:1024/


Verify the logs
+++++++++++++++

::

	$ docker logs ogwl4.container.0
	$ docker logs ogwl4.container.1


Verify GoBetween configuration
++++++++++++++++++++++++++++++

::

	$ python 
	>>> import requests
	>>> requests.get("http://192.168.100.32:8888/servers").json()
	
Adapt the GoBetween ip address and port for your context.

