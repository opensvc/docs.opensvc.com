Namespaces
**********

Namespaces allow users to create services with the same name in different naming spaces.

The ``<namespace>/<svcname>`` is called a svcpath.

The svcmgr and svcmon service selector (--service option) accept the svcpath notation.

Service in an explicit namespace have their config stored in /etc/opensvc/namespaces/<namespace>/. They also have the namespace name inserted in their docker container names on Linux.

This feature is available in agent versions up from 1.9-2748.

Operations with namespaces
==========================

Users have 3 methods to select a namespace to operate into:

Svcpath selector expressions
----------------------------

::

	svcmgr -s test/svc1 create

Namespace command line option
-----------------------------

::

	svcmgr -s svc1 --namespace=test create

OSVC_NAMESPACE environment variable
-----------------------------------

::
	OSVC_NAMESPACE=test svcmgr -s svc1

Exporting OSVC_NAMESPACE=test thus applies all svcmgr and svcmon actions in the context of the test namespace.

::

	$ export OSVC_NAMESPACE=test
	$ svcmgr ls
	svc1
	svc2

::

	$ unset OSVC_NAMESPACE
	$ svcmgr ls -s 'test/*'
	test/svc1
	test/svc2

References
==========

A new {namespace} reference is now available for service configuration.

Cgroups
=======

Service in an explicit namespace have the namespace name inserted in their cgroup path

::

	opensvc.slice/<namespace>.slice/<svcname>.slice

The "root" pseudo namespace
===========================

Service created before namespaces support and services created without an explicit namespace are assigned to a pseudo namespace named "root". Their config are stored in ``/etc/opensvc/``.

The root pseudo namespace name is used in the cluster dns names (<svcname>.root.svc.<clustername>) and dns search paths, but is not embedded in docker container names nor cgroup paths.

The ``{namespace}`` reference is evaluated to ``root``.

Select services in the root namespace
-------------------------------------

::

	$ svcmgr -s 'root/*' ls
	$ svcmgr ls -s '*' --namespace=root
	$ OSVC_NAMESPACE=root svcmgr ls -s '*'

Create services in the root namespace
-------------------------------------

::

	$ unset OSVC_NAMESPACE
	$ svcmgr -s svc1 create

Service executable symlinks
===========================

Operating services through their svcmgr symlink is not supported for services in namespaces, to avoid relying on the PATH environment variable paths ordering. Operating via ``svcmgr`` is thus mandatory for these services.


Services relationships
======================

Children and parents relationship can now use svcpaths in addition to svcnames.

* If a svcname is declared in the parents, slaves or children lists, the related services are searched in the same namespace.
* To declare a relation to a service in another namespace, its svcpath reference must be used instead of its svcname.

Relations to services in the root pseudo namespace have to be defined as ``root/<svcname>`` to avoid ambiguity.

