Docker Disaster Recovery Plan (DRP)
===================================

You are happy with your Docker infrastructure, but what happen if you meet a serious issue in your datacenter ? 
This tutorial will show up how you can setup a Docker infrastructure, with a ready to use disaster recovery solution

Pre-requisites
--------------

* OpenSVC service managing docker container(s) (We use same container as described in `Docker Relocation <agent.service.container.docker.relocation.html>`_ )
* 1 physical server acting as Production node
* 1 physical server acting as DRP node
* Both nodes have OpenSVC agent and Docker installed

Initial State
-------------

At the beginning we start with container ``opensvc/busybox:date`` running in OpenSVC service ``busybox.opensvc.com``, located on a single physical host named ``deb1.opensvc.com`` :

**Initial Service Configuration**::

        root@deb1:/opt/opensvc/etc# cat busybox.opensvc.com.env
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
        
        [ip#1]
        ipdev = eth0
        ipname = busybox.opensvc.com
        
        [vg#1]
        vgname = vglocaldeb1
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/busybox.opensvc.com
        dev = /dev/mapper/vglocaldeb1-lvbusyboxroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/busybox.opensvc.com/appdata
        dev = /dev/mapper/vglocaldeb1-lvbusyboxdata
        type = ext4

::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# busybox.opensvc.com docker pull opensvc/busybox:date
        Pulling repository opensvc/busybox
        b073e328878e: Download complete
        511136ea3c5a: Download complete
        b6c0d171b362: Download complete
        9798716626f6: Download complete
        98b9fdab1cb6: Download complete
        e2dda52210a3: Download complete

        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     opensvc/busybox:date
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# busybox.opensvc.com startcontainer
        17:07:20 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock run -t -i -d --name=busybox.opensvc.com.container.1 b073e328878e
        17:07:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        ce6204fcec5a1e449a52d232c87d724fb0349cf9d932abfd8dfc9e976c10ab8b
        
        17:07:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container up status
        17:07:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a

        root@deb1:/# busybox.opensvc.com docker attach ce6204fcec5a
        Fri Jun  6 15:08:25 UTC 2014
        Fri Jun  6 15:08:26 UTC 2014
        Fri Jun  6 15:08:27 UTC 2014
        
At this point we have a simple service, running a docker container, fetching time each second on stdout.

Enabling DRP on OpenSVC Service
-------------------------------

We want to be able to enable service on DRP physical node named ``deb2.opensvc.com``

Basically, we have to:

* declare node ``deb2.opensvc.com`` as being a DRP node for service ``busybox.opensvc.com``
* deal with technical differences between primary node and drp node
* declare a data replication method


Adding DRP node in configuration file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We can do this modification while service is running : we will add a ``drpnodes`` statement in the default section

**Once it's done on deb1.opensvc.com**::

        root@deb1:/opt/opensvc/etc# head -6 busybox.opensvc.com.env
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        drpnodes = deb2.opensvc.com


Dealing with servers differences
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We have to deal with problems like:

* network card is not the same ( example : bond0 on production, and eth0 on drp side )
* LVM volume groups does not have the same name
* LVM logical volume does not have the same name
* IP address to bind the service is not the same

To workaround those problems, OpenSVC software use a concept named "scoping". This means that resources parameters can change depending on their context.

**Declaring different docker parameters**::

        docker_daemon_args@nodes = --ip 37.59.71.25
        docker_daemon_args@drpnodes = --ip 37.59.71.24

**Declaring different ip addresses**::

        [ip#1]
        ipdev = eth0
        ipname@deb1.opensvc.com = busybox.opensvc.com
        ipname@deb2.opensvc.com = busybox-drp.opensvc.com
        
**Declaring different volume groups**::

        [vg#1]
        vgname@deb1.opensvc.com = vglocaldeb1
        vgname@deb2.opensvc.com = vglocaldeb2
        always_on = drpnodes

.. note:: "always_on = drpnodes" keyword specify that service must enable lvm volume group upon startup on drpnodes, because we always need the target logical volumes to be available for the replication to be fine
        
**Declaring different logical volumes**::

        [fs#1]
        mnt_opt = rw
        mnt = /opt/busybox.opensvc.com
        dev@deb1.opensvc.com = /dev/mapper/vglocaldeb1-lvbusyboxroot
        dev@deb2.opensvc.com = /dev/mapper/vglocaldeb2-lvbusyboxroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/busybox.opensvc.com/appdata
        dev@deb1.opensvc.com = /dev/mapper/vglocaldeb1-lvbusyboxdata
        dev@deb2.opensvc.com = /dev/mapper/vglocaldeb2-lvbusyboxdata
        type = ext4


Replicating datas
^^^^^^^^^^^^^^^^^

One of the great OpenSVC feature is that it is very modular about data replication, you just have to declare a ``sync#X`` section, with a supported type, and you're done. Type corresponds to accurate replication driver like drdb, dds, netapp snapmirror, emc srdf, hp 3par remote copy... Each setup is just a question of teaching OpenSVC how to deal with your storage technology. Please consult `Supported data replication modes <agent.feature.matrix.html#supported-data-replication-modes>`_ to discover storage technologies supported. Feel free to contribute if your storage equipment is not already supported, or contact us if you prefer that we develop it to suits your needs.

Data replication method have to be choosen depending on multiple criterias:

* **RPO** is the amount of data you are authorized to lose when you enable the DRP solution. It can be lossless and you need a synchronous replication solution, or it can be 5 minutes, 1 hour, or more, and an asynchronous solution is fine. People responsible of the application you are protecting is the only capable of explaining what are the needs.
* **RTO** is the time needed to enable the DRP once decision to go is taken. It can be weeks (replication solution can be 1.44MB floppy disks or old tapes) to minutes (in this case you need some tools, and standby hosts/storage).
* **Crash consistent or Application consistent** : depending on your application robustness, you may just need to have an image of your data, at a time where the application was open and running (called crash consistent), or you may require an application consistent image, this means that you have to use tools (script/api/...) to tell application that you need to take a picture of the datas. Again, each application is different, consult your application provider to be sure you are doing the right way.

In our current example, we use a very cheap (but working) solution, we assume that volume groups and logical volumes are located on internal disks, thus we choose ``dds`` replication type. This will allow us to have asynchronous, incremental LVM snapshot based data replication, like described in `DDS Replication <storage.dds.html>`_

As we need to replicate 2 filesystems to the DRP node, we have to declare 2 ``sync#X`` sections like below::

        [sync#1]
        type = dds
        src = /dev/mapper/vglocaldeb1-lvbusyboxroot
        dst = /dev/mapper/vglocaldeb2-lvbusyboxroot
        target = drpnodes
        
        [sync#2]
        type = dds
        src = /dev/mapper/vglocaldeb1-lvbusyboxdata
        dst = /dev/mapper/vglocaldeb2-lvbusyboxdata
        target = drpnodes


Config Summary
^^^^^^^^^^^^^^

The service configuration looks like::

        root@deb1:/opt/opensvc/etc# cat busybox.opensvc.com.env
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com
        drpnodes = deb2.opensvc.com
        docker_data_dir = /opt/busybox.opensvc.com/appdata
        docker_daemon_args@nodes = --ip 37.59.71.25
        docker_daemon_args@drpnodes = --ip 37.59.71.24
        
        [container#1]
        type = docker
        run_image = b073e328878e
        
        [ip#1]
        ipdev = eth0
        ipname@deb1.opensvc.com = busybox.opensvc.com
        ipname@deb2.opensvc.com = busybox-drp.opensvc.com
        
        [vg#1]
        vgname@deb1.opensvc.com = vglocaldeb1
        vgname@deb2.opensvc.com = vglocaldeb2
        always_on = drpnodes
        
        [fs#1]
        mnt_opt = rw
        mnt = /opt/busybox.opensvc.com
        dev@deb1.opensvc.com = /dev/mapper/vglocaldeb1-lvbusyboxroot
        dev@deb2.opensvc.com = /dev/mapper/vglocaldeb2-lvbusyboxroot
        type = ext4
        
        [fs#2]
        mnt_opts = rw
        mnt = /opt/busybox.opensvc.com/appdata
        dev@deb1.opensvc.com = /dev/mapper/vglocaldeb1-lvbusyboxdata
        dev@deb2.opensvc.com = /dev/mapper/vglocaldeb2-lvbusyboxdata
        type = ext4
        
        [sync#1]
        type = dds
        src = /dev/mapper/vglocaldeb1-lvbusyboxroot
        dst = /dev/mapper/vglocaldeb2-lvbusyboxroot
        target = drpnodes
        
        [sync#2]
        type = dds
        src = /dev/mapper/vglocaldeb1-lvbusyboxdata
        dst = /dev/mapper/vglocaldeb2-lvbusyboxdata
        target = drpnodes


Testing Modifications
^^^^^^^^^^^^^^^^^^^^^

Status complains about lvm logical volumes have never been replicated, and configuration on drpnode need to be refreshed.

::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   warn
        |  |- sync#1         .... warn     dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |                               # dds state file not found
        |  |- sync#2         .... warn     dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |                               # dds state file not found
        |  |- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |  |                               # deb2.opensvc.com need update
        |  '- sync#i1        .... down     rsync system files to drpnodes
        |                                  # deb2.opensvc.com need update
        '- hb                     n/a

We trigger an initial full data synchronization::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com syncfullsync
        18:11:10 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvcreate -s -n lvbusyboxdata_osvc_snap1 -L 102.0M /dev/vglocaldeb1/lvbusyboxdata
        18:11:16 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxdata_osvc_snap1" created
        
        18:11:16 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  update state file with snap uuid Zd3fOM-Oxfy-XMPk-XhGP-ayYq-3ZJN-kVQGQU
        18:11:16 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvcreate -s -n lvbusyboxroot_osvc_snap1 -L 102.0M /dev/vglocaldeb1/lvbusyboxroot
        18:11:20 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxroot_osvc_snap1" created
        
        18:11:20 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  update state file with snap uuid 5QCucL-11s3-lafC-eE8x-Ice1-wgOz-etLDua
        18:11:20 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  dd if=/dev/vglocaldeb1/lvbusyboxdata_osvc_snap1 bs=1M | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dd bs=1M of=/dev/mapper/vglocaldeb2-lvbusyboxdata
        1024+0 records in
        1024+0 records out
        1073741824 bytes (1.1 GB) copied, 22.5169 s, 47.7 MB/s
        0+63178 enregistrements lus
        0+63178 enregistrements écrits
        1073741824 octets (1,1 GB) copiés, 22,4865 s, 47,8 MB/s
        18:11:42 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state
        18:11:42 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  dd if=/dev/vglocaldeb1/lvbusyboxroot_osvc_snap1 bs=1M | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dd bs=1M of=/dev/mapper/vglocaldeb2-lvbusyboxroot
        1024+0 records in
        1024+0 records out
        1073741824 bytes (1.1 GB) copied, 33.7963 s, 31.8 MB/s
        0+62091 enregistrements lus
        0+62091 enregistrements écrits
        1073741824 octets (1,1 GB) copiés, 33,7645 s, 31,8 MB/s
        18:12:16 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   warn
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |  |                               # deb2.opensvc.com need update
        |  '- sync#i1        .... down     rsync system files to drpnodes
        |                                  # deb2.opensvc.com need update
        '- hb                     n/a

.. note::  ``sync#1`` and ``sync#2`` resources are now in ``up`` state.

We trigger OpenSVC service configuration sync to drpnodes, which also initiate an incremental update of data synchronization::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com syncdrp --force
        18:13:16 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvcreate -s -n lvbusyboxdata_osvc_snap2 -L 102.0M /dev/vglocaldeb1/lvbusyboxdata
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxdata_osvc_snap2" created
        
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvcreate -s -n lvbusyboxroot_osvc_snap2 -L 102.0M /dev/vglocaldeb1/lvbusyboxroot
        18:13:54 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxroot_osvc_snap2" created
        
        18:13:54 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  dds --extract --cow /dev/mapper/vglocaldeb1-lvbusyboxdata_osvc_snap1-cow --source /dev/vglocaldeb1/lvbusyboxdata_osvc_snap2 | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dds --merge --dest /dev/mapper/vglocaldeb2-lvbusyboxdata -v
        18:13:55 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  Snapshot header:
          magic             0x70416e53
          version           1
          valid             yes
          chunk_size        4 KB
        Report:
          Exception chunks  1
          Exceptions        107
          Output size meta  8 KB
          Output size data  428 KB
          Output size total 436 KB
        
        18:13:55 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvremove -f /dev/vglocaldeb1/lvbusyboxdata_osvc_snap1
        18:14:11 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Logical volume "lvbusyboxdata_osvc_snap1" successfully removed
        
        18:14:11 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvrename vglocaldeb1 lvbusyboxdata_osvc_snap2 lvbusyboxdata_osvc_snap1
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Renamed "lvbusyboxdata_osvc_snap2" to "lvbusyboxdata_osvc_snap1" in volume group "vglocaldeb1"
        
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  update state file with snap uuid xCHoG0-ghs9-Rpzx-nEzk-1pLC-gPku-Mffsyk
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  dds --extract --cow /dev/mapper/vglocaldeb1-lvbusyboxroot_osvc_snap1-cow --source /dev/vglocaldeb1/lvbusyboxroot_osvc_snap2 | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dds --merge --dest /dev/mapper/vglocaldeb2-lvbusyboxroot -v
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  Snapshot header:
          magic             0x70416e53
          version           1
          valid             yes
          chunk_size        4 KB
        Report:
          Exception chunks  1
          Exceptions        20
          Output size meta  8 KB
          Output size data  80 KB
          Output size total 88 KB
        
        18:14:13 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvremove -f /dev/vglocaldeb1/lvbusyboxroot_osvc_snap1
        18:14:20 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Logical volume "lvbusyboxroot_osvc_snap1" successfully removed
        
        18:14:20 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvrename vglocaldeb1 lvbusyboxroot_osvc_snap2 lvbusyboxroot_osvc_snap1
        18:14:21 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Renamed "lvbusyboxroot_osvc_snap2" to "lvbusyboxroot_osvc_snap1" in volume group "vglocaldeb1"
        
        18:14:23 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  update state file with snap uuid fCD6EK-Digj-cRk5-fEoM-3lnq-d38U-PzCOrp
        18:14:23 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state
        18:14:23 INFO    BUSYBOX.OPENSVC.COM         exec '/opt/opensvc/etc/busybox.opensvc.com --waitlock 3600 postsync' on node deb2.opensvc.com

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   up
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
        |  '- sync#i1        .... up       rsync system files to drpnodes
        '- hb                     n/a

.. note::  The service is now up, and replicated. ``--force`` flag was used because we are outside of the authorized sync period. By default, OpenSVC will trigger an syncdrp action once a day, during the night.

Testing DRP
^^^^^^^^^^^

Before testing DRP, you have to be aware of your data consistency between Production and DRP side:

* Real disaster (0 < RPO < 24H) : you do not have other choice than starting on data located on the DRP side, which can be 24 hours (maximum, it may also be 1 minute if you are "lucky" ) in the past with default OpenSVC settings and DDS replication driver.
* Test disaster (RPO = 0): you will trigger a syncupdate, to be sure that same datas are located on both sides.

::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... up       vglocaldeb1
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   up
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
        |  '- sync#i1        .... up       rsync system files to drpnodes
        '- hb                     n/a
        
.. warning:: at this point, you should have turned off users access to your application so as to avoid losing data on drp side.

Trigerring incremental data replication::
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com syncupdate --force
        19:08:41 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvcreate -s -n lvbusyboxdata_osvc_snap2 -L 102.0M /dev/vglocaldeb1/lvbusyboxdata
        19:08:48 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxdata_osvc_snap2" created
        
        19:08:48 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvcreate -s -n lvbusyboxroot_osvc_snap2 -L 102.0M /dev/vglocaldeb1/lvbusyboxroot
        19:08:52 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Rounding up size to full physical extent 104.00 MiB
          Logical volume "lvbusyboxroot_osvc_snap2" created
        
        19:08:52 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  dds --extract --cow /dev/mapper/vglocaldeb1-lvbusyboxdata_osvc_snap1-cow --source /dev/vglocaldeb1/lvbusyboxdata_osvc_snap2 | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dds --merge --dest /dev/mapper/vglocaldeb2-lvbusyboxdata -v
        19:08:52 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  Snapshot header:
          magic             0x70416e53
          version           1
          valid             yes
          chunk_size        4 KB
        Report:
          Exception chunks  1
          Exceptions        57
          Output size meta  8 KB
          Output size data  228 KB
          Output size total 236 KB
        
        19:08:52 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvremove -f /dev/vglocaldeb1/lvbusyboxdata_osvc_snap1
        19:08:56 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Logical volume "lvbusyboxdata_osvc_snap1" successfully removed
        
        19:08:56 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  lvrename vglocaldeb1 lvbusyboxdata_osvc_snap2 lvbusyboxdata_osvc_snap1
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  output:
          Renamed "lvbusyboxdata_osvc_snap2" to "lvbusyboxdata_osvc_snap1" in volume group "vglocaldeb1"
        
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  update state file with snap uuid 2hfvQV-OowW-JvqS-R6lw-5gW0-IEFa-pqd44j
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#2  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#2_dds_state
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  dds --extract --cow /dev/mapper/vglocaldeb1-lvbusyboxroot_osvc_snap1-cow --source /dev/vglocaldeb1/lvbusyboxroot_osvc_snap2 | /usr/bin/ssh -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com dds --merge --dest /dev/mapper/vglocaldeb2-lvbusyboxroot -v
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  Snapshot header:
          magic             0x70416e53
          version           1
          valid             yes
          chunk_size        4 KB
        Report:
          Exception chunks  1
          Exceptions        26
          Output size meta  8 KB
          Output size data  104 KB
          Output size total 112 KB
        
        19:08:57 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvremove -f /dev/vglocaldeb1/lvbusyboxroot_osvc_snap1
        19:08:58 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Logical volume "lvbusyboxroot_osvc_snap1" successfully removed
        
        19:08:58 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  lvrename vglocaldeb1 lvbusyboxroot_osvc_snap2 lvbusyboxroot_osvc_snap1
        19:08:58 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  output:
          Renamed "lvbusyboxroot_osvc_snap2" to "lvbusyboxroot_osvc_snap1" in volume group "vglocaldeb1"
        
        19:08:59 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  update state file with snap uuid TJwnak-FSZI-Py2s-V8Wr-AUbQ-wlXM-Sdm375
        19:08:59 INFO    BUSYBOX.OPENSVC.COM.SYNC#1  /usr/bin/scp -q -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state deb2.opensvc.com:/opt/opensvc/var/busybox.opensvc.com_sync#1_dds_state

Stopping service on **production** side::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com stop
        19:09:08 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock stop ce6204fcec5a
        19:09:20 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        ce6204fcec5a
        
        19:09:20 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container down status
        19:09:20 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 no more container handled by docker daemon. shut it down
        19:09:20 INFO    BUSYBOX.OPENSVC.COM.FS#2    umount /opt/busybox.opensvc.com/appdata
        19:09:25 INFO    BUSYBOX.OPENSVC.COM.FS#1    umount /opt/busybox.opensvc.com
        19:09:27 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --deltag @deb1.opensvc.com vglocaldeb1
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          Volume group "vglocaldeb1" successfully changed
        
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vglocaldeb1/lvbusyboxdata
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vglocaldeb1/lvbusyboxdata_osvc_snap1
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vglocaldeb1/lvbusyboxroot
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vglocaldeb1/lvbusyboxroot_osvc_snap1
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a n vglocaldeb1
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          0 logical volume(s) in volume group "vglocaldeb1" now active
        
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 down
        19:09:28 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vglocaldeb1
        |  |- fs#1           .... down     /dev/mapper/vglocaldeb1-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vglocaldeb1-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... down     busybox.opensvc.com@eth0
        |- sync                   up
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
        |  '- sync#i1        .... n/a      rsync system files to drpnodes
        |                                  # passive node not in sync destination
        |                                  nodes
        '- hb                     n/a
        
Starting service on **DRP** side::

        root@deb2:/opt/opensvc/lib# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   stdby up
        |- avail                  stdby up
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... stdby up vglocaldeb2
        |  |- fs#1           .... down     /dev/mapper/vglocaldeb2-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vglocaldeb2-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... down     busybox-drp.opensvc.com@eth0
        |- sync                   up
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
        |  '- sync#i1        .... n/a      rsync system files to drpnodes
        |                                  # no destination nodes
        '- hb                     n/a

        root@deb2:/opt/opensvc/lib# busybox.opensvc.com start
        19:09:40 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.24 availability
        19:09:44 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.24 netmask 255.255.255.224 up
        19:09:44 INFO    BUSYBOX.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.24 37.59.71.24
        19:09:44 INFO    BUSYBOX.OPENSVC.COM.VG#1    vglocaldeb2 is already up
        19:09:44 INFO    BUSYBOX.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vglocaldeb2-lvbusyboxroot
        19:09:45 INFO    BUSYBOX.OPENSVC.COM.FS#1    output:
        /dev/mapper/vglocaldeb2-lvbusyboxroot: clean, 13/65536 files, 12637/262144 blocks
        
        19:09:45 INFO    BUSYBOX.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vglocaldeb2-lvbusyboxroot /opt/busybox.opensvc.com
        19:09:45 INFO    BUSYBOX.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vglocaldeb2-lvbusyboxdata
        19:09:46 INFO    BUSYBOX.OPENSVC.COM.FS#2    output:
        /dev/mapper/vglocaldeb2-lvbusyboxdata: clean, 488/65536 files, 17775/262144 blocks
        
        19:09:46 INFO    BUSYBOX.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vglocaldeb2-lvbusyboxdata /opt/busybox.opensvc.com/appdata
        19:09:46 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 starting docker daemon
        19:09:46 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock -r=false -d -g /opt/busybox.opensvc.com/appdata -p /opt/opensvc/var/busybox.opensvc.com/docker.pid --ip 37.59.71.24
        19:09:47 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock start ce6204fcec5a
        19:09:47 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        ce6204fcec5a
        
        19:09:47 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container up status
        19:09:47 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb2:/opt/opensvc/lib# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       ce6204fcec5a@opensvc/busybox:date
        |  |- vg#1           .... stdby up vglocaldeb2
        |  |- fs#1           .... up       /dev/mapper/vglocaldeb2-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vglocaldeb2-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox-drp.opensvc.com@eth0
        |- sync                   up
        |  |- sync#1         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxroot to ['drpnodes']
        |  |- sync#2         .... up       dds of /dev/mapper/vglocaldeb1-lvbusyboxdata to ['drpnodes']
        |  |- sync#i0        .... n/a      rsync svc config to drpnodes, nodes
        |  |                               # service up on drp node, sync disabled
        |  '- sync#i1        .... n/a      rsync system files to drpnodes
        |                                  # no destination nodes
        '- hb                     n/a
        root@deb2:/opt/opensvc/lib# busybox.opensvc.com docker attach ce6204fcec5a
        Fri Jun  6 17:10:09 UTC 2014
        Fri Jun  6 17:10:10 UTC 2014
        Fri Jun  6 17:10:11 UTC 2014
        Fri Jun  6 17:10:12 UTC 2014
        Fri Jun  6 17:10:13 UTC 2014
        
        root@deb2:/opt/opensvc/lib# busybox.opensvc.com docker ps
        CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS               NAMES
        ce6204fcec5a        opensvc/busybox:date   /bin/sh -c 'while tr   2 hours ago         Up About a minute                       busybox.opensvc.com.container.1

The service is now up and running on the DRP side. You just need a few minutes to enable your DRP with this solution. Incremental data replication is the main key factor when estimating how long it will last to go from production to DRP.

Imagine you have consolidated multiple OpenSVC services on the same physical host (or cluster), you can use OpenSVC keywords ``allservices``, ``allupservices`` instead of service name like ``busybox.opensvc.com`` to trigger massive actions on services. This means that you just need one command to stop all the services, and another one to start them on the DRP side. Extremely powerfull.
