Getting Started
***************

This page will help you take your first steps with OpenSVC services setup.

It will guide you through the sequence of tasks to achieve a simple but working dual-node failover cluster.

Prerequisites
=============

The demonstration environment is composed of:

* A Suse Linux Enterprise Server 11 SP3 (SLES11SP3) named ``sles1`` => will act as first cluster node
* A Suse Linux Enterprise Server 11 SP3 (SLES11SP3) named ``sles2`` => will act as second cluster node
* A Storage Array capable of exporting block devices to both nodes.

 * In this guide, we use iSCSI luns exported from an OpenFiler instance (http://www.openfiler.com)
 * FC Luns exported from high end arrays (EMC, HDS, IBM, ...) would also work, as long as the server share the same logical units

As we plan to create 2 OpenSVC services, we need 2 IP adresses, one for each service :

* p26.opensvc.com <=> 37.59.71.26
* p27.opensvc.com <=> 37.59.71.27


iSCSI Target Configuration
==========================

OpenFiler configuration being web-based, we can easilly create the following objects:

* 2 iSCSI Targets
* 2 x 32 MBytes Logical Units

And finally:

* Map both luns to both iscsi targets
* Allow nodes ``sles1`` and ``sles2`` access through both iscsi targets

This setup serves each lun through 2 paths, thus simulating lun access redundancy.

iSCSI Initiator Configuration
=============================

First, we need the iscsi initiator software installed on the SLES Servers. The open-iscsi package will be used for this setup:

**On both nodes**::

	sles1:/ # zypper install open-iscsi

Then, we have to specify iscsi initiator name for each node:

**On both nodes**::

        sles1:/ # cat /etc/iscsi/initiatorname.iscsi
        InitiatorName=iqn.1994-05.com.suse:sles1

        sles2:/ # cat /etc/iscsi/initiatorname.iscsi
        InitiatorName=iqn.1994-05.com.suse:sles2

We start iscsi services, and enable the daemon for boot-time start-up:

**On both nodes**::

        # /etc/init.d/open-iscsi restart
        Stopping iSCSI initiator service: Closing all iSCSI connections:    done
        Starting iSCSI initiator service:                                   done
        Setting up iSCSI targets:                                           unused

        # chkconfig --add open-iscsi
        open-iscsi                0:off  1:off  2:off  3:on   4:off  5:on   6:off

It's now time to discover the target ports serving our iscsi luns:

**On both nodes**::

        # lsscsi
        [0:0:0:0]    cd/dvd  QEMU     QEMU DVD-ROM     0.12  /dev/sr0
        [1:0:0:0]    cd/dvd  QEMU     QEMU DVD-ROM     0.12  /dev/sr1

        # iscsiadm --mode discovery --type sendtargets --portal openfiler.opensvc.com
        37.59.71.21:3260,1 iqn.2006-01.com.openfiler:tsn.sles.2
        37.59.71.21:3260,1 iqn.2006-01.com.openfiler:tsn.sles.1

        # iscsiadm -m node --login
        Logging in to [iface: default, target: iqn.2006-01.com.openfiler:tsn.sles.1, portal: 37.59.71.21,3260] (multiple)
        Logging in to [iface: default, target: iqn.2006-01.com.openfiler:tsn.sles.2, portal: 37.59.71.21,3260] (multiple)
        Login to [iface: default, target: iqn.2006-01.com.openfiler:tsn.sles.1, portal: 37.59.71.21,3260] successful.
        Login to [iface: default, target: iqn.2006-01.com.openfiler:tsn.sles.2, portal: 37.59.71.21,3260] successful.

        # lsscsi
        [0:0:0:0]    cd/dvd  QEMU     QEMU DVD-ROM     0.12  /dev/sr0
        [1:0:0:0]    cd/dvd  QEMU     QEMU DVD-ROM     0.12  /dev/sr1
        [2:0:0:0]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sdb
        [2:0:0:1]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sdd
        [3:0:0:0]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sda
        [3:0:0:1]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sdc

As we have multiple paths to the same luns, through multiple targets, we have to setup linux native multipath software :

**On both nodes**::

        # chkconfig --add multipathd
        multipathd                0:off  1:off  2:off  3:on   4:off  5:on   6:off

        # multipath -l
        Feb 17 13:15:47 | DM multipath kernel driver not loaded

        # /etc/init.d/multipathd start
        Starting multipathd                                           done

        # multipath -l
        14f504e46494c45524d46646433322d476348562d33724c44 dm-0 OPNFILER,VIRTUAL-DISK
        size=32M features='0' hwhandler='0' wp=rw
        |-+- policy='service-time 0' prio=0 status=active
        | `- 2:0:0:0 sdb 8:16 active undef running
        `-+- policy='service-time 0' prio=0 status=enabled
          `- 3:0:0:0 sda 8:0  active undef running
        14f504e46494c45526461484d656c2d5a6f416f2d33596b52 dm-1 OPNFILER,VIRTUAL-DISK
        size=32M features='0' hwhandler='0' wp=rw
        |-+- policy='service-time 0' prio=0 status=active
        | `- 2:0:0:1 sdd 8:48 active undef running
        `-+- policy='service-time 0' prio=0 status=enabled
          `- 3:0:0:1 sdc 8:32 active undef running

The shared storage setup is operational.

Storage Configuration
=====================

We use Linux LVM to manage our storage. As we plan 2 services, we assign 1 lun to each OpenSVC service.

**On sles1 node**

Physical volume creation::

        sles1:/ # pvcreate /dev/mapper/14f504e46494c45524d46646433322d476348562d33724c44
          Physical volume "/dev/mapper/14f504e46494c45524d46646433322d476348562d33724c44" successfully created
        sles1:/ # pvcreate /dev/mapper/14f504e46494c45526461484d656c2d5a6f416f2d33596b52
          Physical volume "/dev/mapper/14f504e46494c45526461484d656c2d5a6f416f2d33596b52" successfully created

Volume group creation::

        sles1:/ # vgcreate vgsvc1 /dev/mapper/14f504e46494c45524d46646433322d476348562d33724c44
          Volume group "vgsvc1" successfully created
        sles1:/ # vgcreate vgsvc2 /dev/mapper/14f504e46494c45526461484d656c2d5a6f416f2d33596b52
          Volume group "vgsvc2" successfully created

Logical volume creation for first service::

        sles1:/ # lvcreate -L 10M -n lvdatasvc1 vgsvc1
          Rounding up size to full physical extent 12,00 MiB
          Logical volume "lvdatasvc1" created
        sles1:/ # lvcreate -L 10M -n lvappsvc1 vgsvc1
          Rounding up size to full physical extent 12,00 MiB
          Logical volume "lvappsvc1" created

Logical volume creation for second service::

        sles1:/ # lvcreate -L 10M -n lvdatasvc2 vgsvc2
          Rounding up size to full physical extent 12,00 MiB
          Logical volume "lvdatasvc2" created
        sles1:/ # lvcreate -L 10M -n lvappsvc2 vgsvc2
          Rounding up size to full physical extent 12,00 MiB
          Logical volume "lvappsvc2" created

Filesystem creation for both services::

        sles1:/ # mkfs.ext3 -m 0 /dev/mapper/vgsvc1-lvappsvc1
        sles1:/ # mkfs.ext3 -m 0 /dev/mapper/vgsvc1-lvdatasvc1
        sles1:/ # mkfs.ext3 -m 0 /dev/mapper/vgsvc2-lvappsvc2
        sles1:/ # mkfs.ext3 -m 0 /dev/mapper/vgsvc2-lvdatasvc2

**On both nodes**

Mountpoint creation for both services::

        sles1:/ # mkdir -p /svc1/app /svc1/data
        sles1:/ # mkdir -p /svc2/app /svc2/data


OpenSVC Installation
====================

We will follow the steps described in `Nodeware installation <agent.install.html>`_

Install OpenSVC Agent on both cluster nodes.

**On both nodes**::

        # wget -O /tmp/opensvc.latest.rpm http://repo.opensvc.com/rpms/current
        # rpm -Uvh /tmp/opensvc.latest.rpm
        # rpm -qa | grep opensvc
        opensvc-1.5-10303
        # ls /opt/opensvc/
        bin  etc  lib  log  tmp  usr  var
        # cat /etc/cron.d/opensvc
        0,10,20,30,40,50 * * * * root [ -x /opt/opensvc/bin/svcmon ] && /opt/opensvc/bin/svcmon --updatedb --maxdelaydb 120 >/dev/null 2>&1
        0,10,20,30,40,50 * * * * root [ -x /opt/opensvc/bin/cron/opensvc ] && /opt/opensvc/bin/cron/opensvc >/dev/null 2>&1
        0,10,20,30,40,50 * * * * root [ -x /opt/opensvc/bin/perfagt.Linux ] && /opt/opensvc/bin/perfagt.Linux >/dev/null 2>&1

The OpenSVC agent is now operational.

SSH Keys Setup
==============

Cluster members commnuicate through ssh. They must trust each other to do so. We will use ssh keys to achieve that.

* sles1 will be able to connect to sles2 as root.
* sles2 will be able to connect to sles1 as root.

.. note::

        It is also possible for the agent to login on peer cluster nodes using an unprivileged user. In this case, the agent needs sudo priviles to run the following commands as root: ``nodemgr``, ``svcmgr``, ``rsync``.

**On sles1**::

	sles1:/ # scp /root/.ssh/id_dsa.pub root@sles2:/tmp/

**On sles2**::

	sles2:/ # scp /root/.ssh/id_dsa.pub root@sles1:/tmp/


**On sles1 AND sles2**::

	# cat /tmp/id_dsa.pub >> /root/.ssh/authorized_keys2

**On sles1**::

	sles1:/ # ssh sles2 hostname
	sles2

**On sles2**::

	sles2:/ # ssh sles1 hostname
	sles1

Set Host Mode
=============

As we are in a lab, we do not need to specify the host mode because "TST" is the default.

For other purposes than testing, we would have defined on both nodes the relevant mode with the method described `here <agent.install.html#set-host-mode>`_.

Service Creation
================

2 methods are available to create OpenSVC services::

* wizard : svcmgr create with interactive option (-i)
* manual : build config file from template (located in /opt/opensvc/usr/share/doc/template.env)

We will describe the manual option, for a better understanding of what happens. 

Step 1 : Service configuration file
+++++++++++++++++++++++++++++++++++

Basically, we just add the needed fields in the service configuration file. The expected file name is ``servicename.env``

The DEFAULT section in the service file describes the service itself (human readable name, nodes where service is expected to run on, default node, ...).

Every other section defines a ressource managed by the service.

The following configuration describes a service named ``p26.opensvc.com``, running on primary node ``sles1``, failing-over to node ``sles2``, using 1 IP address named ``p26.opensvc.com`` (name to ip resolution is done by the OpenSVC agent), 1 LVM volume groupe ``vgsvc1``, and 2 filesystems hosted in logical volumes ``/dev/mapper/vgsvc1-lvappsvc1`` and ``/dev/mapper/vgsvc1-lvdatasvc1``.

**On sles1 node**::

        sles1:/ # cd /opt/opensvc/etc

        sles1:/opt/opensvc/etc # cat p26.opensvc.com.env
        [DEFAULT]					# Global section for service description
        app = MyApp					# service application friendly name
        service_type = TST				# specify is service runs production, test, dev, ...
        autostart_node = sles1				# default running node, name returned by « hostname » command
        nodes = sles1 sles2				# cluster nodes where the service is able to run on
        mode = hosted					# default service mode for failover cluster services

        [ip#0]						# Ressource Section for ip address
        ipname = p26.opensvc.com			# specify the ip address on which the service will be bound
        disable = False					# the ip address will be enabled at service startup
        optional = False				# mandatory ressource, the service can't work without it
        ipdev = eth0					# the physical network device on which the ip address will be stacked

        [vg#0]						# Ressource Section for volume group
        vgname=vgsvc1					# volume group name

        [fs#0]						# Ressource Section for filesystem
        type = ext3					# filesystem type
        disable = False					# filesystem is enabled at service startup
        mnt = /svc1/app					# filesystem mountpoint
        optional = False				# mandatory ressource, the service can't work without it
        dev = /dev/mapper/vgsvc1-lvappsvc1		# block device where the filesystem is hosted

        [fs#1]
        type = ext3
        disable = False
        mnt = /svc1/data
        optional = False
        dev = /dev/mapper/vgsvc1-lvdatasvc1


Step 2 : Service startup scripts directory
++++++++++++++++++++++++++++++++++++++++++

As services are used to manage application, we need to specify a directory where all applications startup scripts are located.

As an example, if we want to build a LAMP service, we would use 2 scripts: one for the mysql database, and another for the apache webserver. Those scripts have to be located in the service startup scripts directory ::

        sles1:/opt/opensvc/etc # mkdir p26.opensvc.com.dir
        sles1:/opt/opensvc/etc # ln -s p26.opensvc.com.dir p26.opensvc.com.d

We will see later in this tutorial that ``/opt/opensvc/etc/p26.opensvc.com.dir`` may not be the best place for hosting this directory. Anyway, the symlink ``p26.opensvc.com.d`` is the only place where OpenSVC search for application launchers.

For now, we just will just create this directory and the symlink. No script are added yet.

Step 3 : Service management facility
++++++++++++++++++++++++++++++++++++

To make service management easy, we create a symlink to OpenSVC core service management command ::

        sles1:/opt/opensvc/etc # ln -s /opt/opensvc/bin/svcmgr p26.opensvc.com

Without this symlink, we have to use the ``svcmgr`` command with arguments to manage our service ::

        sles1:/ # svcmgr -s p26.opensvc.com print status

With this symlink, we can directly use ::

        sles1:/ # p26.opensvc.com print status

Step 4 : Service configuration check
++++++++++++++++++++++++++++++++++++

As a final check, we list all entries that match our ``p26.opensvc.com`` service ::

        sles1:/opt/opensvc/etc # ls -lart | grep p26
        total 20
        drwxr-xr-x 9 root root 4096 16 févr. 11:14 ..
        -rw-r--r-- 1 root root  423 17 févr. 14:12 p26.opensvc.com.env
        drwxr-xr-x 2 root root 4096 17 févr. 14:14 p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   19 17 févr. 14:15 p26.opensvc.com.d -> p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /opt/opensvc/bin/svcmgr
        drwxr-xr-x 3 root root 4096 17 févr. 14:15 .

We need to find out :

- the service configuration file (service.env)
- the directory where are stored the applications launchers (service.dir)
- a symlink to the service.dir (service.d)
- a symlink to the /opt/opensvc/bin/svcmgr command (service)

At this point, we have configured a single service without application on node sles1.

Service Testing
===============

Query service status
++++++++++++++++++++

Our first service is now ready to use, we can query for its status.

**On sles1**::

        sles1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   warn
        |  '- sync#i0        .... warn     rsync svc config to drpnodes, nodes
        |                                  # passive node needs update
        '- hb                     n/a

This command allow us to gather status for each service ressource :

- overall status is ``warn`` due to the fact that all ressources are not in ``up`` status
- ressource ``vg#0`` is up because the volume group is activated (we just did the LVM setup)
- all other ressources are ``down`` or non available ``n/a``

Start service
+++++++++++++

The use of OpenSVC for your services management allow you to save a lot of time.
Once the service is implemented on the node, you just need 1 command to start the overall application.
Let's start the service ::

        sles1:/ # p26.opensvc.com start
        14:40:06 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        14:40:11 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        14:40:11 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        14:40:11 INFO    P26.OPENSVC.COM.VG#0    vgsvc1 is already up
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    create missing mountpoint /svc1/app
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 11/3072 files, 1530/12288 blocks
        
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    create missing mountpoint /svc1/data
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 11/3072 files, 1530/12288 blocks
        
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data

We can see in the startup sequence :

- check if service IP address is not already used somewhere
- bring up service ip address 
- volume group activation (if not already in the correct state)
- fsck + mount of each filesystem


We check for filesystem being mounted ::

        sles1:/ # mount | grep svc1
        /dev/mapper/vgsvc1-lvappsvc1 on /svc1/app type ext3 (rw)
        /dev/mapper/vgsvc1-lvdatasvc1 on /svc1/data type ext3 (rw)

We check for ip address being ip aliases on eth0 (p26.opensvc.com is 37.59.71.26) ::

        sles1:/ # ip addr list eth0
        2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
            link/ether 52:54:00:db:db:29 brd ff:ff:ff:ff:ff:ff
            inet 37.59.71.22/27 brd 37.59.71.31 scope global eth0
            inet 37.59.71.26/27 brd 37.59.71.31 scope global secondary eth0:1
            inet6 fe80::5054:ff:fedb:db29/64 scope link
               valid_lft forever preferred_lft forever

We confirm that everything is OK with ``print status`` command::

        sles1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |                                  # no checkup scripts
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # sles2 need update
        '- hb                     n/a

At this point, we have a running service, configured to run on sles1 node.

Application Integration
=======================

We have done the setup of a single service, but actually it does nothing. We will remediate that by integrating an application into our service.

We will use a very simple example : tiny webserver with a single index.html file to serve

Applications launcher directory
+++++++++++++++++++++++++++++++

You have to keep in mind the philosophy of an OpenSVC service. You have specified a directory structure as service ressource, so the applications you are integrating into a service have to be located only into this directory structure, because we want our service to be relocatable to other nodes.

That's why we have to relocate application launchers directory to a filesystem inside the service. We previously installed this directory in ``/opt/opensvc/etc/p26.opensvc.dir``, we move it to ``/svc1/app/init.d`` ::

        sles1:/opt/opensvc/etc # ls -lart | grep p26
        total 20
        drwxr-xr-x 9 root root 4096 16 févr. 11:14 ..
        -rw-r--r-- 1 root root  423 17 févr. 14:12 p26.opensvc.com.env
        drwxr-xr-x 2 root root 4096 17 févr. 14:14 p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   19 17 févr. 14:15 p26.opensvc.com.d -> p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /opt/opensvc/bin/svcmgr
        drwxr-xr-x 3 root root 4096 17 févr. 14:15 .

        sles1:/opt/opensvc/etc # rm -f p26.opensvc.com.d
        sles1:/opt/opensvc/etc # rmdir p26.opensvc.com.dir

        sles1:/opt/opensvc/etc # mkdir /svc1/app/init.d
        sles1:/opt/opensvc/etc # ln -s /svc1/app/init.d p26.opensvc.com.d

        sles1:/opt/opensvc/etc # ls -lart | grep p26
        total 12
        lrwxrwxrwx 1 root root  23 17 févr. 14:15 p26.opensvc.com -> /opt/opensvc/bin/svcmgr
        lrwxrwxrwx 1 root root  16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root 396 17 févr. 14:21 p26.opensvc.com.env

Application Binary
++++++++++++++++++

Inside the service directory structure, we put a standalone binary of Mongoose web server (https://code.google.com/p/mongoose/) ::

        sles1:/ # cd /svc1/app
        
        sles1:/svc1/app # wget -O /svc1/app/webserver http://cesanta.com/downloads/mongoose-lua-sqlite-ssl-static-x86_64-5.2
        --2014-02-18 14:35:12--  http://cesanta.com/downloads/mongoose-lua-sqlite-ssl-static-x86_64-5.2
        Resolving cesanta.com... 54.194.65.250
        Connecting to cesanta.com|54.194.65.250|:80... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 1063420 (1.0M) [text/plain]
        Saving to: `/svc1/app/webserver'
        
        100%[================================================================================================>] 1,063,420    210K/s   in 5.3s
        
        2014-02-18 14:35:18 (197 KB/s) - `/svc1/app/webserver' saved [1063420/1063420]
        
        sles1:/svc1/app # ls -l /svc1/app/webserver
        -rwxr-xr-x 1 root root 1063420 Feb  1 18:11 /svc1/app/webserver

We need to create a dummy web page to be served by our webserver, stored in ``/svc1/data/``  ::

        sles1:/svc1/app # cd /svc1/data/
        
        sles1:/svc1/data # cat index.html
        <html><body>It Works !</body></html>

Applications launcher script
++++++++++++++++++++++++++++

We have to create a management script for our web application. As a best practise, the script have to support the following arguments :

- start
- stop
- status

Of course, we will store our script named ``weblauncher`` in the directory previsouly created for this purpose ::

        sles1:/ # cd /svc1/app/init.d
        
        sles1:/svc1/app/init.d # cat weblauncher
        #!/bin/bash
        
        SVCROOT=/svc1
        APPROOT=${SVCROOT}/app
        DAEMON=${APPROOT}/webserver
        DAEMON_BASE=$(basename $DAEMON)
        DAEMONOPTS="-document_root ${SVCROOT}/data -index_files index.html -listening_port 8080"
        
        function status {
        	pgrep $DAEMON_BASE >/dev/null 2>&1
        }
        
        case $1 in
        restart)
        	killall $DAEMON_BASE
        	$DAEMON
        	;;
        start)
        	status && {
        		echo "already started"
        		exit 0
        	}
        	nohup $DAEMON $DAEMONOPTS >> /dev/null 2>&1 &
        	;;
        stop)
        	killall $DAEMON_BASE
        	;;
        info)
        	echo "Name: webserver"
        	;;
        status)
        	status
        	exit $?
        	;;
        *)
        	echo "unsupported action: $1" >&2
        	exit 1
        	;;
        esac

