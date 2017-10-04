Agent Release Notes
*******************

New Features
============

* The agent now runs a daemon implementing heartbeats, scheduling, a remote OpenSVC actions listener and node/services/resources orchestration.
* Add monitor states to :cmd:`svcmgr print status` human-friendly and JSON outputs.
* The frozen service instance status is not longer honored by the CRM, only by the orchestrator.
* The node is freezeable. A thawed service instance on a frozen node is not orchestrated.
* Service are created in frozen state by :cmd:`svcmgr create`.
* svcmon output is now cluster-wide and displays daemon information
* Most commands have adopted a "forest" representation for their human-friendly output: :cmd:`nodemgr pushasset`, :cmd:`nodemgr checks`, :cmd:`nodemgr pushdisks`, :cmd:`svcmgr print schedule`, :cmd:`nodemgr print schedule`, ...
* Support JSON output in :cmd:`nodemgr pushdisks`, :cmd:`nodemgr checks`, :cmd:`nodemgr pushasset`.
* :cmd:`nodemgr unset --param <section>`
* :cmd:`svcmgr enable` and :cmd:`svcmgr disable` no longer reorder the service configuration file.
* Near-synchronous service configuration file swapping amongst cluster nodes.
* Cluster-wide service logs, and follow mode
* Pervasive support for converters in keyword values and command line argument values: period (ex: 1h10s), size (10mib), speed (10mib/s), shlex, integer, boolean, list, set.
* Add a size formatter and use it in most command outputs.
* Use a denser streamlog format.
* :cmd:`svcmgr -s` now accepts service selection expressions
* Cap the parallel running subprocesses on :cmd:`svcmgr --parallel` commands. :kw:`node.max_parallel` node configuration keyword can be used to change the default value (10).
* The optional resource flag is now used to dispatch resources into the "avail" and "optional" lists, instead of using hardcoded driver groups.
* The provision local action now leaves the instance in standby state, instead of started.
* Support different command for stop, start, check, info actions in a app resource.
* The :cmd:`<svcname>.stonith` and :cmd:`<svcname>.cluster` symlinks are no longer necessary, and automatically deleted.
* The :kw:`DEFAULT.env` parameter is now only used to check for service placement : a PRD node can only run PRD/PPRD services
* Inter-services start dependencies, intra-cluster, using the :kw:`DEFAULT.parents` keyword.
* Inter-services stop dependencies, intra-cluster, using the :kw:`DEFAULT.children` keyword.

.. warning:: :cmd:`nodemgr thaw`, :cmd:`nodemgr freeze`, :cmd:`svcmgr start`, :cmd:`svcmgr stop`, :cmd:`svcmgr freeze`, :cmd:`svcmgr thaw`, :cmd:`svcmgr provision` and :cmd:`svcmgr unprovision` commands operate cluster wide. :cmd:`svcmgr unprovision` would thus delete all services and their data on all cluster nodes.

New Commands
============

| :cmd:`svcmgr ls`
| :cmd:`svcmgr giveback`
| :cmd:`svcmgr takeover`
| :cmd:`svcmgr set --param <param> --add <member>`
| :cmd:`svcmgr set --param <param> --remove <member>`
| :cmd:`svcmgr set --kw <expr> [--kw <expr> ...]`
| :cmd:`svcmgr print devs`
| :cmd:`svcmgr print exposed devs`
| :cmd:`svcmgr print sub devs`
| :cmd:`svcmgr print base devs`
| :cmd:`nodemgr print devs`
| :cmd:`nodemgr daemon status`
| :cmd:`nodemgr daemon blacklist`
| :cmd:`nodemgr daemon join`
| :cmd:`nodemgr daemon leave`
| :cmd:`nodemgr daemon running`
| :cmd:`nodemgr daemon shutdown`
| :cmd:`nodemgr daemon start`
| :cmd:`nodemgr daemon stop`
| :cmd:`nodemgr daemon restart`
| :cmd:`nodemgr set --param <param> --add <member>`
| :cmd:`nodemgr set --param <param> --remove <member>`
|

New References
==============

| :kw:`{clusternodes}`
| :kw:`{exposed_devs}`
| :kw:`{exposed_devs}[<n>]`
| :kw:`{sub_devs}`
| :kw:`{sub_devs}[<n>]`
| :kw:`{base_devs}`
| :kw:`{base_devs}[<n>]`
|

New Keywords
============

.. toctree::
   :maxdepth: 3

   agent.keywords.19

Deprecated
==========

* The 1.9 agent no longer support the hb resource class. All external heartbeat drivers have been dropped. hb resource sections in service configurations are ignored.
* The 1.9 agent no longer need a crontrab entry. The package postinstall removes it if present.
* sync#i1 internal sync to drp nodes is dropped.
* :kw:`optional_on`, :kw:`monitor_on`, :kw:`enable_on` and :kw:`disable_on` service configuration keywords.
* :kw:`sync[rsync].exclude`
* :kw:`DEFAULT.service_env`
* :kw:`DEFAULT.autostart_node`


Agent Migration
===============

Live migration from 1.8 to 1.9 requires some precaution. This section describes the recommended preliminary actions and services reconfigurations.

.. toctree::
   :maxdepth: 2

   agent.migration
