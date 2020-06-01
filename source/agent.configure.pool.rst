Cluster Storage Pools
*********************

Services can use ``volume`` resources to:

* Abstract the disks and filesystems layout, which are hosting specificities, from the service deployment. A development cluster can for example define pools on a ceph cluster, while a production cluster can define pools on fc arrays.

* Enable service redeployment while retaining the data.

In this case the translation from volumes to disks and filesystems is delegated to the storage pool drivers.

Pools are defined in the node configuration. Each pool is identified by its name (the section suffix). For example, a ``pool#tank`` section defines a pool named ``tank``.

The ``default`` pool always exist, even if not defined in the node configuration. If not explicitely changed, the ``default`` pool driver is ``directory``.

Volumes
=======

* A volume resource drives a volume object, automatically created upon service provisioning if not already existing.

* The volume is hosted in the same namespace than its users.

* If not explicitely set, the volume object name is ``<consumer name>-vol-<volume resource index>``. For example, a ``svc1`` service with a ``volume#1`` resource will create a ``svc1-vol-1`` volume object.

* A volume object can be referenced by multiple services in the same namespace.

* On provision, a service adds itself as a child of the volume objects mapped via volume resources. Due to this parent/child relation, stopping a volume object is delayed until all its consumers are stopped.

* On unprovision, a service removes itself from the children list of the volume objects mapped via volume resources.

* A consumer service instance stop also stops its node-affine volume object instances if the consumer service is the only child of the volume service. 

* A consumer service instance start always tries to start its node-affine volume object instances.

Volume Resources Keywords
-------------------------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.volume

Access Modes
------------

* ``roo`` Read Only Once

* ``rwo`` Read Write Once (default)

* ``rox`` Read Only from multiple instances

* ``rwx`` Read Write from multiple instances

Access Mode to Volume Topology
------------------------------

* ``..x`` access modes imply the volume is configured in a flex topology (active on all service nodes).

* ``..o`` access modes imply the volume is configured in a failover topology (active on only one service node).

Volume Resource Parameter Requirements
--------------------------------------

* ``..x + shared=true format=false`` requires a shared block storage (SAN array, a rados blockdev gateway, ...)

* ``..x + shared=true format=true`` requires either a shared block storage (SAN array, a rados blockdev gateway, ...) plus a cluster filesystem (gfs2, ocfs, ...), or a distributed cluster filesystem (CephFS, GlusterFS, NAS, ...)

Pool Selector
=============

A volume resource requires a size and capabilities from the pool, via its ``size``, ``access``, ``shared`` and ``format`` keywords.

If ``pool`` is not set explicitely to a pool name, the pool selector will return the available pool matching those criteria with the most free space.

Pool Drivers
============

directory
---------

Capabilities
++++++++++++

rox, rwx, roo, rwo

Layout
++++++

A volume object from this type of pool contains:

* a fs.directory resource, with ``path`` set to ``<pool head>/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.directory

drbd
----

Capabilities
++++++++++++

rox, rwx, shared, blk, roo, rwo

Layout
++++++

A volume object from this type of pool contains:

If a vg is defined in the pool configuration,

* a fs resource, with ``dev`` set to the drbd device path
* a drbd resource, layered over a logical volume of the pool vg
* a lv resource

If a zpool is defined in the pool configuration,

* a fs resource, with ``dev`` set to the drbd device path
* a drbd resource, layered over a zvol of the pool zpool
* a zvol resource

If the pool configuration has neither vg nor zpool set,

* a fs resource, with ``dev`` set to the drbd device path
* a drbd resource, layered over a logical volume
* a lv resource
* a vg resource
* a loop resource, with image file hosted in the pool defined ``path`` or in ``<PATHVAR>/pool/<poolname>/``

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.drbd

freenas
-------

Capabilities
++++++++++++

roo, rwo, shared, blk, iscsi

Layout
++++++

A volume object from this type of pool contains:

* a disk.disk resource named, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume object also contains:

* a fs.<pool fs_type> resource, with ``mnt`` set to ``/srv/<volume fqdn>``

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.freenas

loop
----

Capabilities
++++++++++++

rox, rwx, roo, rwo, blk

Layout
++++++

A volume object from this type of pool contains:

* a disk.loop resource, with ``file`` set to ``<pool head>/<volume fqdn>.img``

If the consumer has ``format=true`` (default), the volume object also contains:

* a fs.<pool fs_type> resource, with ``mnt`` set to ``/srv/<volume fqdn>``

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.loop

symmetrix
---------

Capabilities
++++++++++++

roo, rwo, shared, blk, fc

Layout
++++++

A volume object from this type of pool contains:

* a disk.disk resource named, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume object also contains:

* a fs.<pool fs_type> resource, with ``mnt`` set to ``/srv/<volume fqdn>``

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.symmetrix

vg
--

Capabilities
++++++++++++

rox, rwx, roo, rwo, blk, snap

Layout
++++++

A volume object from this type of pool contains:

* a disk.lv resource, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume object also contains:

* a fs.<pool fs_type> resource, with ``mnt`` set to ``/srv/<volume fqdn>``

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.vg

share
-----

Capabilities
++++++++++++

rox, rwx, roo, rwo, shared

Layout
++++++

A volume object from this type of pool contains:

* a fs.directory resource, with ``path`` set to ``<pool head>/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.share

zpool
-----

Capabilities
++++++++++++

rox, rwx, roo, rwo, blk, snap

Layout
++++++

A volume object from this type of pool contains:

* a fs.zfs resource, with ``name`` set to ``<pool>/<volume fqdn>`` and ``mnt`` set to ``/srv/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.zpool

Virtual Pool Driver
-------------------

A virtual pool allow administrators to create complex layouts based on volumes from other pools.

A typical use-case in a virtual pool allocating volumes mirrored over two other volumes allocated from arrays on two different sites.

A virtual pool volume is created from a template volume object the administrator can design at wish to meet its specific needs.

Capabilities
++++++++++++

Capabilities are user defined.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.virtual

Pool Commands
=============

Pool list
---------

::

	# om pool ls
	default
	freenas
	mpool

Pool Status
-----------