You first need to ensure that your script is working fine outside of OpenSVC ::

        sles1:/svc1/app # ./weblauncher status
        sles1:/svc1/app # echo $?
        1
        sles1:/svc1/app # ./weblauncher start
        sles1:/svc1/app # ./weblauncher status
        sles1:/svc1/app # echo $?
        0
        sles1:/svc1/app # ./weblauncher stop
        sles1:/svc1/app # ./weblauncher status
        sles1:/svc1/app # echo $?
        1

Once it's done, we can specify OpenSVC how to use this script to enable application management ::

        sles1:/svc1/app/init.d # ln -s weblauncher S10weblauncher
        sles1:/svc1/app/init.d # ln -s weblauncher K90weblauncher
        sles1:/svc1/app/init.d # ln -s weblauncher C10weblauncher

        sles1:/svc1/app/init.d # ls -l
        total 1
        lrwxrwxrwx 1 root root  11 Feb 17 16:49 C10weblauncher -> weblauncher
        lrwxrwxrwx 1 root root  11 Feb 17 16:48 K90weblauncher -> weblauncher
        lrwxrwxrwx 1 root root  11 Feb 17 16:47 S10weblauncher -> weblauncher
        -rwxr-xr-x 1 root root 570 Feb 17 16:45 weblauncher


