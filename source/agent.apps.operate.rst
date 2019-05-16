Operate Apps
************

Selecting Objects
=================

All
+++

::

	om '**' ls

All Services
++++++++++++

::

	om '*' ls

Single Service
++++++++++++++

::

	om <path> ls
	om ns1/svc/web1 ls

Object list
+++++++++++

::

	om <path1>,<path2> ls
	om ns1/svc/web1,ns1/vol/wev1 ls

Services by State
+++++++++++++++++

::

	om '*' ls --status down

List all services in 'down' state.

::

	om '*' ls --status up,warn

List all services in 'up' and 'warn' state.

Service Selector Expressions
++++++++++++++++++++++++++++

::

        om <expr> ls

Where ``<expr>`` is:

* ``<path glob pattern>``
* ``[!]<param><op><value>``

Where ``<param>`` is:

* ``<rid>.<key>`` in a service config file
* ``<group>.<key>`` in a service config file, where ``<group>`` is a driver group name like disk, fs, task, ... or an empty string, meaning "all resources"
* ``<key>`` in the service config file header

Where ``<op>`` is:

* ``<`` ``>`` ``<=`` ``>=`` ``=`` operators
* ``:`` as a existance test operator (empty value)
* ``~`` as a regexp operator

And:

* ``!`` as a negation operator
* ``+`` as the AND expression separator
* ``,`` as the OR expression separator

The matching is case-sensitive except for booleans.

Examples:

services with name ending with dns or starting with ha and with
an app resource with a timeout set superior to 1::

	$ om '*dns,ha*+app.timeout>1' ls
	ha1
	ha2
	ha3
	pridns

Services with at least one ip resource and one task resource::

	$ om 'ip:+task:' ls
	ha1
	ha2
	ha3
	registry

Services with at least one monitored resource and monitor_schedule not set::

	$ om '!monitor_schedule+.monitor=true' ls
	ha1
	ha4

Services Status
===============

Cluster Overview
++++++++++++++++

Human Readable
--------------

::

        om mon

This command fetches the information from the daemon listener. Hence,

* The daemon must be up and running
* The displayed information is near synchronous

.. raw:: html

	<pre class="output">
	Threads                                  <span style="font-weight: bold">aubergine</span> <span style="font-weight: bold">nuc</span>
	 <span style="font-weight: bold">hb#1.rx</span>     <span style="color: #00aa00">running</span> 224.3.29.71:10001 | <span style="color: #767676">/</span>         <span style="color: #aa0000">X</span>  
	 <span style="font-weight: bold">hb#1.tx</span>     <span style="color: #00aa00">running</span> 224.3.29.71:10001 | <span style="color: #767676">/</span>         <span style="color: #00aa00">O</span>  
	 <span style="font-weight: bold">hb#2.rx</span>     <span style="color: #00aa00">running</span> 0.0.0.0:10004     | <span style="color: #767676">/</span>         <span style="color: #00aa00">O</span>  
	 <span style="font-weight: bold">hb#2.tx</span>     <span style="color: #00aa00">running</span>                   | <span style="color: #767676">/</span>         <span style="color: #00aa00">O</span>  
	 <span style="font-weight: bold">listener</span>    <span style="color: #00aa00">running</span> 0.0.0.0:1214     
	 <span style="font-weight: bold">monitor</span>     <span style="color: #00aa00">running</span>
	 <span style="font-weight: bold">scheduler</span>   <span style="color: #00aa00">running</span>

	Nodes                                    <span style="font-weight: bold">aubergine</span> <span style="font-weight: bold">nuc</span>
	<span style="font-weight: bold"> 15m</span>                                   | 0.6       0.0
	<span style="font-weight: bold"> state</span>                                 |              

	Services                                 <span style="font-weight: bold">aubergine</span> <span style="font-weight: bold">nuc</span>
	 <span style="font-weight: bold">collector</span>   <span style="color: #00aa00">up</span>      failover          | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>           
	 <span style="font-weight: bold">ha1</span>         <span style="color: #aa5500">warn</span><span style="color: #aa5500">!</span><span style="color: #aa0000">^</span>  failover          | <span style="color: #aa5500">!</span><span style="color: #aa5500">!</span>        <span style="color: #aa5500">!</span><span style="color: #aa5500">!</span><span style="color: #767676">^</span>
	 <span style="font-weight: bold">pridns</span>      <span style="color: #00aa00">up</span>      failover          | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>           
	 <span style="font-weight: bold">registry</span>    <span style="color: #00aa00">up</span>      failover          | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>           
	 <span style="font-weight: bold">testapplim</span>  <span style="color: #767676">n/a</span>     flex              | <span style="color: #767676">/</span><span style="color: #767676">^</span>           
	 <span style="font-weight: bold">testapplim2</span> <span style="color: #767676">n/a</span>     flex              | <span style="color: #767676">/</span><span style="color: #0000aa">*</span>        <span style="color: #767676">/</span><span style="color: #0000aa">*</span> 
	 <span style="font-weight: bold">testbnp</span>     <span style="color: #767676">n/a</span>     failover          | <span style="color: #767676">/</span><span style="color: #aa0000">P</span>           
	 <span style="font-weight: bold">testdrbd</span>    <span style="color: #767676">n/a</span>     failover          | <span style="color: #767676">/</span><span style="color: #aa0000">P</span>        <span style="color: #767676">/</span><span style="color: #aa0000">P</span> 
	 <span style="font-weight: bold">testmd</span>      <span style="color: #00aa00">up</span><span style="color: #aa5500">!</span>     flex              | <span style="color: #aa0000">X</span><span style="color: #aa5500">!</span>        <span style="color: #00aa00">O</span><span style="color: #aa5500">!</span><span style="color: #767676">^</span>
	 <span style="font-weight: bold">testmd2</span>     <span style="color: #00aa00">up</span><span style="color: #aa5500">!</span><span style="color: #aa0000">^</span>    failover          | <span style="color: #00aa00">O</span><span style="color: #aa5500">!</span>        <span style="color: #aa0000">X</span><span style="color: #aa5500">!</span><span style="color: #767676">^</span>
	</pre>

