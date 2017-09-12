Agent Daemon
============

Threads
-------

The agent daemon spawns threads to handle its different roles:

* Listener
  Listens for peer daemon, collector, nodemgr and svcmgr requests.
* Monitor
  Handle cluster-wide service start and failover decisions and actions.
* Scheduler
  Periodically run node and services schedulers.
* Heartbeat threads
  Check if peers are alive and exchange node and service information.

Daemon management
-----------------

Start
+++++

::

	$ nodemgr daemon start

.. rst-class:: lvl1

	On systems using systemd, the start is delegated to the systemd ``opensvc-agent`` unit, which triggers a ``nodemgr daemon start``.

Stop
++++

::

	$ nodemgr daemon stop

The node advertizes its entering maintenance mode, so peer nodes will preserve the node's last known data until the ``maintenance_grace_period`` expires.

Restart
+++++++

::

	$ nodemgr daemon restart

.. rst-class:: lvl1

	The node advertizes its entering maintenance mode, so peer nodes will preserve the node's last known data until the ``maintenance_grace_period`` expires.

	On systems using systemd, the restart is delegated to the systemd ``opensvc-agent`` unit, which triggers a ``nodemgr daemon stop`` followed by a ``nodemgr daemon start``

.. rst-class:: lvl2

Debugging
---------

Run the daemon in foreground::

	$ sudo python <OSVCLIB>/osvcd.py -f

Subsystems
----------

.. toctree::
	:maxdepth: 2

	agent.daemon.listener
	agent.daemon.monitor
	agent.daemon.scheduler
	agent.daemon.heartbeats

