.. _agent.service.creation:

Creation
********

Service Naming
==============

A service is created in a cluster namespace. A fully qualified service name is formatted as ``<namespace>/<kind>/<name>``.

Where kind is one of:

* ``svc``
  A service, with a mix of ip, app, container, volume, disk, fs and task resources.
* ``vol``
  A volume from a pool, with a mix of volume, disk and fs resources.
* ``cfg``
  A configuration map, storing unencrypted key/value pairs for use by other kinded objects.
* ``sec``
  A secret, storing encrypted key/value pairs for use by other kinded objects.
* ``ccfg``
  The special kind for the cluster configuration object.

Names must conform to RFC952:

* only alphanum characters or dash
* start with an alpha
* end with an alphanum

A name must be unique in its namespace and kind.

Service Creation Methods
========================

The following actions only modify files in ``<OSVCETC>``. No operating system configuration file is modified, so they are safe to experiment with.

From Scratch, non Interactive
-----------------------------

Create a service with minimal configuration. No resources are described.

::

	om <path> create

Resources and default keywords can be set right from the service create command, using ``--kw <keyword>=<value>`` options

::

	om <path> create [--interactive] [--provision]
		--kw container#0.type=docker \
		--kw container#0.image=google/pause \
		--kw orchestrate=ha \
		--kw nodes={clusternodes}

From a JSON formatted config
----------------------------

This method is useful to clone services

::

	om ns1/svc/svc1 print config --format json | \
		om ns2/svc/svc1 create --config=- [--interactive] [--provision]

From an Existing Local Configuration File
-----------------------------------------

Experienced users may find it easier to start from a copy of the conf file of an existing similar service. The following information describes the steps needed to create a service manually.

The configuration file can be remote, referenced by URI.

::

	om <path> create --config <path to config file> [--interactive] [--provision]

From a Template
---------------

Templates can be served by the collector.

::

	om <path> create --template <id|name> [--interactive] [--provision]

.. seealso:: :ref:`agent-service-provisioning`

From a Collector's Service
--------------------------

::

	om <path> pull

Service Configuration Files
===========================

Service configuration files are in ``<OSVCETC>``. They are created automatically by the above ``om`` commands. A service is considered active if these two files exist:

::

	<OSVCETC>/<name>.conf

Services in a namespace have their configuration files stored deeper in ``<OSVCETC>``

::

	<OSVCETC>/namespaces/<namespace>/<kind>/<name>.conf

Service Configuration Updates
=============================

At that point you should describe your service's ip addresses, filesystems, disk groups, file synchronizations, app launchers, ... The ``<OSVCDOC>`` templates present you with all possible configurations available.

Interactive
-----------

::

	om <path> edit config

The configuration file syntax is checked upon editor exit. The new configuration is installed if the syntax is found correct, or save in a temporary location if not. In this later case, two options are possible:

* Discard the erroneous configuration::

	om <path> edit config --discard

* Re-edit the erroneous configuration::

	om <path> edit config --recover


Non-Interactive Resource Addition
---------------------------------

::

	om <path> update --resource '{"rtype": "fs", "foo": "bar"}'

The resource identifier (rid) must not be specified. The resource type must be specified (rtype). A free rid will be allocated.

Non-Interactive Resource Modification
-------------------------------------

::

	om <path> update --resource '{"rid": "fs#1", "foo": "bar"}'

The resource identifier must be specified.

Non-Interactive Resource Deletion
---------------------------------

::

	om <path> delete --rid fs#1

Test
====

You should now be able to run succesfully:

::

	om <path> print config
	om <path> print status
	om <path> start
	om <path> stop

Service Deletion
================

::

	om <path> delete



