.. _agent.service.orchestration.smonstates:

Service Monitor States
======================

Service monitor states are displayed in the svcmon and print status output.

Idle
----

The service monitor is not currently running an action.

Ready
-----

The monitor is advertizing its intention to start the local instance of the service and is waiting for peers to contest.

Freezing
--------

The instance is freezing. Orchestration is about to be blocked.

Thawing
-------

The instance is thawing. Orchestration is about to be resumed.

<action> failed
---------------

The last <action> triggered by the daemon returned with errors. The orchestration is blocked for this service instance.

Starting
--------

No peers contested the monitor intention to start the local service instance during the "ready" period. The instance is now starting.

Restarting
----------

Monitored instance resources are being restarted.

Stopping
--------

The instance is stopping.

Deleting
--------

A deleted target state has been set. A :cmd:`svcmgr -s <svcname> delete` is in progress.

Purging
-------

A purged target state has been set. A :cmd:`svcmgr -s <svcname> unprovision` and :cmd:`svcmgr -s <svcname> delete` sequence is in progress.

Provisioning
------------

A provisioned target state has been set. A :cmd:`svcmgr -s <svcname> provision` is in progress.


