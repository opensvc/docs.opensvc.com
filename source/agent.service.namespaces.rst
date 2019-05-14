Namespaces
**********

Namespaces allow users to create objects with the same name in different naming spaces.

The ``<namespace>/<kind>/<name>`` is called a path.

The object selector (``--service`` option for svcmgr and svcmon, first argument for om) accepts the path notation.

Namespaced objects have their config stored in ``/etc/opensvc/namespaces/<namespace>/<kind>/``.

This feature is available since version 1.9-2748.

Operations with namespaces
==========================

Users have 3 methods to select a namespace to operate into:

Selector expressions
--------------------

::

	om test/svc/svc1 create

Namespace command line option
-----------------------------

::

	om svc1 --namespace=test create

OSVC_NAMESPACE environment variable
-----------------------------------

::

	OSVC_NAMESPACE=test om svc1 create

With ``OSVC_NAMESPACE`` exported, all actions are applied in the context of the ``test`` namespace.

::

	$ export OSVC_NAMESPACE=test
	$ om '*' ls
	svc1
	svc2

::

	$ unset OSVC_NAMESPACE
	$ om 'test/*' ls
	test/svc1
	test/svc2

References
==========

A ``{namespace}`` reference is available for service configuration.

Cgroups
=======

Services in an explicit namespace have the namespace name inserted in their cgroup path

::

	opensvc.slice/<namespace>.slice/<name>.slice

The "root" pseudo namespace
===========================

Services created before namespaces support and services created without an explicit namespace are assigned to a pseudo namespace named ``root``. Their config are stored in ``/etc/opensvc/``.

The root pseudo namespace name is used in the cluster dns names (<name>.root.svc.<clustername>) and dns search paths, but is not embedded in docker container names nor cgroup paths.

The ``{namespace}`` reference is evaluated to ``root``.

Select objects in the root namespace
------------------------------------

::

	$ om 'root/**' ls
	$ om '**' ls --namespace=root
	$ OSVC_NAMESPACE=root om '**' ls

Create objects in the root namespace
------------------------------------

::

	$ unset OSVC_NAMESPACE
	$ om svc1 create

Relations
=========

Children and parents relations use object paths or object names.

* If a name is declared in the parents, slaves or children lists, the related objects are searched in the same namespace.
* A relation to an object in another namespace must be declared using its path instead of its name.
* Relations to objects in the root pseudo namespace must be defined as ``root/<kind>/<name>`` to avoid ambiguity.

