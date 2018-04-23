Node Monitor States
===================

Idle
----

The normal node state. The node monitor is not currently running an action.

Maintenance
-----------

A clean daemon stop or daemon daemon restart (which does not include the node reboot scenario) cause the node to advertize its going into maintenance.

Peer nodes preserve a maintenance node last received heartbeat information until ``node.mainteance_grace_period = <duration expr>`` expires, and thus inhibits orchestration.

When the stopped daemon comes back alive, the normal orchestration is resumed.

Upgrade
-------

A OpenSVC agent package upgrade switches the node monitor state to ``upgrade``. This states has the same effect as ``maintenance``, inhibiting orchestration, except no timeout is enforced.

Init
----

When the daemon starts the node monitor state is immediately switched to ``init``. This states has the same effect as ``maintenance``, inhibiting orchestration, except no timeout is enforced.

During init, each local service instance status is reevaluated.