To optimize information density, attributes, status and alerts are represented as markers.

Heartbeats markers:

======== =================================== ===================================
Marker   On hb.tx target                     On hb.rx source
======== =================================== ===================================
``O``    data has been sent in time          data has been received in time
``X``    data has not been sent in time      data has not been received in time
``/``    not applicable                      not applicable
======== =================================== ===================================

Nodes, services and instances markers:

======== ================================== ================================== ===============
Marker   On service instance                On Service                         On node status
======== ================================== ================================== ===============
``O``    up                                                             
``o``    standby up instance
``X``    down instance or heartbeat
``x``    standby down instance
``/``    not applicable, undefined
``^``    placement leader                   placement alert
``!``    warning                            warning raise by any instance
``!!``   not fully available instance
``*``    frozen instance                                                       frozen node
``P``    not fully provisioned instance
======== ================================== ================================== ===============

Machine readable
----------------

::

        om daemon status --format json
        om daemon status --format flat_json

Watch
-----

::

	om mon --watch

Stats
-----

::

	om mon --stats

Detailled Instance Status
+++++++++++++++++++++++++

Human Readable
--------------

::

        om <path> print status

Machine Readable
----------------

::

        om <path> print status --format json
        om <path> print status --format flat_json

Forced evaluation of status
---------------------------

::

        om <path> print status --refresh


Actions
=======

Base Actions
++++++++++++

Start
-----

::

        om <path> start --local

Start the local service instance, shortcutting the orchestrator.
Resources start order is ip, disk, fs, share, container, app.

::

        om <path> start [--wait] [--time <duration expr>] [--watch]

Tell the orchestrator to start the service on the nodes the placement policy and constraints choose.

By default, the command returns as soon has to daemon has acknowedged the order. With :opt:`--wait`, the command will wait for the action completion before returning. :opt:`--time` set a maximum wait time.

Stop
----

::

        om <path> stop --local

Stop the local service instance, shortcutting the orchestrator.
Resources stop order is app, container, share, fs, disk, ip.

::

        om <path> stop [--wait] [--time <duration expr>] [--watch]

Tell the orchestrator to stop the service wherever it runs and freeze it so it is not restarted.

By default, the command returns as soon has to daemon has acknowedged the order. With :opt:`--wait`, the command will wait for the action completion before returning. :opt:`--time` set a maximum wait time.

Relocation
----------

::

        om <path> switch --node <nodename> [--wait] [--time <duration expr>] [--watch]

Stop the service on <nodename> peers and start it on <nodename>.

All service instances are thawed at the end of this ended, whatever their initial frozen state.

::

        om <path> takeover [--wait] [--time <duration expr>] [--watch]

Stop the service instances on peers and start it on the local node.

All service instances are thawed at the end of this ended, whatever their initial frozen state.

::

        om <path> giveback [--wait] [--time <duration expr>] [--watch]

Thaw the nodes and service instances, stop the service instances running on non-leader nodes, and let the orchestrator start the instances on the leaders.

All service instances are thawed at the end of this ended, whatever their initial frozen state.

Handling Failures
-----------------

When an action is submitted to the agent daemons, they orchestrate the execution plan to make the service reach the desired state. If a step of this plan fails, the orchestrator is blocked, the failure reported in :cmd:`om mon` and :cmd:`om <path> print status`, and the target state is still set.

For example, the :c-svc:`svc1` failover service is requested to start. The :c-node:`n1` node is the leader and its instance started, but the action fails. This instance service monitor status transitioned to ``start failed``, and the orchestration is blocked.

To let the daemon retry the execution plan, the failure can be **cleared**, using::

	om <path> clear

To abort the action, use::

	om <path> abort

Sync
----

::

        om <path> sync all

Run the sync resources replication to all targets, either prd or drp.

::

        om <path> sync nodes

Trigger hard-coded and user-defined file synchronization to secondary nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

