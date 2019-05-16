.. _agent.apps.delete:

Purge, Delete
*************

Purge
=====

::

	om <path> purge

This command asks the cluster to orchestrate a stop, unprovision and delete. Non-leader instances are sequenced first.

Purging a service does not purge its referenced volumes.

Purging a volume actually removes all volume data.

Delete
======

::

	om <path> delete

This command does not stop nor unprovision the object, so it can leave unreferenced mounts, containers and processes on the nodes.

This command should be used by administrators only.

