Agent 1.9 Changes
*****************

New Features
============

* The agent now runs a daemon implementing heartbeats, scheduling, a remote OpenSVC actions listener and node/services/resources orchestration.
* New reference ``{clusternodes}``, evaluated as ``cluster.nodes`` in node.conf.
* Add monitor states to ``svcmgr print status`` human-friendly and JSON outputs.
* The frozen service instance status is not longer honored by the CRM, only by the orchestrator.
* The node is freezeable. A thawed service instance on a frozen node is not orchestrated.
* Service are created in frozen state by ``svcmgr create``.
* svcmon output is now cluster-wide and displays daemon information
* Most commands have adopted a "forest" representation for their human-friendly output: ``nodemgr pushasset``, ``nodemgr checks``, ``nodemgr pushdisks``, ``svcmgr print schedule``, ``nodemgr print schedule``, ...
* Support JSON output in ``nodemgr pushdisks``, ``nodemgr checks``, ``nodemgr pushasset``.
* ``nodemgr unset --param <section>``
* ``svcmgr enable`` and ``svcmgr disable`` no longer reorder the service configuration file.
* Near-synchronous service configuration file swapping amongst cluster nodes.
* Cluster-wide service logs, and follow mode
* Pervasive support for converters in keyword values and command line argument values: period (ex: 1h10s), size (10mib), speed (10mib/s), shlex, integer, boolean, list, set.
* Add a size formatter and use it in most command outputs.
* Use a denser streamlog format.
* ``svcmgr -s`` now accepts service selection expressions

.. warning:: start, stop, freeze, thaw service commands operate cluster wide.

New Commands
============

* ``svcmgr ls``
* ``svcmgr giveback``
* ``svcmgr takeover``
* ``svcmgr set --param <param> --add <member>``
* ``svcmgr set --param <param> --remove <member>``
* ``svcmgr print devs``
* ``nodemgr print devs``
* ``nodemgr daemon status``
* ``nodemgr daemon blacklist``
* ``nodemgr daemon join``
* ``nodemgr daemon leave``
* ``nodemgr daemon running``
* ``nodemgr daemon shutdown``
* ``nodemgr daemon start``
* ``nodemgr daemon stop``
* ``nodemgr daemon restart``
* ``nodemgr set --param <param> --add <member>``
* ``nodemgr set --param <param> --remove <member>``

New Keywords
============

Services
--------

* ``DEFAULT.hard_affinity``
* ``DEFAULT.soft_affinity``
* ``DEFAULT.hard_anti_affinity``
* ``DEFAULT.soft_anti_affinity``
* ``DEFAULT.placement``
* ``DEFAULT.constraints``

Node
----

* ``node.maintenance_grace_period``
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
* sync#i1 internal sync to drp nodes is dropped.
* ``optional_on``, ``monitor_on``, ``enable_on`` and ``disable_on`` service configuration keywords.
* ``sync[rsync].exclude``
* ``DEFAULT.service_env``

Migrating from 1.8
==================

* [optional] Remove hb sections from service configurations
* [optional] Set ``DEFAULT.placement``
* [optional] Set ``DEFAULT.constraints``
* [optional] Rename ``DEFAULT.affinity`` to ``DEFAULT.hard_affinity``
* [optional] Rename ``DEFAULT.anti_affinity`` to ``DEFAULT.hard_anti_affinity``
* [optional] Remove the ``<OSVCETC>/{svcname}.cluster`` symlinks
* [optional] Remove the ``<OSVCETC>/{svcname}.stonith`` symlinks
* [optional] Set a sensible ``node.maintenance_grace_period``
* [mandatory] Replace ``optional_on``, ``monitor_on``, ``enable_on`` and ``disable_on`` by their equivalent scoped ``optional``, ``monitor``, ``enable`` and ``disable``
* [mandatory] Replace ``sync[rsync].exclude`` by their equivalent ``sync[rsync].options``
* [mandatory] Replace ``DEFAULT.service_env`` by their equivalent ``DEFAULT.env``


