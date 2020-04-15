Release Notes
*************

Policy changes
==============

* The optional resource flag is now used to dispatch resources into the "avail" and "optional" lists, instead of using hardcoded driver groups. Service designers can thus choose what resources contribute to the availabilty state, letting other, optional, resources contribute to the overall status. Note the asynchronous, target-state driven, daemon actions only consider the service instances availstatus. For example, a "start" action tells the daemon to take actions for the service to reach the "up availability state", so a service with optional resources down is already considered on-target and no action will be taken.
* Resources tagged "noaction" are now automatically set optional. Beware, an encap service should have at least one non-optional resource for an availstatus to be evaluated.
* The disk.scsireserv resources now inherit their peer resource optional and monitor values.

New Features
============

* The agent now runs a daemon implementing heartbeats, quorum, scheduling, a remote OpenSVC actions listener and node/services/resources orchestration.
* The agent now announce its "compat version" in the heartbeats, so as ensure proper communication with other cluster nodes. A lack of "compat version" alignment temporarily disable automated orchestration, until issue is fixed.
* Add monitor states to :cmd:`svcmgr print status` human-friendly and JSON outputs.
* The frozen service instance status is not longer honored by the CRM, only by the orchestrator.
* The node is freezeable. A thawed service instance on a frozen node is not orchestrated.
* Service are created in frozen state by :cmd:`svcmgr create`.
* svcmon output is now cluster-wide and displays daemon information
* Most commands have adopted a "forest" representation for their human-friendly output: :cmd:`om node pushasset`, :cmd:`om node checks`, :cmd:`om node pushdisks`, :cmd:`svcmgr print schedule`, :cmd:`om node print schedule`, ...
* Support JSON output in :cmd:`om node pushdisks`, :cmd:`om node checks`, :cmd:`om node pushasset`.
* :cmd:`om node unset --param <section>`
* :cmd:`svcmgr enable` and :cmd:`svcmgr disable` no longer reorder the service configuration file.
* Near-synchronous service configuration file swapping amongst cluster nodes.
* Cluster-wide service logs, and follow mode
* Pervasive support for converters in keyword values and command line argument values: period (ex: 1h10s), size (10mib), speed (10mib/s), shlex, integer, boolean, list, set.
* Add a size formatter and use it in most command outputs.
* Use a denser streamlog format.
* :cmd:`svcmgr -s` now accepts service selection expressions
* Cap the parallel running subprocesses on :cmd:`svcmgr --parallel` commands. :kw:`node.max_parallel` node configuration keyword can be used to change the default value (10).
* The provision local action now leaves the instance in standby state, instead of started.
* Support different command for stop, start, check, info actions in a app resource.
* The :cmd:`<svcname>.stonith` and :cmd:`<svcname>.cluster` symlinks are no longer necessary, and automatically deleted.
* The :kw:`DEFAULT.env` parameter is now only used to check for service placement : a PRD node can only run PRD/PPRD services
* Inter-services start dependencies, intra-cluster, using the :kw:`DEFAULT.parents` keyword.
* Inter-services stop dependencies, intra-cluster, using the :kw:`DEFAULT.children` keyword.
* Scaler services
* PowerDNS remote backend

.. warning:: :cmd:`om node thaw`, :cmd:`om node freeze`, :cmd:`svcmgr start`, :cmd:`svcmgr stop`, :cmd:`svcmgr freeze`, :cmd:`svcmgr thaw`, :cmd:`svcmgr provision` and :cmd:`svcmgr unprovision` commands operate cluster wide. :cmd:`svcmgr unprovision` would thus delete all services and their data on all cluster nodes.

New Drivers
===========

* disk.lv (Linux)
* ip.cni (Linux)
* fs.docker

New Commands
============

