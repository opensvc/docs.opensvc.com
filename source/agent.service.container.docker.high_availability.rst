Docker High Availability
========================

Considering you are responsible of hosting docker production infrastructures, you are surely interested in improving the service availability. Just imagine you have stacked tens of docker environments on one physical host, you certainly want to ensure that all people accessing your platform won't be prevented from working due to a hardware failure.

The first step consists in implementing a manual failover cluster, like described in `Docker relocation <agent.service.container.docker.relocation.html>`_ tutorial.

The second step, shown in this tutorial, will show up how you can followup with a HA configuration by implementing OpenHA on top of OpenSVC services, leading to a dual node high availability docker cluster.

OpenSVC agent, and OpenHA are both open source free softwares.

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
        autostart_node = deb1.opensvc.com
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
        mnt_opts = rw
        mnt = /opt/registry.opensvc.com/dockerdata
        dev = /dev/mapper/vgregistry-lvdockerdata
        type = ext4
        
        [fs#3]
        mnt_opts = rw
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
        autostart_node = deb1.opensvc.com
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
        mnt_opts = rw
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

One important concept to understand is that the HA cluster is made with 2 different pieces of software

* OpenSVC agent : deals with resources management, and service actions, actually acts as a cluster resource manager

  * this topic is already implemented, described in the previous tutorial part

* OpenHA : used to monitor both cluster nodes, and take decisions about where to start/stop/failover which service.

  * this subject is covered in the following section

OpenSVC Configuration
^^^^^^^^^^^^^^^^^^^^^

2 modifications are expected:

1. remove the autostart_node keyword from service configuration file

  * OpenSVC is no more deciding where the service start, it is now the OpenHA decision.

2. tell OpenSVC that it now depends on OpenHA

First modification implementation::

        root@deb1:/# cd /etc/opensvc
        root@deb1:/etc/opensvc# cp registry.opensvc.com.env registry.opensvc.com.backup
        root@deb1:/etc/opensvc# cat registry.opensvc.com.backup | grep -v autostart_node > registry.opensvc.com.env
        root@deb1:/etc/opensvc# diff registry.opensvc.com.backup registry.opensvc.com.env
        2d1
        < autostart_node = deb1.opensvc.com
        root@deb1:/etc/opensvc# cp busybox.opensvc.com.env busybox.opensvc.com.backup
        root@deb1:/etc/opensvc# cat busybox.opensvc.com.backup | grep -v autostart_node > busybox.opensvc.com.env
        root@deb1:/etc/opensvc# diff busybox.opensvc.com.backup busybox.opensvc.com.env
        2d1
        < autostart_node = deb1.opensvc.com

Second modification implementation::

        root@deb1:/etc/opensvc# cat >> registry.opensvc.com.env << EOF

        [hb#0]
        type = OpenHA
        name = registry
        EOF
        
        root@deb1:/etc/opensvc# cat >> busybox.opensvc.com.env << EOF

        [hb#0]
        type = OpenHA
        name = busybox
        EOF

        root@deb1:/etc/opensvc# tail -3 registry.opensvc.com.env
        [hb#0]
        type = OpenHA
        name = registry
        
        root@deb1:/etc/opensvc# tail -3 busybox.opensvc.com.env
        [hb#0]
        type = OpenHA
        name = busybox

Propagate configuration::

        root@deb1:/etc/opensvc# allupservices syncnodes --force

.. note:: this is a mass action command. Each service in "up" state will propagate its configuration to other nodes. We could have just required the push for our 2 services only.

To continue, we stop both services (not mandatory, but easier to understand in this tutorial context)

on node deb1.opensvc.com::

        root@deb1:/etc/opensvc# registry.opensvc.com stop --cluster
        root@deb1:/etc/opensvc# busybox.opensvc.com stop --cluster

.. warning:: as OpenSVC is no more supposed to pilot services itself, due to the declared heartbeat resource in the <service>.env file, a security prevents it to stop service. It can be overridden by the ``--cluster`` option.

OpenHA installation
^^^^^^^^^^^^^^^^^^^

Installation described in `Getting Started - OpenHA Integration <howto.getting.started.html#openha-integration>`_ and `High Availability Setup <howto.ha.html>`_)

::

        # wget -O /tmp/openha.latest.rpm http://repo.opensvc.com/rpms/deps/el6/openha-0.4.1.osvc1-0.x86_64.rpm
        # alien --to-deb /tmp/openha.latest.rpm
        # dpkg -i openha_0.4.1.osvc1-1_amd64.deb
        # dpkg -l|grep -i openha
        ii  openha                                     0.4.1.osvc1-1                 amd64        EASY high-availability software.
        # ls /usr/local/cluster
        bin  conf  doc  env.sh  ezha.init  log  services

OpenHA configuration
^^^^^^^^^^^^^^^^^^^^

In file :file:`/usr/local/cluster/conf/nodes` we list physical cluster nodes.

**On both nodes**::

        # cat /usr/local/cluster/conf/nodes
        deb1.opensvc.com
        deb2.opensvc.com

The heartbeat configuration file :file:`/usr/local/cluster/conf/monitor` contains the following lines.

.. note:: Whatever the heartbeat type (network, disk), the same logic is used, the first node announce its heartbeat status while the other node reads it.

**On both nodes**::

        # cat /usr/local/cluster/conf/monitor
        deb1.opensvc.com	net	eth1	239.131.50.10	5010	10
        deb1.opensvc.com	net	eth2	239.131.50.11	5011	10
        deb2.opensvc.com	net	eth1	239.131.50.12	5012	10
        deb2.opensvc.com	net	eth2	239.131.50.13	5013	10
        deb1.opensvc.com	dio	/dev/mapper/disk.hb.0	0	10
        deb2.opensvc.com	dio	/dev/mapper/disk.hb.0	10	10

This 3 heartbeats (2 networks + 1 disk) configuration means:

- ``deb1.opensvc.com`` node will send heartbeat through eth1 on multicast IP 239.131.50.10 port 5010, with a 10 seconds timeout, and ``deb2.opensvc.com`` node will listen on the same ip port
- ``deb1.opensvc.com`` node will send heartbeat through eth2 on multicast IP 239.131.50.11 port 5011, with a 10 seconds timeout, and ``deb2.opensvc.com`` node will listen on the same ip port
- ``deb2.opensvc.com`` node will send heartbeat through eth1 on multicast IP 239.131.50.12 port 5012, with a 10 seconds timeout, and ``deb1.opensvc.com`` node will listen on the same ip port
- ``deb2.opensvc.com`` node will send heartbeat through eth2 on multicast IP 239.131.50.13 port 5013, with a 10 seconds timeout, and ``deb1.opensvc.com`` node will listen on the same ip port
- ``deb1.opensvc.com`` node will write heartbeat starting from the first block of disk ``/dev/mapper/disk.hb.0`` with a 10 seconds timeout, and ``deb2.opensvc.com`` node will read it from the first block
- ``deb2.opensvc.com`` node will write heartbeat starting from block number 10 of disk ``/dev/mapper/disk.hb.0`` with a 10 seconds timeout, and ``deb1.opensvc.com`` node will read it from the block number 10

.. note:: adjust heartbeat configuration according to your setup. Only disk, only network, a mix of both.

The OpenHA services are configured and mapped 1 to 1 to OpenSVC services:

Loading cluster environment, on both nodes::

        # export EZ=/usr/local/cluster
        # . $EZ/env.sh
        
Creating OpenHA service ``registry``, on both nodes::

        # $EZ_BIN/service -a registry /etc/opensvc/registry.opensvc.com.cluster deb1.opensvc.com deb2.opensvc.com /bin/true
        Creating service registry :
        Directory /usr/local/cluster/services/registry created
        State file /usr/local/cluster/services/registry/STATE.deb1.opensvc.com created with initial state FROZEN_STOP
        State file /usr/local/cluster/services/registry/STATE.deb2.opensvc.com created with initial state FROZEN_STOP
        Done.
        
Creating OpenHA service ``busybox``, on both nodes::

        # $EZ_BIN/service -a busybox /etc/opensvc/busybox.opensvc.com.cluster deb1.opensvc.com deb2.opensvc.com /bin/true
        Creating service busybox :
        Directory /usr/local/cluster/services/busybox created
        State file /usr/local/cluster/services/busybox/STATE.deb1.opensvc.com created with initial state FROZEN_STOP
        State file /usr/local/cluster/services/busybox/STATE.deb2.opensvc.com created with initial state FROZEN_STOP
        Done.

* -a busybox : add an OpenHA service named busybox
* /etc/opensvc/busybox.opensvc.com.cluster : is the start/stop script for the service
* deb1.opensvc.com : is the primary node
* deb2.opensvc.com : is the secondary node
* /bin/true : is the check-up script ran before service startup. Should be replaced by a stonith command for production implementation.

OpenHA Start
^^^^^^^^^^^^

on node deb1.opensvc.com::

        root@deb1:~# $EZ/ezha start
        
        root@deb1:~# ez_ps
        root     25004  0.0  0.1  16664   924 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartd eth1 239.131.50.10 5010
        root     25007  0.0  0.1  16664   920 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartd eth2 239.131.50.11 5011
        root     25010  0.0  0.0  16452   500 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartc eth1 239.131.50.12 5012 10
        root     25013  0.0  0.0  16452   500 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartc eth2 239.131.50.13 5013 10
        root     25016  0.0  0.1  16452   908 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartd_dio /dev/mapper/disk.hb.0 0
        root     25019  0.0  0.1  16240   756 pts/10   S<   07:46   0:00 /usr/local/cluster/bin/heartc_dio /dev/mapper/disk.hb.0 10 10
        root     25024  0.0  0.2  97928  1052 pts/10   S    07:46   0:00 /usr/local/cluster/bin/nmond
        
        root@deb1:~# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com UNKNOWN
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com UNKNOWN

.. note:: FROZEN_STOP is the expected, default OpenHA service status at first service declaration
        
::

        root@deb1:~# ez_hb_status
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net sender eth1:239.131.50.10 pid 25004 status UP, updated at Jun 19 08:00:57
        net sender eth2:239.131.50.11 pid 25007 status UP, updated at Jun 19 08:00:57
        net listener eth1:239.131.50.12 status DOWN
        net listener eth2:239.131.50.13 status DOWN
        dio sender /dev/mapper/disk.hb.0:0 pid 25016 status UP, updated at Jun 19 08:00:58
        dio listener /dev/mapper/disk.hb.0:10 status DOWN

.. note:: although deb1 heartbeat senders are announcing their state accurately, the listeners processes do not manage to read anything announced from deb2, it is a normal state because OpenHA is not started on deb2 at the moment

on node deb2.opensvc.com::


        root@deb2:/# $EZ/ezha start
        
        root@deb2:/# ez_ps
        root     12407  0.0  0.1  16452   736 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartc eth1 239.131.50.10 5010 10
        root     12410  0.0  0.1  16452   740 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartc eth2 239.131.50.11 5011 10
        root     12413  0.0  0.1  16664   920 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartd eth1 239.131.50.12 5012
        root     12416  0.0  0.1  16664   920 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartd eth2 239.131.50.13 5013
        root     12419  0.0  0.1  16240   768 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartc_dio /dev/mapper/disk.hb.0 0 10
        root     12422  0.0  0.1  16452   908 pts/0    S<   08:10   0:00 /usr/local/cluster/bin/heartd_dio /dev/mapper/disk.hb.0 10
        root     12426  0.0  0.2  32392  1040 pts/0    S    08:10   0:00 /usr/local/cluster/bin/nmond
        
        root@deb2:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        registry         deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        
        root@deb2:/# ez_hb_status
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 pid 25004 status UP, updated at Jun 19 08:10:49
        net listener eth2:239.131.50.11 pid 25007 status UP, updated at Jun 19 08:10:49
        net sender eth1:239.131.50.12 pid 12413 status UP, updated at Jun 19 08:10:49
        net sender eth2:239.131.50.13 pid 12416 status UP, updated at Jun 19 08:10:49
        dio listener /dev/mapper/disk.hb.0:0 pid 25016 status UP, updated at Jun 19 08:10:40
        dio sender /dev/mapper/disk.hb.0:10 pid 12422 status UP, updated at Jun 19 08:10:49

.. note:: all heartbeat processes are OK, senders and listeners. It is the same on the other node deb1 (you can check)

OpenHA Services
^^^^^^^^^^^^^^^

As you have seen, both OpenHA service are in FROZEN_STOP state, which means that they are declared in OpenHA, but their state can't change. They first have to be unfrozen.

check OpenSVC state, service should be stopped on both nodes::

        root@deb1:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False
        
        root@deb2:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False

Unfreeze service ``registry`` on node deb1.opensvc.com::

        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        
        root@deb1:/# $EZ_BIN/service -A registry unfreeze
        Ready to UNFREEZE, we are (FROZEN_STOP)
        Service registry UNFROZEN
        
        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com START_READY    deb2.opensvc.com FROZEN_STOP
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        
        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTING       deb2.opensvc.com FROZEN_STOP
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        
        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com FROZEN_STOP
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        
        root@deb1:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    up        up        up         up         n/a        n/a        up        up        up         up         False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False
        
        root@deb1:/# registry.opensvc.com print status
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
        '- hb                     up
           '- hb#0           .... up       hb.openha

        root@deb1:/# registry.opensvc.com docker ps
        CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                        NAMES
        e9828ec4620a        registry:latest     /bin/sh -c 'exec doc   47 hours ago        Up 2 minutes       37.59.71.25:5000->5000/tcp   registry.opensvc.com.container.1

.. note:: after unfreeze, we see different state changes, FROZEN_STOP=>START_READY=>STARTING=>STARTED. Once STARTED is achieved, the service is up and running

Unfreeze service ``registry`` on node deb2.opensvc.com::

        root@deb2:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com FROZEN_STOP

        root@deb2:/# $EZ_BIN/service -A registry unfreeze
        Ready to UNFREEZE, we are (FROZEN_STOP)
        Service registry UNFROZEN

        root@deb2:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED

        root@deb2:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    down      down      down       down       n/a        n/a        down      up        down       down       False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        warn      up        down       warn       False

.. note:: OpenHA service ``registry`` is now STARTED@deb1 and STOPPED@deb2.

We can enable the second service ``busybox``, using the same procedure:

Unfreeze service ``busybox`` on node deb1.opensvc.com::

        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        busybox          deb1.opensvc.com FROZEN_STOP    deb2.opensvc.com FROZEN_STOP

        root@deb1:/# $EZ_BIN/service -A busybox unfreeze
        Ready to UNFREEZE, we are (FROZEN_STOP)
        Service busybox UNFROZEN

        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        busybox          deb1.opensvc.com START_READY    deb2.opensvc.com FROZEN_STOP

        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        busybox          deb1.opensvc.com STARTING       deb2.opensvc.com FROZEN_STOP

        root@deb1:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com FROZEN_STOP

        root@deb1:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    up        up        up         up         n/a        n/a        up        up        up         up         False
        busybox.opensvc.com  DEV     hosted    up        up        up         up         n/a        n/a        up        up        up         up         False

        root@deb1:/# busybox.opensvc.com print status
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
        '- hb                     up
           '- hb#0           .... up       hb.openha

        root@deb1:/# busybox.opensvc.com docker attach 59fca3cd2745
        Thu Jun 19 07:07:27 UTC 2014
        Thu Jun 19 07:07:28 UTC 2014
        Thu Jun 19 07:07:29 UTC 2014
        Thu Jun 19 07:07:30 UTC 2014

        root@deb1:/# busybox.opensvc.com docker ps
        CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS               NAMES
        59fca3cd2745        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.7
        173a812f4ed5        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.6
        fb2513423499        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.3
        3a7e545bced2        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.4
        a189884f060a        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.2
        1b6a3d00661e        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.5
        c37b83887947        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up About a minute                       busybox.opensvc.com.container.1

Unfreeze service ``busybox`` on node deb2.opensvc.com::

        root@deb2:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com FROZEN_STOP
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        
        root@deb2:/# $EZ_BIN/service -A busybox unfreeze
        Ready to UNFREEZE, we are (FROZEN_STOP)
        Service busybox UNFROZEN
        
        root@deb2:/# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED

Cluster Failover
----------------

Two kind of events can trigger a cluster failover:

* all heartbeat listeners do not receive peer notifications for timeout period (which is 10 seconds in our example)
* one monitored ressource is not in the "up" status

  * this case is not described here, but in `High Availability Resource Monitoring <howto.ha.html#resource-monitoring>`_

We will halt node deb1.opensvc.com and observe what happens from deb2.opensvc.com:

* primary node halt is launched around Jun 19 09:31:57
* secondary node is running an infinite loop ``while true; do echo "-----------------------------"; ez_svc_status; ez_hb_status; date; sleep 5; done``, so as to fully understand what happens

On node deb2.opensvc.com::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 pid 2861 status UP, updated at Jun 19 09:31:55
        net listener eth2:239.131.50.11 pid 2864 status UP, updated at Jun 19 09:31:55
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:31:55
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:31:55
        dio listener /dev/mapper/disk.hb.0:0 pid 2873 status UP, updated at Jun 19 09:31:48
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:31:55
        Thu Jun 19 09:31:56 CEST 2014

.. note:: halt is launched just after this sample


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 pid 2861 status UP, updated at Jun 19 09:31:57
        net listener eth2:239.131.50.11 pid 2864 status UP, updated at Jun 19 09:31:57
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:00
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:00
        dio listener /dev/mapper/disk.hb.0:0 pid 2873 status UP, updated at Jun 19 09:31:58
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:00
        Thu Jun 19 09:32:01 CEST 2014

.. note:: we can observe that listeners update time is now fixed to 09:31:57. This means that other node is halted, and no more sending heartbeats.


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        registry         deb1.opensvc.com STARTED        deb2.opensvc.com STOPPED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 pid 2861 status UP, updated at Jun 19 09:31:57
        net listener eth2:239.131.50.11 pid 2864 status UP, updated at Jun 19 09:31:57
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:05
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:05
        dio listener /dev/mapper/disk.hb.0:0 pid 2873 status UP, updated at Jun 19 09:31:58
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:05
        Thu Jun 19 09:32:06 CEST 2014

.. note:: node deb2.opensvc.com is still waiting for timeout expiring, which should occur at around 09:32:07


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com UNKNOWN        deb2.opensvc.com START_READY
        registry         deb1.opensvc.com UNKNOWN        deb2.opensvc.com START_READY
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 status DOWN
        net listener eth2:239.131.50.11 status DOWN
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:10
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:10
        dio listener /dev/mapper/disk.hb.0:0 status DOWN
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:10
        Thu Jun 19 09:32:11 CEST 2014

.. note:: More than 10 seconds are elapsed since deb1.opensvc.com was halted. Node deb2.opensv.com tag its partner as UNKNOWN, for all services, and start service takeover. When cluster is configured with stonith features, it is the moment where other node is killed, so as to avoid split brain cluster.


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTING
        registry         deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 status DOWN
        net listener eth2:239.131.50.11 status DOWN
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:15
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:15
        dio listener /dev/mapper/disk.hb.0:0 status DOWN
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:15
        Thu Jun 19 09:32:16 CEST 2014

.. note:: we can see that service starup is done in parallel in the "secstate" column


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTING
        registry         deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 status DOWN
        net listener eth2:239.131.50.11 status DOWN
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:20
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:20
        dio listener /dev/mapper/disk.hb.0:0 status DOWN
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:20
        Thu Jun 19 09:32:21 CEST 2014
        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTING
        registry         deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 status DOWN
        net listener eth2:239.131.50.11 status DOWN
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:25
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:25
        dio listener /dev/mapper/disk.hb.0:0 status DOWN
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:25
        Thu Jun 19 09:32:26 CEST 2014

.. note:: service busybox.opensvc.com is longer to start than service registry.opensvc.com


::

        -----------------------------
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        busybox          deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTED
        registry         deb1.opensvc.com UNKNOWN        deb2.opensvc.com STARTED
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net listener eth1:239.131.50.10 status DOWN
        net listener eth2:239.131.50.11 status DOWN
        net sender eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 09:32:30
        net sender eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 09:32:30
        dio listener /dev/mapper/disk.hb.0:0 status DOWN
        dio sender /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 09:32:30
        Thu Jun 19 09:32:31 CEST 2014
        


        root@deb2:/# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    up        up        up         up         n/a        n/a        up        up        up         up         False
        busybox.opensvc.com  DEV     hosted    up        up        up         up         n/a        n/a        up        up        up         up         False

        root@deb2:/# busybox.opensvc.com docker ps
        CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS               NAMES
        59fca3cd2745        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.7
        173a812f4ed5        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.6
        fb2513423499        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.3
        3a7e545bced2        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.4
        a189884f060a        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.2
        1b6a3d00661e        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 17 seconds                           busybox.opensvc.com.container.5
        c37b83887947        opensvc/busybox:date   /bin/sh -c 'while tr   47 hours ago        Up 18 seconds                           busybox.opensvc.com.container.1
        root@deb2:/# date
        Thu Jun 19 09:32:52 CEST 2014

.. note:: both services are now up and running on node deb2.opensvc.com


From halt on primary node to service availability on secondary node, we can see a **1 minute delay**, mostly due to application startup times.

**This setup ensure a robust and easy solution to environments that require high availability. Lots of clusters are currently running in production with OpenSVC & OpenHA.**

Cluster Failback
----------------

When node deb1.opensvc.com is back, it joins the cluster and discover that secondary node deb2.opensvc.com owns services.

::

        root@deb1:~# ez_svc_status
        => Querying OpenHA services status [/usr/local/cluster/bin/service -s -c]
        service          prinode          pristate       secnode          secstate
        registry         deb1.opensvc.com STOPPED        deb2.opensvc.com STARTED
        busybox          deb1.opensvc.com STOPPED        deb2.opensvc.com STARTED
        
        root@deb1:~# ez_hb_status
        => Querying OpenHA heartbeat status [/usr/local/cluster/bin/hb -s]
        net sender eth1:239.131.50.10 pid 2914 status UP, updated at Jun 19 10:03:11
        net sender eth2:239.131.50.11 pid 2941 status UP, updated at Jun 19 10:03:11
        net listener eth1:239.131.50.12 pid 17469 status UP, updated at Jun 19 10:03:11
        net listener eth2:239.131.50.13 pid 17472 status UP, updated at Jun 19 10:03:11
        dio sender /dev/mapper/disk.hb.0:0 pid 3015 status UP, updated at Jun 19 10:03:11
        dio listener /dev/mapper/disk.hb.0:10 pid 17478 status UP, updated at Jun 19 10:03:09
        
        root@deb1:~# svcmon --service=registry.opensvc.com,busybox.opensvc.com
        service              service container container ip        disk       fs         share      app        hb        sync      avail      overall
        name                 type    type      status    status    status     status     status     status     status    status    status     status     frozen
        -------              ------- --------- --------- ------    ------     ------     ------     ------     ------    ------    ------     -------    ------
        registry.opensvc.com DEV     hosted    down      down      down       down       n/a        n/a        down      up        down       down       False
        busybox.opensvc.com  DEV     hosted    down      down      down       down       n/a        n/a        down      up        down       down       False

Production Use
--------------

If you plan to use this setup in production, it is strongly recommended to:

* enable scsi reservation on disks (add ``scsi_reserve = true`` in volume group resources for each service). This will prevent any data corruption that would happen if both nodes mounts filesystems at the same time.
* implement STONITH as described in `High Availability Stonith <howto.ha.html#stonith>`_. As soon as one secondary node has decided to takeover a service, it will stonith the other node to be sure to be the only node to run the OpenSVC service.
