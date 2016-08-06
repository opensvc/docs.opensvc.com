Service management
******************

Commands
========

Explicit service management
+++++++++++++++++++++++++++

The prefered command to use to start an action on a specific service is ``sudo svcmgr -s <svcname> <action>``, or simply ``sudo <svcname> <action>``.

Explicit group of services management
+++++++++++++++++++++++++++++++++++++

The prefered command to use to start an action on a specific group of services is ``sudo svcmgr -s svc1,svc2 action``.

Contextual group of services management
+++++++++++++++++++++++++++++++++++++++

OpenSVC provides a set of svcmgr links applying preset filters on local service.

.. function:: svcmgr <action>

Apply action to all node services.
The command ``svcmgr shutdown --parallel`` is triggered upon node shutdown by the opensvc rc script.
The command ``svcmgr boot --parallel`` is triggered upon node startup by the opensvc rc script.

.. function:: svcmgr --state down <action>

Apply action to all node services in 'down' state.

.. function:: svcmgr --state up,warn

Apply action to all node services in 'up' and 'warn' state.

.. function:: svcmgr --onlyprimary action

Apply action to all node services having the node as an 'autostart_node' in their env file.

.. function:: svcmgr --onlysecondary action

Apply action to all node services not having the node as an 'autostart_node' in their env file.

Services status
===============

.. function:: svcmon

Overview of all local node services status.

.. function:: <svcname> print status

Detailled service resources status.

Actions
=======

.. function:: <svcname> start

Start resources of type ip, loop, disk group, zpool, fs, container, app

.. function:: <svcname> stop

Stop resources of type app, container, fs, zpool, disk group, loop, ip

.. function:: <svcname> startdisk

Start resources of type loop, disk group, zpool, fs

.. function:: <svcname> stopdisk

Stop resources of type fs, zpool, disk group, loop

.. function:: <svcname> startip

Start resources of type ip

.. function:: <svcname> stopip

Stop resources of type ip

.. function:: <svcname> startloop

Start resources of type loop

.. function:: <svcname> stoploop

Stop resources of type loop

.. function:: <svcname> startvg

Start resources of type disk group

.. function:: <svcname> stopvg

Stop resources of type disk group

.. function:: <svcname> mount

Start resources of type fs and the underlying resources

.. function:: <svcname> umount

Stop resources of type fs and the underlying resources

.. function:: <svcname> prstart

Acquire scsi persistent reservations on disks of the service (wrapped by startvg and startdisk)

.. function:: <svcname> prstop

Release scsi persistent reservations on disks of the service (wrapped by stopvg and stopdisk)

.. function:: <svcname> syncnodes

Trigger hard-coded and user-defined file synchronization to secondary nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

.. function:: <svcname> syncdrp

Trigger hard-coded and user-defined file synchronization to disaster recovery nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

Logging
=======

All action logs are multiplexed to:

*   stdout

*   ``<OSVCLOG>/<svcname>.log``
    Daily rotation on these files, and size limit rotation

*   collector database
    Optional, through asynchronous xmlrpc calls.

*   syslog
    Optional, disabled by default, configured in ``node.conf``

Examples
========

Print services status of a node:

::

	[root@node111 ~]# svcmon
	service     service  container container ip        disk      fs        overall  
	name        type     type      status    status    status    status    status   
	-------     -------  --------- --------- ------    ------    ------    -------  
	aasprddst01 PRD      hosted    n/a       down      down      down      down     
	aasprdmqs01 PRD      hosted    n/a       up        n/a       n/a       up       
	aasprdora01 PRD      hosted    n/a       down      down      down      down     
	aasprdosvc  PRD      hosted    n/a       up        up        up        up       

Print resource status of a service:

::

	[root@node111 ~]# gieprdtransco print_status
	fs /dev/mapper/gieprdtransco-moteurs@/gieprdtransco/moteurs            up
	fs /dev/mapper/gieprdtransco-data01@/gieprdtransco/data01/oracle/XMETA up
	fs /dev/mapper/gieprdtransco-bkp01@/gieprdtransco/bkp01/oracle/XMETA   up
	fs /dev/mapper/gieprdtransco-scratch@/gieprdtransco/applis/scratch     up
	fs /dev/mapper/gieprdtransco-datastage@/gieprdtransco/applis/datastage up
	fs /dev/mapper/gieprdtransco-dataset@/gieprdtransco/applis/dataset     up
	fs /dev/mapper/gieprdtransco-root@/gieprdtransco                       up
	vg gieprdtransco                                                       up
	vg gieprdtransco scsireserv                                            up
	ip gieprdtransco@bond0                                                 up
	overall                                                                up

Stop of a hosted Oracle service:

