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

+------------+--------------+--------------+---------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator  | Comments                             |
|            +--------------+--------------+ Action        |                                      |
|            | n1           | n2           |               |                                      |
+============+==============+==============+===============+======================================+
| svc1       | | up         | | down       |               |                                      |
+------------+--------------+--------------+---------------+--------------------------------------+
| svc2       | | down       | | down       | start on n1   |                                      |
|            | | leader     |              |               |                                      |
|            |              |              |               |                                      |
|            +--------------+--------------+---------------+--------------------------------------+
|            | | down       | | down       | start on n1   | Although placement policy is set to  |
|            |              | | leader     |               | ``nodes order`` with ``n2`` as first |
|            |              |              |               | node, ``n1`` will be preferred       |
|            +--------------+--------------+---------------+--------------------------------------+
|            | | down       | | down       | none          | hard affinity can't be satisfied,    |
|            | | leader     |              |               | the service won't be started.        |
|            | | frozen     |              |               |                                      |
+------------+--------------+--------------+---------------+--------------------------------------+

``DEFAULT.soft_affinity``
-------------------------

This parameter can be used to help a service to run on the same node running other services.

For example, if ``svc1`` and ``svc2`` are known to have better performance when executed on the same node, those services should run on the same node.

To set up this soft affinity::

    $ sudo svcmgr -s svc2 set --kw soft_affinity=svc1

+------------+--------------+--------------+---------------+--------------------------------------+
| Service    | Nodes                       | Orchestrator  | Comments                             |
|            +--------------+--------------+ Action        |                                      |
|            | n1           | n2           |               |                                      |
+============+==============+==============+===============+======================================+
| svc1       | | up         | | down       |               |                                      |
+------------+--------------+--------------+---------------+--------------------------------------+
| svc2       | | down       | | down       | start on n1   |                                      |
|            | | leader     |              |               |                                      |
|            |              |              |               |                                      |
|            +--------------+--------------+---------------+--------------------------------------+
|            | | down       | | down       | start on n1   | Although placement policy is set to  |
|            |              | | leader     |               | ``nodes order`` with ``n2`` as first |
|            |              |              |               | node, ``n1`` will be preferred       |
|            +--------------+--------------+---------------+--------------------------------------+
|            | | down       | | down       | start on n2   | soft affinity can't be satisfied,    |
|            | | leader     |              |               | as a best effort, the service will   |
|            | | frozen     |              |               | be started on ``n2``                 |
+------------+--------------+--------------+---------------+--------------------------------------+

Anti-Affinity
=============

``DEFAULT.hard_anti_affinity``
------------------------------

``DEFAULT.soft_anti_affinity``
------------------------------

``DEFAULT.orchestrate``
=======================

``DEFAULT.placement``
=====================

``DEFAULT.constraints``
=======================

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
