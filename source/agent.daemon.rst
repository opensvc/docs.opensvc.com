.. _agent.daemon:

Daemon
======

Roles
-----

The agent daemon spawns threads to handle its different roles:

* Listener
  Listens for peer daemon, collector, nodemgr and svcmgr requests.
* Monitor
  Handle cluster-wide service start and failover decisions and actions.
* Scheduler
  Periodically run node and services schedulers.
* Heartbeat threads
  Check if peers are alive and exchange node and service information. Run the quorum race on split-brain.
* Collector
  Send cluster information to the collector. Only one node in the
  cluster sends. This role fails over transparently.

.. seealso::

        | :ref:`agent.daemon.quorum`

Daemon management
-----------------

Start
+++++

::

	$ om node daemon start

.. rst-class:: lvl1

	On systems using systemd, the start is delegated to the systemd ``opensvc-agent`` unit, which triggers a :cmd:`nodemgr daemon start`.

Stop
++++

::

	$ om node daemon stop

The node advertizes its entering maintenance mode, so peer nodes will preserve the node's last known data until the :kw:`node.maintenance_grace_period` expires.

Restart
+++++++

::

	$ om node daemon restart

.. rst-class:: lvl1

	The node advertizes its entering maintenance mode, so peer nodes will preserve the node's last known data until the :kw:`maintenance_grace_period` expires.

	On systems using systemd, the restart is delegated to the systemd ``opensvc-agent`` unit, which triggers a :cmd:`nodemgr daemon stop` followed by a :cmd:`nodemgr daemon start`.

.. rst-class:: lvl2

Debugging
---------

Run the daemon in foreground::

	$ sudo python <OSVCLIB>/osvcd.py -f

Threads
-------

.. toctree::
	:maxdepth: 2

	agent.daemon.listener
	agent.daemon.monitor
	agent.daemon.scheduler
	agent.daemon.heartbeats
	agent.daemon.quorum

