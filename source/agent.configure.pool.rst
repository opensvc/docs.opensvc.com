Storage Pools Configuration
***************************

Service templates can use "volume" resources to abstract the disks and filesystems layout. In this case the translation from volumes to disks and filesystems is delegated to the storage pool drivers.

Pools can be defined in the node configuration. Each pool is identified by its name (the section suffix). For example, a ``pool#tank`` section defines a pool named ``tank``.

The ``default`` pool always exist, even if not defined in the node configuration. If not explicitely changed, the ``default`` pool driver is directory.

Volumes
=======

A volume transient resource accept the following keywords:

size
----

A size expression. The size to allocate from the pool.

This keyword is honored by the loop and vg pool drivers.

pool
----

The name of the pool to allocate from.

format
------

A boolean. Whether a filesystem should be created on the allocated device.

This keyword is honored by the loop and vg pool drivers.

mnt
---

The path where to expose the filesystem.

If not set, the path defaults to ``/srv/{id}/{rindex}``.

fs_type
-------

If a filesystem is added by the translator, this keyword defines the fs type.

mkfs_opt
--------

If a filesystem is added by the translator, this keyword defines the mkfs options added to the format command.

create_opt
----------

If a logical volume or lv-backed fs is added by the translator, this keyword defines the lvcreate options.

Pool Drivers
============

directory
---------

A volume referencing a directory pool is translated to:

* a fs.directory resource, with path set to ``<pool path>/{id}_<volume index>``.
* a fs.bind resource, binding the directory to the expected mounntpoint.

loop
----

A volume with ``format=true`` (default) referencing a loop pool is translated to:

* a disk.loop resource.
* a fs.<pool fs_type> resource.

A volume with ``format=false`` referencing a loop pool is translated to:

* a disk.loop resource.

vg
--

A volume with ``format=true`` (default) referencing a vg pool is translated to:

* a fs.<pool fs_type> resource, with lv provisioning keywords set

A volume with ``format=false`` referencing a vg pool is translated to:

* a disk.lv resource

Specific parameters: create_opt

The logical volume name is set to ``{id}_<volume index>``.

zfs
---

A volume referencing a zfs pool is translated to a fs.zfs resource.

The dataset name is set to ``{id}_<volume index>``.

Examples
========

loop pool
---------

With a pool definition

::

	[pool#loop]
	type = loop
	path = /bigfs
	mkfs_opt = -n ftype=1
	fs_type = xfs

The volume transient resource

::

	[volume#1]
	size = 1g
	pool = loop
	mnt = /srv/{svcname}

is translated to:

::

	[disk#1]
	type = loop
	file = /bigfs/{id}/1.img
	size = 1g

	[fs#1]
	type = xfs
	dev = /bigfs/{id}/1.img
	mnt = /srv/{svcname}

vg
--

With a pool definition

::

	[pool#sysvg]
	type = vg
	name = ubuntu-vg
	create_opt = -m 2

The same volume transient resource

::

	[volume#1]
	size = 1g
	pool = sysvg
	mnt = /srv/{svcname}

is translated to:

::

	[fs#1]
	type = xfs
	dev = /dev/ubuntu-vg/{id}_1
	mnt = /srv/{svcname}
	create_opt = -m 2
	vg = ubuntu-vg
	size = 1g

zfs
---

With a pool definition

::

	[pool#tank]
	type = zpool
	name = testmd
	mkfs_opt = -o mountpoint=legacy -o dedup=on -o compression=on

The same volume transient resource

::

	[volume#1]
	size = 1g
	pool = tank
	mnt = /srv/{svcname}

is translated to:

::

	[fs#1]
	type = zfs
	dev = testmd/{id}_1
	mkfs_opt = -o mountpoint=legacy -o dedup=on -o compression=on
	mnt = /srv/{svcname}