By integrating this way, we just have told OpenSVC to call ``weblauncher`` script with :

- ``start`` argument when OpenSVC service starts (symlink S10weblauncher)
- ``stop`` argument when OpenSVC service stops (symlink K90weblauncher)
- ``status`` argument when OpenSVC service needs status on application (symlink C10weblauncher)

When integrating multiple software into an OpenSVC service, you have to use the 2-digits number in the symlink name to specify the order that have to be followed for start/stop/check actions.

Now we can give a try to our launcher script, through OpenSVC calls ::

        sles1:~ # p26.opensvc.com start
        16:52:31 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:52:36 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        16:52:36 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        16:52:36 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @sles1 vgsvc1
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        16:52:37 INFO    P26.OPENSVC.COM.APP     spawn: /opt/opensvc/etc/p26.opensvc.com.d/S10weblauncher start
        16:52:37 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.007657 - ret 0 - logs in /opt/opensvc/tmp/svc_p26.opensvc.com_S10weblauncher.log

We can see that OpenSVC is now calling our startup script after mounting filesystems.
        
We can query service status, please note that the ``app`` ressource is now reporting as being ``up`` ::

        sles1:~ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # sles2 need update
        '- hb                     n/a

Let's check if that is really true ::

        sles1:/ # ps auxww|grep web
        root      5902  0.0  0.1   4596  2304 pts/2    S    16:52   0:00 /svc1/app/webserver -document_root /svc1/data -index_files index.html -listening_port 8080
        root      5958  0.0  0.0   7780   888 pts/2    S+   16:53   0:00 grep web
        
        sles1:~ # wget -qO - http://p26.opensvc.com:8080/
        <html><body>It Works !</body></html>

