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

.. toctree::
   :maxdepth: 2

   collector.tabs.app
   collector.tabs.node
   collector.tabs.service


