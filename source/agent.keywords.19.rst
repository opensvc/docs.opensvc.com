Services
********

Affinity
========

``DEFAULT.hard_affinity``
-------------------------

This parameter can be used to force a service to run on the same node running other services.

For example, if ``svc1`` can listens on a unix socket used by ``svc2``, those services must run on the same node.

To set up this hard affinity::

    $ sudo svcmgr -s svc2 set --kw hard_affinity=svc1

+------------+--------------+--------------+-----------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator    | Comments                             |
|            +--------------+--------------+ Action          |                                      |
|            | ``n1``       | ``n2``       |                 |                                      |
+============+==============+==============+=================+======================================+
| ``svc1``   | | up         | | down       |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+
| ``svc2``   | | down       | | down       | start on ``n1`` |                                      |
|            | | leader     |              |                 |                                      |
|            |              |              |                 |                                      |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n1`` | Although placement policy is set to  |
|            |              | | leader     |                 | ``nodes order`` with ``n2`` as first |
|            |              |              |                 | node, ``n1`` will be preferred       |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | none            | hard affinity can't be satisfied,    |
|            | | leader     |              |                 | the service won't be started.        |
|            | | frozen     |              |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+

``DEFAULT.soft_affinity``
-------------------------

This parameter can be used to help a service to run on the same node running other services.

For example, if ``svc1`` and ``svc2`` are known to have better performance when executed on the same node, those services should run on the same node.

To set up this soft affinity::

    $ sudo svcmgr -s svc2 set --kw soft_affinity=svc1

+------------+--------------+--------------+-----------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator    | Comments                             |
|            +--------------+--------------+ Action          |                                      |
|            | ``n1``       | ``n2``       |                 |                                      |
+============+==============+==============+=================+======================================+
| ``svc1``   | | up         | | down       |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+
| ``svc2``   | | down       | | down       | start on ``n1`` |                                      |
|            | | leader     |              |                 |                                      |
|            |              |              |                 |                                      |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n1`` | Although placement policy is set to  |
|            |              | | leader     |                 | ``nodes order`` with ``n2`` as first |
|            |              |              |                 | node, ``n1`` will be preferred       |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n2`` | soft affinity can't be satisfied,    |
|            | | leader     |              |                 | as a best effort, the service will   |
|            | | frozen     |              |                 | be started on ``n2``                 |
+------------+--------------+--------------+-----------------+--------------------------------------+

Anti-Affinity
=============

``DEFAULT.hard_anti_affinity``
------------------------------

This parameter can be used to force a service to avoid execution on the same node running other services.

For example, if ``svc2`` must never be executed on same node than ``svc1``, those services must run on different nodes.

To set up this hard anti affinity::

    $ sudo svcmgr -s svc2 set --kw hard_anti_affinity=svc1

+------------+--------------+--------------+-----------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator    | Comments                             |
|            +--------------+--------------+ Action          |                                      |
|            | ``n1``       | ``n2``       |                 |                                      |
+============+==============+==============+=================+======================================+
| ``svc1``   | | up         | | down       |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+
| ``svc2``   | | down       | | down       | start on ``n2`` |                                      |
|            |              | | leader     |                 |                                      |
|            |              |              |                 |                                      |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n2`` | Although placement policy is set to  |
|            | | leader     |              |                 | ``nodes order`` with ``n1`` as first |
|            |              |              |                 | node, ``n2`` will be preferred       |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | none            | hard affinity can't be satisfied,    |
|            |              | | leader     |                 | the service won't be started.        |
|            |              | | frozen     |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+


``DEFAULT.soft_anti_affinity``
------------------------------

This parameter can be used to help a service try to avoid execution on the same node running other services.

For example, if ``svc2`` should never be executed on same node than ``svc1``, those services should run on different nodes.

To set up this soft anti affinity::

    $ sudo svcmgr -s svc2 set --kw soft_anti_affinity=svc1

+------------+--------------+--------------+-----------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator    | Comments                             |
|            +--------------+--------------+ Action          |                                      |
|            | ``n1``       | ``n2``       |                 |                                      |
+============+==============+==============+=================+======================================+
| ``svc1``   | | up         | | down       |                 |                                      |
+------------+--------------+--------------+-----------------+--------------------------------------+
| ``svc2``   | | down       | | down       | start on ``n2`` |                                      |
|            |              | | leader     |                 |                                      |
|            |              |              |                 |                                      |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n2`` | Although placement policy is set to  |
|            | | leader     |              |                 | ``nodes order`` with ``n1`` as first |
|            |              |              |                 | node, ``n2`` will be preferred       |
|            +--------------+--------------+-----------------+--------------------------------------+
|            | | down       | | down       | start on ``n1`` | hard affinity can't be satisfied,    |
|            |              | | leader     |                 | as a best effort, the service will   |
|            |              | | frozen     |                 | be started on ``n1``                 |
+------------+--------------+--------------+-----------------+--------------------------------------+


.. _default_orchestrate:

``DEFAULT.orchestrate``
=======================

This parameter is used to specify the daemon behaviour regarding service orchestration

To set up this parameter::

    $ sudo svcmgr -s svc2 set --kw orchestrate=<no|start|ha>

Possible values:

* ``no``
    * no instance is started automatically
    * giveback is disabled, takeover can be used to relocate the service
    * placement warnings are inhibited
    * use this setting for all 1.8 services **without** ``DEFAULT.autostart_node``
* ``start``
    * only the instance on the natural leader is started
    * takeover can be used to relocate the service
    * giveback is useful to relocate the service to the natural leader
    * use this setting for all 1.8 services **with** ``DEFAULT.autostart_node``
* ``ha``
    * an instance is started on the best available node
    * takeover can be used to relocate the service
    * giveback is useful to relocate the service to the best available node
    * use this setting for all 1.8 services under OpenHA control

.. note::

    ``DEFAULT.orchestrate`` default value is ``no``

``DEFAULT.placement``
=====================

``DEFAULT.constraints``
=======================

``DEFAULT.parents``
===================

This parameter is used to store a list of services that must be avail up for the agent daemon to proceed on starting the service.

To set up this tunable::

    $ sudo svcmgr -s svc2 set --kw parents=svc1

Resources
=========

``*.shared``
------------

``*.provision``
---------------

Node
****

``node.maintenance_grace_period``
=================================

``node.rejoin_grace_period``
============================

Cluster
=======

``cluster.secret``
------------------

``cluster.nodes``
-----------------

``cluster.name``
----------------

Heartbeat
=========

``hb.type``
-----------

``hb[type=unicast].addr``
-------------------------

``hb[type=unicast].intf``
-------------------------

``hb[type=unicast].port``
-------------------------

``hb[type=unicast].timeout``
----------------------------

``hb[type=multicast].addr``
---------------------------

``hb[type=multicast].intf``
---------------------------

``hb[type=multicast].port``
---------------------------

``hb[type=multicast].timeout``
------------------------------

``hb[type=disk].dev``
---------------------

``hb[type=disk].timeout``
-------------------------
