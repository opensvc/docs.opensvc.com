.. _agent.gobtw:

Cluster Ingress Gateway, GoBetween L4 Load Balancer
===================================================


This feature is not enabled by default.

Role
----

OpenSVC users can configure an integrated load balancing service to meet their application needs. 
Indeed, OpenSVC supports L4 load balancing by adding listening ports and linking target services.
Several ingress gateways can be running and GoBetween will create load balancer service for every OpenSVC ingress.

Implementation
--------------

GoBetween is rolled out in a Docker container with an inital configuration enabling API Rest demand.
A controller (The ``janitoring daemon``) is also rolled out in a Docker container, listening to server events producing load balancer configuration to be implemented by API Rest. 
OpenSVC events listened by the controller are either ingress create/update or remove (In a OpenSVC cluster, ingress is a bunch of routing rules that determine how users access services running).
And the controller generates load balancer configuration based on OpenSVC ingress information
In a nutshell:

* A failover service.
* The active instance runs a GoBetween load balancer process and a janitoring daemon.
* Each component runs as a privileged docker instance to have r/w access to the opensvc daemon unix socket. 
* The janitoring daemon is tied down with a Cluster DNS to be functional. (See ``Preliminary steps``)
* GoBetween build his backends list by querying the DNS servers and get those backends from SRV records.


Docker images
+++++++++++++

* yyyar/gobetween
* igw_gobetween

Configure
---------


Preliminary steps
+++++++++++++++++

See :ref:`agent.dns`


Deploy the GoBetween service
++++++++++++++++++++++++++++

Create the service::

	svcmgr create -s svc-gobtw \
                --config http://www.opensvc.com/init/static/templates/svc-gobtw.conf \
                --provision 
                

Unfreeze the service::

	svcmgr unfreeze -s svc-gobtw


Expose services
+++++++++++++++

Service exposition through this ingress gateway is controlled through ``env`` section keywords. Most keywords are optional.

General
*******

* igw_gobtw_bind::

	addr default=0.0.0.0, port default=<auto_alloc>

* igw_gobtw_balance::

	The policy used by gobetween to select a backend slot to handle a new connection.
	``weight`` is the default balance policy.
	You can also configure to :
		iphash : Target backend will be calculated using hash function of client ip address mod backends count.
		leastconn : GoBetween will select backends with least connections to it. 
		roundrobin : Each new connection will be proxies to next backend in the backends pool successively. 
		leastbandwidth : Backends with least sum of rx/tx per second traffic will be selected for next request.

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

	default : SRV (This discovery method uses DNS lookup to build backends list)

* igw_gobtw_discovery_srv_dns_protocol::

	default : tcp

* igw_gobtw_discovery_srv_lookup_server::

	ip default=<from get_node_config> & port default=53

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

Test with this service::

	svcmgr create -s svcweb \
                --config http://www.opensvc.com/init/static/templates/svcweb.conf \
                --provision

Verify the barrel of backends
+++++++++++++++++++++++++++++

::

	dig _http._tcp.svcweb.default.svc.cluster7 SRV @192.168.100.29 -p 5300
	dig _https._tcp.svcweb.default.svc.cluster7 SRV @192.168.100.29 -p 5300
	
	(with the correct DNS)


Verify the logs
+++++++++++++++

::

	docker logs svc-gobtw.container.1 -f


Verify GoBetween configuration
++++++++++++++++++++++++++++++

::

	python 
	
	>>> import requests
	>>> requests.get("http://192.168.100.32:8888/servers").json()
	
	(with the correct GoBetween addr/port)