::

	[root@node111 ~]# aasprdora01 stop
	* APP - INFO - spawn: /opt/opensvc/etc/aasprdora01.d/K50oracle stop
	* APP - INFO - stop done in 0:00:00.258900 - ret 0 - logs in /var/tmp/svc_aasprdora01_K50oracle.log
	* FS - INFO - umount /aasprdora01/moteurs
	* FS - INFO - umount /aasprdora01/data01/oracle/XMETA
	* FS - INFO - umount /aasprdora01/bkp01/oracle/XMETA
	* FS - INFO - umount /aasprdora01
	* DISK.VG - INFO - vgchange -a n aasprdora01
	* IP - INFO - ifconfig bond0:2 down

Start of an HP-VM service:

::

	2010-01-20 10:05:40,955 - DISK.VG - INFO - mksf -r -C disk -I 18 /dev/rdisk/vm089_system
	* DISK.VG - INFO - mksf -r -C disk -I 15 /dev/rdisk/vm089_system2
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c2t0d6 preserve register skey 0x45603beb
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c5t0d6 preserve register skey 0x45603beb
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c2t0d7 preserve register skey 0x45603beb
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c5t0d7 preserve register skey 0x45603beb
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c2t0d6 preserve reserve key 0x45603beb type wero
	* SCSIRESERV - INFO - scu -f /dev/rdsk/c2t0d7 preserve reserve key 0x45603beb type wero
	* CONTAINER.HPVM - INFO - /opt/hpvm/bin/hpvmstart -P vm089
	* CONTAINER.HPVM - WARNING - command succesful but stderr
	HPVM guest vm089 configuration problems
	    Warning 1 on item vs_PROD: Guest MAC address for switch vs_PROD is in use.
	These problems may prevent HPVM guest vm089 from starting.
	(C) Copyright 2000 - 2008 Hewlett-Packard Development Company, L.P.
	/opt/hpvm/lbin/hpvmapp (/var/opt/hpvm/uuids/2adfad34-005b-11df-bc07-00226402aebe/vmm_config.current): Allocated 2147483648 bytes at 0x6000000100000000
	/opt/hpvm/lbin/hpvmapp (/var/opt/hpvm/uuids/2adfad34-005b-11df-bc07-00226402aebe/vmm_config.current): Allocated 6442450944 bytes at 0x6000000200000000
	/opt/hpvm/lbin/hpvmapp (/var/opt/hpvm/uuids/2adfad34-005b-11df-bc07-00226402aebe/vmm_config.current): Allocated 131072 bytes at 0x6000000500000000
	/opt/hpvm/lbin/hpvmapp (/var/opt/hpvm/uuids/2adfad34-005b-11df-bc07-00226402aebe/vmm_config.current): Allocated 131072 bytes at 0x6000000500040000
	Daemonizing....
	hpvmstart: Successful start initiation of guest 'vm089'

	* APP - INFO - /usr/bin/ssh vm089 chmod +x /svc/etc/init.d/S10foo
	* APP - INFO - spawn: /usr/bin/ssh vm089 /svc/etc/init.d/S10foo start
	* APP - INFO - start done in 0:00:00.481997 - ret 0 - logs in /var/tmp/svc_aastmphpux_S10foo.log
	* APP - INFO - /usr/bin/ssh vm089 chmod +x /svc/etc/init.d/S20foo
	* APP - INFO - spawn: /usr/bin/ssh vm089 /svc/etc/init.d/S20foo start
	* APP - INFO - start done in 0:00:00.327710 - ret 0 - logs in /var/tmp/svc_aastmphpux_S20foo.log
	* APP - INFO - /usr/bin/ssh vm089 chmod +x /svc/etc/init.d/S80foo
	* APP - INFO - spawn: /usr/bin/ssh vm089 /svc/etc/init.d/S80foo start
	* APP - INFO - start done in 0:00:00.304998 - ret 0 - logs in /var/tmp/svc_aastmphpux_S80foo.log

Start of an Xen service:

::

	cgaliber@dell opensolaris:/$ pfexec xosolglo1.opensvc.com start
	* XOSOLGLO1.OPENSVC.COM.POOL#1PR - INFO - sg_persist -n --out --register-ignore --param-sark=0x114366380227 /dev/rdsk/xosolglo1-data
	* XOSOLGLO1.OPENSVC.COM.POOL#1PR - INFO - sg_persist -n --out --reserve --param-rk=0x114366380227 --prout-type=5 /dev/rdsk/xosolglo1-data
	* XOSOLGLO1.OPENSVC.COM.POOL#1 - INFO - zpool import xosolglo1-data
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - virsh define /opt/opensvc/var/xosolglo1.xml
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - output
	Domain xosolglo1 defined from /opt/opensvc/var/xosolglo1.xml
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - virsh start xosolglo1
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - output
	Domain xosolglo1 started
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container up status
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container ping
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container operational
	* XOSOLGLO1.OPENSVC.COM.APP - INFO - spawn: /usr/bin/ssh xosolglo1 /svc/etc/init.d/S10example start
	* XOSOLGLO1.OPENSVC.COM.APP - INFO - start done in 0:00:00.508232 - ret 0 - logs in /var/tmp/svc_xosolglo1.opensvc.com_S10example.log

