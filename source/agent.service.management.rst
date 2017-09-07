Service Management
******************

Selecting Services
==================

All Services
++++++++++++

::

	sudo svcmgr ls

Single Service
++++++++++++++

::

	sudo svcmgr ls -s <svcname>
        # or
	sudo <svcname> ls

List All Services
+++++++++++++++++

::

	sudo svcmgr ls -s svc1,svc2

Services by State
+++++++++++++++++

::

	sudo svcmgr ls --status down

List all services in 'down' state.

::

	sudo svcmgr ls --status up,warn

List all services in 'up' and 'warn' state.

Service Selector Expressions
++++++++++++++++++++++++++++

Selector syntax::

        svcmgr ls -s <expr>[+<expr>...]

Where ``<expr>`` is:

* ``<svcname glob pattern>``
* ``<param><op><value>``

Where ``<param>`` is:

* ``<rid>.<key>`` in a service config file
* ``<group>.<key>`` in a service config file, where ``<group>`` is a driver group name like disk, fs, task, ...
* ``<key>`` in the service config file header

Where ``<op>`` is:

* ``+`` as the AND expression separator
* ``<`` ``>`` ``<=`` ``>=`` ``=`` operators
* ``:`` as a existance test operator (empty value)
* ``!`` as a negation operator
* ``~`` as a regexp operator

Examples:

services with name ending with dns or starting with ha and with
an app resource with a timeout set superior to 1::

        $ sudo svcmgr -s '*dns,ha*+app.timeout>1' ls
        ha1
        ha2
        ha3
        pridns

Services with at least one ip resource and one task resource::

        $ sudo svcmgr -s 'ip:+task:' ls
        ha1
        ha2
        ha3
        registry


Services status
===============

``sudo svcmon``

        Overview of the status of all services this configured on the node.

``sudo svcmgr -s <svcname> print status``

        Detailled service resources status.

Actions
=======

Base Actions
++++++++++++

``sudo svcmgr -s <svcname> start``

        Start resources of type ip, disk, fs, share, container, app.

``sudo svcmgr -s <svcname> stop``

        Stop resources of type app, container, share, fs, disk, ip.

``sudo svcmgr -s <svcname> sync all``

        Run the sync resources replication to all targets, either prd or drp.

``sudo svcmgr -s <svcname> run``

        Run tasks.


Resource Filtering
++++++++++++++++++

``sudo svcmgr -s <svcname> --rid <rid>[,<rid>,...] <action>``

        Execute ``<action>`` on ``<svcname>`` resources specified by ``--rid``.

``sudo svcmgr -s <svcname> --tags tag1,tag2 <action>``

        Execute ``<action>`` on ``<svcname>`` resources tagged with either tag1 or tag2.

``sudo svcmgr -s <svcname> --tags tag1+tag2,tag3 <action>``

        Execute ``<action>`` on ``<svcname>`` resources tagged with both tag1 or tag2 or with tag3.

``sudo svcmgr -s <svcname> --subsets s1,s2 <action>``

        Execute ``<action>`` on ``<svcname>`` resources in subset s1 or s2


Group actions
+++++++++++++

``sudo svcmgr -s <svcname> startdisk``

        Start resources of type loop, disk group, zpool, fs

``sudo svcmgr -s <svcname> stopdisk``

        Stop resources of type fs, zpool, disk group, loop

``sudo svcmgr -s <svcname> startip``

        Start resources of type ip

``sudo svcmgr -s <svcname> stopip``

        Stop resources of type ip

``sudo svcmgr -s <svcname> startloop``

        Start resources of type loop

``sudo svcmgr -s <svcname> stoploop``

        Stop resources of type loop

``sudo svcmgr -s <svcname> startvg``

        Start resources of type disk group

``sudo svcmgr -s <svcname> stopvg``

        Stop resources of type disk group

``sudo svcmgr -s <svcname> mount``

        Start resources of type fs and the underlying resources

``sudo svcmgr -s <svcname> umount``

        Stop resources of type fs and the underlying resources

``sudo svcmgr -s <svcname> prstart``

        Acquire scsi persistent reservations on disks of the service (wrapped by startvg and startdisk)

``sudo svcmgr -s <svcname> prstop``

        Release scsi persistent reservations on disks of the service (wrapped by stopvg and stopdisk)

``sudo svcmgr -s <svcname> syncnodes``

        Trigger hard-coded and user-defined file synchronization to secondary nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

``sudo svcmgr -s <svcname> syncdrp``

        Trigger hard-coded and user-defined file synchronization to disaster recovery nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

Logging
=======

All action logs are multiplexed to:

*   stdout/stderr

*   ``<OSVCLOG>/<svcname>.log``
    Daily rotation on these files, and size limit rotation

*   ``<OSVCLOG>/<svcname>.debug.log``
    Including debug logs

*   collector database
    Optional, through asynchronous xmlrpc calls.

*   syslog
    Optional, disabled by default, configured in ``node.conf``

Examples
========

Print services status of a node:

::

	[root@aubergine ~]# svcmon
        Threads                                   aubergine clementine nuc            
         hb#1.rx    running   224.3.29.71:10001 | /         X          X              
         hb#1.tx    running   224.3.29.71:10001 | /         O          O              
         hb#2.rx    running   0.0.0.0:10004     | /         X          O              
         hb#2.tx    running                     | /         X          O              
         listener   running   0.0.0.0:1214     
         monitor    running  
         scheduler  running  

        Cluster                                   aubergine clementine nuc            
         1m                                     | 0.57                 0.1            
         5m                                     | 0.56                 0.07           
         15m                                    | 0.57                 0.07           
         mon                                    | idle                 idle           

        Services                                  aubergine clementine nuc            
         collector  up        failover          | O                                   
         ha1        warn      failover          | O                    O              
         pridns     up        failover          | O                                   
         registry   up        failover          | O                                   
         testapplim n/a       flex              | /                                   
         testbnp    n/a       failover          | /                                   
         testdrbd   n/a       failover          | /         ?          /              
         testmd     down warn flex              | !!                   !! start failed

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
	* APP - INFO - spawn: /etc/opensvc/aasprdora01.d/K50oracle stop
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
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - virsh define /var/lib/opensvc/xosolglo1.xml
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - output
	Domain xosolglo1 defined from /var/lib/opensvc/xosolglo1.xml
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - virsh start xosolglo1
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - output
	Domain xosolglo1 started
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container up status
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container ping
	* XOSOLGLO1.OPENSVC.COM.XEN - INFO - wait for container operational
	* XOSOLGLO1.OPENSVC.COM.APP - INFO - spawn: /usr/bin/ssh xosolglo1 /svc/etc/init.d/S10example start
	* XOSOLGLO1.OPENSVC.COM.APP - INFO - start done in 0:00:00.508232 - ret 0 - logs in /var/tmp/svc_xosolglo1.opensvc.com_S10example.log

