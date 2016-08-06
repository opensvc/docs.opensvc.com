Service application launchers
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

Application resource definition
===============================

Section syntax
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

About subsets
-------------

* Actions on subsets are chained in alphanumeric subset name order on start, status and info.
* Actions on subsets are chained in reverse alphanumeric subset name order on stop.
* The implicit subset name is ``subset#app``.
* Scripts in a subset are executed either in parallel or serially (default).

Here is a subset section:

::

	[subset#app:web]
	parallel = true


SysV-style launcher definition
==============================

Application launchers are installed in the directory pointed by ``<OSVCETC>/<svcname>.d``. They follow the SysV guidelines:

+----------------+--------------------------+-----------------------------------------------------------------------------+
| File name      | Action                   | Description                                                                 |
+================+==========================+=============================================================================+
| mylauncher     | N/A                      | The launcher script proper                                                  |
+----------------+--------------------------+-----------------------------------------------------------------------------+
| S10mylauncher  | start                    | A symlink to mylauncher marking the script for schedule upon service start  |
+----------------+--------------------------+-----------------------------------------------------------------------------+
| K90mylauncher  | stop                     | A symlink to mylauncher marking the script for schedule upon service stop   |
+----------------+--------------------------+-----------------------------------------------------------------------------+
| C90mylauncher  | status                   | A symlink to mylauncher marking the script for schedule upon service status |
+----------------+--------------------------+-----------------------------------------------------------------------------+

In containers and virtual machines OpenSVC the launchers are installed in ``/svc/etc/init.d/`` in the container file tree.

Application can be started and stopped without touching the other service resources with:

::

	sudo svcmgr -s myservice stopapp
	sudo svcmgr -s myservice startapp

The ``OPENSVC_SVCNAME`` variable is set by OpenSVC to the service name, so that integrators can write reusable launcher scripts. Examples of this variable usage below.

Environment variable named ``OPENSVC_IP<n>`` are also set to let app launchers bind the appropriate service ips, for services with instances on different subnets. For example, the service might have a different ip address when starting on the disaster recovery site.

Launcher scripts development guidelines
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

Common launchers
================

Crontab handler
---------------

Services often come with specific schedules. Either they start their own private scheduler, or they use the main system scheduler. In the later case, services' cron jobs must be installed upon service start and removed upon service stop to make sure the jobs don't get scheduled on multiple nodes. The following launcher script can be used to do that on hosts with split crontab support. It installs and removes the crontabs in ``/opt/opensvc/etc/myservice.d/cron.d/``:

::

	#!/bin/bash

	cron_d=/$OPENSVC_SVCNAME/etc/init.d/cron.d
	cf=

	[ "$OPENSVC_SVCNAME" = "" ] && {
		echo "\$OPENSVC_SVCNAME must be set"
		exit 1
	}

	function check_crontab {
		find $cron_d/$1 -user root -a -group root -a -perm -o-w | grep $1 >/dev/null 2>&1 && return 0
		cat $cron_d/$1 | cut -f6 | grep root >/dev/null 2>&1 && return 1
		return 0
	}

	function add_crontab {
		if [ "${cf/$1//}" != "$cf" ] ; then
			echo $cf
			return
		fi
		if ! check_crontab $1 ; then
			echo "discard $1 because of security risks" >&2
			echo $cf
			return
		fi
		echo "$cf $1"
	}

	function get_crontabs {
		for c in $(ls $cron_d | grep -v '\.') ; do
			if [ -f $c.$HOSTNAME ] ; then
				add_crontab $c.$HOSTNAME
			else
				add_crontab $c
			fi
		done
	}

	case $1 in
	start)
		for cf in $(get_crontabs) ; do
			cp -f $cron_d/$cf /etc/cron.d/$OPENSVC_SVCNAME.$cf
			chown root:root /etc/cron.d/$OPENSVC_SVCNAME.$cf
			echo "installed $cf as /etc/cron.d/$OPENSVC_SVCNAME.$cf"
		done
		;;
	stop)
		rm -f /etc/cron.d/$OPENSVC_SVCNAME.*
		;;
	esac

Note that an additional safety net is needed to keep the cron jobs from failing after a node unclean reboot: all cron jobs must verify the presence of their executable file.

Example:

::

	22 23 * * * [ -x /myservice/app/jobs/job1 ] && /myservice/app/jobs/job1
	23 23 * * * [ -x /myservice/app/jobs/job2 ] && /myservice/app/jobs/job2

