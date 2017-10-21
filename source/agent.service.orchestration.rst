.. _agent.service.orchestration:

Orchestration
=============

Orchestration
-------------

The parameter :kw:`DEFAULT.orchestrate` is used to specify the daemon behaviour regarding service orchestration, which by default, does not orchestrate service.

Possible values:

* ``no``
    * no instance is started automatically
    * takeover can be used to relocate the service
    * giveback is useful to relocate the service to the natural leader
    * use this setting for all 1.8 services **without** :kw:`DEFAULT.autostart_node`
* ``start``
    * only the instance on the natural leader is started
    * takeover can be used to relocate the service
    * giveback is useful to relocate the service to the natural leader
    * use this setting for all 1.8 services **with** :kw:`DEFAULT.autostart_node`
* ``ha``
    * an instance is started on the best available node
    * takeover can be used to relocate the service
    * giveback is useful to relocate the service to the best available node
    * use this setting for all 1.8 services under OpenHA control

.. _agent.service.orchestration.placement.policies:

Placement Policies
------------------

When a service instance needs starting, the opensvc daemons of the nodes listed in the service ``DEFAULT.nodes`` each run the placement policy algorithm specified by ``DEFAULT.placement``.

This algorithm decides if the local node is the best candidate node, and if so, the daemon transition the service in ready state.

Nodes unreachable, with affinity or constraints violations are discarded from the placement policies candidate nodes.

nodes order
+++++++++++

The first node in the nodes list gets the highest placement priority.

load avg
++++++++

The node with the lowest load average gets the highest placement priority.

spread
++++++

A static random ranking. The more services, the better leveling.

.. _agent.service.orchestration.affinity:

Affinity
--------

.. _agent.service.orchestration.hard.affinity:

``DEFAULT.hard_affinity``

        A whitespace-separated list of service names. The orchestrator won't propose to start a local instance of the service if all specified services don't have a local running instance.

        For example, if :c-svc:`svc1` can listens on a unix socket used by :c-svc:`svc2`, those services must run on the same node.


+------------------+------------------+------------------+-----------------+--------------------------------------+
| Service          | Nodes                               | Orchestrator    | Comments                             |
|                  +------------------+------------------+ Action          |                                      |
|                  | :c-node:`n1`     | :c-node:`n2`     |                 |                                      |
+==================+==================+==================+=================+======================================+
| :c-svc:`svc1`    | | up             | | down           |                 |                                      |
+------------------+------------------+------------------+-----------------+--------------------------------------+
| :c-svc:`svc2`    | | down           | | down           | start on        |                                      |
|                  | | leader         |                  | :c-node:`n1`    |                                      |
|                  |                  |                  |                 |                                      |
|                  +------------------+------------------+-----------------+--------------------------------------+
|                  | | down           | | down           | start on        | Although placement policy is set to  |
|                  |                  | | leader         | :c-node:`n1`    | ``nodes order`` with :c-node:`n2` as |
|                  |                  |                  |                 | first node, :c-node:`n1` will be     |
|                  |                  |                  |                 | prefered.                            |
|                  +------------------+------------------+-----------------+--------------------------------------+
|                  | | down           | | down           | none            | hard affinity can't be satisfied,    |
|                  | | leader         |                  |                 | the service won't be started.        |
|                  | | frozen         |                  |                 |                                      |
+------------------+------------------+------------------+-----------------+--------------------------------------+

.. _agent.service.orchestration.hard.anti.affinity:

``DEFAULT.hard_anti_affinity``

        A whitespace-separated list of service names. The orchestrator won't propose to start a local instance of the service if any of the specified services have a local running instance.

For example, if :c-svc:`svc2` must never be executed on same node than :c-svc:`svc1`, those services must run on different nodes.

