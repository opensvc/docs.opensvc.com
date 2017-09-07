Service Management
******************

Selecting Services
==================

All Services
++++++++++++

::

	sudo svcmgr ls

Single Service
++++++++++++++

::

	sudo svcmgr ls -s <svcname>
        # or
	sudo <svcname> ls

List All Services
+++++++++++++++++

::

	sudo svcmgr ls -s svc1,svc2

Services by State
+++++++++++++++++

::

	sudo svcmgr ls --status down

List all services in 'down' state.

::

	sudo svcmgr ls --status up,warn

List all services in 'up' and 'warn' state.

Service Selector Expressions
++++++++++++++++++++++++++++

::

        svcmgr ls -s <expr>[+<expr>...]

Where ``<expr>`` is:

* ``<svcname glob pattern>``
* ``<param><op><value>``

Where ``<param>`` is:

* ``<rid>.<key>`` in a service config file
* ``<group>.<key>`` in a service config file, where ``<group>`` is a driver group name like disk, fs, task, ...
* ``<key>`` in the service config file header

Where ``<op>`` is:

* ``+`` as the AND expression separator
* ``<`` ``>`` ``<=`` ``>=`` ``=`` operators
* ``:`` as a existance test operator (empty value)
* ``!`` as a negation operator
* ``~`` as a regexp operator

Examples:

services with name ending with dns or starting with ha and with
an app resource with a timeout set superior to 1::

        $ sudo svcmgr -s '*dns,ha*+app.timeout>1' ls
        ha1
        ha2
        ha3
        pridns

Services with at least one ip resource and one task resource::

        $ sudo svcmgr -s 'ip:+task:' ls
        ha1
        ha2
        ha3
        registry


Services status
===============

::

        sudo svcmon

Overview of the status of all services this configured on the node.

::

        sudo svcmgr -s <svcname> print status``

Detailled service resources status.

Actions
=======

Base Actions
++++++++++++

Start
-----

::

        sudo svcmgr -s <svcname> start --local

Start the local service instance, shortcutting the orchestrator.
Resources start order is ip, disk, fs, share, container, app.

::

        sudo svcmgr -s <svcname> start [--wait] [--time <duration expr>]

Tell the orchestrator to start the service on the nodes the placement policy and constraints choose.

By default, the svcmgr command returns as soon has to daemon has acknowedged the order. With ``--wait``, svcmgr will wait for the action completion before returning. ``--time`` set a maximum wait time.

Stop
----

::

        sudo svcmgr -s <svcname> stop --local

Stop the local service instance, shortcutting the orchestrator.
Resources stop order is app, container, share, fs, disk, ip.

::

        sudo svcmgr -s <svcname> stop [--wait] [--time <duration expr>]

Tell the orchestrator to stop the service wherever it runs and freeze it so it is not restarted.

By default, the svcmgr command returns as soon has to daemon has acknowedged the order. With ``--wait``, svcmgr will wait for the action completion before returning. ``--time`` set a maximum wait time.

Relocation
----------

::

        sudo svcmgr -s <svcname> switch --node <nodename>

Tell the orchestrator to stop the service wherever it runs and start it on <nodename>.

::

        sudo svcmgr -s <svcname> takeover

Tell the orchestrator to stop the service wherever it runs and start it on the local node.


::

        sudo svcmgr -s <svcname> giveback

Tell the orchestrator to stop the service wherever it runs and start it on the node elected by the placement policy and constraints.


Sync
----

::

        sudo svcmgr -s <svcname> sync all

Run the sync resources replication to all targets, either prd or drp.

::

        sudo svcmgr -s <svcname> sync nodes

Trigger hard-coded and user-defined file synchronization to secondary nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

::

        sudo svcmgr -s <svcname> sync drp

Trigger hard-coded and user-defined file synchronization to disaster recovery nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

.. seealso:: :ref:`agent-service-sync`

Run
---

::

        sudo svcmgr -s <svcname> run

Run tasks.

.. seealso:: :ref:`agent-service-tasks`

Resource Filtering
++++++++++++++++++

