zfs data replication
********************

Introduction
============

The zfs replication scheme is based on zfs send/receive. OpenSVC uses ZFS snapshots to ensure incremental send/receive replication.

Source and targets maintain a zfs snapshot @sent to identify the last incremental synchronization done properly. This state is used to check that the deltas application sequence is not broken. If broken, alerts are emited and a full sync must be scheduled

Command set
===========

:cmd:`sync nodes`
    Initial synchronization or incremental synchronisation. First one will be a Initial synchronisation, next will be incremental

:cmd:`sync update`
    Same

Status
======

:state:`up`
    Last synchronization occured less than :kw:`sync_max_delay` minutes ago.

:state:`warn`
    Last synchronization occured more than :kw:`sync_max_delay` minutes ago.

Service configuration
=====================

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.sync.zfs

Examples
========

Extract of z3.opensvc.com env file
----------------------------------

::

	[sync#1]
	type = zfs
	src@osol1.opensvc.com = osol1_z3_root/data
	src@osol2.opensvc.com = osol2_z3_root/data
	dst@osol1.opensvc.com = osol2_z3_root/data
	dst@osol2.opensvc.com = osol1_z3_root/data
	target = nodes
	;recursive = True

Full synchronization
--------------------

::

	cgaliber@osol1.opensvc.com # pfexec om z3.opensvc.com sync full
	* Z3.OPENSVC.COM.SYNC#1 - INFO - zfs snapshot -r osol1_z3@tosend
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/sbin/zfs send -R osol1_z3_root@tosend | /usr/bin/ssh osol2.opensvc.com \
					   /usr/sbin/zfs receive -dF osol2_z3_root
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/bin/ssh -n osol2.opensvc.com zfs rename -r osol2_z3_root@tosend osol2_z3_root@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - zfs rename -r osol1_z3_root@tosend osol1_z3_root@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - update state file with snap uuid Sat Jun 19  2:55 2010
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/bin/scp /var/lib/opensvc/z3.opensvc.com_sync#1_zfs_state \
					   osol2.opensvc.com:/var/lib/opensvc/z3.opensvc.com_sync#1_zfs_state

Incremental synchronization
---------------------------

::

	cgaliber@osol1.opensvc.com # pfexec om z3.opensvc.com sync update
	* Z3.OPENSVC.COM.SYNC#1 - INFO - zfs snapshot -r osol1_z3_root/data@tosend
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/sbin/zfs send -R -i osol1_z3_root/data@sent osol1_z3_root/data@tosend | \
					   /usr/bin/ssh osol2.opensvc.com /usr/sbin/zfs receive -dF osol2_z3_root
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/bin/ssh osol2.opensvc.com /usr/sbin/zfs destroy -r osol2_z3_root/data@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/bin/ssh osol2.opensvc.com zfs rename -r osol2_z3_root/data@tosend osol2_z3_root/data@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/sbin/zfs destroy -r osol1_z3_root/data@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - zfs rename -r osol1_z3_root/data@tosend osol1_z3_root/data@sent
	* Z3.OPENSVC.COM.SYNC#1 - INFO - update state file with snap uuid Sat Jun 19 14:30 2010
	* Z3.OPENSVC.COM.SYNC#1 - INFO - /usr/bin/scp /var/lib/opensvc/z3.opensvc.com_sync#1_zfs_state \
					   osol2.opensvc.com:/var/lib/opensvc/z3.opensvc.com_sync#1_zfs_state

