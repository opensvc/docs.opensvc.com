Docker Relocalisation
=====================

Why would I need to relocate my Docker infrastructure ? It works fine ! Actually, there are many reasons that can lead you to a service relocation :

* hardware failure involving downtime.
* planned downtime (hardware tech refresh, firmware updates, os upgrades, ...)

If you only have 2 or 3 docker users, you may give a phone call and agree on a timeframe where the downtime does not bother anyone.
But what happen if you are hosting multiple docker environments (prod, preprod, user acceptance tests, development, ...), each used by tens of people  ? It will be quite impossible to agree everyone on a timeframe to deliver your operation. The situation is worse when the downtime is unplanned (Remember when you were busy trying to fix your latest unplanned issue while your phone does not stop ringing, being called by impacted users)

That's why it is a best practise to be ready to quickly relocate the IT service you provide. 

This tutorial will show up how you can setup such a configuration with OpenSVC.

Pre-requisites
--------------

* OpenSVC service managing docker container(s) (Lets use a simple container example as described in `Docker main page <virtualization.docker.html#service-configuration>`_ )
* 2 physical servers both having :

  * network attachments on the same IP subnet
  * shared storage : same block device seen from operating system
  * OpenSVC agent installed
  * Docker installed

Initial State
-------------

At the beginning we start with container ``opensvc/busybox:date`` running in OpenSVC service ``busybox.opensvc.com``, located on a single physical host named ``deb1.opensvc.com`` :

::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com docker pull opensvc/busybox:date
        Pulling repository opensvc/busybox
        b073e328878e: Download complete
        511136ea3c5a: Download complete
        b6c0d171b362: Download complete
        9798716626f6: Download complete
        98b9fdab1cb6: Download complete
        e2dda52210a3: Download complete
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- container#1    .... down     opensvc/busybox:date
        |  |  |                            # can not find container id
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com startcontainer
        17:06:04 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock run -t -i -d --name=busybox.opensvc.com.container.1 b073e328878e
        17:06:04 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        b82cf3232b7982706b2889f11be0af15f33dc2872939cdbdd9ca39f8cbf56b03
        
        17:06:04 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container up status
        17:06:04 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container operational
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   n/a
        '- hb                     n/a
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com docker attach b82cf3232b79
        Thu Jun  5 15:06:19 UTC 2014
        Thu Jun  5 15:06:20 UTC 2014
        Thu Jun  5 15:06:21 UTC 2014

Relocate Service
----------------

We plan to be able to relocate service on physical node named ``deb2.opensvc.com``

Check Network Prerequisites
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Network interface on deb1.opensvc.com**::

        root@deb1:/# ifconfig eth0 | grep "inet adr"
                 inet adr:37.59.71.6  Bcast:37.59.71.31  Masque:255.255.255.224


**Network interface on deb2.opensvc.com**::

        root@deb2:/# ifconfig eth0 | grep "inet adr"
                 inet adr:37.59.71.7  Bcast:37.59.71.31  Masque:255.255.255.224

Check Storage Prerequisites
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**On deb1.opensvc.com**::

        root@deb1:/# pvs | grep busy
          /dev/mapper/disk.docker vgbusybox lvm2 a--   5,00g  3,00g
        root@deb1:/# sg_inq -i /dev/mapper/disk.docker | grep specific
              vendor specific: 9NOL1o-3Abi-4vlT
        
**On deb2.opensvc.com**::

        root@deb2:~# pvs | grep busy
          /dev/mapper/disk.docker vgbusybox lvm2 a--   5,00g 3,00g
        root@deb2:~# sg_inq -i /dev/mapper/disk.docker | grep specific
              vendor specific: 9NOL1o-3Abi-4vlT

It's the same storage device, with serial 9NOL1o-3Abi-4vlT

