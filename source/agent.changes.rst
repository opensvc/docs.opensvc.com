Agent Release Notes
*******************

New Features
============

* The agent now runs a daemon implementing heartbeats, scheduling, a remote OpenSVC actions listener and node/services/resources orchestration.
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
* Cap the parallel running subprocesses on svcmgr --parallel commands. ``node.max_parallel`` node configuration keyword can be used to change the default value (10).
* The optional resource flag is now used to dispatch resources into the "avail" and "optional" lists, instead of using hardcoded driver groups.
* The provision local action now leaves the instance in standby state, instead of started.
* Support different command for stop, start, check, info actions in a app resource.
* The ``<svcname>.stonith`` and ``<svcname>.cluster`` symlinks are no longer necessary, and automatically deleted.
* The ``DEFAULT.env`` parameter is now only used to check for service placement : a PRD node can only run PRD/PPRD services

.. warning:: start, stop, freeze, thaw, provision and unprovision service commands operate cluster wide. ``svcmgr unprovision`` would thus delete all services and their data on all cluster nodes.

New Commands
============

* ``svcmgr ls``
* ``svcmgr giveback``
* ``svcmgr takeover``
* ``svcmgr set --param <param> --add <member>``
* ``svcmgr set --param <param> --remove <member>``
* ``svcmgr set --kw <expr> [--kw <expr> ...]``
* ``svcmgr print devs``
* ``svcmgr print exposed devs``
* ``svcmgr print sub devs``
* ``svcmgr print base devs``
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

New References
==============

* ``{clusternodes}``
* ``{exposed_devs}``, ``{exposed_devs}[<n>]``
* ``{sub_devs}``, ``{sub_devs}[<n>]``
* ``{base_devs}``, ``{base_devs}[<n>]``

New Keywords
============

The sections below describes new parameters:

.. toctree::
   :maxdepth: 3

   agent.keywords.19

Deprecated
==========

* The 1.9 agent no longer support the hb resource class. All external heartbeat drivers have been dropped. hb resource sections in service configurations are ignored.
* The 1.9 agent no longer need a crontrab entry. The package postinstall removes it if present.
* sync#i1 internal sync to drp nodes is dropped.
* ``optional_on``, ``monitor_on``, ``enable_on`` and ``disable_on`` service configuration keywords.
* ``sync[rsync].exclude``
* ``DEFAULT.service_env``
* ``DEFAULT.autostart_node``


Agent Migration
===============

The sections below provides detailed informations on migration prerequisites and caveats:

.. toctree::
   :maxdepth: 2

   agent.migration.19

