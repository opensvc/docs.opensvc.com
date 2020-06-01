Design Apps
===========

Applications are composed of one or more objects (services, configs, secrets, volumes, service accounts).

The first design decision is the application split into different services. The main reasons for splitting are:

* Different lifecycle (volume vs svc)
* Different topologies (failover, active-active, scaler)
* Security

When the split is decided, each object must be named.

Each object configuration can be designed on a development cluster or namespace. These configurations can be tracked alongside the application code base.

Finally, the configurations can be deployed on test, up to production clusters or namespaces. Usually, these deployments are handled by a CI/CD pipeline.

.. toctree::
   :maxdepth: 2

   agent.service.namespaces
   agent.secrets
   agent.service.references
   agent.service.provisioning
   agent.node.selector
   agent.service.encapsulation
   agent.service.orchestration
   agent.service.scoping
   agent.service.resourcesets
   agent.service.resources
