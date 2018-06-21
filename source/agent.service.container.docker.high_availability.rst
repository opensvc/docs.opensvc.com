Docker High Availability
========================

Considering you are responsible of hosting docker production infrastructures, you are surely interested in improving the service availability. Just imagine you have stacked tens of docker environments on one physical host, you certainly want to ensure that all people accessing your platform won't be impacted by a hardware failure.

The first step consists in implementing a manual failover cluster, like described in `Docker relocation <agent.service.container.docker.relocation.html>`_ tutorial.

The second step, shown in this tutorial, will show up how you can configure HA.

Pre-requisites
--------------

* OpenSVC services managing docker container(s), in this tutorial, we use only 2 services

    * first one is registry.opensvc.com
    * second one is busybox.opensvc.com

* 2 physical servers both having :

  * network attachments on the same IP subnet
  * shared storage : same block device seen from operating system
  * OpenSVC agent installed
  * Docker installed
  * OpenHA installed (Installation described in `Getting Started - OpenHA Integration <howto.getting.started.html#openha-integration>`_ and `High Availability Setup <howto.ha.html>`_)

    * require heartbeat implementation (network, disk, both)

  * 2 services configured

Initial State
-------------

We assume that both OpenSVC services are up and running on node ``deb1.opensvc.com``

Service registry.opensvc.com
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Service configuration file::

        root@deb1:/etc/opensvc# cat registry.opensvc.com.env
        [DEFAULT]
        orchestrate = start
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com deb2.opensvc.com
        docker_data_dir = /opt/registry.opensvc.com/dockerdata
        docker_daemon_args = --ip 37.59.71.25
        
        [container#1]
        type = docker
        run_image = de9a91835513
        run_args = -v /opt/registry.opensvc.com/registrydata:/registrydata -e STORAGE_PATH=/registrydata -p 5000:5000
        
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
        mnt_opt = rw
        mnt = /opt/registry.opensvc.com/dockerdata
        dev = /dev/mapper/vgregistry-lvdockerdata
        type = ext4
        
        [fs#3]
        mnt_opt = rw
        mnt = /opt/registry.opensvc.com/registrydata
        dev = /dev/mapper/vgregistry-lvregistrydata
        type = ext4
        
Service state on node deb1.opensvc.com::

        root@deb1:/etc/opensvc# registry.opensvc.com print status
        registry.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       e9828ec4620a@registry:latest
        |  |- vg#1           .... up       vgregistry
        |  |- fs#1           .... up       /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... up       /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... up       registry.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a
        
        root@deb1:/etc/opensvc# registry.opensvc.com docker ps
        CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                        NAMES
        e9828ec4620a        registry:latest     /bin/sh -c 'exec doc   23 minutes ago      Up 23 minutes       37.59.71.25:5000->5000/tcp   registry.opensvc.com.container.1
        
Service state on node deb2.opensvc.com::

        root@deb2:/etc/opensvc# registry.opensvc.com print status
        registry.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     de9a91835513
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgregistry
        |  |- fs#1           .... down     /dev/mapper/vgregistry-lvregistryroot@/opt/registry.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgregistry-lvdockerdata@/opt/registry.opensvc.com/dockerdata
        |  |- fs#3           .... down     /dev/mapper/vgregistry-lvregistrydata@/opt/registry.opensvc.com/registrydata
        |  '- ip#1           .... down     registry.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a
        
Service busybox.opensvc.com
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        
Service configuration file::
        
        root@deb1:/etc/opensvc# cat busybox.opensvc.com.env
        [DEFAULT]
        orchestrate = start
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com deb2.opensvc.com
        docker_data_dir = /opt/busybox.opensvc.com/appdata
        docker_daemon_args = --ip 37.59.71.24
        
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
        mnt_opt = rw
        mnt = /opt/busybox.opensvc.com/appdata
        dev = /dev/mapper/vgbusybox-lvbusyboxdata
        type = ext4
        
        
Service state on deb1.opensvc.com::
        
        root@deb1:/etc/opensvc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       c37b83887947@opensvc/busybox:date
        |  |- container#2    .... up       a189884f060a@opensvc/busybox:date
        |  |- container#3    .... up       fb2513423499@opensvc/busybox:date
        |  |- container#4    .... up       3a7e545bced2@opensvc/busybox:date
        |  |- container#5    .... up       1b6a3d00661e@opensvc/busybox:date
        |  |- container#6    .... up       173a812f4ed5@opensvc/busybox:date
        |  |- container#7    .... up       59fca3cd2745@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a
        
        root@deb1:/etc/opensvc# busybox.opensvc.com docker ps
        CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS               NAMES
        59fca3cd2745        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.7
        173a812f4ed5        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.6
        fb2513423499        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.3
        3a7e545bced2        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.4
        a189884f060a        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.2
        1b6a3d00661e        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.5
        c37b83887947        opensvc/busybox:date   /bin/sh -c 'while tr   13 minutes ago      Up 13 minutes                           busybox.opensvc.com.container.1

Service state on deb2.opensvc.com::

        root@deb2:/etc/opensvc# busybox.opensvc.com print status
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
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

Nodes State
^^^^^^^^^^^

From the physical nodes point of view, the services are in the following states (check overall status column):

UP on node deb1.opensvc.com::

        root@deb1:/etc/opensvc# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    up        up        up         up         n/a        n/a        n/a       up        up         up         False
        busybox.opensvc.com  DEV     hosted    up        up        up         up         n/a        n/a        n/a       up        up         up         False
        
DOWN on node deb2.opensvc.com::

        root@deb2:/etc/opensvc# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    down      down      down       down       n/a        n/a        n/a       up        down       down       False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        n/a       up        down       down       False

Services registry.opensvc.com and busybox.opensvc.com are currently running on node deb1.opensvc.com.
We know that they can be manually relocated on node deb2.opensvc.com, and we need to do it automatically.


Cluster Configuration
---------------------

::

	svcmgr -s registry.opensvc.com set orchestrate=ha

Cluster Failover
----------------

Two kind of events can trigger a cluster failover:

* all heartbeat listeners do not receive peer notifications for timeout period (which is 10 seconds in our example)
* one monitored ressource is not in the "up" status

  * this case is not described here, but in `High Availability Resource Monitoring <howto.ha.html#resource-monitoring>`_

**This setup ensure a robust and easy solution to environments that require high availability.**

Cluster Failback
----------------

When node deb1.opensvc.com is back, it joins the cluster and discover that secondary node deb2.opensvc.com owns services.

Production Use
--------------

If you plan to use this setup in production, it is strongly recommended to:

* enable scsi reservation on disks (add ``scsi_reserve = true`` in volume group resources for each service). This will prevent any data corruption that would happen if both nodes mounts filesystems at the same time.
* implement STONITH as described in `High Availability Stonith <howto.ha.html#stonith>`_. As soon as one secondary node has decided to takeover a service, it will stonith the other node to be sure to be the only node to run the OpenSVC service.
