Service Application Launchers
*****************************

Introduction
============

An application launcher is a resource. As such, it supports the standard start, stop and status actions. Application resources are also involved in the ``push appinfo`` action. Application launchers can support the following parameters:

+----------------+--------------------+
| Service action | Launcher parameter |
+================+====================+
| start          | start              |
+----------------+--------------------+
| stop           | stop               |
+----------------+--------------------+
| status         | status             |
| print status   |                    |
| json status    |                    |
+----------------+--------------------+
| push appinfo   | info               |
+----------------+--------------------+

As a resource, an application launcher can be defined with a ``<svcname>.env`` section. This method permits complex application scheduling, mixing chaining and parallel execution, timeouts setting and scoping.

For simple cases, the agent also supports a SysV-style launcher definitions.

.. note::
	SysV-style definitions can co-exist with non-conflicting app resources defined in the env file. In case of conflicting definitions, the env file definition takes precedence.

Application Resource Definition
===============================

Section Syntax
--------------

Here is a complete application resource section:

::

	[app#1]
	script = weblogic
	start = 50
	stop = 50
	check = 50
	info = 50
	disable = false
	optional = true
	tags = group1
	subset = web
        # rlimits
        limit_as = 1g
        limit_cpu = 1-4
        limit_core = 1-4
        limit_data = 1g
        limit_fsize = 5t
        limit_memlock = 1k
        limit_nofile = 10k
        limit_nproc = 10k
        limit_rss = 100m
        limit_stack = 10m
        limit_vmem = 100m
                                                                                                                                                                                                              

All these parameters support scoping, using the ``@<nodename>``, ``@nodes``, ``@drpnodes`` and ``@encapnodes`` suffixes.

+------------+---------+---------------------------------------------------------------------------------------------+
| Parameter  | Type    | Role                                                                                        |
+============+=========+=============================================================================================+
| script     | string  | Full path the the app launcher or basename of a launcher in ``etc/<svcname>.d/``.           |
+------------+---------+---------------------------------------------------------------------------------------------+
| start      | integer | Flag the app launcher for execution with the start parameter on service startup.            |
|            |         | The given value is used as the ascending sort key in the resource subset.                   |
|            |         | Omit the parameter to disable app launcher execution on resource start action.              |
+------------+---------+---------------------------------------------------------------------------------------------+
| stop       | integer | Flag the app launcher for execution with the stop parameter on service stop.                |
|            |         | The given value is used as the ascending sort key in the resource subset.                   |
|            |         | Omit the parameter to disable app launcher execution on resource stop action.               |
+------------+---------+---------------------------------------------------------------------------------------------+
| status     | integer | Flag the app launcher for execution with the status parameter on service status evaluation. |
|            |         | The given value is used as the ascending sort key in the resource subset.                   |
|            |         | Omit the parameter to disable app launcher execution on resource status action.             |
+------------+---------+---------------------------------------------------------------------------------------------+
| info       | integer | Flag the app launcher for execution with the info parameter on service push appinfo.        |
|            |         | The given value is used as the ascending sort key in the resource subset.                   |
|            |         | Omit the parameter to disable app launcher execution on resource appinfo action.            |
+------------+---------+---------------------------------------------------------------------------------------------+
| subset     | string  | Add the resource to the specified app subset. In the given example, the full subset name is |
|            |         | subset#app:web                                                                              |
+------------+---------+---------------------------------------------------------------------------------------------+
| limit_*    | string  | Refer to the OS ``man limits.conf``                                                         |
+------------+---------+---------------------------------------------------------------------------------------------+

App Subsets
-----------

* Actions on subsets are chained in alphanumeric subset name order on start, status and info.
* Actions on subsets are chained in reverse alphanumeric subset name order on stop.
* The implicit subset name is ``subset#app``.
* Scripts in a subset are executed either in parallel or serially (default).

Here is a subset section:

::

	[subset#app:web]
	parallel = true


Application can be started and stopped without touching the other service resources with:

::

	sudo svcmgr -s myservice stopapp
	sudo svcmgr -s myservice startapp

The ``OPENSVC_SVCNAME`` variable is set by OpenSVC to the service name, so that integrators can write reusable launcher scripts. Examples of this variable usage below.

Environment variable named ``OPENSVC_IP<n>`` are also set to let app launchers bind the appropriate service ips, for services with instances on different subnets. For example, the service might have a different ip address when starting on the disaster recovery site.

Launcher Scripts Development Guidelines
=======================================

A launcher script should support the following values for argument 1:

+------------+-------------------------------------------------------------------------------------------------------------+
| Arg1       | Description                                                                                                 |
+============+=============================================================================================================+
| start      | Triggers the application startup. The return code must be 0 for a succesful startup, and not 0 otherwise.   |
+------------+-------------------------------------------------------------------------------------------------------------+
| stop       | Triggers the application shutdown. The return code must be 0 for a succesful shutdown, and not 0 otherwise. |
+------------+-------------------------------------------------------------------------------------------------------------+
| status     | Return 0 if the application is up, or any other value if the application is not up. In this later case, the |
|            | agent will report a warn status for the resource.                                                           |
+------------+-------------------------------------------------------------------------------------------------------------+
| info       | Emits on stdout ``key: value`` pairs. These pairs will be reported to the collector for storage, and        |
|            | historization if the value is numeric.                                                                      |
+------------+-------------------------------------------------------------------------------------------------------------+

