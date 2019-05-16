.. _agent.apps.update:

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

