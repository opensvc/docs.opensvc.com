Docker Multiple Instances
=========================

If you are engaged in Docker at an enterprise scale level, you may have problems like:

* My docker based application is working fine but I'd like to have multiple environments of an application, like Production, Test, Dev, Integration, ...
* I would like all those environments to be segmented, so as to avoid common docker layers dependencies between multiple environments. I definitively want to segregate, especially to be able to safely test modifications while production is running
* I know that 5 more projects are currently looking at Docker, and I will certainly have to host them on the same physical host.
* How do I implement security between Docker environments ?

To solve those constraints, the OpenSVC approach is a good solution because Docker in OpenSVC service naturally provides environments segregation. As there is no limit on service count a single host, you can **stack segregated docker environments**, like described in the picture below.

.. figure:: _static/docker.multiple.instances.png
   :align:  center

This tutorial explains how you can setup multiple docker environments on the same host.

Pre-requisites
--------------

* OpenSVC agent installed (As described in the `parent topic <agent.service.container.docker.html>`_)

Services Creation
-----------------

We create 6 OpenSVC services, 2 applications named app1 and app2, each declined in Development, Integration and Production environments.

::

        root@deb1:/# for appli in app1 app2
        > do
        > for env in dev int prd
        > do
        > echo --- creating opensvc service $appli.$env ---
        > svcmgr create -s $appli.$env
        > done
        > done
        --- creating opensvc service app1.dev ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com
        --- creating opensvc service app1.int ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com
        --- creating opensvc service app1.prd ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com
        --- creating opensvc service app2.dev ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com
        --- creating opensvc service app2.int ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com
        --- creating opensvc service app2.prd ---
        Implicitely add [DEFAULT] mode = hosted
        Implicitely add [DEFAULT] service_type = DEV
        Implicitely add [DEFAULT] nodes = deb1.opensvc.com
        Implicitely add [DEFAULT] autostart_node = deb1.opensvc.com

Service monitor command reports our 6 new services. We can see that services are tagged as "TST" by default::

        root@deb1:/# svcmon
        service  service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name     type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------  ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        app1.dev TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app1.int TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app1.prd TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.dev TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.int TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.prd TST     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False

Services Configuration
----------------------

Although it is not mandatory, we tag services to fit their real usage (DEV/INT/PRD)::

        root@deb1:/# ls -l /etc/opensvc/*env
        -rw-r--r-- 1 root root 188 juin  20 14:54 app1.dev.env
        -rw-r--r-- 1 root root 188 juin  20 14:55 app1.int.env
        -rw-r--r-- 1 root root 188 juin  20 14:55 app1.prd.env
        -rw-r--r-- 1 root root 188 juin  20 14:42 app2.dev.env
        -rw-r--r-- 1 root root 188 juin  20 14:42 app2.int.env
        -rw-r--r-- 1 root root 188 juin  20 14:42 app2.prd.env
        
        root@deb1:/# grep service_type /etc/opensvc/*.env
        app1.dev.env:service_type = DEV
        app1.int.env:service_type = INT
        app1.prd.env:service_type = PRD
        app2.dev.env:service_type = DEV
        app2.int.env:service_type = INT
        app2.prd.env:service_type = PRD

        root@deb1:/# svcmon
        service  service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name     type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------  ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        app1.dev DEV     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app1.int INT     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app1.prd PRD     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.dev DEV     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.int INT     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        app2.prd PRD     hosted    n/a       n/a       n/a        n/a        n/a        n/a        n/a       n/a       n/a        n/a        False
        
We have 6 **empty** services at the moment, it's time to describe the service purposes.
As we want to manage Docker containers, we need to specify docker's data folder with ``docker_data_dir`` keyword in the ``[DEFAULT]`` configuration section.
This parameter will be passed to the docker daemon option '-g' (instead of using the default /var/lib/docker)

::

        root@deb1:/# grep docker_data_dir /etc/opensvc/*.env
        app1.dev.env:docker_data_dir = /opt/app1.dev
        app1.int.env:docker_data_dir = /opt/app1.int
        app1.prd.env:docker_data_dir = /opt/app1.prd
        app2.dev.env:docker_data_dir = /opt/app2.dev
        app2.int.env:docker_data_dir = /opt/app2.int
        app2.prd.env:docker_data_dir = /opt/app2.prd
        
