.. _agent.configure.cluster:

Cluster Configuration
*********************

Upon agent installation, the node is considered part of its own 1-node cluster.
The following configuration is merged in ``<OSVCETC>/cluster.conf``:

	:kw:`cluster.secret` is auto-generated, if not already defined.

	:kw:`cluster.name` is set to ``default``, if not already defined.

Bootstrap a new cluster
=======================

If the node joins an existing cluster, skip this section.

Add Heartbeats
--------------

On a new cluster, the heartbeats configuration need to be applied only on the first node. The joining nodes will fetch this configuration from this joined node.

For example, the simplest heartbeat configuration would be

::

        om cluster set --kw hb#1.type=unicast

Display the result

::

        om mon

.. seealso:: :ref:`agent.daemon.heartbeats`

Add Stonith methods
-------------------

Stonith is optional. Skip to the next section if not concerned.

On a new cluster, the stonith configuration can be applied on the first node. The joining nodes will fetch this configuration from this joined node.

For example, a dummy stonith configuration would be

::

        om cluster set --kw stonith#node2.cmd=/bin/true

This configuration will execute :cmd:`/bin/true` on the node taking over a service which was previously running on the now stalled :c-node:`node2`.

Good, isolated fencing packages are freely available. For one, https://github.com/ClusterLabs/fence-agents

Add Arbitrators
---------------

Arbitrators are optional. Skip to the next section if not concerned.

The arbitrator configuration can be applied on any node of the cluster.


::

        om cluster set --kw arbitrator#1.name=relay1 \
                       --kw arbitrator#1.secret=10231023102310231023102310231023

This configuration will ask for the agent on node :c-node:`relay1` for its vote in a quorum race, if needed to get a majority.

The :kw:`arbitrator#1.secret` value comes from the :kw:`cluster.secret` value on the arbitrator `relay1`.

.. seealso::

        | :ref:`agent.daemon.quorum`

Join a Cluster
==============

The joining node can choose to join any of the cluster node already joined.

On the joined node :c-node:`node1`

::

        om cluster get --kw cluster.secret

On the joining node :c-node:`node2`

::

        om daemon join --secret <secret> --node node1

.. note::

        * If the node was frozen before the join, it is left frozen after the join.
        * If the node was not frozen before the join, the join process freezes it. If the join is successful, the node is thawed. If not, the node is left frozen.

Leave a Cluster
===============

::

        om daemon leave



.. seealso::

        | :ref:`agent.daemon.listener`
        | :ref:`agent.daemon.monitor`
        | :ref:`agent.daemon.scheduler`
        | :ref:`agent.daemon.quorum`
        | :ref:`agent.daemon.heartbeats`
        | :ref:`agent.service.orchestration`
        | :ref:`agent.dns`

