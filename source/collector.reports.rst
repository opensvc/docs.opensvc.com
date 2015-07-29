Reports
*******

Introduction
============

The collector embeds a reporting framework.

Reports are most useful to extract key point indicators and billing metrics from the collector database.

Overview
========

A report is a collection of charts and metrics.

Metrics are datasets extracted, daily or just-in-time, from the collector database using a user-defined SQL request.

Reports are presented to users through the :menuselection:`Statistics --> Reports` menu, and can be accessed directly using each report's direct link.

Privileges
==========

Report, charts and metrics creation requires the ReportManager privilege.

Testing
=======

Report, charts and metrics definitions can be tested individually using the gear-icon on the definition line of their admin view.

Metrics
=======

The dedicated view is :menuselection:`Admin --> Metrics`.

Properties
----------

A metric is defined by the following properties:

* **Name**

  A name to describe the metric.

* **SQL request**

  The SQL request used daily to extract and store the dataset.

* **Value column index**

  If the SQL request has more than one column, set this property to the index of the column containing the value to historize.

* **Instance column index**

  If the SQL request extract a grouped-by dataset, the user will want to include a column containing each group description. This property must then be set to the index of this column. Such dataset are extracted at report rendering, and never historized. We will refer to this type of metric as tabbed metrics.

Honoring filtersets
-------------------

Filtersets with the `stats` property set can influence a metric dataset. For example, a metric dedicated to nodes counting would extract the node count for each `stats`-filterset, and having one of those filtersets as a session filter will make to metric show the dataset for this active filterset.

This can be achieved using in the SQL request the special keywords `%%fset_nodenames%%` or `%%fset_services%%`.

Be aware of the collector resource usage caused by this feature. Many `stats`-filtersets coupled with under-optimized metric SQL-requests can load the collector for a long period each day.

Of note, a filterset has the `stats` property off by default.

Examples
--------

* Historized metric

  Name: compliance fixes per day
  SQL request: select count(id) from comp_log where run_action="fix" and run_date > date_sub(now(), interval 1 day) and run_nodename in (%%fset_nodenames%%)
  Value column index: 0
  Instance column index: (empty)

* Tabbed metric

  Name: nodes per city
  SQL request: select count(id), loc_city from nodes where nodename in (%%fset_nodenames%%) group by loc_city
  Value column index: 0
  Instance column index: 1


Charts
======

The dedicated view is :menuselection:`Admin --> Charts`.

Properties
----------

A chart is defined by the following properties:

* **Name**

  A name to describe the chart.

* **YAML definition**

  The chart definition in YAML format, where the user can point the metrics to aggregate in the chart and set properties like metrics stacking. The structure of the expected YAML is detailled in the next section.

YAML definition
---------------

The expected YAML structure is a dictionnary with the following keys.

Title
+++++

A string describing the chart. This string will be rendered with the chart, unlike the `Name` chart property explained in the previous section.

Options
+++++++

A dictionnary structure supporting the following keys.

* **stack**

  Candidates: ``Yes``, ``No``

  Wether the embedded metrics should be stacked one over the other, or rendered unstacked.

Metrics
+++++++

A list structure. Each member is a dictionnary structure pointing to a metric defined in the :menuselection:`Admin --> Metrics` view, using the following keys.

* **metric_id**

  Type: integer

  The metric `Id` as reported in the :menuselection:`Admin --> Metrics` view.


* **fill**

  Candidates: ``Yes``, ``No``

  Fill the zone under the metric line. To set only for one metric if stacking is disabled.

* **shadow**

  Candidates: ``Yes``, ``No``

  Render a shadow under the metric line or filled-in zone.

Example YAML definition
-----------------------

::

    Title: Nodes per city
    
    Options:
     stack: no
    
    Metrics:
     -
      metric_id: 39
      fill: no
      shadow: yes

Reports
=======

The dedicated view is :menuselection:`Admin --> Reports`.

Properties
----------

A report is defined by the following properties:

* **Name**

  A name to describe the report.

* **YAML definition**

  The report definition in YAML format, where the user can point the metrics and charts to aggregate in the report and set rendering properties. The structure of the expected YAML is detailled in the next section.

YAML definition
---------------

The expected YAML structure is a dictionnary with the following keys.

Title
+++++

A string describing the report. This string will be rendered with the chart, unlike the `Name` chart property explained in the previous section.

Sections
++++++++

A dictionnary structure, supporting the following keys: `Charts` and `Metrics`. Values are a dictionnary structure.

* `Charts` keys: `Title`, `Desc` and `chart_id`
* `Charts` keys: `Title`, `Desc` and `chart_id`

Keys details:

* **Title**

  A string describing the metric or chart.

* **Desc**

  A string detailling or commenting the metric or chart. Optional.

* **chart_id**

  Type: integer

  The chart `Id` as reported in the :menuselection:`Admin --> Charts` view.


* **metric_id**

  Type: integer

  The metric `Id` as reported in the :menuselection:`Admin --> Metrics` view.


Example YAML definition
-----------------------

::

    Title: My report
    
    Sections:
      -
        Metrics:
          -
            Title: Linux release dispatch
            metric_id: 48
    
    Sections:
      -
        Metrics:
          -
            Title: Average RAM per node
            Desc: in megabytes
            metric_id: 49
        Charts:
          -
            Title: Total RAM
            chart_id: 3
  
