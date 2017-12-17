.. _agent.daemon.quorum:

Agent Daemon Quorum
*******************

When a peer is flagged stale by all the heartbeats, the daemon has to consider the cluster is in a split-brain situation, as we have no way to tell if the stale peer died or is isolated.

OpenSVC makes it very hard to reach the split-brain situation, using multiple independent heartbeats.

Users prefering anyway to let a cluster segment commit suicide in this situation can set :kw:`cluster.quorum` to true::

	nodemgr set --param cluster.quorum --value true

The default is to ignore, and let the split nodes takeover services and have those services started on both isolated segments.
Return to default with::

	nodemgr unset --param cluster.quorum

See the current configured quorum value with::

	nodemgr get --param cluster.quorum

If the cluster is configured for quorum, and a split-brain situation arises, a node will commit suicide if its reachable nodes count (including itself) is less than half the total cluster nodes count.

When the reachable nodes count is equal to half the total cluster nodes count, the asks for arbitration to a tier (thus an abitrator). Any agent on a site not hosting a node of the cluster can be used as an arbitrator. Multiple arbitrators can be configured, each one is tried in turn until one responds. Any first reachable arbitrator is a vote in the quorum race. No reachable arbitrator gets no vote, and causes segment suicide.

To configure an arbitrator, use::

	nodemgr set --param arbitrator#1.name --value relay1
	nodemgr set --param arbitrator#1.secret --value 1023102310230123123

Testing Arbitrators
===================

::

	nodemgr ping --node relay1

Best Practices
==============

* Configure at least 2 arbitrators, to be able to rolling-upgrade the arbitrators, always keeping one online
* Host all arbitrators on the same site, not hosting any nodes of the cluster it arbitrates for
* Use one of the arbitrators as a relay for the relay heartbeat driver
* Disable quorum on all nodes when doing a relayout of the cluster

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

Site1 Isolated
--------------

node1 standpoint
++++++++++++++++

* node1 loose all heartbeats from node3
* node1 still reaches node2, so the reachable node count is 2 out of 3 cluster nodes
* node1 has quorum, does not commit suicide

node2 standpoint
++++++++++++++++

* node2 loose all heartbeats from node3
* node2 still reaches node1, so the reachable node count is 2 out of 3 cluster nodes
* node2 has quorum, does not commit suicide

node3 standpoint
++++++++++++++++

* node3 loose all heartbeats from node1
* reachable node count is 1 out of 3 cluster nodes
* node3 determines it does not have quorum, commit suicide

Site2 Isolated
--------------

Same as Site1 isolated

Node2 Dies
----------

node1 standpoint
++++++++++++++++

* node1 loose all heartbeats from node2
* node1 still reaches node3, so the reachable node count is 2 out of 3 cluster nodes
* node1 has quorum, does not commit suicide

node3 standpoint
++++++++++++++++

* node3 loose all heartbeats from node2
* reachable node count is 2 out of 3 cluster nodes
* node3 has quorum, does not commit suicide

Node2 and Node3 Die
-------------------

node1 standpoint
++++++++++++++++

* node1 loose all heartbeats from node2 and node3
* the reachable node count is 1 out of 3 cluster nodes
* node1 determines it does not have quorum, commit suicide


Examples, even-nodes cluster
============================

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

* node1 loose all heartbeats from node2
* reachable node count is 1 out of 2 cluster nodes
* node1 tries to reach arbitrator1, fails
* node1 tries to reach arbitrator2, fails
* node1 determines it does not have quorum, commit suicide

node2 standpoint
++++++++++++++++

* node2 loose all heartbeats from node1
* reachable node count is 1 out of 2 cluster nodes
* node2 tries to reach arbitrator1, succeeds
* node1 determines it has quorum, does not commit suicide

Node1 dies
----------

node2 standpoint
++++++++++++++++

* node2 loose all heartbeats from node1
* reachable node count is 1 out of 2 cluster nodes
* node2 tries to reach arbitrator1, succeeds
* node1 determines it has quorum, does not commit suicide


