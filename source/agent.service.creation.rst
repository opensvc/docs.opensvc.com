.. _agent.service.creation:

Create, Update, Delete
**********************

Naming
======

A fully qualified object name is formatted as ``<namespace>/<kind>/<name>``.

Where ``<kind>`` is one of:

* ``svc``
  A service, with a mix of ip, app, container, volume, disk, fs and task resources.
* ``vol``
  A data volume from a pool, with a mix of volume, disk and fs resources.
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

Create
======

The following actions only modify files in ``<OSVCETC>``. No operating system configuration file is modified, so they are safe to experiment with.

The agent support object creation via two commands:

* ``create``
  The object is created but not provisioned nor started.

* ``deploy``
  The object is created, provisioned and started.

Both actions support the same arguments. The following examples use only create commands.

From Scratch, non Interactive
-----------------------------

Create a new object with minimal configuration. No resources are described.

::

	om <path> create

Resources and default keywords can be set right from the create command, using ``--kw <keyword>=<value>`` options

::

	om <path> create
		--kw container#0.type=docker \
		--kw container#0.image=google/pause \
		--kw orchestrate=ha \
		--kw nodes={clusternodes}

From Another Object
-------------------

::

	om <dst path> create --config=<src path>

From a JSON formatted config
----------------------------

This method can also be used to clone objects

::

	om <src path> print config --format json | \
		om <dst path> create --config=- [--interactive] [--provision]

From an Existing Local Configuration File
-----------------------------------------

Experienced users may find it easier to start from a copy of the conf file of an existing similar object.

::

	om <path> create --config <path to config file> [--interactive] [--provision]

The configuration file can be remote, referenced by URI.

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

Update
======

The ``<OSVCDOC>`` templates describe all configurations available for each resource driver.

Configuration files are in ``<OSVCETC>``. They are created automatically by the above ``om`` commands.

Root objects configuration file:

::

	<OSVCETC>/<name>.conf

Namespaced objects configuration file:

::

	<OSVCETC>/namespaces/<namespace>/<kind>/<name>.conf

Interactive
-----------

::

	om <path> edit config

The configuration file syntax is checked upon editor exit. The new configuration is installed if the syntax is found correct, or saved in a temporary location if not. Two options are then possible:

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

This command does not stop the resource before removing its definition. If desired, this can be done with

::

	om <path> stop --rid fs#1

Delete
======

::

	om <path> delete


Test
====

On a created object, you should be able to run succesfully:

::

	om <path> print config
	om <path> print status
	om <path> start
	om <path> stop


