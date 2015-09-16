Docker Enterprise Architecture
==============================

If you are engaged in Docker at an enterprise scale level, you are certainly facing to architecture considerations like:

* how to build a robust and secure docker infrastructure ?
* how to deal with docker container lifecycle ?
* how to implement segregated environments (production, development, integration, user acceptance tests, ...) ?

OpenSVC propose a ready to use model to integrate docker in your company, as described in the picture below

.. image:: _static/docker.enterprise.architecture.png
   :align:  center

Description
-----------

This architecture is made of 3 main docker vertical lines :

* Production on the left
* User Acceptance Tests in the middle
* Development on the right

Each line has :

* a dedicated pool of physical nodes to host `OpenSVC services running Docker <virtualization.docker.multiple_docker_instances.html>`_
* a dedicated `docker private registry hub <virtualization.docker.private_registry.html>`_, storing the accurate docker images
* a set of OpenSVC services, embedding `one or more docker containers <virtualization.docker.multi_containers.html>`_, rendering mass docker container management very powerful

Bullet Point 1
^^^^^^^^^^^^^^

* First user in the docker infrastructure is the technical people involved in building new environments
* They have their own docker environment on their laptop, pull images from public docker hub registry, modify them to achieve their aims, and push them on the Dev private docker hub, which is an OpenSVC service named ``dckhub.dev``

Bullet Point 2
^^^^^^^^^^^^^^

* Development teams are responsible of deploying docker containers, exactly like they are executed on production infrastructure.
* An exact copy of production OpenSVC service is used, except its name which explicitly points to development environment (``app1.dev``, ``app2.dev``, ...). Of course, development services are not obliged to execute the same Docker images & containers as in production (we want to be like in production, but still be able to deal with applications and containers version upgrade)
* They can push/pull from/to the ``dckhub.dev`` private hub, and adjust their development/integration to meet application expectations.

Bullet Point 3
^^^^^^^^^^^^^^

* An application responsible called ``Release Manager`` decide when an application is ready, and eligible to user acceptance tests.
* It pulls the accurate docker images from the ``dckhub.dev`` private Dev hub, and push it on the ``dckhub.tst`` test hub.

Bullet Point 4
^^^^^^^^^^^^^^

* Teams charged of running test plans are told to start tests on new application just published by ``Release Manager``
* They only pull images in OpenSVC services ``app1.tst``, ``app2.tst``, start them, and just have to execute the test plans.
* Either tests are OK, and application can go to production, or tests are not, and Delopment teams have to rework so as to achieve the expected state.

Bullet Point 5
^^^^^^^^^^^^^^

* An application responsible called ``Production Release Manager`` decide when an application can go to production.
* It pulls the accurate docker images from the ``dckhub.tst`` private test hub, and push it on the ``dckhub.prd`` production hub.

Bullet Point 6
^^^^^^^^^^^^^^

* Operation/Production teams are responsible of running applications in the production context
* They align OpenSVC services (``app1.prd``, ``app2.prd``) configuration to point to the accurate docker images, plan downtime, update containers and restart service.

Bullet Point 7
^^^^^^^^^^^^^^

* OpenSVC collector (optional in the architecture) can complete the picture by providing :

  * Service configuration compliance

    * basically, compliance rules are declared in the collector, and pushed to every OpenSVC agent
    * on a recurrent basis (once a week, once a day, ...), OpenSVC agent checks the rules and report if they are respected or not
    * as an example, you could describe the contextual ruleset below :

    ::

      +- it.applications.app1 (contextual ruleset, shown to all app1 OpenSVC services)
         |
         +- it.applications.app1.dev (contextual ruleset, matching app1 **Dev** OpenSVC services)
         |  |
         |  +- container#1.image_id = 1111122222 (docker image id to be used to instantiate container)
         |  `- container#2.image_id = 2222211111
         |
         +- it.applications.app1.tst (contextual ruleset, matching app1 **Tst** OpenSVC services)
         |  |
         |  +- container#1.image_id = 3333344444
         |  `- container#2.image_id = 4444433333
         |
         `- it.applications.app1.prd (contextual ruleset, matching app1 **Prd** OpenSVC services)
            |
            +- container#1.image_id = 5555566666
            `- container#2.image_id = 6666655555 


  This way, you can very easily ensure that no change happen on your infrastructure: your docker containers stacked together, and managed through OpenSVC services will remain predictive, in 2 weeks, in 2 months, as soon as compliance jobs are not reporting errors, you are sure of the quality of your production delivery.

  * Up to date OpenSVC services and docker images inventory per application, making infrastructure billing on a per application/project basis very easy. It's also very simple if you have to build an exhaustive list of Docker images used in Production.

  * Web based OpenSVC services management

    * can be segregated to allow dev people to access dev services only, etc
    * on compliance defaults, remediation campains can be scheduled and triggered from the web interface

.. note:: you can run compliance rules against a lot of parameters, at the service or node level, this example is just focusing on Docker context

Considerations
--------------

Storage
^^^^^^^

* You may complain about registry hubs storage space waste because their datas are duplicated once per line

  * Keep in mind that this data is very static and does not need high performance storage devices (SATA/NL-SAS technology is a good affordable candidate)

  * You can also decrease physical storage occupancy by hosting your docker datas on a storage array equipped with data deduplication features

High Availability
^^^^^^^^^^^^^^^^^

If you consider that some parts of the architecture have to be redundant and highly available, you should have a look at the `Docker high availability tutorial <virtualization.docker.high_availability.html>`_

Disaster Recovery
^^^^^^^^^^^^^^^^^

If you are concerned about disaster recovery plan, you should have a look at the `Docker Disaster Recovery Plan Tutorial <virtualization.docker.disaster_recovery_plan.html>`_
It can be easily enabled with simple replication tools like rsync, or even with proprietary solutions like block device replication (EMC SRDF, NetApp SnapMirror, HP 3Par Remote Replication, ...)
