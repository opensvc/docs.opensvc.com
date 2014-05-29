Docker
******

Docker (https://www.docker.io/) is a very promising container technology. If you're not already informed about it, it's really worth having a look at one of the multiple tutorials available, to discover all the benefits of this solution, that will drastically change the way applications are deployed on linux type systems. This tutorial explains how OpenSVC is complementary to docker. 

This tutorial is useful for all people who want to answer those questions :

* My application is built on 3 Docker images, how do I launch them together ?
* How do I setup my own private Docker registry ?
* How do I relocate my Docker infrastructure on another physical server ?
* How do I build a Docker high availability infrastructure ?
* How do I host multiple Docker installations on the same host (dev, test, preproduction, ...)
* Lots of people use Docker in my company, how do I setup a disaster recovery solution ?
* Lots of people use Docker in my company, how do I chargeback docker usage depending on image or container count or even used space ?

OpenSVC product will be used to encapsulate docker's containers like any other vm/container already supported (like kvm, xen, lxc, zones, jails, hpvm, ovm, ...)

Installing Docker as an OpenSVC service
=======================================

Typical docker implementation is ensured by installing your favorite linux distribution packages. Basically they install Docker software, and some startup scripts to make all the stuff works. Let's setup Docker in an OpenSVC service. You may want to read `OpenSVC VM encapsulation introduction <howto.vmencap.html#introduction>`_ so as to understand why you have interest to do this way.

Pre-requisites
--------------

* debian wheezy (or every linux distro known to work with Docker)
* kernel 3.8 or upper (docker prerequisite due to lxc bug)
* dedicated lun to host Docker's stuff (images, containers, volumes)
* dedicated ip address for docker service
* OpenSVC Agent (open source free software)

Kernel Upgrade
--------------

As we are running a debian wheezy host, which is far behind kernel 3.8, we have to upgrade our kernel version

::

        root@deb1:/# sh -c "echo deb http://ftp.us.debian.org/debian wheezy-backports main" > /etc/apt/sources.list.d/wheezy-backports.source.list
        root@deb1:/# apt-get update -y
        root@deb1:/# apt-get -t wheezy-backports install linux-image-amd64 -y
        root@deb1:/# reboot
        root@deb1:~# uname -a
        Linux deb1.opensvc.com 3.13-0.bpo.1-amd64 #1 SMP Debian 3.13.10-1~bpo70+1 (2014-04-23) x86_64 GNU/Linux

Docker Installation
-------------------

::

        root@deb1:~# sh -c "echo deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.source.list
        root@deb1:~# apt-get update -y
        root@deb1:~# apt-get install lxc-docker
        root@deb1:~# docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

We end up with running docker instance, using all debian defaults, like /var/lib/docker as Docker's root folder, which is empty.
As we want Docker to be managed by OpenSVC, we will disable system launcher::

        root@deb1:/# /etc/init.d/docker stop
        [ ok ] Stopping Docker: docker.
        root@deb1:/# ls -l /etc/rc2.d | grep -i doc
        S19docker
        root@deb1:/# update-rc.d -f docker remove

OpenSVC Installation
--------------------

Please follow the steps described in `OpenSVC installation <howto.getting.started.html#opensvc-installation>`_

Service configuration
=====================

Copy/Paste the service configuration file in folder ``/opt/opensvc/etc`` and name it like ``servicename.env``. In the example below, we will name the service configuration file ``docker.opensvc.com.env``.

::

        root@deb1:/opt/opensvc/etc# ls -l | grep docker*env
        -rw-r--r-- 1 root root  853 mai   26 21:05 docker.opensvc.com.env

        root@deb1:/opt/opensvc/etc# cat docker.opensvc.com.env
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        docker_data_dir = /opt/docker.opensvc.com/appdata
        
        [container#1]
        type = docker
        run_image = f66342b343ae
        run_command = /bin/sh
        run_args = -v /opt/docker.opensvc.com/vol1:/vol1:rw
        
        [ip#1]
        ipdev = eth0
        ipname = docker.opensvc.com
        
        [vg#1]
        vgname = vgdocker
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/docker.opensvc.com
        dev = /dev/mapper/vgdocker-lvdockerroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/docker.opensvc.com/appdata
        dev = /dev/mapper/vgdocker-lvdockerdata
        type = ext4

To declare a docker container in OpenSVC service file, you first have to use the [container#X] tag, with X being any arbitrary container number (0,1,2,3...). Be carefull that the tag [container#X] is not only reserved to docker containers, it's a generic OpenSVC keyword to declare a virtual machine/container object, regardless of virtualization technology. In other words, as an example, OpenSVC is able to manage a service with [container#1], [container#2], [container#3] as being respectively a docker container, a lxc container, a kvm container.

**docker_data_dir**

  This folder parameter is used to specify docker where the docker local files are located. This folder will be passed to the ``-g`` option of docker daemon.

**type**

  Set to 'docker' to explicitely ask OpenSVC to use to docker driver to manage this container.

**run_image**

  This mandatory parameter is used to specify the docker image ID to use for starting the container. Run the ``docker images`` cli command and grab accurate string from the 'ID' column.

.. note:: Our example use the image id f66342b343ae, which corresponds to busybox latest image available on the 29th of May 2014.

**run_command**

  This optional parameter may be needed for images that need a specific command to be launched at startup.

**run_args**

  This optional parameter may be needed to pass options to ``docker run`` command. In the current example, we use the ``-v`` option to map a data volume inside that docker container.

The service .env file is now ready, we have to finish the service creation in OpenSVC

::

        root@deb1:/opt/opensvc/etc# ls -l | grep docker
        -rw-r--r-- 1 root root  800 mai   29 05:14 docker.opensvc.com.env

        root@deb1:/opt/opensvc/etc# mkdir docker.opensvc.com.dir

        root@deb1:/opt/opensvc/etc# ln -s docker.opensvc.com.dir docker.opensvc.com.d

        root@deb1:/opt/opensvc/etc# ln -s ../bin/svcmgr docker.opensvc.com

        root@deb1:/opt/opensvc/etc# ls -l | grep docker
        lrwxrwxrwx 1 root root   13 mai   29 05:52 docker.opensvc.com -> ../bin/svcmgr
        lrwxrwxrwx 1 root root   22 mai   29 05:51 docker.opensvc.com.d -> docker.opensvc.com.dir
        drwxr-xr-x 2 root root 4096 mai   29 05:51 docker.opensvc.com.dir
        -rw-r--r-- 1 root root  800 mai   29 05:14 docker.opensvc.com.env

Now we can test if service setup is ok. We assume that the LVM setup is ok. If you need help, please consult `guidance on storage configuration <howto.getting.started.html#storage-configuration>`_

::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        send /opt/opensvc/etc/docker.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/docker.opensvc.com.push timestamp ... OK
        docker.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgdocker
        |  |- fs#1           .... down     /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... down     docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

All ressources are down when the service is down. (If you just create your LVM setup, you may see vg#1 ressource as up, due to VG being imported in the LVM configuration, no matter OpenSVC won't try to import an already imported VG)

Let's describe OpenSVC theory of operations before starting the service.

OpenSVC Behavior
================

With the configuration file like exposed previously, OpenSVC will take the following actions on service startup :

* **[ip#1]** : add ip address corresponding to ``docker.opensvc.com`` on network interface ``eth0``
* **[vg#1]** : import volume group named ``vgdocker``
* **[fs#1]** and **[fs#2]** : first mount logical volume ``/dev/mapper/vgdocker-lvdockerroot`` on ``/opt/docker.opensvc.com``, and after mount logical volume ``/dev/mapper/vgdocker-lvdockerdata`` on ``/opt/docker.opensvc.com/appdata``
* **[container#1]** : start docker as daemon with the following command line ``docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock -r=false -d -g /opt/docker.opensvc.com/appdata -p /opt/opensvc/var/docker.opensvc.com/docker.pid``. Note that container is assigned with number 1 because of #1.

  * -H : attach docker daemon to local socket. The socket name is herited from the OpenSVC service name.
  * -r = false : we do not want docker to manage the container startup automatically. Instead we will rely on OpenSVC features to do that
  * -d : explicit daemon usage for docker binary (take care, it is the same binary for daemon and client)
  * -g : tell docker where to store its files
  * -p : while in daemon mode, specify a pidfile.

  Once docker daemon is operational, the container is started with command line ``docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock run -t -i -d --name=docker.opensvc.com.container.1 -v /opt/docker.opensvc.com/vol1:/vol1:rw f66342b343ae /bin/sh``

  * -H : asks the docker cli to attach to the docker daemon previously launched
  * -t : allocate a pseudo-tty and attach to the standard input of docker container
  * -i : keep stdin open even if not attached to the container
  * -d : detach after container launch. We can reattach/detach later.
  * --name : assign a name to the container. Format is [OpenSVC_ServiceName].container.[OpenSVC_Container_ID], evaluated to "docker.opensvc.com.container.1" in our example.
  * -v : herited from service file run_args option, to mount a data volume inside the docker container.
  * f66342b343ae : herited from service file run_image option
  * /bin/sh : herited from service file run_command option


Service Startup
===============

The normal way of starting an OpenSVC service is ``service_name start``. But in our case, it will fail because the local Docker repository is empty. We have to do a little preparation to make the docker container startable. To do so, we will start partially the OpenSVC service, to be able to manage Docker manually :

**bring up service Volume Group**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com startvg
        06:36:40 INFO    DOCKER.OPENSVC.COM.VG#1    vgchange --addtag @deb1.opensvc.com vgdocker
        06:36:40 INFO    DOCKER.OPENSVC.COM.VG#1    output:
          Volume group "vgdocker" successfully changed
        
        06:36:40 INFO    DOCKER.OPENSVC.COM.VG#1    vgchange -a y vgdocker
        06:36:40 INFO    DOCKER.OPENSVC.COM.VG#1    output:
          2 logical volume(s) in volume group "vgdocker" now active
        
        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... down     /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... down     docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

vg#1 is now reported as up

**bring up service filesystems**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com startfs
        06:37:07 INFO    DOCKER.OPENSVC.COM.VG#1    vgdocker is already up
        06:37:07 INFO    DOCKER.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgdocker-lvdockerroot
        06:37:07 INFO    DOCKER.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgdocker-lvdockerroot: clean, 18/32768 files, 10586/131072 blocks
        
        06:37:07 INFO    DOCKER.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vgdocker-lvdockerroot /opt/docker.opensvc.com
        06:37:07 INFO    DOCKER.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vgdocker-lvdockerdata
        06:37:08 INFO    DOCKER.OPENSVC.COM.FS#2    output:
        /dev/mapper/vgdocker-lvdockerdata: clean, 25/288000 files, 57330/1152000 blocks
        
        06:37:08 INFO    DOCKER.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vgdocker-lvdockerdata /opt/docker.opensvc.com/appdata

        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... up       /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... down     docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

fs#1 and fs#2 are now reported as up

**bring up service ip**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com startip
        06:37:22 INFO    DOCKER.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        06:37:26 INFO    DOCKER.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.25 netmask 255.255.255.224 up
        06:37:26 INFO    DOCKER.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.25 37.59.71.25

        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... up       /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... up       docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

ip#1 is now reported as up

**querying Docker repository**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        
        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... up       /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... up       docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        
        root@deb1:/opt/opensvc/etc# ps auxww | grep docker
        root      1411  0.0  0.1   7852   836 pts/0    R+   06:54   0:00 grep docker
        root     14530  0.0  1.3 266112  7048 pts/0    Sl   06:47   0:00 docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock -r=false -d -g /opt/docker.opensvc.com/appdata -p /opt/opensvc/var/docker.opensvc.com/docker.pid

We have no images listed in the local Docker repository. We can see that the "docker daemon is not running" message is no more reported. Instead, docker daemon has been started silently, and OpenSVC complains about a missing container. We need to populate the repository to be able to start the container.

**pulling Docker image**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com docker pull busybox:latest
        Pulling repository busybox
        f66342b343ae: Download complete
        511136ea3c5a: Download complete
        569584af1fe2: Download complete
        b1bafeaa2233: Download complete

        root@deb1:/opt/opensvc/etc# docker.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        busybox             latest              f66342b343ae        10 hours ago        2.433 MB

        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     busybox:latest
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... up       /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... up       docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

The image id ``f66342b343ae`` is no more printed out as a raw image id, but is resolved to its friendly name ``busybox:latest``. This means that the image needed to start our container is available in the local Docker repository.

**starting the service**::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com start
        07:17:58 INFO    DOCKER.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        07:17:58 INFO    DOCKER.OPENSVC.COM.IP#1    37.59.71.25 is already up on eth0
        07:17:58 INFO    DOCKER.OPENSVC.COM.VG#1    vgdocker is already up
        07:17:58 INFO    DOCKER.OPENSVC.COM.FS#1    fs(/dev/mapper/vgdocker-lvdockerroot /opt/docker.opensvc.com) is already mounted
        07:17:58 INFO    DOCKER.OPENSVC.COM.FS#2    fs(/dev/mapper/vgdocker-lvdockerdata /opt/docker.opensvc.com/appdata) is already mounted
        07:17:58 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock run -t -i -d --name=docker.opensvc.com.container.1 -v /opt/docker.opensvc.com/vol1:/vol1:rw f66342b343ae /bin/sh
        07:17:58 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 output:
        20f6aabc5ce1ed1a2d2e5a8c22cb98ddfbaaaeb5161ab90c1f1ee4ed749b9038
        
        07:17:58 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 wait for container up status
        07:17:58 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       20f6aabc5ce1@busybox:latest
        |  |- vg#1           .... up       vgdocker
        |  |- fs#1           .... up       /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... up       docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/opt/opensvc/etc# docker.opensvc.com docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
        20f6aabc5ce1        busybox:latest      /bin/sh             8 minutes ago       Up 7 minutes                            docker.opensvc.com.container.1

The service startup is now ok. Docker instanciate and run a container id ``20f6aabc5ce1`` based on image ``busybox:latest``. We can see that the container is running, and owns tag ``docker.opensvc.com.container.1``.

.. note:: You may have noticed that OpenSVC wraps Docker's commands. Every Docker supported option will be passed to the Docker binary, and OpenSVC ensure that return codes from docker binary are caught. The main advantage is that you don't have to worry about which Docker's daemon socket to use, it is automatically herited from the OpenSVC service calling the docker command. In our example, ``docker.opensvc.com docker ps`` will call ``docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock ps``

Service Shutdown
================

We stop the OpenSVC service with command ``service_name stop``.

::

        root@deb1:/opt/opensvc/etc# docker.opensvc.com stop
        07:41:19 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/docker.opensvc.com/docker.sock stop 20f6aabc5ce1
        07:41:29 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 output:
        20f6aabc5ce1
        
        07:41:29 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 wait for container down status
        07:41:29 INFO    DOCKER.OPENSVC.COM.CONTAINER#1 no more container handled by docker daemon. shut it down
        07:41:29 INFO    DOCKER.OPENSVC.COM.FS#2    umount /opt/docker.opensvc.com/appdata
        07:41:29 INFO    DOCKER.OPENSVC.COM.FS#1    umount /opt/docker.opensvc.com
        07:41:29 INFO    DOCKER.OPENSVC.COM.VG#1    vgchange --deltag @deb1.opensvc.com vgdocker
        07:41:30 INFO    DOCKER.OPENSVC.COM.VG#1    output:
          Volume group "vgdocker" successfully changed
        
        07:41:30 INFO    DOCKER.OPENSVC.COM.VG#1    kpartx -d /dev/vgdocker/lvdockerdata
        07:41:30 INFO    DOCKER.OPENSVC.COM.VG#1    kpartx -d /dev/vgdocker/lvdockerroot
        07:41:30 INFO    DOCKER.OPENSVC.COM.VG#1    vgchange -a n vgdocker
        07:41:30 INFO    DOCKER.OPENSVC.COM.VG#1    output:
          0 logical volume(s) in volume group "vgdocker" now active
        
        07:41:30 INFO    DOCKER.OPENSVC.COM.IP#1    ifconfig eth0:1 down
        07:41:30 INFO    DOCKER.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        root@deb1:/opt/opensvc/etc# docker.opensvc.com print status
        docker.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     f66342b343ae
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgdocker
        |  |- fs#1           .... down     /dev/mapper/vgdocker-lvdockerroot@/opt/docker.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgdocker-lvdockerdata@/opt/docker.opensvc.com/appdata
        |  '- ip#1           .... down     docker.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

All services ressources are now stopped. If you want to play, you can re-issue command ``docker.opensvc.com start``. Just imagine how easy it could be if your OpenSVC service is made of 4 VG, 12 LV, 2 NFS mounts, 3 kvm virtual machines, 6 docker containers, still a single command to start or stop the overall ressources.

About the promises
==================

.. toctree::
   :maxdepth: 1

   virtualization.docker.multi_containers
   virtualization.docker.private_registry
   virtualization.docker.relocalisation
   virtualization.docker.high_availability
   virtualization.docker.multiple_docker_instances
   virtualization.docker.disaster_recovery_plan
   virtualization.docker.chargeback
