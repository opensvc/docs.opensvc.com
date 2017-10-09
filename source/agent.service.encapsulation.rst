.. _agent.service.encapsulation:

Encapsulation
*************

Introduction
============

Virtual machines and containers are often used to provide reliable service relocation, leveraging the vm mobility amongst its hypervisor pool nodes. Reliabilty is gained by the single operating system characteristic: the application integration can depend on system-provided files and tools with no burdain of idenfication and replication of these application-system inter-dependencies.

As a service relocation mecanism, containers are fit for description as service resources in the OpenSVC framework. This chapter covers the OpenSVC agent features to handle such services.

Concepts
========

* A service can span a pool of hypervisor
* A service can drive one or multiple container resources
* A service with container resources can be configured to span the containers
* A service spaning the hypervisors and the containers viewed from the containers' side is called an encapsulated service
* An encapsulated service can be single-node, farmed or in a failover configuration
* A service can drive different resources at the hypervisor level and at the encapsulated level
* Encapsulated services need an OpenSVC agent on each hypervisor and each container

Supported Container Resource Types
==================================

A service can drive simultaneously different container types.

For example, a failover service can drive a LDOM on the production side and drive an OpenStack provisionned VM for disaster recovery.

Hardware Emulation
------------------

* Esx
* Hpvm
* Kvm
* Xen
* LDOM
* Virtual Box
* Ovm

Containerization
----------------

* Lxc
* Solaris Zones
* HP Srp
* FreeBSD Jails
* OpenVZ

Cloud-Hosted
------------

* OpenStack
* Vcloud

Topologies
==========

Failover - Single Node
----------------------

The service at the hypervisor level drives a single container and its dependent resources. This service, in failover mode, will run the container on one of the cluster node. The service can be stopped and started on another cluster node to provide relocation, or live-migrated if the underlying technology permits.

Optionally, a heartbeat daemon can drive the service.

At the encapsulated level, the service is viewed as single-node.

Farmed - Failover
-----------------

Containers are started on multiple cluster nodes. At the encapsulated level, each container is viewed as a cluster node and the encapsulated service can relocate from one to another either manually or through a heartbeat daemon action.

Farmed - Farmed
---------------

Containers are started on multiple cluster nodes. At the encapsulated level, each container is viewed as a cluster node and the encapsulated service is started on all, or a subset of, containers.

Configuration
=============

Scoping
-------

Encapsulated service configurations rely heavily on scoping, as this mecanism allows hypervisor nodes and containers to see different settings for the same service.

A scoping target, ``encapnodes``, is dedicated to this usage::

	[DEFAULT]
	encapnodes = vm1
	nodes@encapnodes = vm1
	nodes = hv1 hv2

This simple service header is read at the hypervisor level as::
 
	[DEFAULT]
	nodes = hv1 hv2

And at the encapsulated level as::

	[DEFAULT]
	nodes = vm1

.. seealso:: :ref:`agent-service-scoping`


Resources
---------

Each resource can be tagged with the ``encap`` keyword to be ignored at the hypervisor level, and to be considered at the encapsulated level.
Container resources are obviously **not** tagged as ``encap``.

Example::

	[fs#1]
	dev = /dev/mapper/vgdata-tools
	mnt = /srv/svctest/tools
	type = ext4
	mnt_opt = rw,relatime
	tags = encap

This filesystem is driven by the agent in vm1.


Service Configuration File Replication
======================================

The hypervisor running the container, or the flex_primary node, is the replication master. In encapsulated topologies, the replication master will not blindly copy the service env file to its peer nodes: it determines if the containers have a more recent version of the env file than itself. If so, it fetches the most recent env file from the containers before replication amongst cluster nodes and containers.

This mecanism allows administrators to edit the env file from the containers without risking their change to be rolled back by the replication master.

Service Status
==============

A simple encapsulated service, seen at the hypervisor level::

	deb1.opensvc.com
	overall                   up       
	|- avail                  up       
	|  |- container#0    .... up       deb1
	|  |  |- ip#2        ...E up       128.0.0.2@lo
	|  |  '- ip#1        ...E up       deb1@eth0
	|  |- fs#1           .... up       /dev/mapper/data-deb1@/deb1
	|  '- app            .... n/a      app
	|                                  # no checkup scripts
	|- sync                   up       
	|  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
	|  '- sync#1         .... up       btrfs of deb1:deb1 to ['nodes']
	'- hb                     n/a      

The same service, seen at the container level::

	deb1.opensvc.com
	overall                   up       
	|- avail                  up       
	|  |  ip#2           .... up       128.0.0.2@lo
	|  |  ip#1           .... up       deb1@eth0
	|  '- app            .... n/a      app
	|                                  # no checkup scripts
	|- sync                   up       
	|  |- sync#i0        .... up       rsync svc config to drpnodes, nodes
	'- hb                     n/a      


* The detailled encapsulated service status is folded under each container resource.
* Resources tagged with ``encap`` have the ``E`` flag displayed
* The master hypervisor fetches the encapsulated service status through ``svcmgr -s <svcname> json status``

Commands
========

Services with encapsulted resources can be started and stopped with the simple ``svcmgr -s <svcname> start`` and ``svcmgr -s <svcname> stop`` commands. Those commands chain the service action at the hypervisor level and at the encapsulated level.

Actions limited to a subset of resources, like ``startfs`` or ``startip`` require the administrator to specify at which level they should occur using the ``--master``, ``--slave <slave>`` or ``--slaves`` parameters.