.. warning:: If you plan to use such a setup in production, you are strongly encouraged to enable scsi reservation on devices. Add ``scsireserv = true`` to ``[vg#1]`` config section in file ``/opt/opensvc/etc/busybox.opensvc.com.env``. OpenSVC will avoid data corruption risk by putting scsi reservation on devices belonging to your volume group. Storage equipment have to support this feature.

Check mutual ssh trust
^^^^^^^^^^^^^^^^^^^^^^

**On deb1.opensvc.com**::

        root@deb1:/# ssh deb2 hostname
        deb2.opensvc.com

**On deb2.opensvc.com**::

        root@deb2:/# ssh deb1 hostname
        deb1.opensvc.com

.. note:: it is also possible to use an unpriviledged user with sudo rights delegation (2 commands only)

Check OpenSVC agent
^^^^^^^^^^^^^^^^^^^

**On deb2.opensvc.com**::

        root@deb2:~# dpkg -l | grep opensvc
        ii  opensvc                                    1.5-10445                     all          tools to drive OpenSVC services

Change Service Config
^^^^^^^^^^^^^^^^^^^^^

We need to change **one** parameter in the OpenSVC service config file

* **Before** => nodes = deb1.opensvc.com
* **After**  => nodes = deb1.opensvc.com deb2.opensvc.com

This makes the service config file looks like::

        root@deb1:/opt/opensvc/etc# cat busybox.opensvc.com.env
        [DEFAULT]
        autostart_node = deb1.opensvc.com
        app = OSVCLAB
        service_type = DEV
        nodes = deb1.opensvc.com deb2.opensvc.com
        docker_data_dir = /opt/busybox.opensvc.com/appdata
        docker_daemon_args = --ip 37.59.71.25
        
        [container#1]
        type = docker
        run_image = b073e328878e
        
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

Let's check the status::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        send /opt/opensvc/etc/busybox.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/busybox.opensvc.com.push timestamp ... OK
        busybox.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # deb2.opensvc.com need update
        '- hb                     n/a

.. note:: overall state is "warn" due to "sync" section being in "down" state. This means that the OpenSVC agent is aware that a second node is capable of starting the service, but the problem is that this second node is not aware of that. We have to push the configuration on the second node.

Pushing the configuration (always **from** the node owning the service)::

        root@deb1:/opt/opensvc/etc# busybox.opensvc.com syncnodes
        18:02:35 INFO    BUSYBOX.OPENSVC.COM.SYNC#I0 skip sync: not in allowed period (['03:59', '05:59'])
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com syncnodes --force
        18:02:40 INFO    BUSYBOX.OPENSVC.COM         exec '/opt/opensvc/etc/busybox.opensvc.com --waitlock 3600 postsync' on node deb2.opensvc.com
        
        root@deb1:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a


.. note:: --force flag is required outside of the authorized configuration push timewindow. Just after the push, overall status come back to "up".

Checking the service status on the passive node::

        root@deb2:/opt/opensvc/etc# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgbusybox
        |  |- fs#1           .... down     /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... down     busybox.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

.. note:: service is in the expected "down" state, and sync state is "up" from the configuration point of view, this means nodes runs same service configuration.

Execute Service Relocation
^^^^^^^^^^^^^^^^^^^^^^^^^^

Our environment is now ready to be relocated on node deb2.opensvc.com. Once you are authorized to stop the service, you can proceed with the following :

**On deb1.opensvc.com**::

        root@deb1:/# busybox.opensvc.com stop
        18:13:15 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock stop b82cf3232b79
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        b82cf3232b79
        
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container down status
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 no more container handled by docker daemon. shut it down
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.FS#2    umount /opt/busybox.opensvc.com/appdata
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.FS#1    umount /opt/busybox.opensvc.com
        18:13:25 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --deltag @deb1.opensvc.com vgbusybox
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          Volume group "vgbusybox" successfully changed
        
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxdata
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxroot
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a n vgbusybox
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          0 logical volume(s) in volume group "vgbusybox" now active
        
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 down
        18:13:26 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        
        root@deb1:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   down
        |- avail                  down
        |  |- container#1    .... down     b073e328878e
        |  |  |                            # docker daemon is not running
        |  |- vg#1           .... down     vgbusybox
        |  |- fs#1           .... down     /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... down     /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... down     busybox.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a
        
**On deb2.opensvc.com**::

        root@deb2:/# busybox.opensvc.com start
        18:13:33 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
        18:13:36 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.25 netmask 255.255.255.224 up
        18:13:36 INFO    BUSYBOX.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.25 37.59.71.25
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --addtag @deb2.opensvc.com vgbusybox
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          Volume group "vgbusybox" successfully changed
        
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a y vgbusybox
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
          2 logical volume(s) in volume group "vgbusybox" now active
        
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#1    create missing mountpoint /opt/busybox.opensvc.com
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxroot
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgbusybox-lvbusyboxroot: clean, 13/65536 files, 12637/262144 blocks
        
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vgbusybox-lvbusyboxroot /opt/busybox.opensvc.com
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxdata
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#2    output:
        /dev/mapper/vgbusybox-lvbusyboxdata: clean, 487/65536 files, 17664/262144 blocks
        
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vgbusybox-lvbusyboxdata /opt/busybox.opensvc.com/appdata
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 starting docker daemon
        18:13:37 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock -r=false -d -g /opt/busybox.opensvc.com/appdata -p /opt/opensvc/var/busybox.opensvc.com/docker.pid --ip 37.59.71.25
        18:13:39 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 docker -H unix:///opt/opensvc/var/busybox.opensvc.com/docker.sock start b82cf3232b79
        18:13:39 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 output:
        b82cf3232b79
        
        18:13:39 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container up status
        18:13:39 INFO    BUSYBOX.OPENSVC.COM.CONTAINER#1 wait for container operational

        root@deb2:/# busybox.opensvc.com print status
        busybox.opensvc.com
        overall                   up
        |- avail                  up
        |  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
        |  |- vg#1           .... up       vgbusybox
        |  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
        |  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
        |  '- ip#1           .... up       busybox.opensvc.com@eth0
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a
        root@deb2:/# busybox.opensvc.com docker attach b82cf3232b79
        Thu Jun  5 16:13:48 UTC 2014
        Thu Jun  5 16:13:49 UTC 2014
        Thu Jun  5 16:13:50 UTC 2014

Service stops at 18:13:15 on node deb1, and is up & running on node deb2 at 18:13:39, which make **less than 30 seconds to relocate a service**.
Considering that, it is the time needed to stop/start the applications that will be the most representative in the downtime seen from users.

Basically, we have made a 2-nodes Docker **manual** failover cluster. Easy, isn't it ?
