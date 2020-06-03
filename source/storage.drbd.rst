drbd storage driver
*******************

Introduction
============

Drbd is a Linux kernel driver presenting shared block devices from pairs of local block devices. Replication data goes over the network and can be synchronous ou near-synchronous. It supports the active-active or active-passive operation modes. The former being a prerequisite for cluster filesystem.

OpenSVC drbd driver has provisioning capabilities.

OpenSVC also includes a drbd pool driver, to automatically provision drbd-replicated volumes from a volume group, a zpool or a directory.

Node configuration
==================

The drbd resource configuration is expected to reside in :file:`/etc/drbd.d/${res}.res`.

If a vg is layered above drbd, a specific LVM configuration is recommended (link)

::

        Set write_cache_state = 0 in /etc/lvm/lvm.conf
        Remove /etc/lvm/cache/.cache

Files contributed to sync#i0
============================

::

        /etc/drbd.d/${res}.res

This file is thus replicated from the node running the service to the other nodes and drpnodes.

Command set
===========

The drbd driver is a member of the 'disk group' class.

:cmd:`start`

    Promote to 'primary' state

:cmd:`stop`

    Demote to 'secondary' state

:cmd:`shutdown`

    Demote to 'unconfigured' state

Example
=======

::

	[disk#1]
	type = lv
	name = lv1
	vg = vg1
	size = 190m
	standby = true

	[disk#2]
	type = drbd
	res = res1
	disk = /dev/vg1/lv1
	standby = true

* The drbd and underlying logical volume resources must be configured for standby=true. This make sure the lv is available for drbd on the slave nodes and the drbd is in secondary state.
* The logical volume resource id (disk#1) is sorted before the drbd resource id (disk#2), so the logical volume starts before the drbd.

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.disk.drbd

