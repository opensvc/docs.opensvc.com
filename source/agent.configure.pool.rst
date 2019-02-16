Storage Pools Configuration
***************************

Service templates can use ``volume`` resources to:

* Abstract the disks and filesystems layout, which are hosting specificities, from the application service deployment. A development cluster can for example define pools on a ceph cluster, while a production cluster can define pools on fc arrays.

* Enable application service redeployment while retaining the data.

In this case the translation from volumes to disks and filesystems is delegated to the storage pool drivers.

Pools are defined in the node configuration. Each pool is identified by its name (the section suffix). For example, a ``pool#tank`` section defines a pool named ``tank``.

The ``default`` pool always exist, even if not defined in the node configuration. If not explicitely changed, the ``default`` pool driver is ``directory``.

Volumes
=======

* A volume resource drives a volume service, automatically created upon consumer service provisioning.

* The volume is hosted in the same namespace than its users.

* If not explicitely set, the volume service name is ``<consumer svcname>-vol-<volume resource index>``. For example, a ``svc1`` service with a ``volume#1`` resource will create a ``svc1-vol-1`` volume service.

* A volume service can be referenced by multiple services in the same namespace.

* Each consumer service adds itself as a child of its volume services upon provision, so stopping a volume service is delayed until all its consumers are stopped.

* A consumer service unprovision removes itself from its volume services children.

* A consumer service instance stop also stops its node-affine volume services instances if the consumer service is the only child of the volume service. 

* A consumer service instance start always try to start its node-affine volume services instances.

Volume Resources Keywords
-------------------------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.volume

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

A volume service from this type of pool contains:

* a fs.directory resource, with ``path`` set to ``<pool head>/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.directory

freenas
-------

Capabilities
++++++++++++

roo, rwo, shared, blk, iscsi

Layout
++++++

A volume service from this type of pool contains:

* a disk.disk resource named, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume service also contains:

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

A volume service from this type of pool contains:

* a disk.loop resource, with ``file`` set to ``<pool head>/<volume fqdn>.img``

If the consumer has ``format=true`` (default), the volume service also contains:

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

A volume service from this type of pool contains:

* a disk.disk resource named, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume service also contains:

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

A volume service from this type of pool contains:

* a disk.lv resource, with ``name`` set to ``<volume fqdn>``

If the consumer has ``format=true`` (default), the volume service also contains:

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

A volume service from this type of pool contains:

* a fs.directory resource, with ``path`` set to ``<pool head>/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.share

zfs
---

Capabilities
++++++++++++

rox, rwx, roo, rwo, blk, snap

Layout
++++++

A volume service from this type of pool contains:

* a fs.zfs resource, with ``name`` set to ``<pool>/<volume fqdn>`` and ``mnt`` set to ``/srv/<volume fqdn>``.

Keywords
++++++++

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.pool.zfs

Virtual Pool Driver
===================

A virtual pool allow administrators to create complex layouts based on volumes from other pools.

A typical use-case in a virtual pool allocating volumes mirrored over two other volumes allocated from arrays on two different sites.

A virtual pool volume is created from a template volume service the administrator can design at wish to meet its specific needs.

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

	# nodemgr pool ls
	default
	freenas
	mpool

Pool Status
-----------

::

	# nodemgr pool status
	name        type       caps                      head                             vols  size   used   free   
	|- default  directory  rox,rwx,roo,rwo           /opt/opensvc/var/pool/directory  0     29.0g  3.57g  24.0g  
	|- freenas  freenas    roo,rwo,shared,blk,iscsi  array://freenas/osvcdata         6     195g   9.37g  185g   
	`- mpool    virtual    roo,rox,rwo,rwx,shared    templates/mpool                  1     -      -      -      

Examples
========

loop pool
---------

Pool definition

::

	[pool#loop]
	type = loop
	path = /bigfs
	mkfs_opt = -n ftype=1
	fs_type = xfs

The volume resource in the application service

::

	[volume#1]
	size = 100m
	pool = loop

Configuration of the volume service

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

