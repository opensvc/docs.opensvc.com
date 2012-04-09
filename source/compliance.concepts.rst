Concept
*******

Introduction
============

The "compliance" concept is all about mesuring the adherence of the hosts' configurations to the site's rules. The goals are:

* Auditable host configurations
* Ease change management
* Use auditable scripts to apply changes to your hosts
* Fast and reliable nodes and services provisioning

OpenSVC implements a versatile compliance framework. It allows administrators to describe the corporate server configuration ruleset in a central, auditable place. OpenSVC agent modules compare the actual server configuration to the expected configuration and log the result to the collector.

.. figure:: http://www.opensvc.com/init/static/comp_infra.png
   :align:  center

   Compliance framework workflow

The compliance framework can be used for host post-installation. This strategy ensures a new delivered host is compliant with the current rulesets and is checked for drift afterwards.

.. figure:: http://www.opensvc.com/init/static/comp_cycle.png
   :align:  center

Compliance conceptual objects
=============================

.. figure:: http://www.opensvc.com/init/static/comp_objects.png
   :align:  right

The compliance framework uses 3 types of obects.

.. function:: Rulesets, Rules

    * Rules are variable/value pairs exported in the execution environment of the modules.
    * A rule value can be complex, for example a json-serialized dictionnary. OpenSVC ships with python objects for you to use in your modules and corresponding collector wizard. These objects use such complex rules without you facing the complexity.
    * Rules are grouped into rulesets.
    * Rulesets can be explicitely attached to nodes.
    * Rulesets can be contextually attached to nodes through a filterset.

.. function:: Filtersets, Filters

    * A filter is a SQL-like condition on information available to the collector.
    * Filterable information is grouped into 3 categories : node, service and service status.
    * Available operators are ``>``, ``<``, ``=``, ``!=``, ``IN`` and ``LIKE``
    * Filters must be grouped into filtersets.
    * Filtersets can be grouped into filtersets.
    * Upon grouping, the designer must choose a ``AND`` or ``OR`` logical operator and the components ordering

.. function:: Modulesets, Modules

    * Apply and verify the rules.
    * Modules are grouped into modulesets
    * Modulesets are explicitely attached to nodes
    * All matching rulesets' rules are visible to all modules of attached modulesets
    * Each module picks the rules it is coded to pick

	
Collector compliance views
==========================

Collector's interfaces to analyze compliance data and to configure the framework are all grouped in the menu ``Views > Compliance``.

Switch between compliance sub-views using the menu:

.. figure:: http://www.opensvc.com/init/static/comp_menu.png
   :align:  center

Status
------

This sub-view has 4 stacked panels. The top 3 are folded upon page load.

Per-module compliance status
++++++++++++++++++++++++++++

This panel present the compliant/not-compliant status aggregated by module.

.. figure:: http://www.opensvc.com/init/static/comp_status_module.png
   :align:  center

.. function:: Module column

   The module name.

.. function:: Total column

   The number of nodes checked by this module.

.. function:: Ok column

   The number of nodes passing the compliance checks of the module.

.. function:: Percent column

   100 * Ok / Total.

.. function:: History column

   Week over week plot of ok/not ok/not applicable status returned by modules for the node. The plotted status are the worst case in the week, meaning if a module returned 'not ok' then 'ok' during week 50, only 'not ok' will be accounted.

Per-service compliance status
+++++++++++++++++++++++++++++

This panel present the compliant/not-compliant status aggregated by service.

.. function:: Service column

   The service name.

.. function:: Total column

   The number of modules checked for this service.

.. function:: Ok column

   The number of modules passing the compliance checks for this service.

.. function:: Percent column

   100 * Ok / Total.

.. function:: History column

   Week over week plot of ok/not ok/not applicable status returned by modules for the service. The plotted status are the worst case in the week, meaning if a module returned 'not ok' then 'ok' during week 50, only 'not ok' will be accounted.

Per-node compliance status
++++++++++++++++++++++++++

This panel present the compliant/not-compliant status aggregated by node.

.. figure:: http://www.opensvc.com/init/static/comp_status_node.png
   :align:  center

.. function:: Node column

   The node name.

.. function:: Total column

   The number of modules run on the node.

.. function:: Ok column

   The number of modules passing compliance checks.

.. function:: Percent column

   100 * Ok / Total.

.. function:: History column

   Week over week plot of ok/not ok/not applicable status returned by modules for the node. The plotted status are the worst case in the week, meaning if a module returned 'not ok' then 'ok' during week 50, only 'not ok' will be accounted.

Detailled compliance status
+++++++++++++++++++++++++++

This panel present the compliant/not-compliant status without aggregation. It can be used to filter the dataset aggregated in the above panels.

.. figure:: http://www.opensvc.com/init/static/comp_status_details.png
   :align:  center

.. function:: Date column

   The module run date on the node.

.. function:: Node column

   The node name.

.. function:: Module column

   The compliance  module name.

.. function:: Action column

   The module action which returned the logged status. Always 'check' in this view.

.. function:: Status column

   The module check run status. Can be 'ok' (0), 'not ok' (1) or 'not applicable' (2).

.. function:: History column

   A run over run status sparkline. This columns present no timeline information.

Logs
----

This sub-view presents raw logs of the compliance modules runs on every nodes. It can be used to analyze failure patterns.

.. figure:: http://www.opensvc.com/init/static/comp_log.png
   :align:  center

