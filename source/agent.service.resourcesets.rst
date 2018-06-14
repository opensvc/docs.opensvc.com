Resource Sets
*************

A resource set is a group of resources of the same family (ip, disk, share, fs, app; task, sync).

A default resource set per family is implicitely created. These default resource sets start their resources serially.

A resource can join a custom resourceset by setting :kw:``subset`` to the name of a custom resource set.
For example a disk resource setting ``subset = g1`` joins the resource to a subset named ``subset#disk:g1``.

Administrator may want to configure resource sets for the following reasons:

* Alter the default resources ordering
* Define a group of resources to start and stop in parallel instead of serially
* Apply machine resources capping to a group of resources

Resource Sets and Subsets Names
===============================

The same subset name can be set for resources of different driver families.
The resulting resource sets name do not conflict, being formatted as ``subset#<driver family>:<subset>``.

Example::

	[disk#01]
	subset = g1
	...

	[fs#01]
	subset = g1
	...

	[subset#disk:g1]
	...

	[subset#fs:g1]
	...

Ordering
========

Resource Sets Ordering
----------------------

On ascending actions, the resources are strictly activated in this order:

* ip
* sync resources that handle disks: netapp, dcsckpt, nexenta, symclone, symsnap, symsrdfs, hp3par, ibmdssnap
* disk
* fs
* share
* container
* app

When custom resource sets are defined in a driver family, those are ordered with a alphanumeric sort of the resource sets names.

Resources Ordering
------------------

All resources families resource sets, except the ``fs`` resource sets, order their resources with a alphanumeric sort of the resource ids,

* Ascending on start, provision, run and sync actions
* Descending on stop, unprovision and shutdown actions

The ``fs`` resource sets sort their resources by mount point, so filesystems are always mounted from shallowest to deepest.
For filesystems mounted in the same parent directory, the ordering falls back to the usual alphanumeric sort on resource id.

This policy avoids administrator causing resource ordering errors due to the fs resources id choices.

Serial or parallel actions
==========================

A resource set can be configured for parallel execution of actions on its resources with::

	[subset#disk:g1]
	parallel = true

Capping
=======

Resource caps can be set at the resource set level using the same syntax than at the resource level::

	[subset#app:g1]
	pg_cpu_quota = -1
	pg_cpus = 1-2
	pg_mem_limit = 400MB
	pg_mem_oom_control = 1


