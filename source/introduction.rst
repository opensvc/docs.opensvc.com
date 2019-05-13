Introduction
************

What is OpenSVC
===============

OpenSVC is a Open Source software product and the name of the commercial entity developping and supporting it. The product will be referenced as "OpenSVC" and the company "OpenSVC co". This book covers extensively the OpenSVC goals, design and usage.

This software is used in large scale and critical production since 2009.

OpenSVC is composed of two software components:

* the agent

  The OpenSVC agent is a supervisor, clusterware, container orchestrator and configuration manager.
  It is licensed under the GNU General Public License v2. 

* the collector

  The collector aggregates the agents-reported data and the data fetched from the sites infrastructure (network, SAN, storage arrays, backup servers and asset managers).
  It also serves the configuration management targets.
  The collector is a commercially-licenced web 2.0 application.
  The clustering and container orchestration features of the OpenSVC agent don't require a collector.

These two components together address a wide range of modern IT concerns, including:

* Service mobility

  * business continuity
  * high availability clustering
  * providing reliable and abstracted method to stop, start and move a service or a group of services

* Configuration management

  * scalable to thousands of servers, services and configuration rules
  * cluster aware
  * minimal dependencies
  * strict separation of configuration targets from audit and remediation methods

* Inventoring

  * services
  * assets
  * storage arrays and SAN
  * networks
  * backups
  * cloud-hosted resources
  * software and hardware lifecycle management
  * infrastructure resources accounting and billing

* Orchestration and interoperability

  * pervasive RestFul API
  * self-service portal
  * provisioning
  * fine-grained privileges and tasks delegation capabilities

* Continuous infrastructure, systems, and services auditing

  * alarming
  * performance and quality analysis
  * trending
  * file changes recording
  * servers differential analysis

* Boost the IT productivity

  * low total cost of ownership
  * minimal infrastructure maintenance
  * maximize the delegation of tasks to lower-grade profiles
  * speed tasks through automation and/or self service
  * focus the higher-grade profiles on orchestration and configuration management designing
  * shorten post-mortem analysis

OpenSVC is operating system, application and hardware agnostic.

Subsystems requirements
=======================

========================================================== ====== =========
Subsystem                                                  Agent  Collector
========================================================== ====== =========
Service mobility, clustering, container orchestration      O
Configuration management                                   O      O
Inventoring                                                O      O
Orchestration and interoperability                         O      O
Continuous infrastructure, systems, and services auditing  O      O
Boost the IT productivity                                  O      O
========================================================== ====== =========