::

	# om pool status
	name        type       caps                      head                             vols  size   used   free   
	|- default  directory  rox,rwx,roo,rwo           /opt/opensvc/var/pool/directory  0     29.0g  3.57g  24.0g  
	|- freenas  freenas    roo,rwo,shared,blk,iscsi  array://freenas/osvcdata         6     195g   9.37g  185g   
	`- mpool    virtual    roo,rox,rwo,rwx,shared    templates/mpool                  1     -      -      -      

Examples
========

loop pool
---------

Pool configuration

::

	om cluster set \
		--kw pool#loop.type=loop \
		--kw pool#loop.path=/bigfs \
		--kw "pool#loop.mkfs_opt=-n ftype=1" \
		--kw pool#loop.fs_type=xfs

::

	[pool#loop]
	type = loop
	path = /bigfs
	mkfs_opt = -n ftype=1
	fs_type = xfs

The volume resource in the service

::

	[volume#1]
	size = 100m
	pool = loop

Resulting configuration of the volume object

::

	[disk#1]
	size = 104857600
	type = loop
	file = /bigfs/<fqdn>.img

	[fs#1]
	type = xfs
	dev = {disk#1.exposed_devs[0]}
	mnt = /srv/<fqdn>
	mkfs_opt = -n ftype=1

zfs pool
--------

Pool configuration

::

	om cluster set \
		--kw pool#tank.type=zpool \
		--kw pool#tank.name=tank \
		--kw "pool#tank.mkfs_opt=-o mountpoint=legacy -o dedup=on -o compression=on"

::

	[pool#tank]
	type = zpool
	name = tank
	mkfs_opt = -o mountpoint=legacy -o dedup=on -o compression=on

The volume resource in the service

::

	[volume#1]
	size = 100m
	pool = tank

Resulting configuration of the volume object

::

        [fs#1]
        type = zfs
        dev = tank/<fqdn>
        mnt = /srv/<fqdn>
        mkfs_opt = -o mountpoint=legacy -o dedup=on -o compression=on

virtual pool, mirrored zpool over 2 SAN disks
---------------------------------------------

Pools configuration

::

	om cluster set \
		--kw pool#freenas1.type=array \
		--kw pool#freenas1.array=freenas1 \
		--kw pool#freenas1.sparse=true \
		--kw pool#freenas1.diskgroup=cluster1 \
		--kw pool#freenas2.type=array \
		--kw pool#freenas2.array=freenas2 \
		--kw pool#freenas2.sparse=true \
		--kw pool#freenas2.diskgroup=cluster1 \
		--kw pool#mpool.type=virtual \
		--kw pool#mpool.template=templates/mpool \
		--kw "pool#mpool.capabilities=rox rwx roo rwo shared"

::

	[pool#freenas1]
	type = array
	array = freenas1
	diskgroup = cluster1
	sparse = true

	[pool#freenas2]
	type = array
	array = freenas2
	diskgroup = cluster1
	sparse = true

	[pool#mpool]
	type = virtual
	template = templates/mpool
	capabilities = rox rwx roo rwo shared

The volume object template referenced by the vpool

::

	[DEFAULT]
	kind = vol
	nodes = *
	disable = true

	[disk#1]
	name = {namespace}-{svcname}
	type = zpool
	vdev = mirror {volume#1.exposed_devs[0]} {volume#2.exposed_devs[0]}
	shared = true

	[fs#1]
	dev = {disk#1.name}
	mnt = /srv/{namespace}/{svcname}
	type = zfs
	shared = true

	[fs#2]
	dev = {disk#1.name}/data
	mnt = {fs#1.mnt}/data
	type = zfs
	shared = true

	[fs#3]
	dev = {disk#1.name}/log
	mnt = {fs#1.mnt}/log
	type = zfs
	shared = true

	[volume#1]
	format = false
	name = {svcname}-1
	pool = freenas1
	size = {env.size}
	shared = true

	[volume#2]
	format = false
	name = {svcname}-2
	pool = freenas2
	size = {env.size}
	shared = true

virtual pool, mirrored lv over 2 SAN disks
------------------------------------------

Pools configuration

::

	om cluster set \
		--kw pool#freenas1.type=array \
		--kw pool#freenas1.array=freenas1 \
		--kw pool#freenas1.sparse=true \
		--kw pool#freenas1.diskgroup=cluster1 \
		--kw pool#freenas2.type=array \
		--kw pool#freenas2.array=freenas2 \
		--kw pool#freenas2.sparse=true \
		--kw pool#freenas2.diskgroup=cluster1 \
		--kw pool#mvg.type=virtual \
		--kw pool#mvg.template=templates/mvg \
		--kw "pool#mvg.capabilities=rox rwx roo rwo shared"

::

	[pool#freenas1]
	type = array
	array = freenas1
	diskgroup = cluster1
	sparse = true

	[pool#freenas2]
	type = array
	array = freenas2
	diskgroup = cluster1
	sparse = true

	[pool#mvg]
	type = virtual
	template = templates/mvg
	capabilities = rox rwx roo rwo shared

The volume object template referenced by the vpool

::

	[DEFAULT]
	kind = vol
	nodes = *
	disable = true

	[volume#1]
	shared = true
	size = {env.size}
	name = {svcname}-1
	pool = freenas
	format = false

	[volume#2]
	shared = true
	size = {env.size}
	name = {svcname}-2
	pool = freenas
	format = false

	[disk#1]
	shared = true
	type = vg
	name = {namespace}-{svcname}
	pvs = {volume#1.exposed_devs[0]} {volume#2.exposed_devs[0]}

	[fs#1]
	shared = true
	mnt = /srv/{namespace}/{svcname}
	dev = /dev/{disk#1.name}/root
	type = ext4
	size = 10m
	create_options = -m 1
	vg = {namespace}-{svcname}

	[fs#2]
	shared = true
	mnt = {fs#1.mnt}/data
	dev = /dev/{disk#1.name}/data
	type = ext4
	size = 60%FREE
	create_options = -m 1
	vg = {namespace}-{svcname}

	[fs#3]
	shared = true
	mnt = {fs#1.mnt}/log
	dev = /dev/{disk#1.name}/log
	type = ext4
	size = 40%FREE
	create_options = -m 1
	vg = {namespace}-{svcname}

virtual pool, mirrored md over 2 SAN disks
------------------------------------------

Pools configuration

::

	om cluster set \
		--kw pool#freenas1.type=array \
		--kw pool#freenas1.array=freenas1 \
		--kw pool#freenas1.sparse=true \
		--kw pool#freenas1.diskgroup=cluster1 \
		--kw pool#freenas2.type=array \
		--kw pool#freenas2.array=freenas2 \
		--kw pool#freenas2.sparse=true \
		--kw pool#freenas2.diskgroup=cluster1 \
		--kw pool#md.type=virtual \
		--kw pool#md.template=templates/md \
		--kw "pool#md.capabilities=rox rwx roo rwo shared"

::

	[pool#freenas1]
	type = array
	array = freenas1
	diskgroup = cluster1
	sparse = true

	[pool#freenas2]
	type = array
	array = freenas2
	diskgroup = cluster1
	sparse = true

	[pool#md]
	type = virtual
	template = templates/md
	capabilities = rox rwx roo rwo shared

The volume object template referenced by the vpool

::

	[DEFAULT]
	kind = vol
	disable = true
	nodes = *

	[disk#1]
	shared = true
	devs = {volume#1.exposed_devs[0]} {volume#2.exposed_devs[0]}
	type = md
	level = raid1

	[disk#2]
	shared = true
	pvs = {disk#1.exposed_devs[0]}
	type = vg
	name = {namespace}-{svcname}

	[fs#1]
	vg = {namespace}-{svcname}
	mnt = /srv/{namespace}/{svcname}
	dev = /dev/{disk#1.name}/root
	shared = true
	type = ext4
	size = 10m

	[fs#2]
	vg = {namespace}-{svcname}
	mnt = {fs#1.mnt}/data
	dev = /dev/{disk#1.name}/data
	shared = true
	type = ext4
	size = 60%FREE

	[fs#3]
	vg = {namespace}-{svcname}
	mnt = {fs#1.mnt}/log
	dev = /dev/{disk#1.name}/log
	shared = true
	type = ext4
	size = 40%FREE

	[volume#2]
	shared = true
	size = {env.size}
	name = {svcname}-2
	pool = freenas
	format = false

	[volume#1]
	shared = true
	size = {env.size}
	name = {svcname}-1
	pool = freenas
	format = false

drbd pool
---------

Pool configuration

::

   om cluster set \
      --kw pool#drbdloop.type=drbd

   om cluster set \
      --kw pool#drbdvg.type=drbd \
      --kw pool#drbdvg.vg=centos

::

   [pool#drbdloop]
   type = drbd

   [pool#drbdvg]
   type = drbd
   vg = centos


Example postgres service using a volume from a pool.

::

   [DEFAULT]
   nodes = *
   orchestrate = ha

   [volume#1]
   shared = true
   size = 200m
   name = {name}

   [container#1]
   type = oci
   image = postgres
   volume_mounts = {name}/data:/var/lib/postgresql/data
   secrets_environment = POSTGRES_PASSWORD=pg/password
   rm = true
   shared = true

