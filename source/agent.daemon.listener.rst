.. _agent.daemon.listener:

Agent Daemon Listener
*********************

* Listen on the address specified by ``listener.addr`` and port specified by ``listener.port``.
* Executes ``nodemgr dequeue actions`` when receiving empty packets
* Execute valid requests

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

Request format::

        {
            "action": "get_service_config",
            "options": {
                "svcname": "svc1",
            }
        }

Set Service Monitor
===================

Get Service Monitor
===================

Join
====

Leave
=====

Service Action
==============

Service Logs
============



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

Or any command causing a timestamp change on ``<OSVCETC>/node.conf``, trigger a listener reconfiguration:

* Modified parameters are applied


