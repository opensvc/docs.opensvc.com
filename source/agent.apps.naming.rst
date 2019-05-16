.. _agent.apps.create:

Naming
******

A fully qualified object name is formatted as ``<namespace>/<kind>/<name>``.

Namespace
=========

Namespaces allow users to create objects with the same name in different naming spaces.

Namespace names must conform to RFC952:

* only alphanum characters or dash
* start with an alpha
* end with an alphanum

Kind
====

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

Name
====

Names must conform to RFC952, with a tolerance for dots.

A name must be unique in its namespace and kind.

