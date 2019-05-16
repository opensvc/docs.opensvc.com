.. _agent.apps.create:

Create, Deploy
**************

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

