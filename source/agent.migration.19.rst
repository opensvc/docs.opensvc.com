**NOTICE**
**********

``DEFAULT.autostart_node``
==========================

Any service **without** ``DEFAULT.autostart_node`` will be left in ``frozen`` state after migration. If thawed, the service will be orchestrated according to the placement policy.

**OPTIONAL**
************

Remove hb sections from service configurations
==============================================

heartbeats resources are now deprecated, and must be removed from the service configuration file

To remove rid ``hb#1`` resource from service ``svc1``:

* ``svcmgr -s svc1 delete --rid hb#1`` removes the rid from the service configuration file
* ``svcmgr -s svc1 sync nodes --rid sync#i0`` propagates the updated service configuration file to other node

Once no more services are configured with hb resources, OpenHA can be stopped and uninstalled from system :

* chkconfig/update-rc.d based systems : ``/etc/init.d/{ezha,openha} stop`` and remove package
* systemd based systems : ``systemctl stop opensvc-openha.service`` and remove package

Set ``DEFAULT.orchestrate``
===========================

This parameter is used to

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

Previously used for primary node definition at service startup, this parameter is now obsolete. This feature is now managed by the service placement policy. The placement policy algorithm is responsible of primary node identification, so make sure the placement policy produce the same behaviour.

When using ``nodes_order`` (default) placement policy, the service will start on the first node declared in the ``DEFAULT.nodes`` parameter.

Example::

        nodes=n1 n2 n3  => n1 is the primary node, n2 and n3 are secondary nodes
        nodes=n3 n2 n1  => n3 is the primary node, n2 and n1 are secondary nodes


.. note::

    A 1.8 service without ``DEFAULT.autostart_node`` (meaning no automatic start at boot), would be left in ``frozen`` state after 1.9 migration



Remove the ``<OSVCETC>/{svcname}.cluster`` symlinks
===================================================

As soon as OpenHA does not drive service anymore (no more hb resource), symlink ``<OSVCETC>/{svcname}.cluster`` can be removed

Remove the ``<OSVCETC>/{svcname}.stonith`` symlinks
===================================================

As soon as OpenHA does not drive service anymore (no more hb resource), symlink ``<OSVCETC>/{svcname}.stonith`` can be removed

Set ``node.maintenance_grace_period``
=====================================

A node now announces its entering 'maintenance' upon clean daemon stop and restart.
Peer nodes won't try to take over the services which were running on this node until node.maintenance_grace_period is expired, so the services have a chance to be restarted on the same node after the maintenance is over.

.. note::

    ``node.maintenance_grace_period`` default value is ``90`` seconds

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

for resources you don't want to provision using the opensvc provisioner.
And set your own as a ``pre_provision`` trigger.


Set ``<rid>.shared=true`` in your service configuration files and templates
===========================================================================

on resources you want provisioned on one node only.

Set ``DEFAULT.orchestrate=false`` in your service without hb resource
=====================================================================

to ensure manual service failover. Also ensure that the placement policy meet your expectations. Default placement policy rely on nodes declaration order.
Among all changes in the 1.9 version, one of the most important is that services are now orchestrated **by default**, as soon as a cluster is formed (2 nodes and upper), and the service nodes list is made of at least 2 nodes.

It means the following:

* Any 1.8 service that operate **without** hearbeat resource (manual failover from one node to another) would behave like a HA service as soon as the agent stack is upgraded to 1.9

* In order to avoid a different behaviour after agent migration, it is mandatory to deploy new parameter ``DEFAULT.orchestrate=false`` before starting migration.

Examples :

+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|  Service Type |    V1.8                |   V1.9               |   Comments                                                                              |
+===============+========================+======================+=========================================================================================+
|               | | [DEFAULT]            | | [DEFAULT]          | | we have to disable orchestration because no hb resource in 1.8                        |
| | failover    | | nodes=n1 n2          | | nodes=n2 n1        | | we also have to order nodes accurately to allow service default startup on n2         |
| |   no hb     | | autostart_node=n2    | | orchestrate=false  |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]            | | [DEFAULT]          | | as openha is leading the primary node (n2), no autostart_node is present in 1.8       |
| | failover    | | nodes=n1 n2          | | nodes=n2 n1        | | we just have to order nodes accurately to allow service default startup on n2         |
| | with hb     | |                      | |                    |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]            | | [DEFAULT]          | | we have to disable orchestration to have a kind of static service                     |
| |  flex       | | nodes=n1 n2 n3       | | nodes=n2 n3 n1     | | we also have to order nodes accurately to allow service default startup on n2 and n3  |
|               | | autostart_node=n2 n3 | | flex_min_nodes=2   | | flex_min_nodes ensure that 2 service instances are spawned at service startup         |
|               |                        | | orchestrate=false  |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+

