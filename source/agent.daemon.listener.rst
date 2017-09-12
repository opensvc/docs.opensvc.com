.. _agent.daemon.listener:

Agent Daemon Listener
*********************

* Listen on the address specified by ``listener.addr`` and port specified by ``listener.port``.
* Executes ``nodemgr dequeue actions`` when receiving empty packets
* Execute valid requests

.. rst-class:: lvl2

Requests Validation
-------------------

A request message must be AES256-encrypted using the ``cluster.secret``. The sender nodename and encryption salt are sent unencrypted.

* The sender nodename is verified to be in the ``cluster.nodes`` (expect for join requests)
* The encrypted data must pass decryption using the received salt and ``cluster.secret``

A node sending 5 consecutive invalid messages is blacklisted, and its future messages will be dropped before decryption.

Requests
--------

Clear Blacklist
===============

Clear the whole blacklist.

::

        $ sudo nodemgr daemon blacklist clear


Blacklist Status
================

Return the blacklist contents.

::

        $ sudo nodemgr daemon blacklist status
        {
            "data": {
                "node1": 1,
                "node2": 5,
            }, 
            "status": 0
        }

Daemon Status
=============

Return the cluster data.

::

        $ sudo nodemgr daemon status [--format json]

.. seealso:: :ref:`agent.cluster.data`

Daemon Stop
===========

Stop the daemon or a single thread.

Stopping the whole daemon advertizes to its peers its going into maintenance. The local service instances are not stopped.

::

        $ sudo nodemgr daemon stop [--thread-id <id>]

Daemon Start
============

Start the daemon or a single thread.

::

        $ sudo nodemgr daemon start [--thread-id <id>]

Daemon Shutdown
===============

Stop service instances, advertize maintenance to peers and stop the daemon.

::

        $ sudo nodemgr daemon shutdown

Get Service Config
==================

Serve a service configuration file content.

.. container:: lvl2

	Request format::

		{
		    "action": "get_service_config",
		    "options": {
			"svcname": "svc1",
		    }
		}

Clear
=====

Clear the service monitor ``start failed`` and ``stop failed`` states.

Clear the resource restart count, so the service monitor will retry ``<rid>.restart`` times again to start a resource evaluated down when the local_expect is ``started``.

::

        $ sudo svcmgr -s <svcname> clear


Set Node Monitor
================

Set the node monitor attributes.

.. container:: lvl2

	* ``status``
	  The node monitor status. ``idle``, ``freezing``, ``thawing``

	* ``local_expect``
	  The target node status. The node monitor will try to take actions to make the node reach that status. ``thawed``, ``frozen``.

	Request format::

		{
		    "action": "set_node_monitor",
		    "options": {
			"local_expect": "thawed"
		    }
		}

Set Service Monitor
===================

Set a service monitor attributes:

.. container:: lvl2

	* ``status``
	  The service monitor status. ``idle``, ``starting``, ``stopping``, ...

	* ``local_expect``
	  The target local service instance status. The service monitor will try to take actions to make the service instance reach that status.

	* ``global_expect``
	  The target service status. The service monitor will discuss with its peers how to make the service reach that status.

	* ``reset_retries``
	  Clear the resource restart count, so the service monitor will retry ``<rid>.restart`` times again to start a resource evaluated down when the local_expect is ``started``.

	Request format::

		{
		    "action": "set_service_monitor",
		    "options": {
			"svcname": "svc1",
			"local_expect": "started",
			"global_expect": "started",
			"reset_retries": True
		    }
		}

Get Service Monitor
===================

Return the service monitor attributes.

.. container:: lvl2

	Request format::

		{
		    "action": "set_service_monitor",
		    "options": {
			"svcname": "svc1",
		    }
		}

Join
====

Merge the joining nodename in the ``cluster.nodes``.

Return the cluster and heartbeats configuration sections the joiner must merge.

::

        $ sudo nodemgr daemon join --secret <secret> --node <nodename>

Leave
=====

Remove the leaving nodename from ``cluster.nodes``.

Service Action
==============

Execute an arbitrary service instance action on the node.

Support synchronous or asynchronous execution.

.. container:: lvl2

	Request format::

		{
		    "action": "service_action",
		    "options": {
			"svcname": "svc1",
			"command": ["compliance", "fix", "--moduleset", "foo"],
			"sync": True,
		    }
		}

Service Logs
============

Return or stream the local service instance logs.

::

        $ sudo svcmgr -s <svcname> logs [--follow] [--backlog <n>]

Request logs from all service nodes daemons and aggregate the results.

Maintenance
-----------

The listener thread is restarted by the agent daemon if it exits uncleanly.

::

        sudo nodemgr daemon stop --thread-id listener

Stop the listener thread. The thread state transitions from ``running`` to ``stopped``.

::

        sudo nodemgr daemon start --thread-id listener

Start the listener tx thread. The thread state transitions from ``stopped`` to ``running``.

::

        sudo nodemgr set --param listener.port --value 1215
        sudo nodemgr edit config

.. container:: lvl1

	Any command causing a timestamp change on ``<OSVCETC>/node.conf`` triggers a listener reconfiguration:

	* Modified parameters are applied