.. warning:: Be sure to use a different ``docker_data_dir`` for each service (we want to segregate docker datas !)

We also have to specify that we want the service to manage docker container. 
This tutorial is voluntary simple, and use 1 docker container per service, but you can implement complex schemes, like multiple docker containers in the same service (`Docker Multi Containers <http://docs.opensvc.com/agent.service.container.docker.multi_containers.html>`_), or even combining resources types in a service (like a service modelized with 1 docker container, 2 lxc containers, 3 kvm containers, 4 lvm volumes groups, 5 filesystems, hosted on a netapp filer with snapmirror data replication)

We can declare a docker container using the syntax below::

        [container#1]
        type = docker
        run_image = b073e328878e
        run_command = /bin/bash
        # run_args =

.. note:: **run_image** is mandatory. **run_command & run_args** are optional.
        
This makes the ``app1.dev`` service config file look like ::

        [DEFAULT]
        service_type = DEV
        autostart_node = deb1.opensvc.com
        nodes = deb1.opensvc.com
        mode = hosted
        docker_data_dir = /opt/app1.dev
        
        [container#1]
        type = docker
        run_image = 37fca75d01ff
        run_command = /bin/bash

We setup the services exactly as just described so as they run the following images, taken from `official docker hub registry <https://registry.hub.docker.com/>`_

+--------------+--------------+-----------------------------+
| Service Name |   Image ID   |           Comment           |
+--------------+--------------+-----------------------------+
|   app1.dev   | e54ca5efa2e9 | Ubuntu 14.04                |
+--------------+--------------+-----------------------------+
|   app1.int   | 463ff6be4238 | Ubuntu 13.04                |
+--------------+--------------+-----------------------------+
|   app1.prd   | ebe4be4dd427 | Ubuntu 12.04                |
+--------------+--------------+-----------------------------+
|   app2.dev   | a9eb17255234 | Busybox latest              |
+--------------+--------------+-----------------------------+
|   app2.int   | d200959a3e91 | Busybox buildroot-2013.08.1 |
+--------------+--------------+-----------------------------+
|   app2.prd   | fd5373b3d938 | Busybox ubuntu-12.04        |
+--------------+--------------+-----------------------------+

.. note:: at this point, you must have completed 6 OpenSVC service configuration files

Service Management
------------------

We prefix docker commands with OpenSVC service name so as to be sure that we are in the accurate docker environment:

* OpenSVC will start Docker daemon and create a socket special file for docker client calls
* When prefixing docker client commands with service name, OpenSVC will add the docker -H option, to connect to the correct socket file
* We always ensure that logs in ``<OSVCLOG>`` and stdout outputs the real unix commands. This way it is very easy to troubleshoot if anything goes wrong.

Populate local docker repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For each docker environment, we pull the expected image.

app1.dev::

        root@deb1:/# svcmgr -s app1.dev docker pull ubuntu:14.04
        Pulling repository ubuntu
        e54ca5efa2e9: Download complete
        511136ea3c5a: Download complete
        d7ac5e4f1812: Download complete
        2f4b4d6a4a06: Download complete
        83ff768040a0: Download complete
        6c37f792ddac: Download complete

        root@deb1:/# svcmgr -s app1.dev docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        ubuntu              14.04               e54ca5efa2e9        38 hours ago        276.5 MB

app1.int::

        root@deb1:/# svcmgr -s app1.int docker pull ubuntu:13.04
        Pulling repository ubuntu
        463ff6be4238: Download complete
        511136ea3c5a: Download complete
        3af9d794ad07: Download complete
        b7c6da90134e: Download complete
        47dd6d11a49f: Download complete

        root@deb1:/# svcmgr -s app1.int docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        ubuntu              13.04               463ff6be4238        38 hours ago        169.4 MB

app1.prd::

        root@deb1:/# svcmgr -s app1.prd docker pull ubuntu:12.04
        Pulling repository ubuntu
        ebe4be4dd427: Download complete
        511136ea3c5a: Download complete
        4d289a435341: Download complete
        994db1cb2425: Download complete
        f86a812b1308: Download complete
        0b628db0b664: Download complete
        
        root@deb1:/# svcmgr -s app1.prd docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        ubuntu              12.04               ebe4be4dd427        38 hours ago        210.6 MB

app2.dev::

        root@deb1:/# svcmgr -s app2.dev docker pull busybox:latest
        Pulling repository busybox
        a9eb17255234: Download complete
        511136ea3c5a: Download complete
        42eed7f1bf2a: Download complete
        120e218dd395: Download complete

        root@deb1:/# svcmgr -s app2.dev docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        busybox             latest              a9eb17255234        2 weeks ago         2.433 MB
        
app2.int::

        root@deb1:/# svcmgr -s app2.int docker pull busybox:buildroot-2013.08.1
        Pulling repository busybox
        d200959a3e91: Download complete
        511136ea3c5a: Download complete
        42eed7f1bf2a: Download complete
        c120b7cab0b0: Download complete

        root@deb1:/# svcmgr -s app2.int docker images
        REPOSITORY          TAG                   IMAGE ID            CREATED             VIRTUAL SIZE
        busybox             buildroot-2013.08.1   d200959a3e91        2 weeks ago         2.489 MB
        
app2.prd::

        root@deb1:/# svcmgr -s app2.prd docker pull busybox:ubuntu-12.04
        Pulling repository busybox
        fd5373b3d938: Download complete
        511136ea3c5a: Download complete
        42eed7f1bf2a: Download complete
        1f5049b3536e: Download complete

        root@deb1:/# svcmgr -s app2.prd docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        busybox             ubuntu-12.04        fd5373b3d938        2 weeks ago         5.455 MB


As we can see below, 6 differents docker repositories are populated::

        root@deb1:/# for appli in app1 app2
        > do
        > for env in dev int prd
        > do
        > echo --- repository $appli.$env ---
        > cat /opt/$appli.$env/repositories-aufs
        > echo;echo
        > done
        > done
        --- repository app1.dev ---
        {"Repositories":{"ubuntu":{"14.04":"e54ca5efa2e962582a223ca9810f7f1b62ea9b5c3975d14a5da79d3bf6020f37"}}}
        
        --- repository app1.int ---
        {"Repositories":{"ubuntu":{"13.04":"463ff6be4238c14f5b88898f17b47a9cf494f9a9be7b6170c3e852568d2b0432"}}}
        
        --- repository app1.prd ---
        {"Repositories":{"ubuntu":{"12.04":"ebe4be4dd427fcc7e137b340f60e458baa5fb710a280332454d2c8a8209a14d7"}}}
        
        --- repository app2.dev ---
        {"Repositories":{"busybox":{"latest":"a9eb172552348a9a49180694790b33a1097f546456d041b6e82e4d7716ddb721"}}}
        
        --- repository app2.int ---
        {"Repositories":{"busybox":{"buildroot-2013.08.1":"d200959a3e91d88e6da9a0ce458e3cdefd3a8a19f8f5e6a1e7f10f268aea5594"}}}
        
        --- repository app2.prd ---
        {"Repositories":{"busybox":{"ubuntu-12.04":"fd5373b3d93820744a327e609ee86166e5984d7377987f0fde78daeaa345705d"}}}

        
Service Status
^^^^^^^^^^^^^^

When querying service status, we can see that the log complains about the lack of container id. It is because the container need to be started a first time, to let docker instantiate it. 

::

        root@deb1:/# app1.dev print status
        app1.dev
        overall                   down
        |- avail                  down
        |  '- container#1    .... down     ubuntu:14.04
        |                                  # can not find container id
        |- sync                   n/a
        '- hb                     n/a
        
Service Start
^^^^^^^^^^^^^

The first start trigger a ``docker run`` action, to create the container from image::

        root@deb1:/# app1.dev start
        16:12:26 INFO    APP1.DEV.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.dev/docker.sock run -t -i -d --name=app1.dev.container.1 e54ca5efa2e9 /bin/bash
        16:12:27 INFO    APP1.DEV.CONTAINER#1 output:
        760b01810910547bb2b8beeb0cfdc751507a9677e7836a986bd116faf08f6aab
        
        16:12:27 INFO    APP1.DEV.CONTAINER#1 wait for container up status
        16:12:27 INFO    APP1.DEV.CONTAINER#1 wait for container operational
        
        root@deb1:/# app1.dev print status
        app1.dev
        overall                   up
        |- avail                  up
        |  '- container#1    .... up       760b01810910@ubuntu:14.04
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# app1.dev docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
        760b01810910        ubuntu:14.04        /bin/bash           14 seconds ago      Up 14 seconds                           app1.dev.container.1

        root@deb1:/# svcmon
        service     service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name        type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------     ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        app1.int    INT     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app2.dev    DEV     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app2.prd    PRD     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app2.int    INT     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app1.prd    PRD     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app1.dev    DEV     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False

.. note:: OpenSVC explicitely tag the container with "<service>.container.<resourceID>". service "app1.dev" & docker "container#1" gives "app1.dev.container.1"

Now we issue a ``<service> start`` command for the 5 remaining services, and after we can see that they are all up in the ``overall status`` column::

        root@deb1:/# svcmon
        service     service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name        type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------     ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        app2.int    INT     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        app1.int    INT     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        app1.dev    DEV     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        app1.prd    PRD     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        app2.dev    DEV     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        app2.prd    PRD     hosted    up        n/a       n/a        n/a        n/a        n/a        n/a       n/a       up         up         False
        
        root@deb1:/# ps auxww|grep [d]ocker
        root      8546  0.0  2.4 353072 12180 pts/0    Sl   15:14   0:00 docker -H unix:///var/lib/opensvc/app2.dev/docker.sock -r=false -d -g /opt/app2.dev -p /var/lib/opensvc/app2.dev/docker.pid
        root      8899  0.0  2.4 402216 12300 pts/0    Sl   15:15   0:00 docker -H unix:///var/lib/opensvc/app2.int/docker.sock -r=false -d -g /opt/app2.int -p /var/lib/opensvc/app2.int/docker.pid
        root      9179  0.0  2.3 402344 12108 pts/0    Sl   15:16   0:00 docker -H unix:///var/lib/opensvc/app2.prd/docker.sock -r=false -d -g /opt/app2.prd -p /var/lib/opensvc/app2.prd/docker.pid
        root     15388  0.0  2.9 405932 14748 ?        Sl   juin20   0:32 docker -H unix:///var/lib/opensvc/app1.int/docker.sock -r=false -d -g /opt/app1.int -p /var/lib/opensvc/app1.int/docker.pid
        root     16074  0.0  2.8 340268 14576 ?        Sl   juin20   0:35 docker -H unix:///var/lib/opensvc/app1.prd/docker.sock -r=false -d -g /opt/app1.prd -p /var/lib/opensvc/app1.prd/docker.pid
        root     21692  0.0  1.6 398464  8400 pts/0    Sl   16:14   0:00 docker -H unix:///var/lib/opensvc/app1.dev/docker.sock -r=false -d -g /opt/app1.dev -p /var/lib/opensvc/app1.dev/docker.pid

6 docker environments are running on the same system, with docker data repositories fully segregated.

Environments Security
^^^^^^^^^^^^^^^^^^^^^

If you are concerned about security, like assigning app1 to team1, and app2 to team2, just remember how docker client and daemon are connecting together: a unix socket is used.
So you just have to:

* Create unix groups team1 and team2
* Change app1 sockets group owner to team1 => ``chgrp team1 /var/lib/opensvc/app1*/docker.sock``
* Change app2 sockets group owner to team2 => ``chgrp team2 /var/lib/opensvc/app2*/docker.sock``
* Assign users to accurate group

As default socket permissions are ``srw-rw----  root docker``, they will be changed to ``srw-rw----  root team1``. This way, only root or team1 members will be able to connect to team1 docker environments.

Service Stop
^^^^^^^^^^^^

Although we can stop a service with ``<service> stop`` command, we also benefit from OpenSVC mass actions command::

        root@deb1:/# allupservices stop
        16:22:37 INFO    APP1.DEV.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.dev/docker.sock stop 760b01810910
        16:22:38 INFO    APP1.DEV.CONTAINER#1 output:
        760b01810910
        
        16:22:38 INFO    APP1.DEV.CONTAINER#1 wait for container down status
        16:22:38 INFO    APP1.DEV.CONTAINER#1 no more container handled by docker daemon. shut it down
        16:22:38 INFO    APP1.INT.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.int/docker.sock stop 460741db5c87
        16:22:48 INFO    APP1.INT.CONTAINER#1 output:
        460741db5c87
        
        16:22:48 INFO    APP1.INT.CONTAINER#1 wait for container down status
        16:22:49 INFO    APP1.INT.CONTAINER#1 no more container handled by docker daemon. shut it down
        16:22:49 INFO    APP1.PRD.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.prd/docker.sock stop 7bc8d3a666bd
        16:22:59 INFO    APP1.PRD.CONTAINER#1 output:
        7bc8d3a666bd
        
        16:22:59 INFO    APP1.PRD.CONTAINER#1 wait for container down status
        16:22:59 INFO    APP1.PRD.CONTAINER#1 no more container handled by docker daemon. shut it down
        16:23:00 INFO    APP2.DEV.CONTAINER#1 docker -H unix:///var/lib/opensvc/app2.dev/docker.sock stop c9b34e8418b7
        16:23:10 INFO    APP2.DEV.CONTAINER#1 output:
        c9b34e8418b7
        
        16:23:10 INFO    APP2.DEV.CONTAINER#1 wait for container down status
        16:23:10 INFO    APP2.DEV.CONTAINER#1 no more container handled by docker daemon. shut it down
        16:23:11 INFO    APP2.INT.CONTAINER#1 docker -H unix:///var/lib/opensvc/app2.int/docker.sock stop 64caeed1724c
        16:23:21 INFO    APP2.INT.CONTAINER#1 output:
        64caeed1724c
        
        16:23:21 INFO    APP2.INT.CONTAINER#1 wait for container down status
        16:23:21 INFO    APP2.INT.CONTAINER#1 no more container handled by docker daemon. shut it down
        16:23:21 INFO    APP2.PRD.CONTAINER#1 docker -H unix:///var/lib/opensvc/app2.prd/docker.sock stop a821c33e9aef
        16:23:32 INFO    APP2.PRD.CONTAINER#1 output:
        a821c33e9aef
        
        16:23:32 INFO    APP2.PRD.CONTAINER#1 wait for container down status
        16:23:32 INFO    APP2.PRD.CONTAINER#1 no more container handled by docker daemon. shut it down

        root@deb1:/# svcmon
        service     service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name        type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------     ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        app2.dev    DEV     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app1.prd    PRD     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app2.prd    PRD     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app1.dev    DEV     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app2.int    INT     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False
        app1.int    INT     hosted    down      n/a       n/a        n/a        n/a        n/a        n/a       n/a       down       down       False

Service Restart
^^^^^^^^^^^^^^^

Let's restart a single service::

        root@deb1:/# app1.prd start
        16:41:33 INFO    APP1.PRD.CONTAINER#1 starting docker daemon
        16:41:33 INFO    APP1.PRD.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.prd/docker.sock -r=false -d -g /opt/app1.prd -p /var/lib/opensvc/app1.prd/docker.pid
        16:41:34 INFO    APP1.PRD.CONTAINER#1 docker -H unix:///var/lib/opensvc/app1.prd/docker.sock start 7bc8d3a666bd
        16:41:34 INFO    APP1.PRD.CONTAINER#1 output:
        7bc8d3a666bd
        
        16:41:34 INFO    APP1.PRD.CONTAINER#1 wait for container up status
        16:41:34 INFO    APP1.PRD.CONTAINER#1 wait for container operational

        root@deb1:/# app1.prd docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
        7bc8d3a666bd        ubuntu:12.04        /bin/bash           24 hours ago        Up 7 seconds                            app1.prd.container.1

        root@deb1:/# app1.prd print status
        app1.prd
        overall                   up
        |- avail                  up
        |  '- container#1    .... up       7bc8d3a666bd@ubuntu:12.04
        |- sync                   n/a
        '- hb                     n/a
        root@deb1:/# app1.prd docker attach 7bc8d3a666bd

        root@7bc8d3a666bd:/# hostname
        7bc8d3a666bd

        root@deb1:/# app1.int docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

        root@deb1:/# app1.dev docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

We can see in sequence:  

* Docker daemon startup
* Docker container startup (called with ``start`` and no more ``run``, because container do exists)
* OpenSVC overall service status up
* Docker attach is working fine

To summarize, we have segregated docker environments, and made their management very easy with OpenSVC encapsulation.