::

        sudo svcmgr -s <svcname> --rid <rid>[,<rid>,...] <action>

Execute ``<action>`` on ``<svcname>`` resources specified by ``--rid``.

::

        sudo svcmgr -s <svcname> --tags tag1,tag2 <action>

Execute ``<action>`` on ``<svcname>`` resources tagged with either tag1 or tag2.

::

        sudo svcmgr -s <svcname> --tags tag1+tag2,tag3 <action>

Execute ``<action>`` on ``<svcname>`` resources tagged with both tag1 or tag2 or with tag3.

::

        sudo svcmgr -s <svcname> --subsets s1,s2 <action>

Execute ``<action>`` on ``<svcname>`` resources in subset s1 or s2


Group actions
+++++++++++++

::

        sudo svcmgr -s <svcname> startdisk

Start resources of type loop, disk group, zpool, fs

::

        sudo svcmgr -s <svcname> stopdisk

Stop resources of type fs, zpool, disk group, loop

::

        sudo svcmgr -s <svcname> startip

Start resources of type ip

::

        sudo svcmgr -s <svcname> stopip

Stop resources of type ip

::

        sudo svcmgr -s <svcname> startloop

Start resources of type loop

::

        sudo svcmgr -s <svcname> stoploop

Stop resources of type loop

::

        sudo svcmgr -s <svcname> startvg

Start resources of type disk group

::

        sudo svcmgr -s <svcname> stopvg

Stop resources of type disk group

::

        sudo svcmgr -s <svcname> startfs

Start resources of type fs and the underlying resources

::

        sudo svcmgr -s <svcname> stopfs

Stop resources of type fs and the underlying resources

::

        sudo svcmgr -s <svcname> prstart

Acquire scsi persistent reservations on disks of the service (wrapped by startvg and startdisk)

::

        sudo svcmgr -s <svcname> prstop

Release scsi persistent reservations on disks of the service (wrapped by stopvg and stopdisk)

Logging
=======

All action logs are multiplexed to:

*   stdout/stderr

*   ``<OSVCLOG>/<svcname>.log``
    Daily rotation on these files, and size limit rotation

*   ``<OSVCLOG>/<svcname>.debug.log``
    Including debug logs

*   collector database
    Optional, through asynchronous xmlrpc calls.

*   syslog
    Optional, disabled by default, configured in ``node.conf``

Examples
========

Print services status of a node:

::

	[root@aubergine ~]# svcmon
        Threads                                   aubergine clementine nuc            
         hb#1.rx    running   224.3.29.71:10001 | /         X          X              
         hb#1.tx    running   224.3.29.71:10001 | /         O          O              
         hb#2.rx    running   0.0.0.0:10004     | /         X          O              
         hb#2.tx    running                     | /         X          O              
         listener   running   0.0.0.0:1214     
         monitor    running  
         scheduler  running  

        Cluster                                   aubergine clementine nuc            
         1m                                     | 0.57                 0.1            
         5m                                     | 0.56                 0.07           
         15m                                    | 0.57                 0.07           
         mon                                    | idle                 idle           

        Services                                  aubergine clementine nuc            
         collector  up        failover          | O                                   
         ha1        warn      failover          | O                    O              
         pridns     up        failover          | O                                   
         registry   up        failover          | O                                   
         testapplim n/a       flex              | /                                   
         testbnp    n/a       failover          | /                                   
         testdrbd   n/a       failover          | /         ?          /              
         testmd     down warn flex              | !!                   !! start failed

Print resource status of a service:

