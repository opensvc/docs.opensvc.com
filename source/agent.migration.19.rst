**NOTICE**
**********

``DEFAULT.autostart_node``
==========================


**OPTIONAL**
************

Remove hb sections from service configurations
==============================================

heartbeats resources are now deprecated, and should be removed from the service configuration file.

To remove rid ``hb#1`` resource from service ``svc1``:

* ``svcmgr -s svc1 delete --rid hb#1`` removes the rid from the service configuration file
* ``svcmgr -s svc1 sync nodes --rid sync#i0`` propagates the updated service configuration file to other node

Once no more services are configured with hb resources, OpenHA can be stopped and uninstalled from system :

* chkconfig/update-rc.d based systems : ``/etc/init.d/{ezha,openha} stop`` and remove package
* systemd based systems : ``systemctl stop opensvc-openha.service`` and remove package

Set ``DEFAULT.orchestrate``
===========================

Depending on your 1.8 service behavior, you have to check that they are correctly setup so as to keep working as previously

Possible values:

* ``no``
    * use this setting for all 1.8 services **without** ``DEFAULT.autostart_node``
* ``start``
    * use this setting for all 1.8 services **with** ``DEFAULT.autostart_node``
* ``ha``
    * use this setting for all 1.8 services under OpenHA control

.. seealso:: :ref:`default_orchestrate`


Set ``DEFAULT.placement``
=========================

This parameter is used to set a service instances placement policy. It is used to identify which node is the most appropriate to start the service.

Possible values:

* ``nodes order`` : the left-most available node is allowed to start a service instance
* ``load avg``    : the least loaded node, taken from system load averages in the past 15 minutes

.. note::

    ``DEFAULT.placement`` default value is ``nodes order``

Set ``DEFAULT.constraints``
===========================

An expression evaluating as a boolean, constraining the service instance placement by the daemon monitor to nodes with the constraints evaluated as True.
The osvcd monitor now filter the list of service nodes to discard the nodes in constraints violation, and applies the placement policy to the resulting list.

Supported syntax:

* comparison operators are '==', '!=', '>', '>=', '<=', 'in (e1, e2)', 'in [e1, e2]'
* arithmetic operators are '*', '+', '-', '/', '**', '//', '%'
* binary operators are '&', '|', '^'
* negation operator is 'not'
* boolean operators are 'and', 'or'
* references are allowed
* Strings, and references evaluating as strings, containing dots must be quoted

Examples:

* constraints = $("{nodename}"=="node2.acme.com")
* constraints = $("{nodename}"=="node1" or "{node.env}" in (DEV, TST))

.. note::

    * The constraints are not honored by manual start operations.
    * The constraints violation notification is added to "print status" and "json status" outputs

Rename ``DEFAULT.affinity`` to ``DEFAULT.hard_affinity``
========================================================

Use in context of affinity between services., where a service svc1 should be run on same node 

Assuming svc1 and svc2 are tied to each other, we expect that those 2 services run on the same node

Example for ``svc2``::

    [DEFAULT]
    hard_affinity = svc1


Rename ``DEFAULT.anti_affinity`` to ``DEFAULT.hard_anti_affinity``
==================================================================

Remove ``DEFAULT.autostart_node``
=================================

Previously used for primary node definition at service startup, this parameter is now obsolete. This feature is now managed by the service placement policy and ``orchestrate``. The placement policy algorithm is responsible of primary node identification, so make sure the placement policy produce the same behaviour.

When using ``nodes order`` (default) placement policy, the service will start on the first node declared in the ``DEFAULT.nodes`` parameter.

Example::

        nodes=n1 n2 n3  => n1 is the primary node, n2 and n3 are secondary nodes
        nodes=n3 n2 n1  => n3 is the primary node, n2 and n1 are secondary nodes


.. note::

    A 1.8 service without ``DEFAULT.autostart_node`` (meaning no automatic start at boot), would be left in ``frozen`` state after 1.9 migration



Remove the ``<OSVCETC>/{svcname}.cluster`` symlinks
===================================================

As soon as OpenHA does not drive service anymore (no more hb resource), symlink ``<OSVCETC>/{svcname}.cluster`` is automatically removed.

Remove the ``<OSVCETC>/{svcname}.stonith`` symlinks
===================================================

As soon as OpenHA does not drive service anymore (no more hb resource), symlink ``<OSVCETC>/{svcname}.stonith`` is automatically removed.

Set ``node.maintenance_grace_period``
=====================================

A node now announces its entering 'maintenance' upon clean daemon stop and restart. A node reboot is a clean stop too.
Peer nodes won't try to take over the services which were running on this node until ``node.maintenance_grace_period`` is expired, so the services have a chance to be restarted on the same node after the maintenance is over.

.. note::

    ``node.maintenance_grace_period`` default value is ``60`` seconds

Set ``node.rejoin_grace_period``
================================



.. note::

    ``node.rejoin_grace_period`` default value is ``90`` seconds

**MANDATORY**
*************

Replace ``optional_on``, ``monitor_on``, ``enable_on`` and ``disable_on`` by their equivalent scoped ``optional``, ``monitor``, ``enable`` and ``disable``
==========================================================================================================================================================


Replace ``sync[rsync].exclude`` by their equivalent ``sync[rsync].options``
===========================================================================

Replace ``DEFAULT.service_env`` by their equivalent ``DEFAULT.env``
===================================================================

Set ``<rid>.provision=false`` in your **templates**
===================================================

For resources you don't want to provision using the opensvc provisioner.
And set your own as a ``pre_provision`` trigger.


Set ``<rid>.shared=true`` in your service configuration files and templates
===========================================================================

On resources you want provisioned on one node only.

Set ``DEFAULT.orchestrate=false`` in your service without hb resource
=====================================================================

This parameter is used to restrict or allow the daemon orchestration capabilities for the service.

If not set explicitely, the ``orchestrate`` value defaults to ``no``, disabling all start orchestration.

The other valid values, ``start`` and ``ha``, require that you also set and configure the service placement policy. The default ``placement``, ``nodes order``, ranks the nodes respecting the user-defined order of the ``nodes`` and ``drpnodes`` keyword.

Users can change the ``orchestrate`` value online at any moment. For example activating ha on a service can be done with::

	$ sudo svcmgr -s svc1 set --kw orchestrate=ha

Any 1.8 service with **no** hearbeat resource (manual failover) can behave like a HA service as soon as the agent stack is upgraded to 1.9

Conversion table:

+---------------+--------------------------+-----------------------+-----------------------------------------------------------------------------------------+
|  Service Type |    V1.8                  |   V1.9                |   Comments                                                                              |
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