| :cmd:`svcmgr ls`
| :cmd:`svcmgr abort`
| :cmd:`svcmgr clear`
| :cmd:`svcmgr giveback`
| :cmd:`svcmgr takeover`
| :cmd:`svcmgr start --upto <drvgrp>`
| :cmd:`svcmgr stop --downto <drvgrp>`
| :cmd:`svcmgr set --param <param> --add <member>`
| :cmd:`svcmgr set --param <param> --remove <member>`
| :cmd:`svcmgr set --kw <expr> [--kw <expr> ...]`
| :cmd:`svcmgr set provisioned`
| :cmd:`svcmgr unset provisioned`
| :cmd:`svcmgr print devs`
| :cmd:`svcmgr print exposed devs`
| :cmd:`svcmgr print sub devs`
| :cmd:`svcmgr print base devs`
| :cmd:`svcmgr snooze`
| :cmd:`svcmgr unsnooze`
| :cmd:`om node freeze`
| :cmd:`om node thaw`
| :cmd:`om node print devs`
| :cmd:`om node daemon status`
| :cmd:`om node daemon blacklist`
| :cmd:`om node daemon join`
| :cmd:`om node daemon leave`
| :cmd:`om node daemon running`
| :cmd:`om node daemon shutdown`
| :cmd:`om node daemon start`
| :cmd:`om node daemon stop`
| :cmd:`om node daemon restart`
| :cmd:`om node set --param <param> --add <member>`
| :cmd:`om node set --param <param> --remove <member>`
| :cmd:`om node ping --node <nodename>`
| :cmd:`om node snooze`
| :cmd:`om node unsnooze`
|

New References
==============

| :kw:`{clusternodes}`
| :kw:`{clusterdrpnodes}`
| :kw:`{clustername}`
| :kw:`{exposed_devs}`
| :kw:`{exposed_devs}[<n>]`
| :kw:`{sub_devs}`
| :kw:`{sub_devs}[<n>]`
| :kw:`{base_devs}`
| :kw:`{base_devs}[<n>]`
| :kw:`{dns}`
| :kw:`{dnsnodes}`
| :kw:`{dnsuxsock}`
| :kw:`{dnsuxsockd}`
| :kw:`{collector_api}`
|

New Keywords
============

.. toctree::
   :maxdepth: 3

   agent.keywords.19

Deprecated
==========

* The agent no longer needs a crontrab entry. The package postinstall removes it if present.
* The ``hb`` resource drivers are dropped. The heartbeats are now handled by the daemon and configured in ``node.conf``.
* The ``stonith`` resource drivers are dropped. The stonith configurations are moved to ``node.conf``.
* :c-res:`sync#i1` internal sync to drp nodes is dropped.
* :kw:`*.optional_on`
* :kw:`*.monitor_on`
* :kw:`*.enable_on`
* :kw:`*.disable_on`
* :kw:`*.always_on` (maintained for backward compatibility)
* :kw:`sync[rsync].exclude`
* :kw:`DEFAULT.service_env`
* :kw:`DEFAULT.autostart_node`
* :kw:`DEFAULT.mode`
* :kw:`DEFAULT.cluster_type` (renamed to :kw:`DEFAULT.topology`, maintained for backward compatibility)
* :cmd:`svcmgr boot`
* :cmd:`svcmgr startip`
* :cmd:`svcmgr startdisk`
* :cmd:`svcmgr startfs`
* :cmd:`svcmgr startshare`
* :cmd:`svcmgr startcontainer`
* :cmd:`svcmgr startapp`
* :cmd:`svcmgr stopip`
* :cmd:`svcmgr stopdisk`
* :cmd:`svcmgr stopfs`
* :cmd:`svcmgr stopshare`
* :cmd:`svcmgr stopcontainer`
* :cmd:`svcmgr stopapp`
* :cmd:`svcmgr compliance attach moduleset`
* :cmd:`svcmgr compliance detach moduleset`
* :cmd:`svcmgr compliance attach ruleset`
* :cmd:`svcmgr compliance detach ruleset`
* :cmd:`om node compliance attach moduleset`
* :cmd:`om node compliance detach moduleset`
* :cmd:`om node compliance attach ruleset`
* :cmd:`om node compliance detach ruleset`


Agent Migration
===============

Live migration from 1.8 to 1.9 requires some precaution. This section describes the recommended preliminary actions and services reconfigurations.

.. toctree::
   :maxdepth: 2

   agent.migration
