Docker Hosting
==============

If you are engaged in Docker at an enterprise scale level, you may have faced challenges like:

* I have to host multiple instances of an application (for Production, Test, Dev, Integration, ...)
* I have to host multiple applications for different clients on the same cluster.
* I would like all those application instances to be isolated, to avoid common docker components ops or issues affecting them all.
* How do I implement security between Docker environments ?

OpenSVC service provides the desired segregation.

.. figure:: _static/docker.multiple.instances.png
   :align:  center

This tutorial explains these segregation capabilities.

Pre-requisites
--------------

* OpenSVC agent installed (As described in the `parent topic <agent.service.container.docker.html>`_)

Services Creation
-----------------

Let's create 6 OpenSVC services, one for each applications named app1 and app2, and each environment named dev, int and prd.

We'll format the namespace name as <app>-<env>, and all services name will be svc1.

::

	$ for appli in app1 app2 ; do for env in dev int prd ; do svcmgr create -s $appli-$env/svc1 ; done ; done

	$ svcmon -s 'app[12]-*/*' --sections services
	Services                      aubergine nuc-cva
	 app1-dev/svc1 n/a failover | /*               
	 app1-int/svc1 n/a failover | /*               
	 app1-prd/svc1 n/a failover | /*               
	 app2-dev/svc1 n/a failover | /*               
	 app2-int/svc1 n/a failover | /*               
	 app2-prd/svc1 n/a failover | /*

Services Configuration
----------------------

We now have 6 **empty** services.

Although it is not mandatory, we tag services with their environment (DEV/INT/PRD)::

	$ om 'app[12]-dev/*' set --kw env=DEV
	$ om 'app[12]-int/*' set --kw env=INT
	$ om 'app[12]-prd/*' set --kw env=PRD

And with their application code::

	$ om 'app1-*/*' set --kw app=APP1
	$ om 'app2-*/*' set --kw app=APP2

As we want to highlight to maximum segragation, we will setup the services to start their own private docker daemon.
This configuration is achieved by specifying an alternate docker's data folder with the ``DEFAULT.docker_data_dir`` keyword.

::

	$ om 'app*-*/*' set --kw docker_data_dir=/srv/{svcpath}/docker
        
.. note:: Be sure to use a different ``docker_data_dir`` for each service. Here {svcpath} for service svc1 of app1 in prd environment is evaluated as ``app1-prd/svc1``, so the docker data directory for this service is ``/srv/app1-prd/svc1/docker``.

Then, we can add a simple container

::

	$ om 'app*-*/*' set --kw container#0.type=docker --kw container#0.image=google/pause


.. note:: Naturally, you can setup more useful services, like multiple docker containers in the same service (`Docker Multi Containers <https://docs.opensvc.com/agent.service.container.docker.multi_containers.html>`_), or even combining resources types in a service (like a service modelized with 1 docker container, 2 lxc containers, 3 kvm containers, 4 lvm volumes groups, 5 filesystems, hosted on a netapp filer with snapmirror data replication)

At this point the ``app1-prd/svc1`` service configuration looks like

