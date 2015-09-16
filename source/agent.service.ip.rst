Service ip resources
====================

Introduction
************

A service must expose its middleware to other services and to end users through ip address. It is possible to expose through the service instance's node ip addresses, or through one or more ip addresses handled by the service.

Failover services should prefer exposing through service-private ip addresses, so that:

* relocating the service running instance on another node in the same network retains the same ip addresses.
* the service ip addresses can be used to avoid starting multiple instances simultaneously

Even flex services can benefit from private ip addresses:

* middlewares of different services running on the same node can bind the same port without conflict

This chapter presents the different ip management capabilities offered by the OpenSVC agent.

Failover
********

.. image:: _static/agent.service.ip.failover.png
   :scale: 50 %

Example non-containerized ip resource definition::

  [ip#0]
  ipname@nodes = ipname1
  ipname@drpnodes = ipname2
  ipdev = eth0

Flex with instance ip
*********************

.. image:: _static/agent.service.ip.flex.png
   :scale: 50 %

Example non-containerized ip resource definition::

  [ip#0]
  ipname@node1 = ipname1
  ipname@node2 = ipname2
  ipname@node3 = ipname3
  ipdev = eth0

