Docker Multi Containers
=======================

Docker is a great tool, but you may find it painful if you work with complex applications that rely on multiple docker containers. You may have to deal with different docker image providers, who will deliver you their respective part of the application. About your part, you have to make the whole containers work together, and also to be able to upgrade and test easily a new release of only one provider. You may also be responsible of scheduling the containers start/stop, this means that you have to take care of containers dependency and start/stop sequences.
This tutorial will show up how you can deal with multiple containers management.

Pre-requisites
--------------

* OpenSVC service managing docker containers (As described in the `parent topic <virtualization.docker.html#installing-docker-as-an-opensvc-service>`_)
* We assume that the docker images are available (It means that you already have docker pulled your needed images, check `here <virtualization.docker.html#service-startup>`_ if you need help for that part)

Let's take an example and consider that we are responsible of hosting an application relying on 3 docker containers :

* busybox 
* shipyard/shipyard
* dhrp/sshd

Service Configuration File
--------------------------

::

        root@deb1:/opt/opensvc/etc# cat app.opensvc.com.env
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
        run_args = -v /opt/opensvc/var/app.opensvc.com/docker.sock:/docker.sock -p 8888:8000
        
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


We need to manage 3 containers to make our application working, so we declare 3 opensvc container objects, with ``docker`` type :

