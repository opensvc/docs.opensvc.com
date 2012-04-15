.. |video-icon| image:: _static/video.png

Collector
*********

Introduction
============

The collector is commercially licensed web 2.0 site available either in SaaS mode or in client-hosted mode. Contact sales@opensvc.com for licensing information.

The collector centralizes the agents data and provides advanced filtering, reporting and accounting features.

Internet collector account configuration
========================================

Account registration the SaaS collector at https://collector.opensvc.com is open to all.

A newly created account has no privilege to see other users services. You have to ask admin@opensvc.com to add filters to your account so you can see your data. Filtering is based on domainnames patterns. You can declare as many domains as you need. The email address you setup during registration is important : it is used by the collector alarming subsystem as a mail sink for services you are responsible of.

Navigation
==========

Data views are accessed through the tabulations in the site's pages header.

.. image:: http://www.opensvc.com/init/static/tabs.png

Views
=====

Views present data as tables.

Each view has:

* A persistent filters selector
* A column selector
* A column filters bar
* A pager
* A csv export tool
* View-specific tools

Persistent filters
------------------

The active filter is stored in database and applied on all collector views. It persists across navigation sessions.  Upon filter selection, the view is reloaded.

Filters can be designed from the :menuselection:`Admin --> Filters` view.

Column selector
---------------

|video-icon| `Watch a video <http://www.youtube.com/watch?feature=player_embedded&v=8PLTJuEOHRs>`_

View columns can be toggled on and off from the column selector. Each view has a default set of column displayed. User column selection is stored in database, thus persistent across user sessions and different browsing devices.

Column filters bar
------------------

|video-icon| `Watch a video <http://www.youtube.com/watch?feature=player_embedded&v=32pyu623U7A>`_

Each column of the table supports filtering. Filters are applied upon ``<enter>`` in any filter box. Filter box expressions are AND'ed. Filter syntax supports :

:command:`%`
  Multiple character wildcard for SQL expressions. Can be used as a header, trailer or in the middle of a pattern (%gie%01%)

:command:`.`
  Single character wildcard for SQL expressions. Can be used as a header, trailer or in the middle of a pattern (%gie%01%)

:command:`&`
  AND multiple patterns (%gie%&%adomain.com)

:command:`|`
  OR multiple patterns (%gie%|%adomain.com)

:command:`!`
  Negate the pattern (!%gie%&%adomain.com)

:command:`empty`
  Select only empty cells (!empty)

:command:`>`
  Select only cells with value superior to specified value or date (>2012-04-01)

:command:`<`
  Select only cells with value inforior to specified value or date (<2012-04-01)

:command:`>=`
  Select only cells with value superior or equal to specified value or date (>=2012-04-01)

:command:`<=`
  Select only cells with value inforior or equal to specified value or date (<=2012-04-01)

Service tabs
------------

In all views, clicking on a service name will open the service tabs to display the most comprehensive data set the collector knows about this service.

.. figure:: http://www.opensvc.com/init/static/doc_collector_svc_tabs.png

properties
++++++++++

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

Sketches service-nodes-storage-sites relationships

.. figure:: http://www.opensvc.com/init/static/doc_collector_svc_tabs_topo.png

Node tabs
---------

|video-icon| `Watch a video <http://www.youtube.com/watch?feature=player_embedded&v=tEqKPRZ4YeA>`_

In all views, clicking on a node name will open the node tabs to display the most comprehensive data set the collector knows about this node.
server, os, mem, cpu, location, power

Information displayed in these tabs are extracted from the asset table. Assets can be loaded from a tiers enterprise asset manager or filled-in manually.

.. figure:: http://www.opensvc.com/init/static/doc_collector_node_tabs.png

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

* The current node ruleset
* The current per-module compliance status of the node
* The modulesets attached to the node

wiki
++++

A per-node wiki page the team responsible member can use to share information relative to the node.

