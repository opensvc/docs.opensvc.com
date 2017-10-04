.. _agent.service.orchestration:

Service Orchestration
=====================

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

Affinity
--------

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


``DEFAULT.soft_anti_affinity``

        A whitespace-separated list of service names. If the local node is not the only candidate, the orchestrator won't propose to start a local instance of the service if any of the specified services have a local running instance.

For example, if :c-svc:`svc2` should never be executed on same node than :c-svc:`svc1`, those services should run on different nodes.

i+----------------+--------------+--------------+-----------------+--------------------------------------+
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

Maintenance
-----------

A clean daemon stop, which includes the node reboot scenario, cause the node to advertize its going into maintenance.

Peer nodes preserve a maintenance node last received heartbeat information until ``node.mainteance_grace_period = <duration expr>`` expires, and thus inhibits orchestration.

When the stopped daemon comes back alive, the normal orchestration is resumed, and

* If the service instances were stopped, like in a reboot scenario, they are restarted honoring placement policies, affinity and constraints. Thus, if the instances were placed optimally, the final situation is also optimal.
* If the service instances were not stopped, like in a ``nodemgr daemon restart`` scenario, no orchestration actions are triggered.

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



