.. index:: tabs

Objects tabulations
*******************

Introduction
============

Major object types have a dedicated tabulation collection representation. These collections present the most detailled level of information about the object.

The first tab of the collection is always "properties", which presents the object properties and its relations to other object types represented as tag clouds.

The other tabs are either:

* Tables, normally accessed trough the navigation menu, but pre-filtered to display only the information relating to the object (ex: node logs, service actions).
* Dedicated data analysis tools (ex: service topology diagram, node statistics)
* Dedicated design tools (ex: filterset designer)
* A wiki editor to comment on the object (ex: node, service)
* A change tracker allowing object changes audit and rollback (ex: form, provisioning template)

Conventions
===========

* The tabs are opened by clicking or double-clicking (for tag representation) the object name or id wherever it is displayed: search results, table cells, tab content, flash barel
* The tabs are displayed in the flash header panel
* Clicking the title of an already open tab reloads its content.

Collections
===========

Service tabs
------------

properties
++++++++++

.. figure:: _static/doc_collector_svc_tabs.png

:command:`opensvc version`

  Pushed to database daily by the opensvc nodeware cronjob.

:command:`unackowledged errors`

  A count of the unacknowledged errors on this service found in the actions table.

:command:`type`

  Service type can be PRD, DEV, ...

:command:`comment`

  Pushed to database daily by the opensvc nodeware cronjob. This information resides in the service env file on the nodes.

:command:`last update`

  Timestamp updated upon service information receive from the nodeware cronjob.

:command:`container name`

  Host Name of the virtual machine encapsulated in the service, if any.

:command:`container type`

  Virtualisation driver to handle the encapsulated virtual machine, if any.

:command:`responsibles`

  List of administrators contact names for this service.

:command:`responsibles mail`

  List of administrators contact emails for this service.

:command:`primary node`

  Host name of the node where the service should be running in optimal situation.

:command:`nodes`

  All nodes where the service may be running in degraded situation (not in disaster recovery situation).

:command:`drp node`

  Host name of the node the service should be running in a disaster recovery situation.

:command:`drp nodes`

  All nodes where the service may be running in disaster recovery situation.

:command:`status`

  Display the per-node synthetic service status.

resources
+++++++++

Display the per-node per-resource detailled service status.

env
+++

Display the raw service configuration file pushed by the nodeware.

topology
++++++++

A diagram of apps, resources, service, nodes, storage, locations relations.

.. figure:: _static/doc_collector_svc_tabs_topo.png

Node tabs
---------

properties
++++++++++

.. figure:: _static/doc_collector_node_tabs.png

Asset information can be loaded from a tiers enterprise asset manager or filled-in manually.

stats
+++++

Generate and display graphs of performance metrics on the user-selected time range. The metrics are gathered daily from tools like glance and sar running on the nodes. The opensvc agent pushes this information to database.

Metrics collection depend on the operating system. Some of them are:

*   cpu: usr, sys, wait, irq, guest, steal, idle, nice, iowait, soft

*   mem: commit, free, used by usr, buffer, cache, sys

*   swap: free, used, used but cached

*   load: avg1, avg5, avg15, runq size, proc list size

*   all-disks: io/s, bandwidth

*   per-disk: io/s, request size, wait time, service time, %util, bandwidth

compliance
++++++++++

Displays:

* The node rulesets and modulesets attachments
* The current per-module compliance status of the node
* Compliance alerts details

wiki
++++

A per-node wiki page team responsible members can use to share information related to the node.

