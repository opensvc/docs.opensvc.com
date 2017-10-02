NEC iSM snapshots
*****************************

Introduction
============

.. figure:: _static/necsnap.png
   :align:  center

The NEC arrays snapshots driver allow multi-target block device replication and support the 'syncresync' action which automates the Snapshot Volume and relink Link Volume. An opensvc service can thus easily use a snapshoted set of devices. This kind of services are often used for maintenance, pre-production, performance testing environments, where the source device set is used for production. The following documentation presents the configuration of such a service.

A service with only necismsnap sync resources can be defined to drive the snapshots of other servers, just for the benefit of centralized logging and scheduling.

Command set
===========

:cmd:`syncresync`
    Unlink Link Volumes, resync Snapshot Volumes and relink Link Volumes.

:cmd:`syncresync --force`
    Bypass the sync_min_delay protection.

Status
======

:cmd:`up`
    The last resync occured less than 'sync_max_delay' minutes ago.

:cmd:`warn`
    *  The last resync occured more than 'sync_max_delay' minutes ago.
    *  Snapshot Volumes or Link Volumes are in a unexpected state or not present in NEC array.

Service configuration
=====================

Pre-requisites
--------------

The iSMccs commands (iSMccs.rpm) must be installed in the standard location on the node. The service iSMHostRegisterService must be started and iSMvollist reset (# iSMvollist -r)

Service configuration file
--------------------------

::

	#
	# NEC iSM snap
	#
	;[sync#1]
	;type = necismsnap
	;sync_max_delay = 10512000

	#
	# 'devs'
	#   mandatory. whitespace-separated list of devices to drive with this resource.
	#   devices are specified as 'array Snapshot Volume identifier:array Link Volume identifier' 
	#
	;devs = SOURCE_0001_SV006D:SOURCE_0001_LV00A6 SOURCE_0002_SV0055:SOURCE_0002_LV009E

You can setup as many sync resources as needed to ensure a consistent replication scenario.

NEC iSM snapshots configuration
===============================

You have to create the Snapshot Volumes and Link Volumes manually once and link SV and LV to present them to the hosts. These properties can then be set in the service env file to ensure the snapshots will always be created and presented using those same properties. This is important to make the snapshot resync as transparent as possible to the operating system, and not to trigger device renames.

Examples
========

Resync a started service snapshots
----------------------------------

::

	# svcmgr -s iiststnec02 stop && svcmgr -s iiststnec02 syncresync && svcmgr -s iiststnec02 start

Resync a stopped service snapshots
----------------------------------

::

	# svcmgr -s iiststnec02 syncresync

	2014-09-18 05:14:25,547 - iiststnec02.SYNC#1 - INFO - iSMsc_unlink -lv SOURCE_0001_LV00A6 -lvflg ld
	2014-09-18 05:14:26,020 - iiststnec02.SYNC#1 - INFO - iSMsc_unlink:Info: iSM20030: iSMsc_unlink has normally terminated.

	2014-09-18 05:14:26,052 - iiststnec02.SYNC#1 - INFO - iSMsc_unlink -lv SOURCE_0002_LV009E -lvflg ld
	2014-09-18 05:14:26,375 - iiststnec02.SYNC#1 - INFO - iSMsc_unlink:Info: iSM20030: iSMsc_unlink has normally terminated.

	2014-09-18 05:14:28,177 - iiststnec02.SYNC#1 - INFO - iSMsc_create -bv SOURCE_0001 -sv SOURCE_0001_SV006D -bvflg ld -svflg ld
	2014-09-18 05:15:03,549 - iiststnec02.SYNC#1 - INFO - iSMsc_create:Info: iSM19010: iSMsc_create has normally terminated.
	   BV:SOURCE_0001         LX
	      Special File : -
	   SV:SOURCE_0001_SV006D  LX
	      Generation : -1
	      Status     : snap/active [2014/09/18 05:15:04]

	2014-09-18 05:15:03,590 - iiststnec02.SYNC#1 - INFO - iSMsc_create -bv SOURCE_0002 -sv SOURCE_0002_SV0055 -bvflg ld -svflg ld
	2014-09-18 05:15:42,002 - iiststnec02.SYNC#1 - INFO - iSMsc_create:Info: iSM19010: iSMsc_create has normally terminated.
	   BV:SOURCE_0002         LX
	      Special File : -
	   SV:SOURCE_0002_SV0055  LX
	      Generation : -1
	      Status     : snap/active [2014/09/18 05:15:42]

	2014-09-18 05:18:43,426 - iiststnec02.SYNC#1 - INFO - iSMsc_link -lv SOURCE_0001_LV00A6 -sv SOURCE_0001_SV006D -lvflg ld -svflg ld
	2014-09-18 05:18:43,453 - iiststnec02.SYNC#1 - INFO - iSMsc_link:Info: iSM20020: iSMsc_link has normally terminated.

	2014-09-18 05:18:43,483 - iiststnec02.SYNC#1 - INFO - iSMsc_link -lv SOURCE_0002_LV009E -sv SOURCE_0002_SV0055 -lvflg ld -svflg ld
	2014-09-18 05:18:43,510 - iiststnec02.SYNC#1 - INFO - iSMsc_link:Info: iSM20020: iSMsc_link has normally terminated.