+----------------+--------------+--------------+-----------------+--------------------------------------+
| Service        | Nodes                       | Orchestrator    | Comments                             |
|                +--------------+--------------+ Action          |                                      |
|                | :c-node:`n1` | :c-node:`n2` |                 |                                      |
+================+==============+==============+=================+======================================+
| :c-svc:`svc1`  | | up         | | down       |                 |                                      |
+----------------+--------------+--------------+-----------------+--------------------------------------+
| :c-svc:`svc2`  | | down       | | down       | start on        |                                      |
|                |              | | leader     | :c-node:`n2`    |                                      |
|                |              |              |                 |                                      |
|                +--------------+--------------+-----------------+--------------------------------------+
|                | | down       | | down       | start on        | Although placement policy is set to  |
|                | | leader     |              | :c-node:`n2`    | ``nodes order`` with :c-node:`n1` as |
|                |              |              |                 | first node, :c-node:`n2` will be     |
|                |              |              |                 | preferred                            |
|                +--------------+--------------+-----------------+--------------------------------------+
|                | | down       | | down       | none            | hard affinity can't be satisfied,    |
|                |              | | leader     |                 | the service won't be started.        |
|                |              | | frozen     |                 |                                      |
+----------------+--------------+--------------+-----------------+--------------------------------------+

.. _agent.service.orchestration.soft.affinity:

``DEFAULT.soft_affinity``

        A whitespace-separated list of service names. If the local node is not the only candidate, the orchestrator won't propose to start a local instance of the service if all specified services don't have a local running instance.

For example, if :c-svc:`svc1` and :c-svc:`svc2` are known to have better performance when executed on the same node, those services should run on the same node.

+-----------------+--------------+--------------+-----------------+----------------------------------------------+
| Service         | Nodes                       | Orchestrator    | Comments                                     |
|                 +--------------+--------------+ Action          |                                              |
|                 | :c-node:`n1` | :c-node:`n2` |                 |                                              |
+=================+==============+==============+=================+==============================================+
| :c-svc:`svc1`   | | up         | | down       |                 |                                              |
+-----------------+--------------+--------------+-----------------+----------------------------------------------+
| :c-svc:`svc2`   | | down       | | down       | start on        |                                              |
|                 | | leader     |              | :c-node:`n1`    |                                              |
|                 |              |              |                 |                                              |
|                 +--------------+--------------+-----------------+----------------------------------------------+
|                 | | down       | | down       | start on        | Although placement policy is set to          |
|                 |              | | leader     | :c-node:`n1`    | ``nodes order`` with :c-node:`n2` as first   |
|                 |              |              |                 | node, :c-node:`n1` will be preferred         |
|                 +--------------+--------------+-----------------+----------------------------------------------+
|                 | | down       | | down       | start on        | soft affinity can't be satisfied,            |
|                 | | leader     |              | :c-node:`n2`    | as a best effort, the service will           |
|                 | | frozen     |              |                 | be started on :c-node:`n2`                   |
+-----------------+--------------+--------------+-----------------+----------------------------------------------+

.. _agent.service.orchestration.soft.anti.affinity:

``DEFAULT.soft_anti_affinity``

        A whitespace-separated list of service names. If the local node is not the only candidate, the orchestrator won't propose to start a local instance of the service if any of the specified services have a local running instance.

For example, if :c-svc:`svc2` should never be executed on same node than :c-svc:`svc1`, those services should run on different nodes.

