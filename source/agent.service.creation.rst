.. _agent.service.creation:

Creation
********

Choose a Service Name
=====================

A service name must be unique in its application code namespace.

A best practice is to allocate unique service names in the corporate namespace, even if it is not mandatory.

Service Creation Methods
========================

The following actions only modify files in ``<OSVCETC>``. No operating system configuration file is modified, so they are safe to experiment with.

From Scratch, non Interactive
-----------------------------

Create a service with minimal configuration. No resources are described.

::

	sudo svcmgr -s <svcname> create

From Scratch, Interactive
-------------------------

::

	sudo svcmgr -s <svcname> create -i

From an Existing Local Configuration File
-----------------------------------------

Experienced users may find it easier to start from a copy of the conf file of an existing similar service. The following information describes the steps needed to create a service manually.

::

	sudo svcmgr -s <svcname> create --config <path to config file>

From a Collector's Service
--------------------------

::

	sudo svcmgr -s <svcname> pull

From a Template
---------------

Templates can be served by the collector, by a webserver or ftpserver, or can be accessed on the local filesystem.

::

	sudo svcmgr -s <svcname> create --template <id|uri> [--interactive] [--provision]

.. seealso:: :ref:`agent-service-provisioning`

Service Configuration Files
===========================

Service configuration files are in ``<OSVCETC>``. They are created automatically by the above ``svcmgr`` commands. A service is considered active if these two files exist:

::

	<OSVCETC>/<svcname> -> /usr/bin/svcmgr
	<OSVCETC>/<svcname>.conf

Optionally, administrators can create these additional files:

::

	<OSVCETC>/<svcname>.d -> <svcname>.dir/
	<OSVCETC>/<svcname>.dir/

Configuration Files Role
========================

``<OSVCETC>/<svcname> -> /usr/bin/svcmgr``

    This symbolic link is meant to be used as a shortcut to pass commands to a specific service. Like /etc/opensvc/unxdevweb01.mydomain.com start for example

``<OSVCETC>/<svcname>.conf``

    This is the configuration file proper, including service description and resource definitions. Fully commented section templates are available on each node at ``<OSVCDOC>`` and online :doc:`here <agent.template.conf>`.

``<OSVCETC>/<svcname>.d -> <svcname>.dir``

    This symbolic link points to the directory hosting the service application launchers. The service is not considered active if this link is not present. The directory pointed is best hosted on a service-dedicated filesystem. The service application launchers are expected to be in SysV style: [SK][0-9]*appname. S for starters, K for stoppers, number for ordering. Starters and stoppers can be symlink to a single script. Starter are passed 'start' as first parameter, stoppers are passed 'stop' as first parameter.

``<OSVCETC>/<svcname>.dir``

    This optional directory can be used to store locally the startup scripts. As such, it can be linked from ``<OSVCETC>/<svcname>.d``. OpenSVC synchronize this directory to nodes and drpnodes as part of the sync#i0 internal sync resource. If you placed your startup script on a shared volume, this .dir is not needed but you will still have to create a sync resource to send them to the drpnodes.

Service Configuration Updates
=============================

At that point you should describe your service's ip addresses, filesystems, disk groups, file synchronizations, app launchers, ... The ``<OSVCDOC>`` templates present you with all possible configurations available.

Interactive
-----------

::

	sudo svcmgr -s <svcname> edit config

The configuration file syntax is checked upon editor exit. The new configuration is installed if the syntax is found correct, or save in a temporary location if not. In this later case, two options are possible:

* Discard the erroneous configuration::

	sudo svcmgr -s <svcname> edit config --discard

* Re-edit the erroneous configuration::

	sudo svcmgr -s <svcname> edit config --recover


Non-Interactive Resource Addition
---------------------------------

::

	sudo svcmgr -s <svcname> update --resource '{"rtype": "fs", "foo": "bar"}'

The resource identifier (rid) must not be specified. The resource type must be specified (rtype). A free rid will be allocated.

Non-Interactive Resource Modification
-------------------------------------

::

	sudo svcmgr -s <svcname> update --resource '{"rid": "fs#1", "foo": "bar"}'

The resource identifier must be specified.

Non-Interactive Resource Deletion
---------------------------------

::

	sudo svcmgr -s <svcname> delete --rid fs#1

Test
====

You should now be able to run succesfully:

::

	sudo svcmgr -s <svcname> print config
	sudo svcmgr -s <svcname> print status
	sudo svcmgr -s <svcname> start
	sudo svcmgr -s <svcname> stop

Service Deletion
================

::

	sudo svcmgr -s <svcname> delete



