.. _agent.daemon.scheduler:

Agent Daemon Scheduler
**********************

* This agent daemon thread executes the :cmd:`nodemgr schedulers` every minute.
* It makes sure no more than two executions run in parallel, skipping executions.

.. seealso: :ref:`agent-scheduler`

Maintenance
-----------

The scheduler thread is restarted by the agent daemon if it exits uncleanly.

::

        sudo nodemgr daemon stop --thread-id scheduler

Stop the scheduler thread. The thread state transitions from ``running`` to ``stopped``.

::

        sudo nodemgr daemon start --thread-id scheduler

Start the scheduler tx thread. The thread state transitions from ``stopped`` to ``running``.

