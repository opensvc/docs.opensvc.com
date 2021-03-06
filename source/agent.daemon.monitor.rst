.. _agent.daemon.monitor:

Agent Daemon Monitor
********************

* Aggregate peer data received by heartbeats
* Monitor the local services instances status changes and merges them in the tx heartbeats data and cluster data
* Monitor the local services configuration changes and update their last modification time in the tx heartbeats data and cluster data
* Prepare the encrypted message sent by heartbeats
* Signal tx heartbeats that a new message is ready for sending
* Run the orchestrators

	* Node orchestrator
	* Service orchestrators
	* Restart service resources flagged for restart

* Fetch and install the most recent service configuration from peers

.. rst-class:: lvl1

Node Orchestrator
=================

If set, try to reach the ``local_expect``.

================ ============================================================
Value            Actions
================ ============================================================
``thawed``       * set ``status`` to ``thawing``
                 * execute ``om node thaw``
                 * set ``status`` to ``idle``

``frozen``       * set ``status`` to ``frezing``
                 * execute ``om node freeze``
                 * set ``status`` to ``idle``
================ ============================================================

.. rst-class:: lvl1

Service Orchestrators
=====================

If set, negociate with peers which instances to start to reach ``global_expect``.

If ``global_expect`` is not set, the expected service state is ``started``.

If set, try to reach the ``local_expect``.

================ ============================================================
Value            Actions
================ ============================================================
``thawed``       * set ``status`` to ``thawing``
                 * execute ``om <svcname> thaw``
                 * set ``status`` to ``idle``

``frozen``       * set ``status`` to ``frezing``
                 * execute ``om <svcname> freeze``
                 * set ``status`` to ``idle``

``started``      * set ``status`` to ``starting``
                 * execute ``om <svcname> start``
                 * set ``status`` to ``idle`` or ``start failed``
                 * execute ``om <svcname> toc`` if start failed and
                   a monitor action is defined

``stopped``      * set ``status`` to ``stopping``
                 * execute ``om <svcname> stop``
                 * set ``status`` to ``idle`` or ``stop failed``
================ ============================================================

.. seealso:: :ref:`agent.service.orchestration`

