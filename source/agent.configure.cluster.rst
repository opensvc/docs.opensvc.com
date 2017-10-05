.. _agent.configure.cluster:

Agent Cluster Configuration
***************************

Upon agent installation, the node is considered part of its own 1-node cluster.
The following configuration is merged in ``<OSVCETC>/node.conf``:

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

        sudo nodemgr set --param hb#1.type --value unicast

Display the result

::

        sudo svcmon

.. seealso:: :ref:`agent.daemon.heartbeats`

Add Stonith methods
-------------------

Stonith is optional. Skip to the next section if not concerned.

On a new cluster, the stonith configuration can be applied on the first node. The joining nodes will fetch this configuration from this joined node.

For example, a dummy stonith configuration would be

::

        sudo nodemgr set --param stonith#node2.cmd --value /bin/true

This configuration will execute :cmd:`/bin/true` on the node taking over a service which was previously running on the now stalled :c-node:`node2`.

Good, isolated fencing packages are freely available. For one, https://github.com/ClusterLabs/fence-agents

Join a Cluster
==============

The joining node can choose to join any of the cluster node already joined.

On the joined node :c-node:`node1`

::

        sudo nodemgr get --param cluster.secret

On the joining node :c-node:`node2`

::

        sudo nodemgr daemon join --secret <secret> --node node1

.. note::

        * If the node was frozen before the join, it is left frozen after the join.
        * If the node was not frozen before the join, the join process freezes it. If the join is successful, the node is thawed. If not, the node is left frozen.

Leave a Cluster
===============

::

        sudo nodemgr daemon leave



.. seealso::

        | :ref:`agent.daemon.listener`
        | :ref:`agent.daemon.monitor`
        | :ref:`agent.daemon.scheduler`
        | :ref:`agent.daemon.heartbeats`
        | :ref:`agent.service.orchestration`

