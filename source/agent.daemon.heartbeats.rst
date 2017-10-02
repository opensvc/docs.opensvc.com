.. _agent.daemon.heartbeats:

Agent Heartbeats
****************

Hearbeats serve two purposes:

* Exchange data between cluster nodes
* Detect stale nodes

OpenSVC supports multiple parallel running heartbeats. Exercizing different code paths and infrastructure data paths (network and storage switchs and site interconnects) helps limiting split-brain situation occurences.

Heartbeats are declared in ``<OSVCETC>/node.conf``, each in a dedicated section named :kw:`[hb#<n>]`. A heartbeat definition should work on all nodes, using scoped keywords if necessary, as the definition are served by the joined node to the joining nodes.

Each heartbeat runs two threads janitored by the agent daemon: **tx** and **rx**.

The :cmd:`sudo nodemgr daemon status` and :cmd:`sudo svcmon` commands display the heartbeats status, statistics and each peer state

.. raw:: html

	<pre class="output">
	$ sudo svcmon
	Threads                                 <span style="font-weight: bold">aubergine</span> <span style="font-weight: bold">clementine</span> <span style="font-weight: bold">nuc</span> 
	 <span style="font-weight: bold">hb#1.rx</span>    <span style="color: #00aa00">running</span> 224.3.29.71:10001 | /         <span style="color: #aa0000">X</span>          <span style="color: #aa0000">X</span>   
	 <span style="font-weight: bold">hb#1.tx</span>    <span style="color: #00aa00">running</span> 224.3.29.71:10001 | /         <span style="color: #00aa00">O</span>          <span style="color: #00aa00">O</span>   
	 <span style="font-weight: bold">hb#2.rx</span>    <span style="color: #00aa00">running</span> 0.0.0.0:10004     | /         <span style="color: #aa0000">X</span>          <span style="color: #00aa00">O</span>   
	 <span style="font-weight: bold">hb#2.tx</span>    <span style="color: #00aa00">running</span>                   | /         <span style="color: #aa0000">X</span>          <span style="color: #00aa00">O</span>   
	...

	# <span style="color: #aa0000">X</span>: Stale
	# <span style="color: #00aa00">O</span>: Sent/Received
	# /: Not Applicable
	</pre>


Maintenance
-----------

The heartbeat threads are restarted by the agent daemon if they exit uncleanly.

::

        sudo nodemgr daemon stop --thread-id hb#1.tx

Stop the ``hb#1`` tx thread. The thread state transitions from ``running`` to ``stopped``.

::

        sudo nodemgr daemon start --thread-id hb#1.tx

Start the ``hb#1`` tx thread. The thread state transitions from ``stopped`` to ``running``.

::

        sudo nodemgr set --param hb#1.timeout --value 20
        sudo nodemgr unset --param hb#1
        sudo nodemgr edit config

.. container:: lvl1

	Any command causing a timestamp change on ``<OSVCETC>/node.conf`` triggers heartbeats reconfiguration:

	* Modified parameters are applied
	* Heartbeats removed in the configuration are stopped
	* Heartbeats added in the configuration are started

.. rst-class:: lvl1

Threads
-------

Tx
==

* Transmit data prepared by the monitor thread, regularly or as soon as possible after a data change
* The data is pre-encrypted by the monitor thread

Rx
==

* Receive data regularly (disk) or in response to a send (unicast and multicast)
* Update the received peer data in the cluster data
* Wake the monitor thread

  * Merge the updated peer data to update the cluster data attributes produced by node data aggregation
  * Run the node orchestrator: handle freeze/thaw requests propagated through the heartbeats
  * Run each service orchestrator: handle service instance start/stop/freeze/thaw transitions, and monitored resources restart
  * Fetch service configuration files from node node with the most recent version

* If no heartbeat is received from a peer during :kw:`<hb#n>.timeout`, the peer is marked stale in this rx thread. The default timeout is 15 seconds.
* If all rx threads have a peer marked stale, the peer data is purged from the cluster data

  * immediately if the stale peer has not advertized a maintenance
  * after :kw:`node.maintenance grace_period` if the stale peer has advertized a maintenance

.. seealso:: :ref:`agent.cluster.data`

Heartbeat Drivers
-----------------

Unicast
=======

This driver sends and receive using TCP unicast packets.

::

        [hb#1]
        type = unicast

With this simplest definition:

* The rx thread listens on 0.0.0.0:10000
* The tx thread sends to <nodename>:10000

A most precise definition would be

::

        [hb#1]
        type = unicast
        intf@node1 = eth0
        intf@node2 = eth2
        addr@node1 = 1.2.3.4
        addr@node2 = 1.2.3.5
        port@node1 = 10001
        port@node2 = 10002
        timeout = 15


Multicast
=========

This driver sends and receive using UDP multicast packets.

::

        [hb#2]
        type = multicast

With this simplest definition:

* The rx thread listens on all interfaces on port 10000
* The tx thread sends to 224.3.29.71:10000

A most precise definition would be

::

        [hb#2]
        type = multicast
        intf@node1 = eth0
        intf@node2 = eth2
        addr = 224.3.29.71
        port = 10001
        timeout = 15

Addr and port are not scopable.

Disk
====

This driver reads and writes on a dedicated disk, using O_DIRECT|O_SYNC|O_DSYNC on a block device on Linux. Other operating systems must use raw char device.

* The rx thread loop over peer nodes and for each reads its heartbeat data at its reserved slot device offset
* The tx thread write to its reserved slot offset on the device

::

        [hb#2]
        type = disk
        dev = /dev/mapper/3123412312412414214
        timeout = 15

.. container:: lvl2

	When the tx and rx threads are started or reconfigured, they parse a metadata segment at the head of the device and prepare a <nodename>:<slot index> hash.

	The metadata zone maximum size is 4MB.

	A node metadata slot size is 4k, and contains the cluster node name.

        Limits:

        * 1000 nodes (metadata zone size/slot meta data size)
        * nodenames are limited to 4k characters (slot meta data size)
        * A <n>-nodes cluster requires a (<n>+1)*4MB device
        * The heartbeat data (which is gziped) must not exceed 4MB (slot size). A 10 services cluster usually produces ~3k messages.


	If a the local nodename is not found in any slot, the thread allocates one.

