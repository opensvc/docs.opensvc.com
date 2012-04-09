Application launchers
*********************

Usage
=====

Application launchers are installed in the directory pointed by ``/opt/opensvc/etc/svcnamed.d``. They follow the SysV guidelines:

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

Application can be started and stopped without touching the other service resources with::

	/opt/opensvc/etc/myservice stopapp
	/opt/opensvc/etc/myservice startapp

The ``OPENSVC_SVCNAME`` variable is set by OpenSVC to the service name, so that integrators can write reusable launcher scripts. Examples of this variable usage below.

Common launchers
================

Crontab handler
+++++++++++++++

Services often come with specific schedules. Either they start their own private scheduler, or they use the main system scheduler. In the later case, services' cron jobs must be installed upon service start and removed upon service stop to make sure the jobs don't get scheduled on multiple nodes. The following launcher script can be used to do that on hosts with split crontab support. It installs and removes the crontabs in ``/opt/opensvc/etc/myservice.d/cron.d/``::

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

Example::

	22 23 * * * [ -x /myservice/app/jobs/job1 ] && /myservice/app/jobs/job1
	23 23 * * * [ -x /myservice/app/jobs/job2 ] && /myservice/app/jobs/job2

