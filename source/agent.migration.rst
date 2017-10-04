Before Upgrade
**************

Freeze all services
===================

:cmd:`sudo svcmgr freeze`

Unconfigure OpenHA
==================

:cmd:`sudo /etc/init.d/openha kill`

Then, backup configuration files and disable the launcher or remove the package.

Set :kw:`node.maintenance_grace_period`
=======================================

A node now announces its entering 'maintenance' upon clean daemon stop and restart. A node reboot is a clean stop too.
Peer nodes won't try to take over the services which were running on this node until :kw:`node.maintenance_grace_period` is expired, so the services have a chance to be restarted on the same node after the maintenance is over.

.. note::

    :kw:`node.maintenance_grace_period` default value is ``60`` seconds

Set :kw:`node.rejoin_grace_period`
==================================



.. note::

    :kw:`node.rejoin_grace_period` default value is ``90`` seconds

Unset :kw:`DEFAULT.mode`
========================

This service keyword is unused since 1.8.

Set :kw:`DEFAULT.orchestrate`
=============================

This parameter is used to restrict or allow the daemon orchestration capabilities for the service.

If not set explicitely, the :kw:`orchestrate` value defaults to ``no``, disabling all start orchestration.

The other valid values, ``start`` and ``ha``, require that you also set and configure the service placement policy. The default ``placement``, ``nodes order``, ranks the nodes respecting the user-defined order of the :kw:`nodes` and `:kw:drpnodes` keywords.

Users can change the :kw:`orchestrate` value online at any moment. For example activating ha on a service can be done with :cmd:`sudo svcmgr -s svc1 set --kw orchestrate=ha`

Any 1.8 service with **no** hearbeat resource (manual failover) can behave like a HA service as soon as the agent stack is upgraded to 1.9

Conversion table:

+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|  Service Type |    v1.8                  |   v1.9                |   Comments                                                                              |
+===============+==========================+=======================+=========================================================================================+
|               | | [DEFAULT]              | | [DEFAULT]           | orchestrate=no keeps the daemon from starting the instance on any node,                 |
| | failover    | | nodes = n1 n2          | | nodes = n1 n2       | and inhibits failover. The nodes order is only important to determine the node where    |
| | no hb       | | autostart_node =       | | orchestrate = no    | the shared resources are provisioned.                                                   |
+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]              | | [DEFAULT]           | orchestrate=start let the daemon start the instance on the placement leader only,       |
| | failover    | | nodes = n1 n2          | | nodes = n2 n1       | but inhibits failover. n2 is defined as first node, so the placement policy selects     |
| | no hb       | | autostart_node = n2    | | orchestrate = start | it as the leader                                                                        |
+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]              | | [DEFAULT]           | orchestrate=ha let the daemon start the instance and handle failover.                   |
| | failover    | | nodes = n1 n2          | | nodes = n2 n1       | The nodes order must be set in the same order defined in the openha 'services'          |
| | with hb     | | autostart_node =       | | orchestrate = ha    | configuration file.                                                                     |
+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]              | | [DEFAULT]           | orchestrate=start let the daemon start instances on the  2 (flex_min_nodes) first       |
| | flex        | | nodes = n1 n2 n3       | | nodes=n2 n3 n1      | placement leaders. n2 and n3 are defined first, so the placement policy selects them    |
|               | | autostart_node = n2 n3 | | flex_min_nodes=2    | as the leaders.                                                                         |
|               |                          | | orchestrate = start |                                                                                         |
+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]              | | [DEFAULT]           | orchestrate=no keeps the daemon from starting instances on any nodes, and inhibits      |
| | flex        | | nodes = n1 n2 n3       | | nodes=n1 n2 n3      | restart of dead instances to satisfy flex_min_nodes. The nodes order is only important  |
|               | | autostart_node =       | | orchestrate = no    | to determine the node where the shared resources are provisioned.                       |
|               |                          |                       |                                                                                         |
+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+

.. seealso:: :ref:`default_orchestrate`


Set :kw:`DEFAULT.placement`
===========================

This parameter is used to set a service instances placement policy. It is used to identify which node is the most appropriate to start the service.

Possible values:

* ``nodes order`` : the left-most available node is allowed to start a service instance
* ``load avg``    : the least loaded node, taken from system load averages in the past 15 minutes