.. function:: Run date column

   The module action run date on the node.

.. function:: Node column

   The node name.

.. function:: Module column

   The compliance module name

.. function:: Action column

   The module action which returned the logged status. Can be 'check', 'fixable' or 'fix'.

.. function:: Status column

   The module action run status. Can be 'ok' (0), 'not ok' (1) or 'not applicable' (2).

.. function:: Log column

   The output of the compliance module for the run.

Rules
-----

Rules are expressed as variable/value pairs. Rules can be grouped into rulesets. Only members of the 'CompManager' group are allowed to create or edit rulesets.
Contextual rulesets

Contextual ruleset variables are exported to the group of nodes matching the ruleset's filterset.
Explicit rulesets

Explicit ruleset variables are exported only to nodes explicitely attached to the ruleset. This attachment can be configured either through the collector interface (Described below), or through the agent command line tools::

	# nodemgr compliance attach ruleset --ruleset rset1

Create an empty ruleset
+++++++++++++++++++++++

* Click 'Create ruleset'
* Choose a unique ruleset name
* Choose contextual/explicit
* Click 'Submit'

The new ruleset now appears in the ruleset list, ready to receive variables.

Add variables
+++++++++++++

* Click 'Add variable'
* Choose a variable name
* Choose a variable value
* Click 'Submit'

Edit variables
++++++++++++++

* Click either the variable name or the variable value top-right 'edit' icon
* Edit the input or content
* Press 'Enter' to save the change

Attach filterset
++++++++++++++++

If the ruleset is contextual, the following procedure attach a filter to the ruleset.

* Click 'Attach filterset'
* Choose a pre-existing filterset from the list box
* Click 'Submit'

Clone ruleset
+++++++++++++

Cloning a ruleset helps administrators who want their rulesets immutable : when a variable change is needed, the administrator clones the ruleset and apply the change to the clone. This governance policy implies ruleset names are versioned.

* Click 'Clone ruleset'
* Choose a pre-existing ruleset from the list box
* Choose a name for the cloned ruleset
* Click 'Submit'

Attach rulesets to nodes
++++++++++++++++++++++++

This facility is offered by the bottom tables of the ruleset view. The table filters are useful to select the nodes efficiently.

* Check the nodes in the left-side table
* Check the rulesets in the right-side table
* Click 'Attach ruleset'

Filters
-------

The filters view allow compliance administrators to create complex filtersets to limit the ruleset scope to a specific node cursor. All fields from the node asset table can be combined.

A typical filterset would be 'All Red Hat 4 servers whose team responsible is SomeTeam'.

A filterset is a combination of filters or filtersets. Filters are created through the top table and filterset created through the bottom table. Only member of the 'CompManager' group are allowed to create or edit filters.

Create a filter
+++++++++++++++

* Click 'Create filter'
* Choose a table name. Available table names: 'nodes'
* Choose a field name. Available field names: 'warranty_end', 'status', 'role', 'environnement', 'mem_bytes', 'mem_banks', 'mem_slots', 'os_vendor', 'os_name', 'os_kernel', 'os_release', 'os_arch', 'cpu_freq', 'cpu_dies', 'cpu_cores', 'cpu_model', 'cpu_vendor', 'type', 'nodename', 'team_responsible', 'serial', 'model', 'loc_addr', 'loc_city', 'loc_zip', 'loc_rack', 'loc_floor', 'loc_country', 'loc_building', 'loc_room', 'power_supply_nb', 'power_cabinet1', 'power_cabinet2', 'power_protect', 'power_protect_breaker', 'power_breaker1', 'power_breaker2', 'updated'
* Choose an operator. Available operators: '=', 'LIKE', 'NOT LIKE', '<', '<=', '>', '>=', 'IN', 'NOT IN'
* Set a filter value. The wildcard character for the 'LIKE' and 'NOT LIKE' operators is '%'. List values for the 'IN' and 'NOT IN' operators are comma-separated.

Create a filterset
++++++++++++++++++

Filtersets are created empty, then filters or filtersets are attached to the new filterset.

* Click 'Create filterset'
* Set a filterset name
* Click on 'Submit'

Populate a filterset
++++++++++++++++++++

* Click 'Attach filterset' or 'Attach filter'
* Choose the filterset to attach to in the list box
* Choose the filterset or filter to attach in the list box
* Set a logical operator to combine the filter/filterset with. Available logicial operators: 'AND', 'OR'.
* Optionally set an order. Defaults to '0'. Ordering is important when you mix 'AND' and 'OR' in the same filterset
* Click on 'Submit'

Best practice
+++++++++++++

It is recommended for readability to define filtersets combining with only one logical operator (only ANDs or ORs). For example, a filterset implementing 'all Linux or HP-UX servers whose team responsible is SOMETEAM should be implemented as 2 encapsulated filtersets:

* filter1: 'nodes.os_name = HP-UX'
* filter2: 'nodes.os_name = Linux'
* filter3: 'nodes.team_responsible = SOMETEAM'
* filterset1: filter1 OR filter2
* filterset2: filterset1 AND filter3

Of course, more explicit filterset names are recommended.

Modules
-------

The modules view allow compliance administrators to group modules into modulesets. The modulesets can then be attached to nodes through the nodemgr command line::

	# nodemgr compliance attach moduleset --moduleset modset1

Only member of the 'CompManager' group are allowed to create or edit modulesets.
