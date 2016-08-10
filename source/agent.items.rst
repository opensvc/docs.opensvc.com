Agent installed items
*********************

File tree
=========

.. function:: <OSVCETC>

Hosts service configurations

.. function:: <OSVCTMP>

Temporary, discardable files

.. function:: <OSVCBIN>

Executables like svcmon, svcmgr

.. function:: <OSVCBIN>/pkg

Executables to create package and optional, site-specific, release scripts (none shipped in the opensvc-provided packages)

.. function:: <OSVCVAR>/sync

Where the production nodes of a cluster back up their configuration. These backups are used in case of disaster recovery activation to restore some specific configurations of the production nodes.

.. function:: <OSVCVAR>/lock

Where executables create the lock-files used to ensure two actions can not run simultaneously on the same service.

.. function:: <OSVCDOC>

Embedded documentation. Most importantly the service resources and node configuration reference files, documenting all possible parameters.

.. function:: <OSVCLIB>

Python source code for the core and resource drivers.

.. function:: <OSVCLOG>

Per-service, local, size-rotated, delay-rotated log files. All logs are also multiplexed to stdout and to the collector via xmlrpc, and optionally multiplexed to syslog.

Cron jobs
=========

.. function:: * * * * * [ -x /usr/bin/nodemgr ] && /usr/bin/nodemgr schedulers >/dev/null 2>&1

Run the node and each service schedulers. See the output of ``sudo nodemgr print schedule`` and ``sudo svcmgr print schedule`` for the list of scheduled tasks.

* push the service status and configuration to the collector
* push the node configuration to the collector
* collect performance metrics
* trigger services' internal and user-configured inter-nodes synchronizations