Now we can stop our service ::

        sles1:/ # p26.opensvc.com stop
        15:32:31 INFO    P26.OPENSVC.COM.APP     spawn: /opt/opensvc/etc/p26.opensvc.com.d/K90weblauncher stop
        15:32:31 INFO    P26.OPENSVC.COM.APP     stop done in 0:00:00.004676 - ret 0 - logs in /opt/opensvc/tmp/svc_p26.opensvc.com_K90weblauncher.log
        15:32:32 INFO    P26.OPENSVC.COM.FS#1    umount /svc1/data
        15:32:32 INFO    P26.OPENSVC.COM.FS#0    umount /svc1/app
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    vgchange --deltag @sles1 vgsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvappsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvdatasvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    vgchange -a n vgsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    output:
          0 logical volume(s) in volume group "vgsvc1" now active
        
        15:32:32 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 down
        15:32:32 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability

Once again, a single command line :

- bring down application
- unmount filesystems
- deactivate volume group
- disable service ip address

The overall status is now reported as being down ::

        sles1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   down
        |- avail                  down
        |  |- vg#0           .... down     vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # sles2 need update
        '- hb                     n/a

Let's restart the service to continue this tutorial ::

        sles1:/ # p26.opensvc.com start
        15:53:44 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        15:53:48 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        15:53:48 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @sles1 vgsvc1
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        15:53:49 INFO    P26.OPENSVC.COM.APP     spawn: /opt/opensvc/etc/p26.opensvc.com.d/S10weblauncher start
        15:53:49 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.008936 - ret 0 - logs in /opt/opensvc/tmp/svc_p26.opensvc.com_S10weblauncher.log

