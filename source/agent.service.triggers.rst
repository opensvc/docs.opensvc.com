Service resources triggers
**************************

Introduction
============

Triggers are scripts or commands executed before or after a resource action.

Syntax
======

In a service resource configuration section, triggers can be defined using a keyword formatted as

::

        [blocking_]<when>_<action>[@<scope>] = <command>

Blocking
--------

If the ``blocking_`` prefix is set, a non-zero command return code causes the service action to abort on error.

If the ``blocking_`` prefix is not set, a non-zero command return code causes an error log, but the service action continues.

When
----

Supported values:

* ``pre``
  The command is executed before the normal resource driver action.

* ``post``
  The command is executed after the normal resource driver action.

Action
------

Supported values:

* ``start``
* ``stop``
* ``run``
* ``provision``
* ``unprovision``
* ``sync_nodes``
* ``sync_drp``
* ``sync_resync``
* ``sync_update``

Command
-------

The command value supports shell expressions, like ``&&``, ``||``, ...

.. warning:: ``;`` is interpreted as a comment begin marker if preceded by a whitespace. To use this character as a separator between commands, be sure to not insert a whitespace before. Example: ``post_start = echo hey; echo ya`` is valid but ``post_start = echo hey ; echo ya`` is not.

Use cases
=========

* Inter-service dependencies

  Using a trigger to implement a wait loop for a tiers service expected state. A blocking trigger can be combined with a wait loop timeout to abort the service startup if the required tiers service does not reach the expected state in time.

* Service provisioning

  Using a post_provision trigger to create directories, files, run configuration management, deploy app, ... just after the filesystems are provisioned and started.


