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

* **metric_path**

  Type: path with ``/`` as the dir separator

  A metric whisper file path, rooted to the collector's ``stats/`` directory. A metric section can contain either ``metric_id`` or ``metric_path`` but not both. Using ``metric_path`` the report designer can chart any combination of metrics coming from:

  * the services resources info: ``/nodes/<node_id>/services/<svc_id>/resources/<rid>/info/<metric>``. Example: ``/nodes/a3d3634b-51d1-4ce7-a844-6daa6cc49280/services/40a88ec5-cb9c-440a-bd65-54b7713ab108/resources/sync#i0/info/speed``.
  * checkers: ``/nodes/<node_id>/checks/<svc_id>:fs_u:<uuencoded check instance>.wsp``. Example: ``/nodes/a3d3634b-51d1-4ce7-a844-6daa6cc49280/checks/40a88ec5-cb9c-440a-bd65-54b7713ab108:fs_u:L29wdC90ZXN0bWQvdGVzdGRzMQ==.wsp``
  * the node performance metrics: ``/nodes/<node_id>/<performance group>/<metric>``. Example: ``/nodes/a3d3634b-51d1-4ce7-a844-6daa6cc49280/block/rbps``


* **label**

  Type: string

  The label representing the metric in the chart legend.

* **fill**

  Candidates: ``Yes``, ``No``

  Fill the zone under the metric line. To set only for one metric if stacking is disabled.

* **shadow**

  Candidates: ``Yes``, ``No``

  Render a shadow under the metric line or filled-in zone.

* **unit**

  Type: string

  The unit to use when formatting the metric instance values. Example: "MB". Defaults to an empty string.

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

A dictionnary structure, supporting the following keys `Title`, `Desc` and `children`.

Keys details:

* **children**

  A list of dictionnary structures. Each dictionnary can describe a chart or a metric

  * Chart keys: `Title`, `Desc` and `chart_id`

  * Metric keys: `Title`, `Desc` and `metric_id`

  * **width**

    The width in percent of the section element. Of note the padding and margin of elements are set to 1%, so the width must compensate for this, substracting 4% to each element width. For example to render a chart and a metric in 2/3 - 1/3 layout, the width should be set to 62% and 29%, the remaining 8% being used by 4 * 1% margins and 4 * 1% paddings.

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
        children:
          -
            Title: Linux release dispatch
            metric_id: 48
            width: 100%
    
      -
        Title: RAM
        Desc: All about memory
        children:
          -
            Title: Average RAM per node
            Desc: in megabytes
            metric_id: 49
            width: 62%
          -
            Title: Total RAM
            chart_id: 3
            width: 29%
  