::

        $ sudo svcmgr -s osvprdcollector.opensvc.com print status
        osvprdcollector.opensvc.com
        overall                   up         
        |- avail                  up         
        |  |- ip#0           .... up         37.59.71.25@br0@container#0
        |  |- fs#1           .... stdby up   zfs data/osvprdcollector.opensvc.com@/srv/osvprdcollector.opensvc.com
        |  |- fs#3           .... stdby up   zfs data/osvprdcollector.opensvc.com/data@/srv/osvprdcollector.opensvc.com/data
        |  |- fs#2           .... stdby up   zfs data/osvprdcollector.opensvc.com/docker@/srv/osvprdcollector.opensvc.com/docker
        |  |- container#0    .... up         docker container osvprdcollector.opensvc.com.container.0@ubuntu:16.04
        |  |- container#1    .... up         docker container osvprdcollector.opensvc.com.container.1@registry.opensvc.com/opensvc/collector_db:build10
        |  |- container#2    .... up         docker container osvprdcollector.opensvc.com.container.2@registry.opensvc.com/opensvc/collector_redis:build1
        |  |- container#3    .... up         docker container osvprdcollector.opensvc.com.container.3@registry.opensvc.com/opensvc/collector_nginx:build1
        |  '- container#4    .... up         docker container osvprdcollector.opensvc.com.container.4@registry.opensvc.com/opensvc/collector_web2py:build10
        '- accessory                         
           |- sync#1         .... up         zfs of data/osvprdcollector.opensvc.com to nodes
           |- sync#1sd       .... up         zfs 'daily' snapshot data/osvprdcollector.opensvc.com
           '- sync#i0        .... up         rsync svc config to drpnodes, nodes


Starting a service:

::

        $ sudo mysvc1.opensvc.com start --local
        deb1.mysvc1.ip#1                  checking 128.0.1.124 availability
        deb1.mysvc1.ip#1                  ifconfig lo:3 128.0.1.124 netmask 255.255.255.255 up
        deb1.mysvc1.ip#1                  arping -U -c 1 -I lo -s 128.0.1.124 128.0.1.124
        deb1.mysvc1.disk#1                loop /opt/disk1.dd is already up
        deb1.mysvc1.disk#2                loop /opt/disk2.dd is already up
        deb1.mysvc1.disk#3                vg vgtest is already up
        deb1.mysvc1.fs#1                  e2fsck -p /dev/vgtest/lvtest1
        deb1.mysvc1.fs#1                  output:
        deb1.mysvc1.fs#1                  /dev/vgtest/lvtest1: clean, 18/3072 files, 1534/12288 blocks
        deb1.mysvc1.fs#1                
        deb1.mysvc1.fs#1                  mount -t ext4 -o rw /dev/vgtest/lvtest1 /opt/avn/lvtest1
        deb1.mysvc1.fs#2                  e2fsck -p /dev/vgtest/lvtest2
        deb1.mysvc1.fs#2                  output:
        deb1.mysvc1.fs#2                  /dev/vgtest/lvtest2: clean, 13/3072 files, 12286/12288 blocks
        deb1.mysvc1.fs#2                
        deb1.mysvc1.fs#2                  mount -t ext4 -o rw /dev/vgtest/lvtest2 /opt/avn/lvtest2
        deb1.mysvc1.fs#3                  e2fsck -p /dev/loop1
        deb1.mysvc1.fs#3                  output:
        deb1.mysvc1.fs#3                  testfs: clean, 13/12824 files, 27111/51200 blocks
        deb1.mysvc1.fs#3                
        deb1.mysvc1.fs#3                  mount -t ext4 -o rw /dev/loop1 /opt/avn/lvtest3
        deb1.mysvc1.share#0               exportfs -o ro,fsid=0 p145.opensvc.com:/opt/avn/lvtest3
        deb1.mysvc1.app#0                 exec /bin/true start as user root
        deb1.mysvc1.app#0                 start done in 0:00:00.001864 - ret 0

Stopping a service:

::

        $ sudo mysvc1.opensvc.com stop --local
        deb1.mysvc1.app#0                 exec /bin/true stop as user root
        deb1.mysvc1.app#0                 stop done in 0:00:00.004243 ret 0
        deb1.mysvc1.share#0               exportfs -u p145.opensvc.com:/opt/avn/lvtest3
        deb1.mysvc1.fs#3                  umount /opt/avn/lvtest3
        deb1.mysvc1.fs#2                  umount /opt/avn/lvtest2
        deb1.mysvc1.fs#1                  umount /opt/avn/lvtest1
        deb1.mysvc1.disk#3                skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.disk#2                skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.disk#1                skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.ip#1                  ifconfig lo:3 down

