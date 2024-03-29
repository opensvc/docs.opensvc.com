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
* The janitoring daemon, also run as a docker container, listens to cluster events on the opensvc daemon unix socket (bind-mounted in the container) and serves the Clusters, Listeners, Routes, Endpoints and Secrets (certs) configurations to Envoy through the GRPC API on 127.0.0.1:50051 (default).
* The janitoring daemon docker instance runs "privileged" to have r/w access to the opensvc daemon unix socket. 

Docker images
+++++++++++++

* envoyproxy/envoy-alpine
* ghcr.io/opensvc/igw_envoy

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

	$ om system/svc/envoy deploy \
		--config http://www.opensvc.com/init/static/templates/envoy-br-hostns.conf \
		--env public_interface=br-prd \
		--env public_ipaddr=192.168.100.32 \
		--env public_netmask=24

Ipvlan public ip::

	$ om system/svc/envoy deploy \
		--config http://www.opensvc.com/init/static/templates/envoy-ipvlan.conf \
		--env public_interface=eth0 \
		--env public_ipaddr=192.168.100.32 \
		--env public_netmask=24

Also deploy a server.pem and server.key in ``{svcname}-data`` volume root. These autogenerated certificate and key will be used in the following examples.

Prepare certificates
++++++++++++++++++++

The janitor SDS relays certificates data from OpenSVC secrets to envoy. The secret keys looked up by the janitor are:

* certificate_chain
* private_key

Create a secret to host a certificate data:

::

	om test/sec/cert1 create
	om test/sec/cert1 add --key private_key --from ~/certs/cert1.key
	om test/sec/cert1 add --key certificate_chain --from ~/certs/cert1.chain.pem

Extra keys are disregarded by the janitor but might be useful to retain extra data

::

	om test/sec/cert1 add --key certificate_signing_request --from ~/certs/cert1.csr
	om test/sec/cert1 add --key certificate --from ~/certs/cert1.crt


Updates to the OpenSVC secrets are propagated as soon as possible.

::

	om test/sec/cert1 add --key certificate_chain --from ~/certs/newer.cert1.chain.pem

Users can setup operators to update the certificates data in the OpenSVC secrets (using ACME for example).
A service account is necessary to provide access to the OpenSVC API from the operator service.

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
   agent.templates/template.service.hash_policy.envoy
   agent.templates/template.service.certificate.tls

Janitor arguments
+++++++++++++++++

::

	$ ./xds --help
	Usage: xds [options]

	Options:
	  -h, --help            show this help message and exit
	  -n GATEWAY_NAME, --name=GATEWAY_NAME
				The name of this gateway, can be used by services to
				specify one of multiple available gateways. default
				envoy
	  -p PORT, --port=PORT  The xds listener port. default 50051
	  -P ENVOY_PORT, --envoy-port=ENVOY_PORT
				The xds envoy client listener port. default 9901
	  -r PORT_RANGE, --port-range=PORT_RANGE
				The port range the xds allocates new ports from. Some
				hosting providers may allow a restricted range.
				default [1025, 65536]
	  -S OSOCK, --socket=OSOCK
				The OpenSVC daemon unix socket path. default
				/var/lib/opensvc/lsnr/osvcd.sock
	  --janitor-socket=JSOCK
				The janitor gRPC unix socket path. default
				unix:///var/run/xds/xds.sock
	  -w MAX_WORKERS, --max-workers=MAX_WORKERS
				The maximum number of workers. default 256

Verify
------

Create a load-balanced service
++++++++++++++++++++++++++++++

Test with this simple scaler service::

	$ om test/svc/web1 deploy \
		--config http://www.opensvc.com/init/static/templates/svcweb.conf

Add a L4 expose for port 80::

	$ om test/svc/web1 set \
	    --kw ip#1.expose="expose#0" \
	    --kw expose#0.type=envoy \
	    --kw expose#0.listener_port=8080 \
	    --kw expose#0.port=80

Create a certificate for client connections and a certificate for backend connections::

	$ om test/sec/web1-front-cert create
	$ om test/sec/web1-front-cert set --kw cn=web1
	$ om test/sec/web1-front-cert gen cert

	$ om test/sec/web1-back-cert create
	$ om test/sec/web1-back-cert set --kw cn=web1
	$ om test/sec/web1-back-cert gen cert

Add a certificate for upstream and downstream encryption::

	$ om test/svc/web1 set \
	    --kw certificate#front.secret=web1-front-cert \
	    --kw certificate#back.secret=web1-back-cert

Add a L7 expose for port 443, with TLS SNI match::

	$ om test/svc/web1 set \
	    --kw expose#1.type=envoy \
	    --kw expose#1.listener_port=443 \
	    --kw expose#1.port=443 \
	    --kw expose#1.sni=svcweb.acme.org \
	    --kw expose#1.listener_certificates=certificate#front \
	    --kw expose#1.cluster_certificates=certificate#back \
	    --kw ip#1.expose+="expose#1"

Add a L7 expose for port 443, with url domain and path match::

	$ om test/svc/web1 set \
	    --kw ip#1.expose+="expose#1" \
	    --kw expose#1.type=envoy \
	    --kw expose#1.listener_addr=0.0.0.0 \
	    --kw expose#1.listener_port=443 \
	    --kw expose#1.port=443 \
	    --kw expose#1.vhosts=vhost#0 \
	    --kw expose#1.listener_certificates=certificate#front \
	    --kw expose#1.cluster_certificates=certificate#back \
	    --kw vhost#0.domains=alt-svcweb.acme.org \
	    --kw vhost#0.routes="route#0 route#1" \
	    --kw route#0.match_prefix=/realtime/generic \
	    --kw route#0.route_use_websocket=true \
	    --kw route#1.match_prefix=/

Finally, scale the service to start a bunch of application backend listeners::

	$ om test/svc/web1 scale --to 4


Verify the load-balanced server
+++++++++++++++++++++++++++++++

Before testing, make sure the svcweb.acme.org and alt-svcweb.acme.org point to the ingress gateway listener address from the testing device.

::

	$ wget -O- http://svcweb.acme.org:8080
	$ wget -O- --no-check-certificate https://svcweb.acme.org
	$ wget -O- --no-check-certificate https://alt-svcweb.acme.org


Verify the logs
+++++++++++++++

::

	$ om system/svc/envoy docker logs {container#1}
	$ om system/svc/envoy docker logs {container#2}


Verify the Envoy configuration
++++++++++++++++++++++++++++++

::

	$ python -c "import requests; print requests.get(\"http://192.168.100.32:9901/config_dump\").json()"
	
Adapt the Envoy ip address and port for your context.

