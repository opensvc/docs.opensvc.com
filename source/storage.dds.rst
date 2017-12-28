dds data replication
********************

Introduction
============

The dds replication scheme is like ddsnap, just simpler, dumber and entirely in userspace. It builds around the dds utility, provided by OpenSVC and available from the OpenSVC repositories. This tool parses the LVM2 snapshots copy-on-write table to identify changed chunks since snapshot creation and gather fresh data from the origin or from a newer snapshot of the same origin. OpenSVC uses this low-level feature-set to implement binary-delta incremental logical volume replication.

Source and targets maintain a state file to identify the last incremental synchronization done properly. This state is used to check that the deltas application sequence is not broken. If broken, alerts are emited and a full sync must be scheduled.

Delta generation
================	

.. figure:: _static/dds.png
   :align:  left

dds reads the snap1 (oldest) snapshot cow table. For each changed chunk, fetch chunk data from snap2. In the diagram, chunk1 has not changed since snap2 creation, so data is actually read from origin, whereas chunk4 has changed since snap2 creation, so data is read from snap2 cow segment.

In other words, the binary delta file contains all data changed between snap1 and snap2 creation times, plus the mapping table keeping track of each chunk offset in the origin.

After succesful delta application on targets, snap1 is removed and snap2 is renamed snap1. Ready for the next incremental sync.

Command set
===========

:cmd:`sync full`
    Initial synchronization. dd-based. Make the whole dataset transit on the wire. Also needed when source and target get out-of-sync. This operation, though a storage bandwidth drain, works on a snapshot, so the service need not be down.

:cmd:`sync update`
    Incremental synchronization. dds-based. Extract the binary delta as a file, send to file to the target systems and replay the changes there.

Status
======

:state:`up`
    Last synchronization occured less than :kw:`sync_max_delay` minutes ago.

:state:`warn`
    Last synchronization occured more than :kw:`sync_max_delay` minutes ago.

Service configuration
=====================

Cluster mode
------------

:state:`split`
    This is the default disaster recovery mode. Upon service startup on a DRP node, the dds replication is blocked from the DRP node. The return to production mode usually involves a full resynchronization.

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.sync.dds

Examples
========

Full synchronization
--------------------

::

	# svcmgr -s unxtstsvc01 sync full
	* UNXTSTSVC01.SYNC#3 - INFO - lvcreate -s -n data_osvc_snap1 -L 4M /dev/unxtstsvc02/data
	* UNXTSTSVC01.SYNC#3 - INFO - update state file with snap uuid HcJj5t-lPHf-2Jw6-6iLt-MUdf-UKby-LkVYJm
	* UNXTSTSVC01.SYNC#3 - INFO - dd if=/dev/unxtstsvc02/data_osvc_snap1 bs=1M | /usr/bin/ssh vm5 dd bs=1M of=/tmp/dds.img
	32+0 records in
	32+0 records out
	33554432 bytes (34 MB) copied, 26.6035 s, 1.3 MB/s
	0+2626 records in
	0+2626 records out
	33554432 bytes (34 MB) copied, 6.60506 seconds, 5.1 MB/s
	* UNXTSTSVC01.SYNC#3 - INFO - /usr/bin/scp /var/lib/opensvc/sync#3_dds_state vm5:/var/lib/opensvc/sync#3_dds_state

Incremental synchronization
---------------------------

::

	# etc/unxtstsvc01 sync update
	* UNXTSTSVC01.SYNC#3 - INFO - lvcreate -s -n data_osvc_snap2 -L 4M /dev/unxtstsvc02/data
	* UNXTSTSVC01.SYNC#3 - INFO - dds --extract --cow /dev/mapper/unxtstsvc02-data_osvc_snap1-cow
					    --source /dev/unxtstsvc02/data_osvc_snap2 -v --dest /var/lib/opensvc/unxtstsvc02-data.delta
	* UNXTSTSVC01.SYNC#3 - INFO - /usr/bin/scp /var/lib/opensvc/unxtstsvc02-data.delta vm5:/var/lib/opensvc/unxtstsvc02-data.delta
	* UNXTSTSVC01.SYNC#3 - INFO - /usr/bin/ssh vm5 dds -v --merge --cow /var/lib/opensvc/unxtstsvc02-data.delta --dest /tmp/dds.img
	* UNXTSTSVC01.SYNC#3 - INFO - /usr/bin/scp /var/lib/opensvc/sync#3_dds_state vm5:/var/lib/opensvc/sync#3_dds_state
	* UNXTSTSVC01.SYNC#3 - INFO - lvremove -f /dev/unxtstsvc02/data_osvc_snap1
	* UNXTSTSVC01.SYNC#3 - INFO - lvrename unxtstsvc02 data_osvc_snap2 data_osvc_snap1
	* UNXTSTSVC01.SYNC#3 - INFO - update state file with snap uuid gO9o05-Mmdp-lUDS-HVSQ-lpLd-Eq6Q-CPClcc
	* UNXTSTSVC01.SYNC#3 - INFO - /usr/bin/scp /var/lib/opensvc/sync#3_dds_state vm5:/var/lib/opensvc/sync#3_dds_state

