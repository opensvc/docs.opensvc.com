.. _agent.envoy:

Cluster Ingress Gateway, Envoy L4/L7 Load Balancer
==================================================

This feature is not enabled by default.

Role
----

Services with ip addresses allocated on cluster backend networks are exposable either through portmapping or through an ingress gateway.

The Envoy ingress gateway is a Layer 4 and Layer 7 load-balancer configured by a OpenSVC janitoring daemon to expose services through public ip addresses binded by the gateway.

Several ingress gateways can be running on the same cluster, and services can choose which gateway they want to be exposed through.

Implementation
--------------

* A failover service. The active instance runs a Envoy load balancer process and a janitoring daemon.
* The Envoy daemon is run as a docker container with an inital configuration enabling its GRPC API on 127.0.0.1:9901 (default) and pointing the janitoring daemon as a xDS.
* The janitoring daemon, also run as a docker container, listens to cluster events on the opensvc daemon unix socket (bind-mounted in the container) and serves the Listeners, Routes and Endpoints configurations to Envoy through the GRPC API on 127.0.0.1:50051 (default).
* The janitoring daemon docker instance runs "privileged" to have r/w access to the opensvc daemon unix socket. 

Docker images
+++++++++++++

* envoyproxy/envoy-alpine
* opensvc/igw_envoy

Configure
---------

Preliminary steps
+++++++++++++++++

* :ref:`agent.dns`
* :ref:`agent.cni`


Deploy the Envoy service
++++++++++++++++++++++++

Create the service using one the following template. Change the ``--env`` options as appropriate.

Public ip on bridge::

	$ svcmgr create -s envoy \
		--config http://www.opensvc.com/init/static/templates/envoy-br.conf \
		--provision \
		--env public_interface=br-prd \
		--env public_ipaddr=192.168.100.32 \
		--env public_netmask=24

Ipvlan public ip::

	$ svcmgr create -s envoy \
		--config http://www.opensvc.com/init/static/templates/envoy-ipvlan.conf \
		--provision \
		--env public_interface=eth0 \
		--env public_ipaddr=192.168.100.32 \
		--env public_netmask=24

Finaly, unfreeze the service::

	$ svcmgr unfreeze -s envoy


Expose services
+++++++++++++++

The :kw:`expose` ip resources keyword must be set to a list of expose section names.

An expose section describes the public listener and, for L7, can reference vhost sections.

A vhost section can reference route sections.

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.expose.envoy
   agent.templates/template.service.vhost.envoy
   agent.templates/template.service.route.envoy
   agent.templates/template.service.certificate.tls

Verify
------

Create a load-balanced service
++++++++++++++++++++++++++++++

Test with this simple scaler service::

	$ svcmgr create -s svcweb \
		--config http://www.opensvc.com/init/static/templates/svcweb.conf \
		--provision

	$ svcmgr -s svcweb unfreeze

	$ svcmgr -s svcweb unset --kw env.igw_gobtw_target_lb

Add a L4 expose for port 80::

	$ svcmgr -s svcweb set \
	    --kw ip#1.expose="expose#0" \
	    --kw expose#0.type=envoy \
	    --kw expose#0.listener_addr=0.0.0.0 \
	    --kw expose#0.listener_port=8080 \
	    --kw expose#0.port=80

Add a certificate for upstream and downstream encryption::

	$ svcmgr -s svcweb set \
	    --kw certificate#1.type=tls \
	    --kw certificate#1.certificate_chain_filename=/etc/envoy/server.pem \
	    --kw certificate#1.private_key_filename=/etc/envoy/server.key

Add a L7 expose for port 443, with TLS SNI match::

	$ svcmgr -s svcweb set \
	    --kw ip#1.expose+="expose#1" \
	    --kw expose#1.type=envoy \
	    --kw expose#1.listener_addr=0.0.0.0 \
	    --kw expose#1.listener_port=443 \
	    --kw expose#1.port=443 \
	    --kw expose#1.sni=svcweb.acme.org \
	    --kw expose#1.listener_certificates=certificate#1 \
	    --kw expose#1.cluster_certificates=certificate#1

Add a L7 expose for port 443, with url domain and path match::

	$ svcmgr -s svcweb set \
	    --kw ip#1.expose+="expose#1" \
	    --kw expose#1.type=envoy \
	    --kw expose#1.listener_addr=0.0.0.0 \
	    --kw expose#1.listener_port=443 \
	    --kw expose#1.port=443 \
	    --kw expose#1.vhosts=vhost#0 \
	    --kw expose#1.listener_certificates=certificate#1 \
	    --kw expose#1.cluster_certificates=certificate#1
	    --kw vhost#0.domains=alt-svcweb.acme.org \
	    --kw vhost#0.routes="route#0 route#1" \
	    --kw route#0.match_prefix=/realtime/generic \
	    --kw route#0.route_use_websocket=true \
	    --kw route#1.match_prefix=/

Finaly, scale to service to start a bunch of application listeners::

	$ svcmgr scale -s svcweb --to 4

For testing, make sure the svcweb.acme.org and alt-svcweb.acme.org point to the ingress gateway listener address on the testing device.


Verify the load-balanced server
+++++++++++++++++++++++++++++++

This service is exposed through the envoy load-balancer port 1024::

	$ svcmgr -s svcweb print config
	...
	[env]
	igw_gobtw_bind = 80/tcp-0.0.0.0:1024 443/tcp

	$ wget -O- http://192.168.100.32:1024/


Verify the logs
+++++++++++++++

::

	$ svcmgr -s envoy docker logs {container#1}
	$ svcmgr -s envoy docker logs {container#2}


Verify the Envoy configuration
++++++++++++++++++++++++++++++

::

	$ python -c "import requests; print requests.get(\"http://192.168.100.32:9901/config_dump\").json()"
	
Adapt the Envoy ip address and port for your context.