At this point, we have a running service on node sles1, with webserver application embedded.

Service Failover
================

We are fine with our service, but what happens if ``sles1`` node fails ? Our ``p26.opensvc.com`` service will fail also.
That's why we will finalize the configuration so as to enable ``sles2`` node to manage service.
This is done by propagating the service configuration to the ``sles2`` node. 

First we check ``/opt/opensvc/etc/`` on sles2, it should be empty because we do a fresh install ::

        sles1:/opt/opensvc/etc # ssh sles2 ls /opt/opensvc/etc/ | grep p26.opensvc.com
        sles1:/opt/opensvc/etc # 

The configuration propagation will be allowed multiple conditions are met :

- the new node is declared in the service configuration file /opt/opensvc/etc/p26.opensvc.com.env. [parameter "nodes" in .env file]
- the node sending config files (sles1) is trusted on the new node (sles2). [We have done that previously in the tutorial]
- the node sending config files (sles1) must be running the service.
- the timeframe where file synchronisation is allowed is OK, or the -force option is used to bypass the timeframe check.

Let's propagate configuration files ::

        sles1:/opt/opensvc/etc # p26.opensvc.com syncnodes
        17:20:37 INFO    P26.OPENSVC.COM.SYNC#I0 skip sync: not in allowed period (['03:59', '05:59'])
        
        sles1:/opt/opensvc/etc # p26.opensvc.com syncnodes --force
        17:20:41 INFO    P26.OPENSVC.COM         exec '/opt/opensvc/etc/p26.opensvc.com --waitlock 3600 postsync' on node sles2
        
        sles1:/opt/opensvc/etc # ssh sles2 ls -l /opt/opensvc/etc | grep p26.opensvc.com
        total 8
        lrwxrwxrwx 1 root root  23 17 févr. 14:15 p26.opensvc.com -> /opt/opensvc/bin/svcmgr
        lrwxrwxrwx 1 root root  16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root 396 17 févr. 14:21 p26.opensvc.com.env

