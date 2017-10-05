Services
********

Default Section
===============

:kw:`DEFAULT.hard_affinity`
---------------------------

This parameter can be used to force a service to run on the same node running other services.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.hard_affinity>`
    | :ref:`Service Orchestration <agent.service.orchestration.hard.affinity>`

:kw:`DEFAULT.soft_affinity`
---------------------------

This parameter can be used to help a service to run on the same node running other services.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.soft_affinity>`
    | :ref:`Service Orchestration <agent.service.orchestration.soft.affinity>`
    

:kw:`DEFAULT.hard_anti_affinity`
--------------------------------

This parameter can be used to force a service to avoid execution on the same node running other services.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.hard_anti_affinity>`
    | :ref:`Service Orchestration <agent.service.orchestration.hard.anti.affinity>`

:kw:`DEFAULT.soft_anti_affinity`
--------------------------------

This parameter can be used to help a service try to avoid execution on the same node running other services.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.soft_anti_affinity>`
    | :ref:`Service Orchestration <agent.service.orchestration.soft.anti.affinity>`

:kw:`DEFAULT.orchestrate`
-------------------------

This parameter is used to specify the daemon behaviour regarding service orchestration

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.orchestrate>`
    | :ref:`Service Orchestration <agent.service.orchestration>`
    | :ref:`Agent Migration <agent.migration.orchestrate>`

:kw:`DEFAULT.placement`
-----------------------

This setting is used to identify the best node to start the service on.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.placement>`
    | :ref:`Service Orchestration <agent.service.orchestration.placement.policies>`

:kw:`DEFAULT.constraints`
-------------------------

A boolean expression evaluated in order to constrain the service instance placement to nodes where expression is True.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.constraints>`
    | :ref:`Service Orchestration <agent.service.orchestration.constraints>`

:kw:`DEFAULT.parents`
---------------------

This parameter is used to store a list of services that must be avail up for the agent daemon to proceed on starting the service.

The parents must be in the same cluster.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.parents>`
    | :ref:`Service Orchestration <agent.service.orchestration.parents>`

:kw:`DEFAULT.children`
----------------------

This parameter is used to store a list of services that must be avail down for the agent daemon to proceed on stopping the service.

.. seealso::

    | :ref:`Keyword Reference <DEFAULT.children>`
    | :ref:`Service Orchestration <agent.service.orchestration.children>`

:kw:`DEFAULT.stonith`
---------------------

A boolean mandating the stale node previously running the service to be shot by the daemon monitor upon failover.

Defaults to false.

Resource Sections
=================

:kw:`standby`
-------------

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


Heartbeat Section
=================

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