+----------------+--------------+--------------+-----------------+--------------------------------------+
| Service        | Nodes                       | Orchestrator    | Comments                             |
|                +--------------+--------------+ Action          |                                      |
|                | :c-node:`n1` | :c-node:`n2` |                 |                                      |
+================+==============+==============+=================+======================================+
| :c-svc:`svc1`  | | up         | | down       |                 |                                      |
+----------------+--------------+--------------+-----------------+--------------------------------------+
| :c-svc:`svc2`  | | down       | | down       | start on        |                                      |
|                |              | | leader     | :c-node:`n2`    |                                      |
|                |              |              |                 |                                      |
|                +--------------+--------------+-----------------+--------------------------------------+
|                | | down       | | down       | start on        | Although placement policy is set to  |
|                | | leader     |              | :c-node:`n2`    | ``nodes order`` with :c-node:`n1` as |
|                |              |              |                 | first node, :c-node:`n2` will be     |
|                |              |              |                 | preferred                            |
|                +--------------+--------------+-----------------+--------------------------------------+
|                | | down       | | down       | start on        | hard affinity can't be satisfied,    |
|                |              | | leader     | :c-node:`n1`    | as a best effort, the service will   |
|                |              | | frozen     |                 | be started on :c-node:`n1`           |
+----------------+--------------+--------------+-----------------+--------------------------------------+

.. note:: ``hard_affinity`` and ``soft_affinity`` cause a startup serialization.

.. note:: All services in a affinity relationship must be in the same cluster.

.. _agent.service.orchestration.constraints:

Constraints
-----------

        An expression evaluating as a boolean, constraining the service instance placement to nodes where :kw:`constraints` evaluates as True.

Supported syntax:

* comparison operators are ``==`` ``!=`` ``>`` ``>=`` ``<=`` ``in (e1 e2)`` ``in [e1 e2]``
* arithmetic operators are ``*`` ``+`` ``-`` ``/`` ``**`` ``//`` ``%``
* binary operators are ``&`` ``|`` ``^``
* negation operator is ``not``
* boolean operators are ``and`` ``or``
* references are allowed
* Strings, and references evaluating as strings, containing dots must be quoted

Examples:

* ``constraints = $("{nodename}"=="node2.acme.com")``
* ``constraints = $("{nodename}"=="node1" or "{node.env}" in (DEV, TST))``

.. note::

    * The constraints are not honored by manual start operations.
    * The constraints violation notification is added to "print status" and "json status" outputs

.. _agent.service.orchestration.compatibility:

Compatibility
-------------

The daemons now announce their "compat version" through the heartbeats.

If a daemon notices the cluster members have different compat versions, it
disables ha orchestration.

This is what happens during a rollback agent upgrade.

In this case, the logs contain this warning:
``cluster members run incompatible versions. disable ha orchestration``

A orchestrate=ha service instance print status shows:

::

    ha1                         warn       incompatible versions
    `- aubergine                up         idle, started
       |- ip#0           ...... up         128.0.0.2@lo
       |- ip#1           M....S stdby up   128.0.0.3@lo
    ...
    
And svcmon shows:
    
::

    Nodes                                  aubergine nuc
     15m                                 | 0.4       0.1
     compat    warn                      | 2         1
     state                               |
    ...

When the compat is restored, the logs contain this info:
``cluster members run compatible versions. enable ha orchestration``



.. _agent.service.orchestration.parents:

Parents
-------

The keyword :kw:`DEFAULT.parents` store a list of services that must be avail up for the agent daemon to proceed on starting the service.

A typical use case is to modelize services dependency:

* :c-svc:`svc1` and :c-svc:`svc2` are mutually dependent
* :c-svc:`svc1` must be started first, and then :c-svc:`svc2` is able to start once :c-svc:`svc1` is up.

To set up this setting::

    $ sudo svcmgr -s svc2 set --kw parents+=svc1

.. note::

    :c-svc:`svc1` and :c-svc:`svc2` must be in the same cluster

.. _agent.service.orchestration.children:

Children
--------

A service with :kw:`DEFAULT.children` set to a list of tiers services hosted in the same
cluster, waits for children to all reach the down aggregate avail status
before processing a stop order.

A typical use case is to modelize services dependency:

* :c-svc:`svc1` and :c-svc:`svc2` are mutually dependent
* :c-svc:`svc1` can't be stopped before :c-svc:`svc2` is down.

To set up this setting::

    $ sudo svcmgr -s svc1 set --kw children+=svc2

.. note::

    :c-svc:`svc1` and :c-svc:`svc2` must be in the same cluster

.. _agent.service.orchestration.maintenance:

Maintenance
-----------

A clean daemon stop, which includes the node reboot scenario, cause the node to advertize its going into maintenance.

Peer nodes preserve a maintenance node last received heartbeat information until ``node.mainteance_grace_period = <duration expr>`` expires, and thus inhibits orchestration.

When the stopped daemon comes back alive, the normal orchestration is resumed, and

* If the service instances were stopped, like in a reboot scenario, they are restarted honoring placement policies, affinity and constraints. Thus, if the instances were placed optimally, the final situation is also optimal.
* If the service instances were not stopped, like in a ``nodemgr daemon restart`` scenario, no orchestration actions are triggered.

.. _agent.service.orchestration.monitor.states:

Service Monitor states
----------------------

================= ===========================================================
State             Description
================= ===========================================================
``idle``          The monitor is not currently running an action.

``ready``         The monitor has advertized it's intention to start the
                  local instance of the service and is waiting for peers to
                  contest.

``starting``      No peers contested the monitor intention to start the local
                  service instance. The instance is now starting.

``start failed``  The last start action triggered by the daemon returned with
                  errors. The orchestration is blocked for this service
                  instance.

``restarting``    Monitored instance resources are being restarted.

``stopping``      The instance is stopping.

``stop failed``   The last stop action triggered by the daemon returned with
                  errors. The orchestration is blocked for this service
                  instance.

``freezing``      The instance is freezing. Orchestration is about to be
                  blocked.

``thawing``       The instance is thawing. Orchestration is about to be
                  resumed.
================= ===========================================================

.. _agent.service.orchestration.monitor.states.transitions:

State transitions
-----------------

States are expressed as::

        <instance status> <service monitor state> <flags>

Where ``<flags>`` can be::

        A: Affinity Violation
        C: Constraints Violation
        F: Service or Node Frozen
        L: Placement Policy Leader

        *: Any Combination of the Above Flags

====================== ====================== ====================== ======================
Initial States                                Next States
--------------------------------------------- --------------------------------------------- 
Node A                 Node B                 Node A                 Node B                 
====================== ====================== ====================== ======================
down idle L            down idle              idle => ready
down idle L            down idle A            idle => ready
down idle L            down idle C            idle => ready
down idle L            down idle F            idle => ready
down idle AL           down idle                                     idle => ready
down idle AL           down idle A                                   
down idle AL           down idle C                                   
down idle AL           down idle F
down idle CL           down idle                                     idle => ready
down idle CL           down idle A
down idle CL           down idle C
down idle CL           down idle F
down idle FL           down idle                                     idle => ready
down idle FL           down idle A
down idle FL           down idle C
down idle FL           down idle F
down idle              down start failed \*   idle => ready
down idle L            down start failed \*   idle => ready
down idle AL           down start failed \*
down idle CL           down start failed \*
down idle FL           down start failed \*
down idle              down stop failed \*    idle => ready
down idle L            down stop failed \*    idle => ready
down idle AL           down stop failed \*
down idle CL           down stop failed \*
down idle FL           down stop failed \*
down idle              down \*ing \*          
down idle L            down \*ing \*          
down idle AL           down \*ing \*
down idle CL           down \*ing \*
down idle FL           down \*ing \*
down idle              warn \* \*             
down idle L            warn \* \*             
down idle AL           warn \* \*
down idle CL           warn \* \*
down idle FL           warn \* \*
====================== ====================== ====================== ======================

When a service has spent 16 seconds in the ready state and no other node has not opt-in to start an instance, the service transitions to the starting state.


Interacting with the Orchestrator
---------------------------------

Clearing Failed Service Monitor States
++++++++++++++++++++++++++++++++++++++

::

        sudo svcmgr -s <svcname> clear [--node <nodename>]

If ``--node <nodename>`` is set, the clear applies only to the specified node. If not set, the clear applies to all nodes.