We can see that node sles2 is now ready to start our service.

**On sles1**::

        sles1:/opt/opensvc/etc # p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

Please note that ``sync#i0`` ressource is now up, due to both nodes being in sync from a service configuration point of view.
Now, we try to start service on ``sles2``, after stopping it on ``sles1`` ::

        sles1:/opt/opensvc/etc # p26.opensvc.com stop
        16:07:40 INFO    P26.OPENSVC.COM.APP     spawn: /opt/opensvc/etc/p26.opensvc.com.d/K90weblauncher stop
        16:07:40 INFO    P26.OPENSVC.COM.APP     stop done in 0:00:00.004513 - ret 0 - logs in /opt/opensvc/tmp/svc_p26.opensvc.com_K90weblauncher.log
        16:07:40 INFO    P26.OPENSVC.COM.FS#1    umount /svc1/data
        16:07:40 INFO    P26.OPENSVC.COM.FS#0    umount /svc1/app
        16:07:40 INFO    P26.OPENSVC.COM.VG#0    vgchange --deltag @sles1 vgsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvappsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvdatasvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    vgchange -a n vgsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    output:
          0 logical volume(s) in volume group "vgsvc1" now active
        
        16:07:41 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 down
        16:07:41 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        
**On sles2**::
        
        sles2:~ # p26.opensvc.com start
        16:08:38 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:08:41 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        16:08:41 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        16:08:42 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @sles2 vgsvc1
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        16:08:43 INFO    P26.OPENSVC.COM.APP     spawn: /opt/opensvc/etc/p26.opensvc.com.d/S10weblauncher start
        16:08:43 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.009601 - ret 0 - logs in /opt/opensvc/tmp/svc_p26.opensvc.com_S10weblauncher.log

        sles2:~ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