.. note::

    :kw:`DEFAULT.placement` default value is ``nodes order``

Set :kw:`DEFAULT.constraints`
=============================

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

Rename :kw:`DEFAULT.affinity` to :kw:`DEFAULT.hard_affinity`
============================================================

::

	for SVCNAME in $(sudo svcmgr ls)
	do
		BUFF=$(sudo svcmgr -s $SVCNAME get --param affinity) && ( \
			sudo svcmgr -s $SVCNAME set --param hard_affinity --value "$BUFF" ; \
			sudo svcmgr -s $SVCNAME unset --param affinity \
		)
	done


Rename :kw:`DEFAULT.anti_affinity`` to :kw:`DEFAULT.hard_anti_affinity`
=======================================================================

::

	for SVCNAME in $(sudo svcmgr ls)
	do
		BUFF=$(sudo svcmgr -s $SVCNAME get --param anti_affinity) && ( \
			sudo svcmgr -s $SVCNAME set --param hard_anti_affinity --value "$BUFF" ; \
			sudo svcmgr -s $SVCNAME unset --param anti_affinity \
		)
	done

Remove :kw:`DEFAULT.autostart_node`
===================================

Previously used for primary node definition at service startup, this parameter is now obsolete. This feature is now managed by the service placement policy and :kw:`orchestrate`. The placement policy algorithm is responsible of primary node identification, so make sure the placement policy produce the same behaviour.

When using ``nodes order`` (default) placement policy, the service will start on the first node declared in the :kw:`DEFAULT.nodes` parameter.

Examples::

        nodes = n1 n2 n3

:c-node:`n1` is the primary node, :c-node:`n2` and :c-node:`n3` are secondary nodes.

::

        nodes = n3 n2 n1

:c-node:`n3` is the primary node, :c-node:`n2` and :c-node:`n1` are secondary nodes.

Remove hb sections from service configurations
==============================================

heartbeats resources are now deprecated, and should be removed from the service configuration file.

To remove rid :c-res:`hb#1` resource from service :c-svc:`svc1`:

:cmd:`svcmgr -s svc1 delete --rid hb#1`

	Remove the rid from the service configuration file.
  

:cmd:`svcmgr -s svc1 sync drp --rid sync#i0`

	Propagate the updated service configuration file to drp node, if any.

Replace :kw:`optional_on`, :kw:`monitor_on`, :kw:`enable_on` and :kw:`disable_on` by their equivalent scoped :kw:`optional`, :kw:`monitor`, :kw:`enable` and :kw:`disable`
==========================================================================================================================================================================

============================= =================================
v1.8                          v1.9
============================= =================================
<kw>_on = nodes               <kw>@nodes = true
<kw>_on = drpnodes            <kw>@drpnodes = true
<kw>_on = nodes drpnodes      <kw> = true
============================= =================================

Replace :kw:`sync[rsync].exclude` by their equivalent :kw:`sync[rsync].options`
===============================================================================

============================= =================================
v1.8                          v1.9
============================= =================================
exclude = foo                 options = --exclude=foo
============================= =================================

Replace :kw:`DEFAULT.service_env` by their equivalent :kw:`DEFAULT.env`
=======================================================================

::

	for SVCNAME in $(sudo svcmgr ls)
	do
		BUFF=$(sudo svcmgr -s $SVCNAME get --param svc_env) && ( \
			sudo svcmgr -s $SVCNAME set --param env --value "$BUFF" ; \
			sudo svcmgr -s $SVCNAME unset --param svc_env \
		)
	done

Set :kw:`<rid>.provision=false` in your templates
=================================================

For resources you don't want to provision using the opensvc provisioner.
You can also set your own provisioner as a :kw:`pre_provision` trigger.

Set :kw:`<rid>.shared=true` in your service configuration files and templates
=============================================================================

On resources you want provisioned on one node only.

Set :kw:`DEFAULT.parents` and :kw:`DEFAULT.children`
====================================================

If you implemented inter-services start or stop dependencies using triggers, you might now consider removing the triggers and use those keywords instead. Be aware the inter-dependent services must be hosted in the same cluster.

After Upgrade
*************

Configure the Clusters
======================

.. seealso::

	:ref:`agent.configure.cluster`

verify the heartbeats and service status are up
===============================================

::

	sudo svcmon

Thaw services
=============

::

	sudo svcmgr thaw

