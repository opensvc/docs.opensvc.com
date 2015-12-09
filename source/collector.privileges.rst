Privileges
**********

Introduction
------------

The collector handles privileges through users special group membership.

A normal collector group contains:

* nodes, through the team responsible property
* application codes
* users

A privilege group can only contain users.

Most actions in the collector are authorized through the combination of the following rules:

* the user must be in the required privilege group
* the user must be in a normal group common with the nodes and services affected by the action

Privilege groups
----------------

CheckExec
+++++++++

Privilege to edit checker instances thresholds for nodes the user is responsible of.

CheckManager
++++++++++++

Privilege to edit checker instances default thresholds and contextual thresholds.

CheckRefresh
++++++++++++

Privilege to trigger a checker refresh on nodes the user is responsible of.

CompExec
++++++++

Privilege to trigger a compliance action (check, fix) on nodes and services the user is responsible of.

CompManager
+++++++++++

Privilege to create rulesets and modulesets, and to assign them normal groups the user is a member of.

Privilege to edit rulesets and modulesets belonging to a group the user is a member of.

DnsManager
++++++++++


Privilege to add, delete, edit zones in the collector's internal dns.

Privilege to add, delete, edit entries in the collector's internal dns.

FormsManager
++++++++++++

Privilege to create forms, to publish and to assign them to normal groups the user is a member of.

Privilege to delete and edit forms assigned to a group the user is a member of.

Manager
+++++++

All privileges are granted, including the privilege to assign privileges.

Members of the Manager privilege group can manage all nodes and services, whatever their ownership.

This privilege can be restricted to breaking-glass accounts.

NetworkManager
++++++++++++++

Privilege to add, delete and edit subnets in the collector's internal subnets table.

NodeExec
++++++++

Privilege to post agent commands through the collector's interfaces.

NodeManager
+++++++++++

Privilege to add nodes in the collector's internal nodes table.

Privilege to delete and edit the nodes the user is responsible of in the collector's internal nodes table.

ObsManager
++++++++++

Privilege to add, delete and edit obsolescence thresholds for hardware server models and operating systems. Those thresholds are used to compute alerts displayed in the dashboard.

ProvisioningManager
+++++++++++++++++++

Privilege to add new service provisioning templates.

Privilege to assign a service provisioning template owned by a group the user is a member of, to additional groups the user is a member of

Privilege to delete and edit service provisioning templates owned by a group the user is a member of.

RootPasswordExec
++++++++++++++++

Privilege to extract the root password from the collector's vault for nodes to user is responsible of.

This action is logged, to permit breaking-glass audits.

StorageManager
++++++++++++++

Privilege to add, delete and edit per-application code storage array disk group usage quotas. These quotas are used to authorized storage volume provioning actions submitted through the collector provisioning drivers.

StorageExec
+++++++++++

Privilege to provision a storage volume through the collector provisioning drivers, in the limits fixed by the application code disk group quota. The user must be responsible for the application code the provisioning action is submitted for.

TagManager
++++++++++

Privilege to create new tags, delete existing tags and modify tags anti-affinity.