::

	$ om 'app1-prd/svc1' print config
	[DEFAULT]
	id = 1ed0b4b5-d576-4e4d-8e46-1e714b5cded5
	env = PRD
	app = APP1
	docker_data_dir = /srv/{svcpath}/docker

	[container#0]
	type = docker
	image = google/pause

And the services now have a frozen-stopped status

::

	$ svcmon -s 'app[12]-*/*' --sections services
	Services                       aubergine nuc-cva
	 app1-dev/svc1 down failover | X*               
	 app1-int/svc1 down failover | X*               
	 app1-prd/svc1 down failover | X*               
	 app2-dev/svc1 down failover | X*               
	 app2-int/svc1 down failover | X*               
	 app2-prd/svc1 down failover | X*  

Service Management
------------------

We prefix docker commands with OpenSVC service name so as to be sure that we are in the private docker context, and not in the system's docker context:

* OpenSVC will start Docker daemon listening on a private unix socket
* When prefixing docker client commands with service name, OpenSVC will add the docker -H option, to connect to the correct unix socket
* We always ensure that logs in ``<OSVCLOG>`` and stdout outputs the real docker commands, so it is easy to reproduce and troubleshoot if anything goes wrong.

Start the services
^^^^^^^^^^^^^^^^^^

::

	$ om 'app*-*/*' start
	aubergine.svc1             service app1-dev/svc1 target state set to started
	aubergine.svc1             service app1-int/svc1 target state set to started
	aubergine.svc1             service app1-prd/svc1 target state set to started
	aubergine.svc1             service app2-dev/svc1 target state set to started
	aubergine.svc1             service app2-int/svc1 target state set to started
	aubergine.svc1             service app2-prd/svc1 target state set to started

A few seconds later, the services are up and running

::

	$ svcmon -s 'app[12]-*/*' --sections services
	Services                     aubergine nuc-cva
	 app1-dev/svc1 up failover | O^               
	 app1-int/svc1 up failover | O^               
	 app1-prd/svc1 up failover | O^               
	 app2-dev/svc1 up failover | O^               
	 app2-int/svc1 up failover | O^               
	 app2-prd/svc1 up failover | O^

The google/pause image is installed in all private docker data directories

::

	$ om 'app*-*/*' docker images
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	google/pause        latest              f9d5de079539        4 years ago         240kB

6 docker environments are running on the same system, with docker data repositories fully segregated.

Service Instance Status
^^^^^^^^^^^^^^^^^^^^^^^

::

	$ om 'app1-prd/svc1' print status
	svc1                             up                                                                  
	`- instances            
	   `- aubergine                  up         idle, started        
	      `- container#0    ........ up         docker container app1-prd..svc1.container.0@google/pause

Service Instance Stop
^^^^^^^^^^^^^^^^^^^^^

::

	$ om 'app1-prd/svc1' stop --local
	aubergine.svc1.container#0   docker -H unix:///opt/opensvc/var/namespaces/app1-prd/services/svc1/docker.sock stop e427aacd0c7571a5e37248b2e40ae90a601fad61f0a71ea9ff0da16bc3b1a6f0
	aubergine.svc1.container#0   output:
	aubergine.svc1.container#0   e427aacd0c7571a5e37248b2e40ae90a601fad61f0a71ea9ff0da16bc3b1a6f0
	aubergine.svc1               no more container handled by docker daemon (pid 10743). shut it down
	aubergine.svc1.container#0   wait for down status

.. note:: OpenSVC shuts down the private docker daemon when it is no longer needed.

Service Instance Start
^^^^^^^^^^^^^^^^^^^^^^

::

	$ om 'app1-prd/svc1' start --local
	aubergine.svc1               starting docker daemon
	aubergine.svc1               dockerd -H unix:///opt/opensvc/var/namespaces/app1-prd/services/svc1/docker.sock --data-root /srv/app1-prd/svc1/docker -p /opt/opensvc/var/namespaces/app1-prd/services/svc1/docker.pid --exec-root /opt/opensvc/var/dockerx/1ed0b4b5-d576-4e4d-8e46-1e714b5cded5 --exec-opt native.cgroupdriver=cgroupfs
	aubergine.svc1.container#0   docker -H unix:///opt/opensvc/var/namespaces/app1-prd/services/svc1/docker.sock start e427aacd0c7571a5e37248b2e40ae90a601fad61f0a71ea9ff0da16bc3b1a6f0
	aubergine.svc1.container#0   output:
	aubergine.svc1.container#0   e427aacd0c7571a5e37248b2e40ae90a601fad61f0a71ea9ff0da16bc3b1a6f0
	aubergine.svc1.container#0   wait for up status
	aubergine.svc1.container#0   wait for container operational

::

	$ om 'app1-prd/svc1' docker ps
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	e427aacd0c75        google/pause        "/pause"            9 minutes ago       Up 45 seconds                           app1-prd..svc1.container.0

.. note:: OpenSVC explicitely tag the container with "<namespace>..<svcname>.container.<resource index>", So even in a shared docker daemon, the container names would not clash.

Tenency and Security
^^^^^^^^^^^^^^^^^^^^

If you are concerned about security, like assigning app1 to team1, and app2 to team2, just remember how docker client and daemon are connecting together: a unix socket is used.
So you just have to:

* Create unix groups team1 and team2
* Change app1 sockets group owner to team1 => ``chgrp team1 /var/lib/opensvc/namespaces/app1-*/services/svc1/docker.sock``
* Change app2 sockets group owner to team2 => ``chgrp team2 /var/lib/opensvc/namespaces/app2-*/services/svc1/docker.sock``
* Assign users to the group

As default socket permissions are ``srw-rw----  root docker``, they will be changed to ``srw-rw----  root team1``. This way, only root or team1 members will be able to connect to team1 docker environments.

