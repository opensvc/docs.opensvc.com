.. _agent.daemon.quorum:

Agent Daemon Quorum
*******************

When a peer is flagged stale by all the heartbeats, the daemon has to consider the cluster is in a split-brain situation, as we have no way to tell if the stale peer died or is isolated.

OpenSVC makes it very hard to reach the split-brain situation, using multiple independent heartbeats.

Users prefering anyway to let a cluster segment commit suicide in this situation can set :kw:`cluster.quorum` to true::

	sudo nodemgr set --param cluster.quorum --value true

The default is to ignore, and let the split nodes takeover services and have those services started on both isolated segments. Return to default with::

	sudo nodemgr unset --param cluster.quorum

See the current configured quorum value with::

	sudo nodemgr get --param cluster.quorum

If the cluster is configured for quorum, and a split-brain situation arises, the node will commit suicide if the reachable nodes (including itself) count is less than half the total cluster nodes count.

When the reachable nodes count is equals to half the total cluster nodes count, we have to ask we arbitration to a tier (thus an abitrator). Any agent on a site not host a node of the cluster can be used as an arbitrator. Multiple arbitrators can be configured, each one is tried in turn until one respond. Any first reachable arbitrator is a vote in the quorum race. No reachable arbitrator gets no vote, and cause segment suicide.

To configure an arbitrator, use::

	sudo nodemgr set --param arbitrator#1.name --value relay1
	sudo nodemgr set --param arbitrator#1.secret --value 1023102310230123123

