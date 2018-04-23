.. _agent.service.orchestration.compatibility:

Compatibility
-------------

The daemons now announce their "compat version" through the heartbeats.

If a daemon notices the cluster members have different compat versions, it
disables ha orchestration.

This is what happens during a rolling agent upgrade.

In this case, the logs contain this warning

::

	cluster members run incompatible versions. disable ha orchestration

A orchestrate=ha service instance print status shows:

::

    ha1                         warn       incompatible versions
    `- aubergine                up         idle, started
       |- ip#0           ...... up         128.0.0.2@lo
       |- ip#1           M....S stdby up   128.0.0.3@lo
    ...
    
And svcmon shows:
    
::

    Nodes                                  aubergine nuc
     15m                                 | 0.4       0.1
     compat    warn                      | 2         1
     state                               |
    ...

When the compat is restored, the logs contain this info

::

	cluster members run compatible versions. enable ha orchestration




