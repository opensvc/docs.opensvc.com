HP StorageWorks EVA snapshots
*****************************

Introduction
============

.. figure:: _static/evasnap.png
   :align:  center

The EVA arrays snapshots driver allow multi-target block device replication and support the :cmd:`sync resync` action which automates the snapshot recreation and presentation to hosts. An opensvc service can thus easily use a snapshoted set of devices. This kind of services are often used for maintenance, pre-production, performance testing environments, where the source device set is used for production. The following documentation presents the configuration of such a service.

A service with only evasnap sync resources can be defined to drive the snapshots of other servers, just for the benefit of centralized logging and scheduling.

Command set
===========

:cmd:`sync resync`
    Delete Logical Units and snapshots, then create new snapshots and present them.

:cmd:`sync resync --force`
    Bypass the sync_min_delay protection.

Status
======

:state:`up`
    The last resync occured less than 'sync_max_delay' minutes ago.

:state:`warn`

    *   The last resync occured more than 'sync_max_delay' minutes ago.
    *   A snapshot does not exist.
    *   A snapshot exist but with incorrect origin.
    *   A snapshot exist but with incorrect presentation (host or lunid).
    *   Missing sssu binary.
    *   Missing sssu.conf configuration file.
    *   Incorrect credentials for the manager.
    *   The array is not managed by the specified manager.

Service configuration
=====================

Pre-requisites
--------------

The sssu binary must be installed on the node. If not in the PATH, the ``bin`` array keyword must be set. A ``array#<name>`` section must be declared in the node or cluster configuration and contain credentials to access the Command View manager for each array. OpenSVC takes care of obfuscating the password in the output, local logs, and logs sent to the collector.

Example:

::

	[array#EVA11]
	bin = /opt/sssu/bin/sssu
	manager = manager.opensvc.com
	username = hpadmin
	password = system/sec/array-eva11

You can setup as many sync resources as needed to ensure a consistent replication scenario.

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.node.array.eva
   agent.templates/template.service.sync.evasnap

EVA snapshots configuration
===========================

You have to create the snapshots manually once and present them to the hosts, so that the EVA array attributes new snapshots wwid and logical unit numbers. Theses properties can then be set in the service env file to ensure the snapshots will always be created and presented using those same properties. This is important to make the snapshot resync as transparent as possible to the operating system, and not to trigger device renames.

Examples
========

Resync a started service snapshots
----------------------------------

::

	# om iiststeva02 stop && om iiststeva02 sync resync && om iiststeva02 start

Resync a stopped service snapshots
----------------------------------

::

	# om iiststeva02 sync resync
	IISTSTEVA02.SYNC#1 - INFO - sssu "select manager manager.opensvc.com username=hpadmin password=xxxxx" "select system EVA11" "delete lun \"\Hosts\n1\101\"" "delete lun \"\Hosts\n2\106\"" "delete vdisk \"\Virtual Disks\n1\n1-01\n1-01_iiststeva02\" wait_for_completion" "delete lun \"\Hosts\n1\102\"" "delete vdisk \"\Virtual Disks\n1\n1-02\n1-02_iiststeva02\" wait_for_completion"
	IISTSTEVA02.SYNC#1 - INFO - 

	SSSU for HP StorageWorks Command View EVA
	Version: 6.0.2 
	Build: 5
	NoSystemSelected> select system EVA11

	EVA11> delete lun "\Hosts\n1\101"

	EVA11> delete lun "\Hosts\n2\106"

	EVA11> delete vdisk "\Virtual Disks\n1\n1-01\n1-01_iiststeva02" wait_for_completion

	EVA11> delete lun "\Hosts\n1\102"

	EVA11> delete vdisk "\Virtual Disks\n1\n1-02\n1-02_iiststeva02" wait_for_completion

	IISTSTEVA02.SYNC#1 - INFO - sssu "select manager manager.opensvc.com username=hpadmin password=xxxxx" "select system EVA11" "add snapshot n1-01_iiststeva02 vdisk=\"\Virtual Disks\n1\n1-01\ACTIVE\" allocation_policy=demand world_wide_lun_name=6001-4380-abab-cdcd-0000-8000-040f-0000" "add snapshot n1-02_iiststeva02 vdisk=\"\Virtual Disks\n1\n1-02\ACTIVE\" allocation_policy=demand world_wide_lun_name=6001-4380-abab-cdcd-0000-8000-0413-0000"
	2011-03-17 17:54:01,386 - IISTSTEVA02.SYNC#1 - INFO - 

	SSSU for HP StorageWorks Command View EVA
	Version: 6.0.2 
	Build: 5
	NoSystemSelected> select system EVA11

	EVA11> add snapshot n1-01_iiststeva02 vdisk="\Virtual Disks\n1\n1-01\ACTIVE" allocation_policy=demand world_wide_lun_name=6001-4380-abab-cdcd-0000-8000-040f-0000

	EVA11> add snapshot n1-02_iiststeva02 vdisk="\Virtual Disks\n1\n1-02\ACTIVE" allocation_policy=demand world_wide_lun_name=6001-4380-abab-cdcd-0000-8000-0413-0000

	IISTSTEVA02.SYNC#1 - INFO - sssu "select manager manager.opensvc.com username=hpadmin password=xxxxx" "select system EVA11" "add lun 101 host=\"\Hosts\n1\" vdisk=\"n1-01_iiststeva02\"" "add lun 106 host=\"\Hosts\n2\" vdisk=\"n1-01_iiststeva02\"" "add lun 102 host=\"\Hosts\n1\" vdisk=\"n1-02_iiststeva02\""
	IISTSTEVA02.SYNC#1 - INFO - 

	SSSU for HP StorageWorks Command View EVA
	Version: 6.0.2 
	Build: 5
	NoSystemSelected> select system EVA11

	EVA11> add lun 101 host="\Hosts\n1" vdisk="n1-01_iiststeva02"

	EVA11> add lun 106 host="\Hosts\n2" vdisk="n1-01_iiststeva02"

	EVA11> add lun 102 host="\Hosts\n1" vdisk="n1-02_iiststeva02"