::

        om <path> sync drp

Trigger hard-coded and user-defined file synchronization to disaster recovery nodes. Optionally creates snapshots to send a coherent file set. No-op if run from a node not running the service.

.. seealso:: :ref:`agent-service-sync`

Run
---

::

        om <path> run

Run tasks.

.. seealso:: :ref:`agent-service-tasks`

Resource Filtering
++++++++++++++++++

::

        om <path> --rid <rid>[,<rid>,...] <action>

Execute ``<action>`` on :c-svc:`<path>` resources specified by :opt:`--rid`.

::

        om <path> --rid <drvgrp>[,<drvgrp>,...] <action>

Execute ``<action>`` on :c-svc:`<path>` resources of driver groups specified by by :opt:`--rid`.
The supported driver groups are:

* ip
* disk
* fs
* share
* container
* app
* sync
* task

Resource identifiers and driver groups can be mixed in a :opt:`--rid` expression.

::

        om <path> --tags tag1,tag2 <action>

Execute ``<action>`` on :c-svc:`<path>` resources tagged with either tag1 or tag2.

::

        om <path> --tags tag1+tag2,tag3 <action>

Execute ``<action>`` on :c-svc:`<path>` resources tagged with both tag1 or tag2 or with tag3.

::

        om <path> --subsets s1,s2 <action>

Execute ``<action>`` on :c-svc:`<path>` resources in subset s1 or s2


Logging
=======

All action logs are multiplexed to:

*   stdout/stderr

*   ``<OSVCLOG>/<name>.log`` for svc kind in root namespace.
    ``<OSVCLOG>/<kind>/<name>.log`` for non-svc kind in root namespace.
    ``<OSVCLOG>/namespaces/<namespace>/<kind>/<name>.log`` for namespaced objects.
    Daily rotation on these files, and size limit rotation

*   collector database
    Optional, through asynchronous xmlrpc calls.

*   syslog
    Optional, disabled by default, configured in ``node.conf``

Examples
========

Print resource status of a service:

::

        $ om osvprdcollector.opensvc.com print status
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
        deb1.mysvc1.ip#1        checking 128.0.1.124 availability
        deb1.mysvc1.ip#1        ifconfig lo:3 128.0.1.124 netmask 255.255.255.255 up
        deb1.mysvc1.ip#1        arping -U -c 1 -I lo -s 128.0.1.124 128.0.1.124
        deb1.mysvc1.disk#1      loop /opt/disk1.dd is already up
        deb1.mysvc1.disk#2      loop /opt/disk2.dd is already up
        deb1.mysvc1.disk#3      vg vgtest is already up
        deb1.mysvc1.fs#1        e2fsck -p /dev/vgtest/lvtest1
        deb1.mysvc1.fs#1        output:
        deb1.mysvc1.fs#1        /dev/vgtest/lvtest1: clean, 18/3072 files, 1534/12288 blocks
        deb1.mysvc1.fs#1        
        deb1.mysvc1.fs#1        mount -t ext4 -o rw /dev/vgtest/lvtest1 /opt/avn/lvtest1
        deb1.mysvc1.fs#2        e2fsck -p /dev/vgtest/lvtest2
        deb1.mysvc1.fs#2        output:
        deb1.mysvc1.fs#2        /dev/vgtest/lvtest2: clean, 13/3072 files, 12286/12288 blocks
        deb1.mysvc1.fs#2        
        deb1.mysvc1.fs#2        mount -t ext4 -o rw /dev/vgtest/lvtest2 /opt/avn/lvtest2
        deb1.mysvc1.fs#3        e2fsck -p /dev/loop1
        deb1.mysvc1.fs#3        output:
        deb1.mysvc1.fs#3        testfs: clean, 13/12824 files, 27111/51200 blocks
        deb1.mysvc1.fs#3        
        deb1.mysvc1.fs#3        mount -t ext4 -o rw /dev/loop1 /opt/avn/lvtest3
        deb1.mysvc1.share#0     exportfs -o ro,fsid=0 p145.opensvc.com:/opt/avn/lvtest3
        deb1.mysvc1.app#0       exec /bin/true start as user root
        deb1.mysvc1.app#0       start done in 0:00:00.001864 - ret 0

Stopping a service:

::

        $ sudo mysvc1.opensvc.com stop --local
        deb1.mysvc1.app#0       exec /bin/true stop as user root
        deb1.mysvc1.app#0       stop done in 0:00:00.004243 ret 0
        deb1.mysvc1.share#0     exportfs -u p145.opensvc.com:/opt/avn/lvtest3
        deb1.mysvc1.fs#3        umount /opt/avn/lvtest3
        deb1.mysvc1.fs#2        umount /opt/avn/lvtest2
        deb1.mysvc1.fs#1        umount /opt/avn/lvtest1
        deb1.mysvc1.disk#3      skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.disk#2      skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.disk#1      skip 'stop' on standby resource (--force to override)
        deb1.mysvc1.ip#1        ifconfig lo:3 down