Service p26.opensvc.com is now running on node ``sles2``. Have you ever configured a second cluster node so easily ?

Now, what happens if I try to start my service on ``sles1`` while it is already running on ``sles2`` ? ::

        sles1:/ # p26.opensvc.com start
        16:19:39 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:19:39 ERROR   P26.OPENSVC.COM         'start' action stopped on execution error: start aborted due to resource ip#0 conflict
        16:19:39 INFO    P26.OPENSVC.COM         skip rollback start: no resource activated

Fortunately, OpenSVC IP address check prevent the service from starting on ``sles1``.

.. note::

        At this point, we have a 2-nodes failover cluster. Although it may satisfy some customers who prefer that, the failover is _manual_ and that's not considered as high availability cluster.

        That's where we can followup with OpenHA setup on top of OpenSVC, to add the high availability part to our manual cluster.

OpenHA Integration
==================

This chapters show up the keys points needed to transform a "manual" cluster failover to an "automatic high availability" cluster.
We will follow the steps described in `High Availability setup <howto.ha.html>`_

OpenSVC Heartbeat Ressource
+++++++++++++++++++++++++++

OpenSVC service deals with another kind of ressource, named a heartbeat ressource. This ressource is responsible of querying OpenHA for service status.

This configuration section is appended to the ``p26.opensvc.com.env`` file on node ``sles1`` (no need to add ``name`` parameter as we use same service names for OpenSVC and OpenHA)::

        [hb#0]
        type = OpenHA

Just after we issue a ``print status`` action, which will automatically complete the ``/opt/opensvc/etc`` directory with 2 new symlinks ::

        sles1:/opt/opensvc/etc # p26.opensvc.com print status
        send /opt/opensvc/etc/p26.opensvc.com.env to collector ... OK
        update /opt/opensvc/var/p26.opensvc.com.push timestamp ... OK
        p26.opensvc.com
        11:19:37 INFO    P26.OPENSVC.COM.HB#0  /opt/opensvc/etc/p26.opensvc.com.cluster: not regular file nor symlink. fix. 
        11:19:37 INFO    P26.OPENSVC.COM.HB#0  /opt/opensvc/etc/p26.opensvc.com.stonith: not regular file nor symlink. fix.
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     warn
           '- hb#0           .... warn     hb.openha
                                           # open-ha daemons are not running
        
        sles1:/opt/opensvc/etc # ls -lart | grep p26
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /opt/opensvc/bin/svcmgr
        lrwxrwxrwx 1 root root   16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root  428 19 févr. 08:29 p26.opensvc.com.env.before.openha
        -rw-r--r-- 1 root root  450 19 févr. 08:30 p26.opensvc.com.env
        lrwxrwxrwx 1 root root   13 19 févr. 11:19 p26.opensvc.com.stonith -> ../bin/svcmgr
        lrwxrwxrwx 1 root root   13 19 févr. 11:19 p26.opensvc.com.cluster -> ../bin/svcmgr

The other node ``sles2`` also need to be informed that configuration have changed ::

        sles1:/ # p26.opensvc.com syncnodes --force 
        11:55:50 INFO    P26.OPENSVC.COM         exec '/opt/opensvc/etc/p26.opensvc.com --waitlock 3600 postsync' on node sles2

        sles1:/ # ssh sles2 p26.opensvc.com print status
        18:18:56 INFO    P26.OPENSVC.COM.HB#0    /opt/opensvc/etc/p26.opensvc.com.cluster: not regular file nor symlink. fix.
        18:18:56 INFO    P26.OPENSVC.COM.HB#0    /opt/opensvc/etc/p26.opensvc.com.stonith: not regular file nor symlink. fix.
        p26.opensvc.com
        overall                   down
        |- avail                  down
        |  |- vg#0           .... down     vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     warn
           '- hb#0           .... warn     hb.openha
                                           # open-ha daemons are not running

OpenHA Installation
+++++++++++++++++++

Install OpenHA Package on both cluster nodes.

**On both nodes**::

        # wget -O /tmp/openha.latest.rpm http://repo.opensvc.com/rpms/deps/el6/openha-0.3.6.osvc2-0.x86_64.rpm
        # rpm -Uvh /tmp/openha.latest.rpm
        # rpm -qa | grep openha
        openha-0.3.6.osvc2-0
        # ls /usr/local/cluster
        bin  conf  doc  env.sh  ezha  log  services

As specified in the documentation, we have to set environment variables to be able to manage OpenHA. You can either set them system-wide (/etc/profile) or just set them when needed ::

        # export EZ=/usr/local/cluster
        # . /usr/local/cluster/env.sh


OpenHA Configuration
++++++++++++++++++++

First of all we describe the cluster nodes in the file ``/usr/local/cluster/conf/nodes``

**On both nodes**::

        # cat /usr/local/cluster/conf/nodes
        sles1
        sles2

In this example, we implement 2 heartbeats :

- Network IP Multicast
- Shared Disk [a new lun has been provisionned from the OpenFiler host : /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c]

The heartbeat configuration file ``/usr/local/cluster/conf/monitor`` is the following on both nodes: 

**On both nodes**::

        # cat /usr/local/cluster/conf/monitor
        sles1 net eth0 239.131.50.10 1234 10
        sles1 dio /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c 0 10
        sles2 net eth0 239.131.50.10 4321 10
        sles2 dio /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c 2 10

The syntax means that :

- sles1 node will send heartbeat through eth0 on multicast IP 239.131.50.10 port 1234, with a 10 seconds timeout
- sles1 node will write heartbeat on the first block of disk /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c, with a 10 seconds timeout
- sles1 will listen heartbeat through eth0 on multicast IP 239.131.50.10 port 4321, with a 10 seconds timeout
- sles1 node will read heartbeat on the third block of disk /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c, with a 10 seconds timeout

OpenHA also require monitored services to be declared :

**On both nodes**::

        # $EZ_BIN/service -a p26.opensvc.com /opt/opensvc/etc/p26.opensvc.com.cluster sles1 sles2 /bin/true
        Creating service p26.opensvc.com :
        Make of services directory done
        Done.

Please note that the configuration applied does not include any stonith callout.

Last setup step concerns OpenHA start/stop scripts.

**On both nodes**::

        # ln -s /usr/local/cluster/ezha /etc/rc.d/rc3.d/S99cluster
        # ln -s /usr/local/cluster/ezha /etc/rc.d/rc0.d/K01cluster
        # ln -s /usr/local/cluster/ezha /etc/rc.d/rcS.d/K01cluster

OpenHA Testing
++++++++++++++

Once the setup is done, OpenHA is now able to ensure the cluster management. 

.. warning:: To improve understanding, we assume that the service p26.opensvc.com is stopped before enabling OpenHA. Actually, it's technically not a prerequisite to OpenHA implementation but this case won't be considered in this beginner tutorial.

We start the OpenHA agents :

**On both nodes**::

        # /usr/local/cluster/ezha start

You can check OpenHA service configuration, and associated states with the ``$EZ_BIN/service -s`` command :

**On both nodes**::

        # $EZ_BIN/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : sles1, FROZEN_STOP
        	Secondary: sles2, FROZEN_STOP

This command query OpenHA service configuration, and associated states. ``FROZEN_STOP`` state means that neither ``sles1`` nor ``sles2`` are capable of joining the cluster.

It's also possible to check for hearbeats status with the ``$EZ_BIN/hb -s`` command :

**On both nodes**::

        # $EZ_BIN/hb -s
        interface eth0:239.131.50.10:1234 pid 25633 status UP, updated at Feb 19 20:59:57
        interface /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c:0 pid 25636 status UP, updated at Feb 19 20:59:57
        interface eth0:239.131.50.10:4321 pid 23801 status UP, updated at Feb 19 20:59:57
        interface /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c:2 pid 23804 status UP, updated at Feb 19 20:59:55


As everything is working as expected, we can authorize ``sles1`` node to joint the cluster using the ``unfreeze`` keyword :

**On sles1 node**::

        sles1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -A p26.opensvc.com unfreeze

To deeply understand what happens, we query OpenHA service status at around 1 second interval :

**On sles1 node**::

        sles1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : sles1, START_READY
        	Secondary: sles2, FROZEN_STOP

=> ``START_READY`` state means that ``sles1`` node have joined the cluster and is ready to start the OpenHA configured services.

**On sles1 node**::

        sles1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : sles1, STARTING
        	Secondary: sles2, FROZEN_STOP

=> ``STARTING`` state means that ``sles1`` node have initiated the startup of the service by calling the script ``/opt/opensvc/etc/p26.opensvc.com.cluster`` specified in OpenHA service declaration

**On sles1 node**::

        sles1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : sles1, STARTED
        	Secondary: sles2, FROZEN_STOP

=> ``STARTED`` state means that ``sles1`` node have finished the startup of OpenHA configured services.

We can easilly confirm that the service is running by querying its state through OpenSVC commands:

**On sles1 node**::
        
        sles1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     up
           '- hb#0           .... up       hb.openha


As the second node ``sles2`` is still in the ``FROZEN_STOP`` state, we need to authorize it to join the cluster:

**On sles2 node**::

        sles2:/ # /usr/local/cluster/bin/service -A p26.opensvc.com unfreeze

        sles2:/usr/local/cluster/log # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : sles1, STARTED
        	Secondary: sles2, STOPPED

=> The ``sles2`` have joined the cluster, and is ready to failover the service, which is accurately reported as ``STOPPED``

It's important to understand that the OpenSVC service management is now delegated to the OpenHA agents:

**On sles1 node**::

        sles1:/ # p26.opensvc.com stop
        21:34:10 INFO    P26.OPENSVC.COM         this service is managed by a clusterware, thus direct service manipulation is disabled. the --cluster option circumvent this safety net.
        sles1:/ #
