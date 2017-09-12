Agent 1.9 Changes
*****************

New Features
============

* The agent now runs a daemon implementing heartbeats, scheduling, a remote OpenSVC actions listener and node/services/resources orchestration.
* New reference ``{clusternodes}``, evaluated as ``cluster.nodes`` in node.conf

New Keywords
============

Services
--------

* ``DEFAULT.hard_affinity``
* ``DEFAULT.soft_affinity``
* ``DEFAULT.hard_anti_affinity``
* ``DEFAULT.soft_anti_affinity``

Node
----

* ``cluster.secret``
* ``cluster.nodes``
* ``cluster.name``
* ``hb.type``
* ``hb[type=unicast].addr``
* ``hb[type=unicast].intf``
* ``hb[type=unicast].port``
* ``hb[type=unicast].timeout``
* ``hb[type=multicast].addr``
* ``hb[type=multicast].intf``
* ``hb[type=multicast].port``
* ``hb[type=multicast].timeout``
* ``hb[type=disk].dev``
* ``hb[type=disk].timeout``

Deprecated
==========

* The 1.9 agent no longer support the hb resource class. All external heartbeat drivers have been dropped. hb resource sections in service configurations are ignored.
* The 1.9 agent no longer need a crontrab entry. The package postinstall removes it if present.

Migrating from 1.8
==================

* [optional] Remove hb sections from service configurations
* [optional] Set ``DEFAULT.placement``
* [optional] Set ``DEFAULT.constraints``