* **[container#1]** is a busybox container, and has to be the first container to be launched for our application. We just need to spawn /bin/sh in the container.
* **[container#2]** is the shipyard container and the second in sequence order. We have to present the docker socket inside the container (/opt/opensvc/var/app.opensvc.com/docker.sock will be available in the container as /docker.sock), and expose network ports (internal container port 8000 will be available on host port 8888)
* **[container#3]** is the dhrp/sshd and must be the last container to be started. We present a data volume inside the container, and expose ssh port to host port 42222.

Service Startup
---------------

**docker images are present in the local repository** ::

        root@deb1:/opt/opensvc/etc# app.opensvc.com docker images | grep latest
        busybox             latest              f66342b343ae        4 days ago          2.433 MB
        shipyard/shipyard   latest              30e0b59613ff        5 weeks ago         516.5 MB
        dhrp/sshd           latest              2bbfe079a942        11 months ago       321.8 MB
        
**OpenSVC print status** ::

        root@deb1:/opt/opensvc/etc# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/etc# app.opensvc.com start
        11:56:19 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        11:56:19 INFO    APP.OPENSVC.COM.IP#1    37.59.71.25 is already up on eth0
        11:56:19 INFO    APP.OPENSVC.COM.VG#1    vgapp is already up
        11:56:19 INFO    APP.OPENSVC.COM.FS#1    fs(/dev/mapper/vgapp-lvapproot /opt/app.opensvc.com) is already mounted
        11:56:19 INFO    APP.OPENSVC.COM.FS#2    fs(/dev/mapper/vgapp-lvappdata /opt/app.opensvc.com/appdata) is already mounted
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.1 f66342b343ae /bin/sh
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec715a7df33bc0bb36b8e65598e41d83d0b8919b717287b3ca9c9dae
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.2 -v /opt/opensvc/var/app.opensvc.com/docker.sock:/docker.sock -p 8888:8000 30e0b59613ff
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 output:
        cecf54c6c76977d7d8b5801803d270023023efcc9690860da56d6560a81800e6
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container operational
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.3 -v /opt/app.opensvc.com/vol1:/vol1:rw -p 42222:22 2bbfe079a942
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 output:
        c0a390acb80a2e42bb57da5a104dc23ec34955e2aec4ac3cf270399447f64c5f
        
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container up status
        11:56:19 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container operational

        root@deb1:/opt/opensvc/etc# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/etc# app.opensvc.com docker ps -a
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Exited (0) 38 seconds ago    37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Exited (0) 28 seconds ago   37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (0) 18 seconds ago                                app.opensvc.com.container.1

        root@deb1:/opt/opensvc/lib# app.opensvc.com startcontainer
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock start 2d4b80bdec71
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock start cecf54c6c769
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 output:
        cecf54c6c769
        
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container up status
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#2 wait for container operational
        13:56:29 INFO    APP.OPENSVC.COM.CONTAINER#3 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock start c0a390acb80a
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 output:
        c0a390acb80a
        
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container up status
        13:56:30 INFO    APP.OPENSVC.COM.CONTAINER#3 wait for container operational

        root@deb1:/opt/opensvc/lib# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS              PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 12 seconds       37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 12 seconds       37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Up 12 seconds                                    app.opensvc.com.container.1

One container
^^^^^^^^^^^^^

Like any other OpenSVC resource in the service configuration file, it is possible to manage it with its resource ID, by using the ``--rid resource_id`` option.

::

        root@deb1:/opt/opensvc/lib# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com stop --rid container#1
        14:07:05 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock stop 2d4b80bdec71
        14:07:15 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:07:15 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container down status

        root@deb1:/opt/opensvc/lib# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 10 minutes                37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 10 minutes                37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (-1) 12 seconds ago                                app.opensvc.com.container.1

        root@deb1:/opt/opensvc/lib# app.opensvc.com start --rid container#1
        14:07:45 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock start 2d4b80bdec71
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        14:07:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb1:/opt/opensvc/lib# app.opensvc.com print status
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

        root@deb1:/opt/opensvc/lib# app.opensvc.com stop --rid container#1
        14:27:35 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock stop 2d4b80bdec71
        14:27:45 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        2d4b80bdec71
        
        14:27:45 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container down status
        
**Pull the new docker image**::

        root@deb1:/opt/opensvc/lib# app.opensvc.com docker pull google/busybox
        Pulling repository google/busybox
        c8f0cfead624: Download complete
        511136ea3c5a: Download complete
        bd5d7a592a52: Download complete
        31ea9d8cd4b6: Download complete
        
        root@deb1:/opt/opensvc/lib# app.opensvc.com docker images | grep google
        google/busybox      latest              c8f0cfead624        2 weeks ago         2.491 MB

.. note:: The image is in the local repository, with image id c8f0cfead624. We need this image id to modify OpenSVC service configuration file.
        
**Remove the old container**::

        root@deb1:/opt/opensvc/lib# app.opensvc.com docker ps -a
        CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS                       PORTS                        NAMES
        c0a390acb80a        dhrp/sshd:latest           /usr/sbin/sshd -D     2 hours ago         Up 32 minutes                37.59.71.25:42222->22/tcp    app.opensvc.com.container.3
        cecf54c6c769        shipyard/shipyard:latest   /app/.docker/run.sh   2 hours ago         Up 32 minutes                37.59.71.25:8888->8000/tcp   app.opensvc.com.container.2
        2d4b80bdec71        busybox:latest             /bin/sh               2 hours ago         Exited (-1) 58 seconds ago                                app.opensvc.com.container.1
        
        root@deb1:/opt/opensvc/lib# app.opensvc.com docker rm 2d4b80bdec71
        2d4b80bdec71

.. note:: It could be a good idea to rename our container instead of delete it, for rollback purposes. At the beginning of June 2014, Docker doesn't support that, but it's on the roadmap.

**Modify OpenSVC configuration**::
        
        root@deb1:/opt/opensvc/etc# cp app.opensvc.com.env app.opensvc.com.cfgsave
        
        root@deb1:/opt/opensvc/etc# cat app.opensvc.com.cfgsave | sed -e 's/f66342b343ae/c8f0cfead624/' > app.opensvc.com.env

        root@deb1:/opt/opensvc/etc# grep -C2 c8f0cfead624 app.opensvc.com.env
        [container#1]
        type = docker
        run_image = c8f0cfead624
        run_command = /bin/sh

.. note:: We just have to change the ``run_image`` parameter to point to the new image to execute in the container
        
**Bring back service with new container**::

        root@deb1:/opt/opensvc/etc# app.opensvc.com start --rid container#1
        send /opt/opensvc/etc/app.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/app.opensvc.com.push timestamp ... OK
        14:32:25 INFO    APP.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/app.opensvc.com/docker.sock run -t -i -d --name=app.opensvc.com.container.1 c8f0cfead624 /bin/sh
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 output:
        dc32fbc0a6c7e1e4f981fef6444b50bb9b3add5103062b91a15716cd5396ee43
        
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container up status
        14:32:25 INFO    APP.OPENSVC.COM.CONTAINER#1 wait for container operational
        
        root@deb1:/opt/opensvc/etc# app.opensvc.com print status
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
