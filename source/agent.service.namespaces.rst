Namespaces
**********

Namespaces allow users to create services with the same name in different naming spaces.

The ``<namespace>/<svcname>`` is called a svcpath.

The svcmgr and svcmon service selector (--service option) accept the svcpath notation.

Service in an explicit namespace have their config stored in /etc/opensvc/namespaces/<namespace>/. They also have the namespace name inserted in their docker container names on Linux.

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

Service executable symlinks
===========================

Operating services through their svcmgr symlink is not supported for services in namespaces, to avoid relying on the PATH env var paths ordering. Operating via svcmgr is thus mandatory for these services.

References
==========

A new {namespace} reference is now available.


The "root" pseudo namespace
===========================

Service created before this patch and services created without an explicit namespace are considered in a pseudo namespace named "root". Their config are stored as usual in /etc/opensvc/.

The root pseudo namespace name is used in the cluster dns names (<svcname>.root.svc.<clustername>) and dns search paths.

Cgroups
=======

Service in an explicit namespace have the namespace name inserted in their cgroup path

::

	opensvc.slice/<namespace>.slice/<svcname>.slice


Services relationships
======================

Children and parents relationship can now use svcpath.

* If a svcname is declared in these lists, the same namespace is implied.
* To declare a relation to a service in another namespace, users have to use svcpath.

Relations to services in the root pseudo namespace have to be defined as ``root/<svcname>`` to avoid ambiguity.

