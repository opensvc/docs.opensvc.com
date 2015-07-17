Introduction
************

What is OpenSVC
===============

OpenSVC is a software product and the name of the commercial entity developping, supporting and marketing it. The product will be referenced as "OpenSVC" and the company "OpenSVC co". This book covers extensively the OpenSVC goals, design and usage.

OpenSVC is composed of two software components:

* the agent
  The OpenSVC agent is basically a Cluster Resource Manager with extended reporting and configuration management capabilities.
  Coupled by a heartbeat software, the agent completes a full cluster stack.
  It is licensed under the GNU General Public License v2. 

* the collector
  The collector aggregates the agents-reported data and the data fetched from the sites infrastructure (network, SAN, storage arrays, backup servers and asset managers).
  It also serves the configuration management targets.
  The collector is a commercially-licenced web 2.0 application.
  The Resource Management features of the agent are fully functional in the absence of a collector.

These two components together address a wide range of modern IT concerns, including:

* service mobility

  * business continuity
  * high availability clustering
  * providing reliable and abstracted method to stop, start and move a service or a group of services

* configuration management

  * scalable to thousands of servers, services and configuration rules
  * cluster aware
  * minimal dependencies
  * strict separation of configuration targets from audit and remediation methods

* inventoring

  * services
  * assets
  * storage arrays and SAN
  * networks
  * backups
  * cloud-hosted resources
  * software and hardware lifecycle management
  * infrastructure resources accounting and billing

* orchestration and interoperability

  * pervasive RestFul API
  * self-service portal
  * provisioning
  * fine-grained privileges and tasks delegation capabilities

* continuous infrastructure, systems, and services auditing

  * alarming
  * performance and quality analysis
  * trending
  * file changes recording
  * servers differential analysis

* boost the IT productivity

  * low total cost of ownership
  * minimal infrastructure maintenance
  * maximize the delegation of tasks to lower-grade profiles
  * speed tasks through automation and/or self service
  * focus the higher-grade profiles on orchestration and configuration management designing
  * shorten post-mortem analysis

OpenSVC is operating system, application and hardware agnostic.


History
=======

The OpenSVC project was born in November 2009.

