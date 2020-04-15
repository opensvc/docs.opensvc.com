Interacting with the Orchestrator
---------------------------------

Clearing Failed Service Monitor States
++++++++++++++++++++++++++++++++++++++

::

        om <svcname> clear [--node <nodename>]

If ``--node <nodename>`` is set, the clear applies only to the specified node. If not set, the clear applies to all nodes.

Aborting an action
++++++++++++++++++

Clearing a failed action can lead to the action to be immediately retried if the target service state is still the same. To clear the target state, use::

	om <svcname> abort


