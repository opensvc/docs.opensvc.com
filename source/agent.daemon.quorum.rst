.. _agent.daemon.quorum:

Agent Daemon Quorum
*******************

When a peer is flagged stale by all the heartbeats, the daemon has to consider the cluster is in a split-brain situation, as we have no way to tell if the stale peer died or is isolated.

OpenSVC makes it very hard to reach the split-brain situation, using multiple independent heartbeats.

Users prefering anyway to let a cluster segment commit suicide in this situation can set :kw:`cluster.quorum` to true::

	om cluster set --kw cluster.quorum=true

The default is to ignore, and let the split nodes takeover services and have those services started on both isolated segments.
Return to default with::

	om cluster unset --kw cluster.quorum

See the current configured quorum value with::

	om cluster get --kw cluster.quorum

If the cluster is configured for quorum, and a split-brain situation arises, a node will commit suicide if its reachable nodes+arbitrators count (including itself) is less than half the total cluster+arbitrators nodes count.

Any opensvc agent can be used as an arbitrator. Multiple arbitrators can be configured. For examples:

* to survive a split situation when a single node is alive in a 2-nodes cluster, the node must get 1 arbitrator votes.
* to survive a split situation when a single node is alive in a 3-nodes cluster, the node must get 2 arbitrator votes.
* to survive a split situation when a single node is alive in a 4-nodes cluster, the node must get 3 arbitrator votes.
* to survive a split situation when a single node is alive in a 5-nodes cluster, the node must get 3 arbitrator votes.

A frozen node does not execute the quorum race.

To configure an arbitrator, use::

	om cluster set --kw arbitrator#1.name=relay1 \
	               --kw arbitrator#1.secret=1023102310230123123

Testing Arbitrators
===================

::

	om node ping --node relay1

::

	$ om mon
	...
	Arbitrators                                           aubergine  nuc-cva    
	 deb1.opensvc.com         warn                      | X          X          
	 deb2.opensvc.com         warn                      | X          X          
	 centos71.opensvc.com                               | O          O          
	 centos72.opensvc.com     warn                      | X          X          
	...

Best Practices
==============

* Configure <more than half the cluster number of nodes> arbitrators, to be able to rolling-upgrade the arbitrators, always keeping enough online
* Host all arbitrators on the same site, and not on a site hosting any nodes of the cluster it arbitrates for
* Use one of the arbitrators as a relay for the relay heartbeat driver
* Disable quorum or freeze all nodes when doing a relayout of the cluster

Examples, odd-nodes cluster
===========================

::

	+-------------------------------------------+                                
	|  site3                                    |                                
	|                                           |                                
	|  +-------------+   +-------------+        |
	|  |             |   |             |        |
	|  | arbitrator1 |   | arbitrator2 |        |
	|  |             |   |             |        |
	|  +-------------+   +-------------+        |
	|                                           |                                
	+-------------------------------------------+                                
	
	+-------------------------------------------+     +------------------------------+
	| site1                                     |     |   site2                      |
	|                                           |     |                              |
	|    +--------------------------------------|-----|-----------------------+      |
	|    | cluster                              |     |                       |      |
	|    |                                      |     |                       |      |
	|    |    +-----------+    +-----------+    |     |   +-----------+       |      |
	|    |    |           |    |           |    |     |   |           |       |      |
	|    |    |   node1   |    |   node2   |    |     |   |   node3   |       |      |
	|    |    |           |    |           |    |     |   |           |       |      |
	|    |    +-----------+    +-----------+    |     |   +-----------+       |      |
	|    |                                      |     |                       |      |
	|    +--------------------------------------|-----|-----------------------+      |
	|                                           |     |                              |
	+-------------------------------------------+     +------------------------------+

* Total votes: 5
* Majority: 3

Site1 Isolated
--------------

node1 standpoint
++++++++++++++++

* live nodes: 2 (node1, node2)
* arbitrators votes: 0
* votes: 2

=> node does not have quorum, commits suicide

node2 standpoint
++++++++++++++++

* live nodes: 2 (node1, node2)
* arbitrators votes: 0
* votes: 2

=> node does not have quorum, commits suicide

node3 standpoint
++++++++++++++++

* live nodes: 1 (node3)
* arbitrators votes: 2
* votes: 3

=> node has quorum, does not commit suicide

Site2 Isolated
--------------

node1 standpoint
++++++++++++++++

* live nodes: 2 (node1, node2)
* arbitrators votes: 2
* votes: 4

=> node has quorum, does not commit suicide

node2 standpoint
++++++++++++++++

* live nodes: 2 (node1, node2)
* arbitrators votes: 2
* votes: 4

=> node has quorum, does not commit suicide

node3 standpoint
++++++++++++++++

* live nodes: 1 (node3)
* arbitrators votes: 0
* votes: 1

=> node does not have quorum, commits suicide


Node2 Dies
----------

node1 standpoint
++++++++++++++++

* live nodes: 2 (node1, node3)
* arbitrators votes: 2
* votes: 4

=> node has quorum, does not commit suicide

node3 standpoint
++++++++++++++++

* live nodes: 2 (node1, node3)
* arbitrators votes: 2
* votes: 4

=> node has quorum, does not commit suicide


Node2 and Node3 Die
-------------------

node1 standpoint
++++++++++++++++

* live nodes: 1 (node1)
* arbitrators votes: 2
* votes: 3

=> node has quorum, does not commit suicide


Examples, even-nodes cluster
============================

::

	+-------------------------------------------+                                
	|  site3                                    |                                
	|                                           |                                
	|  +-------------+                          |
	|  |             |                          |
	|  | arbitrator1 |                          |
	|  |             |                          |
	|  +-------------+                          |
	|                                           |                                
	+-------------------------------------------+                                
	
	+--------------------------+     +------------------------------+
	| site1                    |     |   site2                      |
	|                          |     |                              |
	|    +---------------------|-----|-----------------------+      |
	|    | cluster             |     |                       |      |
	|    |                     |     |                       |      |
	|    |    +-----------+    |     |   +-----------+       |      |
	|    |    |           |    |     |   |           |       |      |
	|    |    |   node1   |    |     |   |   node2   |       |      |
	|    |    |           |    |     |   |           |       |      |
	|    |    +-----------+    |     |   +-----------+       |      |
	|    |                     |     |                       |      |
	|    +---------------------|-----|-----------------------+      |
	|                          |     |                              |
	+--------------------------+     +------------------------------+

Site1 Isolated
--------------

node1 standpoint
++++++++++++++++

* live nodes: 1 (node1)
* arbitrators votes: 0
* votes: 1

=> node does not have quorum, commits suicide

node2 standpoint
++++++++++++++++

* live nodes: 1 (node2)
* arbitrators votes: 1
* votes: 2

=> node has quorum, does not commit suicide

Node1 dies
----------

node2 standpoint
++++++++++++++++

* live nodes: 1 (node2)
* arbitrators votes: 1
* votes: 2

=> node has quorum, does not commit suicide

