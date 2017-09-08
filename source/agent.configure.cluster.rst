Agent Cluster Configuration
***************************

Add a Heartbeat
===============

::

        sudo nodemgr set --param hb#1.type --value unicast

Join a Cluster
==============

::

        sudo nodemgr join --secret <secret> --node <nodename>

Leave a Cluster
===============

::

        sudo nodemgr leave



.. seealso::

        | :ref:`agent.daemon.listener`
        | :ref:`agent.daemon.monitor`
        | :ref:`agent.daemon.scheduler`
        | :ref:`agent.daemon.heartbeats`
        | :ref:`agent.service.orchestration`

