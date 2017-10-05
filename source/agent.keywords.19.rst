Services
********

Default Section
===============

:kw:`DEFAULT.hard_affinity`
---------------------------

This parameter can be used to force a service to run on the same node running other services.

For example, if :c-svc:`svc1` can listens on a unix socket used by :c-svc:`svc2`, those services must run on the same node.

To set up this hard affinity::

    $ sudo svcmgr -s svc2 set --kw hard_affinity+=svc1

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

:kw:`DEFAULT.soft_affinity`
---------------------------

This parameter can be used to help a service to run on the same node running other services.

For example, if :c-svc:`svc1` and :c-svc:`svc2` are known to have better performance when executed on the same node, those services should run on the same node.

To set up this soft affinity::

    $ sudo svcmgr -s svc2 set --kw soft_affinity+=svc1

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

:kw:`DEFAULT.hard_anti_affinity`
--------------------------------

This parameter can be used to force a service to avoid execution on the same node running other services.

For example, if :c-svc:`svc2` must never be executed on same node than :c-svc:`svc1`, those services must run on different nodes.

To set up this hard anti affinity::

    $ sudo svcmgr -s svc2 set --kw hard_anti_affinity+=svc1

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

:kw:`DEFAULT.soft_anti_affinity`
--------------------------------

This parameter can be used to help a service try to avoid execution on the same node running other services.

For example, if :c-svc:`svc2` should never be executed on same node than :c-svc:`svc1`, those services should run on different nodes.

To set up this soft anti affinity::

    $ sudo svcmgr -s svc2 set --kw soft_anti_affinity+=svc1

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


.. _default_orchestrate:

:kw:`DEFAULT.orchestrate`
-------------------------

This parameter is used to specify the daemon behaviour regarding service orchestration

To set up this parameter::

    $ sudo svcmgr -s svc2 set --kw orchestrate=<no|start|ha>

Possible values:

* ``no``
    * no instance is started automatically
    * giveback is disabled, takeover can be used to relocate the service
    * placement warnings are inhibited
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

.. note::

    :kw:`DEFAULT.orchestrate`` default value is ``no``

:kw:`DEFAULT.placement`
-----------------------

:kw:`DEFAULT.constraints`
-------------------------

:kw:`DEFAULT.parents`
---------------------

This parameter is used to store a list of services that must be avail up for the agent daemon to proceed on starting the service.

The parents must be in the same cluster.

To set up this tunable::

    $ sudo svcmgr -s svc2 set --kw parents+=svc1

:kw:`DEFAULT.children`
----------------------

This parameter is used to store a list of services that must be avail down for the agent daemon to proceed on stopping the service.

The children must be in the same cluster.

To set up this tunable::

    $ sudo svcmgr -s svc2 set --kw children+=svc1

:kw:`DEFAULT.stonith`
---------------------

A boolean mandating the stale node previously running the service to be shot by the daemon monitor upon failover.

Defaults to false.

Resource Sections
=================

:kw:`standby`
------------

:kw:`shared`
------------

:kw:`provision`
---------------

Node
****

Node Section
============

:kw:`node.maintenance_grace_period`
-----------------------------------

:kw:`node.rejoin_grace_period`
------------------------------

Cluster Section
===============

:kw:`cluster.secret`
--------------------

Auto-generated.

:kw:`cluster.nodes`
-------------------

Janitored by the join and leave nodemgr daemon actions.

:kw:`cluster.name`
------------------

Defaults to ``default``. Users can set it to a more meaningful value.

.. note::

	Changing that parameter on a joined cluster will break communications until the nodes share the same :kw:`cluster.name`, thus cause a massive split-brain situation. So take care of freezing the cluster nodes before.


Heartbeat Sections
==================

:kw:`hb.type`
-------------

:kw:`hb[type=unicast].addr`
---------------------------

:kw:`hb[type=unicast].intf`
---------------------------

:kw:`hb[type=unicast].port`
---------------------------

:kw:`hb[type=unicast].timeout`
------------------------------

:kw:`hb[type=multicast].addr`
-----------------------------

:kw:`hb[type=multicast].intf`
-----------------------------

:kw:`hb[type=multicast].port`
-----------------------------

:kw:`hb[type=multicast].timeout`
--------------------------------

:kw:`hb[type=disk].dev`
-----------------------

:kw:`hb[type=disk].timeout`
---------------------------
