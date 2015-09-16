Docker Private Registry
=======================

Docker depends on registry component, which is a repository where docker images are stored, and available to be pulled/pushed by docker instances. Although Docker (https://www.docker.io/) sells "ready to use" private registries, you may want to avoid exposing your docker containers outside of your private IT infrastructure (risk of internal binaries/scripts/ip leak, security team requirement, bandwidth too limited, ...)
This tutorial will show up how you can install and run your own Docker registry.

Pre-requisites
--------------

* OpenSVC service managing docker containers (As described in the `parent topic <virtualization.docker.html#installing-docker-as-an-opensvc-service>`_)
* Official Docker Registry image

Service Creation
----------------

**Preparing OpenSVC registry service**::

        root@deb1:/opt/opensvc/etc# mkdir registry.opensvc.com.dir
        root@deb1:/opt/opensvc/etc# ln -s registry.opensvc.com.dir registry.opensvc.com.d
        root@deb1:/opt/opensvc/etc# ln -s ../bin/svcmgr registry.opensvc.com
        root@deb1:/opt/opensvc/etc# getent hosts registry.opensvc.com
        37.59.71.25     registry.opensvc.com

**Completing with service configuration file (copy/paste ready)**::

        cat > /opt/opensvc/etc/registry.opensvc.com.env << EOF
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        docker_data_dir = /opt/registry.opensvc.com/dockerdata
        docker_daemon_args = --ip 37.59.71.25
        
        [container#1]
        type = docker
        run_image = unknown_at_the_moment
        
        [ip#1]
        ipdev = eth0
        ipname = registry.opensvc.com
        
        [vg#1]
        vgname = vgregistry
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/registry.opensvc.com
        dev = /dev/mapper/vgregistry-lvregistryroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/registry.opensvc.com/dockerdata
        dev = /dev/mapper/vgregistry-lvdockerdata
        type = ext4

        [fs#3]
        mnt_opts = rw
        mnt = /opt/registry.opensvc.com/registrydata
        dev = /dev/mapper/vgregistry-lvregistrydata
        type = ext4
        EOF

Storage configuration consists in 3 logical volumes hosted in a volume group dedicated to OpenSVC registry service :

* **[fs#1]** is the root filesystem for OpenSVC registry service
* **[fs#2]** is the docker dedicated filesystem, where images are stored, and layering is managed
* **[fs#3]** is the registry dedicated filesystem, which will be presented into the registry container, so as to store all private docker images.

.. note:: As a general recommendation (not only when implementing a private docker registry), it is highly recommended to use a data volume presented into the container to store all your datas. This way you will be able to delete/recreate your container without data loss. With another dedicated block device, it is also a convenient way if you need to use block device replication, either locally (EMC Snap/Clones, IBM FlashCopy, etc), or remotely (EMC SRDF/RecoverPoint, IBM PPRC, etc). 


**Check if OpenSVC service is ready**::

        root@deb1:/opt/opensvc/etc# registry.opensvc.com print status
        send /opt/opensvc/etc/registry.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/registry.opensvc.com.push timestamp ... OK
        registry.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     unknown_at_the_moment
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgregistry
        |  |- fs#1           .... down     /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... down     /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... down     registry.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

Docker Image Pull
-----------------

We will use the official registry image (https://index.docker.io/_/registry/)

**Start minimal resource to populate docker local data** ::

        root@deb1:/opt/opensvc/etc# registry.opensvc.com startip
        16:50:28 INFO    REGISTRY.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        16:50:32 INFO    REGISTRY.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.25 netmask 255.255.255.224 up
        16:50:32 INFO    REGISTRY.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.25 37.59.71.25
        root@deb1:/opt/opensvc/etc# registry.opensvc.com startfs
        16:50:36 INFO    REGISTRY.OPENSVC.COM.VG#1    vgchange --addtag @deb1.opensvc.com vgregistry
        16:50:37 INFO    REGISTRY.OPENSVC.COM.VG#1    output:
          Volume group "vgregistry" successfully changed
        
        16:50:37 INFO    REGISTRY.OPENSVC.COM.VG#1    vgchange -a y vgregistry
        16:50:37 INFO    REGISTRY.OPENSVC.COM.VG#1    output:
          3 logical volume(s) in volume group "vgregistry" now active
        
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgregistry-lvregistryroot
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgregistry-lvregistryroot: clean, 11/32768 files, 6257/131072 blocks
        
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vgregistry-lvregistryroot /opt/registry.opensvc.com
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#2    create missing mountpoint /opt/registry.opensvc.com/dockerdata
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vgregistry-lvdockerdata
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#2    output:
        /dev/mapper/vgregistry-lvdockerdata: clean, 11/131072 files, 25388/524288 blocks
        
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vgregistry-lvdockerdata /opt/registry.opensvc.com/dockerdata
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#3    create missing mountpoint /opt/registry.opensvc.com/registrydata
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#3    e2fsck -p /dev/mapper/vgregistry-lvregistrydata
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#3    output:
        /dev/mapper/vgregistry-lvregistrydata: clean, 11/131072 files, 25388/524288 blocks
        
        16:50:37 INFO    REGISTRY.OPENSVC.COM.FS#3    mount -t ext4 /dev/mapper/vgregistry-lvregistrydata /opt/registry.opensvc.com/registrydata

        root@deb1:/opt/opensvc/etc# registry.opensvc.com print status
        registry.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     unknown_at_the_moment
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vgregistry
        |  |- fs#1           .... up       /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... up       /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... up       registry.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        root@deb1:/opt/opensvc/etc# registry.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

**Pull docker image** ::

        root@deb1:/opt/opensvc/etc# registry.opensvc.com docker pull registry:latest
        Pulling repository registry
        5670839b64ba: Download complete
        511136ea3c5a: Download complete
        /* removing download logs */
        
        root@deb1:/opt/opensvc/etc# registry.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        registry            latest              5670839b64ba        3 days ago          554 MB

Docker Registry Setup
---------------------

We have to configure our OpenSVC container object so as to run our private registry. Let's modify file ``/opt/opensvc/etc/registry.opensvc.com.env`` like below :

Config Section::

        [container#1]
        type = docker
        run_image = 5670839b64ba
        run_args = -v /opt/registry.opensvc.com/registrydata:/registrydata -e STORAGE_PATH=/registrydata -p 5000:5000

* **-v /opt/registry.opensvc.com/registrydata:/registrydata** is a volume mapping. We want to present our dedicated registry data volume into the container, mounted on /registrydata.
* **-e STORAGE_PATH=/registrydata** : requiring Docker Registry to use folder /registrydata to store persistent data.
* **-p 5000:5000** expose network port 5000

.. warning:: take care of this bug https://github.com/dotcloud/docker-registry/issues/401 when modifying STORAGE_PATH 

Docker Registry Start
---------------------


**After modifying the service configuration file** ::

        root@deb1:/opt/opensvc/etc# registry.opensvc.com print status
        send /opt/opensvc/etc/registry.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/registry.opensvc.com.push timestamp ... OK
        registry.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     registry:latest
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vgregistry
        |  |- fs#1           .... up       /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... up       /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... up       registry.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        
**Registry start** ::

        root@deb1:/opt/opensvc/etc# registry.opensvc.com startcontainer
        17:03:12 INFO    REGISTRY.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/registry.opensvc.com/docker.sock run -t -i -d --name=registry.opensvc.com.container.1 -v /opt/registry.opensvc.com/registrydata:/registrydata -e STORAGE_PATH=/registrydata -p 5000:5000 5670839b64ba
        17:03:12 INFO    REGISTRY.OPENSVC.COM.CONTAINER#1 output:
        1c235fe957467097da19635f793ecf100d99100753ebdfe5d430142a70bfac73
        
        17:03:12 INFO    REGISTRY.OPENSVC.COM.CONTAINER#1 wait for container up status
        17:03:12 INFO    REGISTRY.OPENSVC.COM.CONTAINER#1 wait for container operational
        
        root@deb1:/opt/opensvc/etc# registry.opensvc.com print status
        registry.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       1c235fe95746@registry:latest
        |  |- vg#1           .... up       vgregistry
        |  |- fs#1           .... up       /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... up       /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... up       registry.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        
        root@deb1:/opt/opensvc/etc# registry.opensvc.com docker ps
        CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                        NAMES
        1c235fe95746        registry:latest     /bin/sh -c 'exec doc   21 seconds ago      Up 21 seconds       37.59.71.25:5000->5000/tcp   registry.opensvc.com.container.1

Our registry is up & running.

.. warning:: The docker registry does not deal with access control. As soon as the docker container is up, everyone is allowed to push/pull images to/from the registry. You have to complete the solution with either ip filtering, or authentification solution. You can also workaround by binding registry to loopback ip address like 127.0.0.1, and create local accounts, so as users are able to open a ssh tunnel to the registry tcp port.

Testing the registry
--------------------

The environment used to test the registry is a mac laptop, running boot2docker.

**Macbook local docker repository is empty** ::

        17:05:35 averon@macbookpro:[~] # docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

**Populating Macbook docker repository with a Docker image, from public Docker registry** ::

        17:05:37 averon@macbookpro:[~] # docker pull busybox:latest
        Pulling repository busybox
        98b9fdab1cb6: Download complete
        511136ea3c5a: Download complete
        b6c0d171b362: Download complete
        9798716626f6: Download complete

        17:06:41 averon@macbookpro:[~] # docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        busybox             latest              98b9fdab1cb6        3 days ago          2.433 MB
        
**Tagging image to be able to push it to the private registry** ::

        17:07:25 averon@macbookpro:[~] # docker tag 98b9fdab1cb6 registry.opensvc.com:5000/busybox:private
        
        17:07:54 averon@macbookpro:[~] # docker images
        REPOSITORY                          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        busybox                             latest              98b9fdab1cb6        3 days ago          2.433 MB
        registry.opensvc.com:5000/busybox   private             98b9fdab1cb6        3 days ago          2.433 MB

**Pushing image to the private registry** ::

        17:09:16 averon@macbookpro:[~] # docker push registry.opensvc.com:5000/busybox:private
        The push refers to a repository [registry.opensvc.com:5000/busybox] (len: 1)
        Sending image list
        Pushing repository registry.opensvc.com:5000/busybox (1 tags)
        511136ea3c5a: Image successfully pushed
        b6c0d171b362: Image successfully pushed
        9798716626f6: Image successfully pushed
        98b9fdab1cb6: Image successfully pushed
        Pushing tag for rev [98b9fdab1cb6] on {http://registry.opensvc.com:5000/v1/repositories/busybox/tags/private}


**Instantiating container and modifying it** ::

        12:01:21 averon@macbookpro:[~] # docker run -t -i registry.opensvc.com:5000/busybox:private
        / # touch /my_new_datafile
        / # cat > /my_new_datafile
        docker container
        / #			### issuing keys ctrl+d to exit container
        12:04:00 averon@macbookpro:[~] #
        
**Committing changes to make new image from container** ::
        
        12:06:33 averon@macbookpro:[~] # docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
        12:06:35 averon@macbookpro:[~] # docker commit --message="Added datafile to container" --author="Arnaud Veron <arnaud.veron@opensvc.com>" 51104d236675 registry.opensvc.com:5000/busybox:datafile
        c56eb09567b98e3fd67c1c94a4cb65a552dc7447843f5415d1553ded3bd22a88
        12:07:12 averon@macbookpro:[~] #
        
**Pushing new image to the private registry** ::
        
        12:08:05 averon@macbookpro:[~] # docker push registry.opensvc.com:5000/busybox:datafile
        The push refers to a repository [registry.opensvc.com:5000/busybox] (len: 1)
        Sending image list
        Pushing repository registry.opensvc.com:5000/busybox (1 tags)
        Image 511136ea3c5a already pushed, skipping
        Image b6c0d171b362 already pushed, skipping
        Image 9798716626f6 already pushed, skipping
        Image 98b9fdab1cb6 already pushed, skipping
        c56eb09567b9: Image successfully pushed
        Pushing tag for rev [c56eb09567b9] on {http://registry.opensvc.com:5000/v1/repositories/busybox/tags/datafile}

It works !
