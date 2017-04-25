Service tasks
=============

Each service embeds its own scheduling table.
Some scheduled tasks are automatically configured:

* data synchronization
* resource information push to the collector
* service configuration push to the collector
* service and resource status push to the collector
* compliance run

Other tasks can be defined by the users.

Tasks Features
**************

* tasks don't need to be added to the system's scheduler, thus can be provisioned along with the service
* tasks follow the service relocations
* tasks can can be disabled, scoped, unscheduled
* tasks runs can be conditionned by a specific service state. Only run on the active instance of a failover for example.
* tasks can be run manually
* tasks can run impersonated as a specified user
* tasks can have cron-style schedule, anacron-style, networker-style schedule definition

Typical Use-Cases
*****************

* embed scheduled tasks in a failover service to not have to swith-over the cronjobs
* embed complex commands as scheduled or unschedule tasks to ease and secure their use (ex: backups of dockerized databases, run a dockerized mysql client with predefinited args)

Tasks Operations
****************

Print a service tasks and their scheduling status
+++++++++++++++++++++++++++++++++++++++++++++++++

::

	$ sudo svcmgr -s testmd print schedule
	action                 last run               config parameter          schedule definition
	------                 --------               ----------------          -------------------
        ...
	task#0                 -                      task#0.schedule           -
	task#1                 2016-11-28 04:01:00    task#1.schedule           @10

Manually run a task
+++++++++++++++++++

All service tasks

::

	$ sudo svcmgr -s testmd run

One specific task

::

	$ sudo svcmgr -s testmd run --rid task#0

All tasks with the backup tag

::

	$ sudo svcmgr -s testmd run --rid task --tags backup

Task Configuration
******************

::

	[task#0]
	command = id
	user = admin

The complete reference is available :doc:`here <agent.template.task.conf>`.
