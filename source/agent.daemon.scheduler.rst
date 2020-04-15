.. _agent.daemon.scheduler:

Agent Daemon Scheduler
**********************

* This agent daemon thread executes node and objects tasks according to their schedule definition.
* It makes sure no more than two executions run in parallel, skipping executions if necessary.

.. seealso: :ref:`agent-scheduler`

Maintenance
-----------

The scheduler thread is restarted by the agent daemon if it exits uncleanly.

::

        om node daemon stop --thread-id scheduler

Stop the scheduler thread. The thread state transitions from ``running`` to ``stopped``.

::

        om node daemon start --thread-id scheduler

Start the scheduler tx thread. The thread state transitions from ``stopped`` to ``running``.

