Docker Multi Containers
=======================

Docker is a great tool, but you may find it painful if you work with complex applications that rely on multiple docker containers. You may have to deal with different docker image providers, who will deliver you their respective part of the application. You have to make all containers work together, and to be able to upgrade and test easily a new release of only one provider. You may also be responsible of scheduling the containers start and stop, meaning that you have to take care of containers dependencies during start and stop operations.

This tutorial explains how you can ease multiple container management using the OpenSVC infrastructure.

Pre-requisites
--------------

* OpenSVC service managing docker containers (As described in the `parent topic <agent.service.container.docker.html#installing-docker-as-an-opensvc-service>`_)
* We assume that the docker images are available (It means that you already have docker pulled your needed images, check `here <agent.service.container.docker.html#service-startup>`_ if you need help for that part)

Let's take an example and consider that we are responsible for hosting an application relying on 3 docker containers :

* busybox 
* shipyard/shipyard
* dhrp/sshd

Service Configuration File
--------------------------

::

        root@deb1:/# svcmgr -s app.opensvc.com print config
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        docker_data_dir = /opt/app.opensvc.com/appdata
        docker_daemon_args = --ip 37.59.71.25
        
        [container#1]
        type = docker
        run_image = f66342b343ae
        run_command = /bin/sh
        
        [container#2]
        type = docker
        run_image = 30e0b59613ff
        run_args = -v /var/lib/opensvc/app.opensvc.com/docker.sock:/docker.sock -p 8888:8000
        
        [container#3]
        type = docker
        run_image = 2bbfe079a942
        run_args = -v /opt/app.opensvc.com/vol1:/vol1:rw -p 42222:22
        
        [ip#1]
        ipdev = eth0
        ipname = app.opensvc.com
        
        [vg#1]
        vgname = vgapp
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/app.opensvc.com
        dev = /dev/mapper/vgapp-lvapproot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/app.opensvc.com/appdata
        dev = /dev/mapper/vgapp-lvappdata
        type = ext4


We need to manage 3 containers to make this application working, so we declare 3 opensvc ``docker``-type container resources:

* **[container#1]** is a busybox container, and has to be launched first for our application. We just need to spawn /bin/sh in the container.
* **[container#2]** is the shipyard container and is second in the startup sequencing. We have to present the docker socket inside the container (``<OSVCVAR>/app.opensvc.com/docker.sock`` will be available in the container as /docker.sock), and expose network ports (internal container port 8000 will be available on host port 8888)
* **[container#3]** is the dhrp/sshd and must be the last container to start. We present a data volume inside the container, and expose ssh port to host port 42222.

Service Startup
---------------

**docker images are present in the local repository** ::

        root@deb1:/# svcmgr -s app.opensvc.com docker images | grep latest
        busybox             latest              f66342b343ae        4 days ago          2.433 MB
        shipyard/shipyard   latest              30e0b59613ff        5 weeks ago         516.5 MB
        dhrp/sshd           latest              2bbfe079a942        11 months ago       321.8 MB
        
**OpenSVC print status** ::

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     busybox:latest
        |  |  |                            # can not find container id
        |  |- container#2    .... down     shipyard/shipyard:latest
        |  |  |                            # can not find container id
        |  |- container#3    .... down     dhrp/sshd:latest
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

.. note:: As containers were never started, OpenSVC agent complains about missing container id.

**run the containers** ::

        root@deb1:/# svcmgr -s app.opensvc.com start
        11:56:19 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        11:56:19 INFO    APP.OPENSVC.COM.IP#1    37.59.71.25 is already up on eth0
        11:56:19 INFO    APP.OPENSVC.COM.VG#1    vgapp is already up
        11:56:19 INFO    APP.OPENSVC.COM.FS#1    fs(/dev/mapper/vgapp-lvapproot /opt/app.opensvc.com) is already mounted
        11:56:19 INFO    APP.OPENSVC.COM.FS#2    fs(/dev/mapper/vgapp-lvappdata /opt/app.opensvc.com/appdata) is already mounted
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.1 f66342b343ae /bin/sh
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec715a7df33bc0bb36b8e65598e41d83d0b8919b717287b3ca9c9dae
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.2 -v /var/lib/opensvc/app.opensvc.com/docker.sock:/docker.sock -p 8888:8000 30e0b59613ff
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 output:
        cecf54c6c76977d7d8b5801803d270023023efcc9690860da56d6560a81800e6
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container operational
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.3 -v /opt/app.opensvc.com/vol1:/vol1:rw -p 42222:22 2bbfe079a942
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 output:
        c0a390acb80a2e42bb57da5a104dc23ec34955e2aec4ac3cf270399447f64c5f
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container operational

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       2d4b80bdec71@busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

.. note:: OpenSVC agent start containers in sequence. Please note timestamps : docker's efficiency associated with OpenSVC allow the start/stop of complex environments in a few seconds.

**Querying docker daemon about containers** ::

        root@deb1:/# svcmgr -s app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS              PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     34 seconds ago      Up 33 seconds       37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   34 seconds ago      Up 33 seconds       37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               34 seconds ago      Up 33 seconds                                    app.opensvc.com.container.1

.. note:: We see that our containers are running as expected, and networks ports are bound to the OpenSVC service IP address


Containers Management
---------------------

All containers
^^^^^^^^^^^^^^

It is possible to manage containers together, either start or stop, by using the ``startcontainer`` or ``stopcontainer`` OpenSVC keywords.

::

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- container#2    .... down     30e0b59613ff
        |  |  |                            # docker daemon is not running
        |  |- container#3    .... down     2bbfe079a942
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# svcmgr -s app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Exited (0) 38 seconds ago    37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Exited (0) 28 seconds ago   37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (0) 18 seconds ago                                app.opensvc.com.container.1

        root@deb1:/# svcmgr -s app.opensvc.com startcontainer
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock start 2d4b80bdec71
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock start cecf54c6c769
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 output:
        cecf54c6c769
        
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container up status
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container operational
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#3 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock start c0a390acb80a
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 output:
        c0a390acb80a
        
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container up status
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container operational

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       2d4b80bdec71@busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# svcmgr -s app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS              PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 12 seconds       37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 12 seconds       37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Up 12 seconds                                    app.opensvc.com.container.1

One container
^^^^^^^^^^^^^

Like any other OpenSVC resource in the service configuration file, it is possible to manage it with its resource ID, by using the ``--rid <resource_id>`` option.

::

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       2d4b80bdec71@busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# svcmgr -s app.opensvc.com stop --rid container#1
        14:07:05 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock stop 2d4b80bdec71
        14:07:15 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:07:15 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container down status

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     2d4b80bdec71@busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# svcmgr -s app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 10 minutes                37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 10 minutes                37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (-1) 12 seconds ago                                app.opensvc.com.container.1

        root@deb1:/# svcmgr -s app.opensvc.com start --rid container#1
        14:07:45 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock start 2d4b80bdec71
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       2d4b80bdec71@busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a


Container Upgrade
^^^^^^^^^^^^^^^^^

Let's consider that you have to change from official image busybox/latest to google/busybox, which simulate the fact that someone provide you a new version of docker image to run instead of the old one, the steps would be :

**Stop the container to upgrade**::

        root@deb1:/# svcmgr -s app.opensvc.com stop --rid container#1
        14:27:35 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock stop 2d4b80bdec71
        14:27:45 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:27:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container down status
        
**Pull the new docker image**::

        root@deb1:/# svcmgr -s app.opensvc.com docker pull google/busybox
        Pulling repository google/busybox
        c8f0cfead624: Download complete
        511136ea3c5a: Download complete
        bd5d7a592a52: Download complete
        31ea9d8cd4b6: Download complete
        
        root@deb1:/# svcmgr -s app.opensvc.com docker images | grep google
        google/busybox      latest              c8f0cfead624        2 weeks ago         2.491 MB

.. note:: The image is in the local repository, with image id c8f0cfead624. We need this image id to modify OpenSVC service configuration file.
        
**Remove the old container**::

        root@deb1:/# svcmgr -s app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 32 minutes                37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 32 minutes                37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (-1) 58 seconds ago                                app.opensvc.com.container.1
        
        root@deb1:/# svcmgr -s app.opensvc.com docker rm 2d4b80bdec71
        2d4b80bdec71

.. note:: It could be a good idea to rename our container instead of delete it, for rollback purposes. At the beginning of June 2014, Docker doesn't support that, but it's on the roadmap.

**Modify OpenSVC configuration**::
        
        root@deb1:/# cd /etc/opensvc && cp app.opensvc.com.env app.opensvc.com.cfgsave
        
        root@deb1:/# cat app.opensvc.com.cfgsave | sed -e 's/f66342b343ae/c8f0cfead624/' > app.opensvc.com.env

        root@deb1:/# grep -C2 c8f0cfead624 app.opensvc.com.env
        [container#1]
        type = docker
        run_image = c8f0cfead624
        run_command = /bin/sh

.. note:: We just have to change the ``run_image`` parameter to point to the new image to execute in the container
        
**Bring back service with new container**::

        root@deb1:/# svcmgr -s app.opensvc.com start --rid container#1
        send /etc/opensvc/app.opensvc.com.env to collector ... OK
        update /var/lib/opensvc/app.opensvc.com.push timestamp ... OK
        14:32:25 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///var/lib/opensvc/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.1 c8f0cfead624 /bin/sh
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        dc32fbc0a6c7e1e4f981fef6444b50bb9b3add5103062b91a15716cd5396ee43
        
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        
        root@deb1:/# svcmgr -s app.opensvc.com print status
        app.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       dc32fbc0a6c7@google/busybox:latest
        |  |- container#2    .... up       cecf54c6c769@shipyard/shipyard:latest
        |  |- container#3    .... up       c0a390acb80a@dhrp/sshd:latest
        |  |- vg#1           .... up       vgapp
        |  |- fs#1           .... up       /dev/mapper/vgapp-lvapproot@/opt/app.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgapp-lvappdata@/opt/app.opensvc.com/appdata
        |  '- ip#1           .... up       app.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

Complex Orchestration
---------------------

When implementing applications as Docker containers, you may be constrained to organize container startup in a specific order, because it's the way your application works. Another kind of problem is that you may need to start multiple containers in parrallel instead of sequentially. OpenSVC agent is developped to support those specific constraints. 

The following example is a dummy application made of :

* 1 database server : this container have to be started first, and stopped at the very end.
* 4 application servers : those containers have to be started in parrallel, and just after the database server.
* 2 webservers : last to be launched, just after the appservers.

Considering that it is an example, all containers will depend on image id b073e328878e, which corresponds to docker public image ``opensvc/busybox:date``

.. note:: if one of the container meet start failure issue, the overall service rollback and stop

OpenSVC Syntax
^^^^^^^^^^^^^^

The method to implement such a modelization rely on 2 configuration tricks:

* tag container resource in container subsets::

        subset = 01appservers

* optionaly declare a parallel start on a per subset basis::

        [subset#container.docker:01appservers]
        parallel = true

Subsets are processed in alphanumerical order. We recommend prefixing the subset name with a 2-digits number, to improve configuration readability.

Example
^^^^^^^

Let's have a look at our dummy application service configuration file

::

        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        docker_data_dir = /opt/busybox.opensvc.com/appdata
        docker_daemon_args = --ip 37.59.71.25
        
        [container#1]
        type = docker
        run_image = b073e328878e
        subset = 00database
        
        [container#2]
        type = docker
        run_image = b073e328878e
        subset = 01appservers
        
        [container#3]
        type = docker
        run_image = b073e328878e
        subset = 01appservers
        
        [container#4]
        type = docker
        run_image = b073e328878e
        subset = 01appservers
        
        [container#5]
        type = docker
        run_image = b073e328878e
        subset = 01appservers
        
        [subset#container.docker:01appservers]
        parallel = true
        
        [container#6]
        type = docker
        run_image = b073e328878e
        subset = 02webservers
        
        [container#7]
        type = docker
        run_image = b073e328878e
        subset = 02webservers
        
        [subset#container.docker:02webservers]
        parallel = false
        
        [ip#1]
        ipdev = eth0
        ipname = busybox.opensvc.com
        
        [vg#1]
        vgname = vgbusybox
        scsireserv = false
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/busybox.opensvc.com
        dev = /dev/mapper/vgbusybox-lvbusyboxroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/busybox.opensvc.com/appdata
        dev = /dev/mapper/vgbusybox-lvbusyboxdata
        type = ext4


Service startup
^^^^^^^^^^^^^^^

Actions are processed in the following order

* ip/vg/fs start
* subset 00database start
* subset 01appservers parallel start
* subset 02webservers sequential start

::

        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#2    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#3    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#4    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#5    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#6    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- container#7    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgbusybox
        |  |- fs#1           .... down     /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... down     busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# busybox.opensvc.com start
        09:10:18 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        09:10:21 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.25 netmask 255.255.255.224 up
        09:10:21 INFO    BUSYBOX.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.25 37.59.71.25
        09:10:21 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --addtag @deb1.opensvc.com vgbusybox
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          Volume group "vgbusybox" successfully changed
        
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a y vgbusybox
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          2 logical volume(s) in volume group "vgbusybox" now active
        
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxroot
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgbusybox-lvbusyboxroot: clean, 13/65536 files, 12637/262144 blocks
        
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vgbusybox-lvbusyboxroot /opt/busybox.opensvc.com
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxdata
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    output:
        /dev/mapper/vgbusybox-lvbusyboxdata: clean, 656/65536 files, 25170/262144 blocks
        
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vgbusybox-lvbusyboxdata /opt/busybox.opensvc.com/appdata
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 starting docker daemon
        09:10:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock -r=false -d -g /opt/busybox.opensvc.com/appdata -p /var/lib/opensvc/busybox.opensvc.com/docker.pid --ip 37.59.71.25
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start b82cf3232b79
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 output:
        b82cf3232b79
        
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container up status
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container operational
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 action start started in child process 23635
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 action start started in child process 23636
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 action start started in child process 23638
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 action start started in child process 23640
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 185751ce205b
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 6212757a24c6
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 68b2e591147a
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 7e0f85484429
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 output:
        185751ce205b
        
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 output:
        6212757a24c6
        
        09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container operational
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 output:
        68b2e591147a
        
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container operational
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 output:
        7e0f85484429
        
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container operational
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container operational
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 6b82e882acf0
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 output:
        6b82e882acf0
        
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container operational
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start a825bb126088
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 output:
        a825bb126088
        
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container up status
        09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container operational

        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
        |  |- container#2    .... up       7e0f85484429@opensvc/busybox:date
        |  |- container#3    .... up       185751ce205b@opensvc/busybox:date
        |  |- container#4    .... up       6212757a24c6@opensvc/busybox:date
        |  |- container#5    .... up       68b2e591147a@opensvc/busybox:date
        |  |- container#6    .... up       6b82e882acf0@opensvc/busybox:date
        |  |- container#7    .... up       a825bb126088@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a


Service stop
^^^^^^^^^^^^

Actions are processed in the following order

* subset 02webservers sequential stop
* subset 01appservers parallel stop
* subset 00database stop
* ip/vg/fs stop

::

        root@deb1:/# busybox.opensvc.com stop
        09:10:40 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop a825bb126088
        09:10:50 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 output:
        a825bb126088
        
        09:10:50 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container down status
        09:10:51 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 6b82e882acf0
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 output:
        6b82e882acf0
        
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container down status
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 action stop started in child process 27048
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 action stop started in child process 27049
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 action stop started in child process 27051
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 action stop started in child process 27052
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 185751ce205b
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 6212757a24c6
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 7e0f85484429
        09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 68b2e591147a
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 output:
        7e0f85484429
        
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container down status
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 output:
        185751ce205b
        
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container down status
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 output:
        68b2e591147a
        
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container down status
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 output:
        6212757a24c6
        
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container down status
        09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop b82cf3232b79
        09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 output:
        b82cf3232b79
        
        09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container down status
        09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 no more container handled by docker daemon. shut it down
        09:11:21 INFO    BUSYBOX.OPENSVC.COM.FS#2    umount /opt/busybox.opensvc.com/appdata
        09:11:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    umount /opt/busybox.opensvc.com
        09:11:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --deltag @deb1.opensvc.com vgbusybox
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          Volume group "vgbusybox" successfully changed
        
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxdata
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxroot
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a n vgbusybox
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          0 logical volume(s) in volume group "vgbusybox" now active
        
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 down
        09:11:23 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
