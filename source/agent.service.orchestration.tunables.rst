Service Tunables
================

This chapter focuses on service configuration keywords affecting the orchestration policies.

:kw:`orchestrate`
-----------------

The :kw:`DEFAULT.orchestrate` keyword specifies the daemon behaviour regarding service start orchestration, which is not enabled by default.

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

:kw:`placement`
---------------

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

A static random ranking. The more services, the better the leveling.

shift
+++++

If the service name starts with an index, like scaler slaves, use that index as a shift on the nodes list and apply the nodes order ranking from there. This placement policy thus makes each slave of a scaler start behave as if the placement policy was "nodes order" and the nodes list shifted by one compared to the preceding slave.

score
+++++

Rank by descending node score. The highest scoring node is the leader. The score is a composite metric obtained by a weighted average of 100/load, %avail memory and %avail swap. The weights favor 1/ avail swap 2/ avail mem 3/ lower load average.

.. note:: A frozen node is excluded from the node candidates list.  If the placement leader is frozen, then a new leader is elected, according to the placement policy.  If all cluster nodes are frozen, service placement warning messages are disabled.

.. _agent.service.orchestration.constraints:

:kw:`constraints`
-----------------

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

.. _agent.service.orchestration.affinity:

.. _agent.service.orchestration.hard.affinity:

:kw:`hard_affinity`
-------------------

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

:kw:`hard_anti_affinity`
------------------------

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

:kw:`soft_affinity`
---------------------------

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

:kw:`soft_anti_affinity`
--------------------------------

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

.. _agent.service.orchestration.parents:

:kw:`parents`
-------------

This keyword stores a list of services that must be avail up for the agent daemon to proceed on starting the service.

A typical use case is to modelize services dependency:

* :c-svc:`svc1` and :c-svc:`svc2` are mutually dependent
* :c-svc:`svc1` must be started first, and then :c-svc:`svc2` is able to start once :c-svc:`svc1` is up.

To set up this setting::

    $ om svc2 set --kw parents+=svc1

.. note::

    :c-svc:`svc1` and :c-svc:`svc2` must be in the same cluster

.. _agent.service.orchestration.children:

:kw:`children`
--------------

A service with :kw:`DEFAULT.children` set to a list of tiers services hosted in the same
cluster, waits for children to all reach the down aggregate avail status
before processing a stop order.

A typical use case is to modelize services dependency:

* :c-svc:`svc1` and :c-svc:`svc2` are mutually dependent
* :c-svc:`svc1` can't be stopped before :c-svc:`svc2` is down.

To set up this setting::

    $ om svc1 set --kw children+=svc2

.. note::

    :c-svc:`svc1` and :c-svc:`svc2` must be in the same cluster


