Installed items details
***********************

File tree
=========

.. function:: /opt/opensvc/etc

Hosts service configurations

.. function:: /opt/opensvc/tmp

Temporary, discardable files

.. function:: /opt/opensvc/bin

Executables like svcmon, svcmgr

.. function:: /opt/opensvc/bin/pkg

Executables to create package and optional, site-specific, release scripts (none shipped in the opensvc-provided packages)

.. function:: /opt/opensvc/bin/cron

Hosts the (daily by default) cron job responsible for the service configurations gathering/pushing to collector, and for the rsync data synchronization to remote nodes. Note that even if no syncs are explicitely described in service configurations, there are still rsyncs scheduled for service and node configuration replication between nodes of a cluster.

.. function:: /opt/opensvc/var/sync

Where the production nodes of a cluster back up their configuration. These backups are used in case of disaster recovery activation to restore some specific configurations of the production nodes.

.. function:: /opt/opensvc/var/lock

Where executables create the lock-files used to ensure two actions can not run simultaneously on the same service.

.. function:: /opt/opensvc/usr/share/doc

Embedded documentation. Most importantly the service configuration reference file documenting all possible parameters.

.. function:: /opt/opensvc/lib

Libraries implementing the nodeware logics

.. function:: /opt/opensvc/log

Per-service, local, size-rotated, delay-rotated log files. All logs are also multiplexed to stdout and to the collector via xmlrpc

Cron jobs
=========

.. function:: 0,10,20,30,40,50 * * * * [ -x /opt/opensvc/bin/svcmon ] && /opt/opensvc/bin/svcmon --updatedb --maxdelaydb 120 >/dev/null 2>&1

Pushes the service per-resource status to the collector via xmlrpc

.. function:: 0,10,20,30,40,50 * * * * [ -x /opt/opensvc/bin/cron/opensvc ] && /opt/opensvc/bin/cron/opensvc >/dev/null 2>&1

Pushes the service and node configuration to the collector via xmlrpc, and triggers internal and user-configured rsyncs. Customized frequencies are preserved upon package upgrades.

.. function:: 0,10,20,30,40,50 * * * * root [ -x /opt/opensvc/bin/perfagt.Linux ] && /opt/opensvc/bin/perfagt.Linux >/dev/null 2>&1

Operating system specific performance metrics gathering. Extends what the operating system provides by default, for example ``sar`` on Linux, FreeBSD and Solaris, ``glance`` on HP-UX.

