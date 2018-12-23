Docker
******

Docker (https://www.docker.io/) is now a standard container technology. drastically changing the way applications are deployed. This tutorial explains how the OpenSVC open source free agent orchestrates docker containers. 

This tutorial is useful for all people who want to answer those questions :

* `My application is built on 3 Docker images, how do I launch them together ? <agent.service.container.docker.multi_containers.html>`_ 
* `How do I setup my own private Docker registry ? <agent.service.container.docker.private_registry.html>`_
* `How do I relocate my Docker infrastructure on another physical server ? <agent.service.container.docker.relocation.html>`_
* `How do I build a Docker high availability infrastructure ? <agent.service.container.docker.high_availability.html>`_
* `How do I host multiple Docker installations on the same host (dev, test, preproduction, ...) ? <agent.service.container.docker.multiple_docker_instances.html>`_
* `Lots of people use Docker in my company, how do I setup a disaster recovery solution ? <agent.service.container.docker.disaster_recovery_plan.html>`_
* `Lots of people use Docker in my company, how do I chargeback docker usage depending on image or container count or even used space ? <agent.service.container.docker.chargeback.html>`_
* `What kind of Docker architecture could I use in my company ? <agent.service.container.docker.enterprise_architecture.html>`_


Installing Docker as an OpenSVC Service
=======================================

Typical docker implementation is ensured by installing your favorite linux distribution packages. Basically they install Docker software, and some startup scripts. Let's setup Docker in an OpenSVC service.

Pre-Requisites
--------------

* a linux distro known to work with Docker
* kernel 3.8 or upper
* OpenSVC Agent (open source free software)

Docker Installation
-------------------

::

        root@deb1:~# sh -c "echo deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.source.list
        root@deb1:~# apt-get update -y
        root@deb1:~# apt-get install docker.io
        root@deb1:~# docker images
        REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

We end up with running docker instance, using all debian defaults, like /var/lib/docker as Docker's root folder, which is empty.

OpenSVC Installation
--------------------

Please follow the steps described in `OpenSVC installation <howto.getting.started.html#opensvc-installation>`_

Quick links to OpenSVC software installation

**DEB**::

        curl -o /tmp/opensvc.latest.deb https://repo.opensvc.com/deb/current && dpkg -i /tmp/opensvc.latest.deb

**RPM**::

        curl -o /tmp/opensvc.latest.rpm https://repo.opensvc.com/rpms/current && rpm -ivh /tmp/opensvc.latest.rpm

Simplest Service Configuration
==============================

::

	root@deb1:/opt/opensvc# echo '{"container#1": {"type": "docker", "image": "nginx"}}' | svcmgr create -s svc1 --config=- --provision
	deb1.opensvc.com.svc1             service svc1 target state set to provisioned


Which installs the following configuration::

	root@deb1:/etc/opensvc# svcmgr -s svc1 print config
	[DEFAULT]
	id = fab0bc71-0434-42a4-9fcd-daac32efda91

	[container#1]
	type = docker
	image = nginx

.. note:: The complete container.docker keywords reference is linked in the toc at the end of this page.

The provisioning is asynchronously handled by the OpenSVC daemon. After a few seconds, the service status is::

	root@deb1:/opt/opensvc# svc1 print status 
	svc1                               up                                                           
	`- instances              
	   `- deb1.opensvc.com             up         idle, started 
	      `- container#1      ........ up         docker container svc1.container.1@nginx           

All ressources are down when the service is just created.

Docker Command via OpenSVC
==========================

The service eases the docker commands on its containers.

**querying the docker images**::

	root@deb1:/etc/opensvc# svc1 docker images
	REPOSITORY             TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
	nginx                  latest              f895b3fb9e30        12 months ago       108MB

**querying the docker instances**::

	root@deb1:/etc/opensvc# svc1 docker ps
	CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS               NAMES
	3c9bc5d7a09a        nginx                    "nginx -g 'daemon of…"   8 minutes ago       Up 8 minutes                            svc1.container.1

**inspecting a docker instance**::

	root@deb1:/etc/opensvc# svc1 docker inspect {container#1} | head
	[
	    {
		"Id": "3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8",
		"Created": "2018-12-23T22:12:21.662430293Z",
		"Path": "nginx",
		"Args": [
		    "-g",
		    "daemon off;"
		],
		"State": {

.. note:: OpenSVC wraps Docker's commands. Every Docker supported option will be passed to the Docker binary, and OpenSVC ensure that return codes from docker binary are propagated. OpenSVC sets up the appropiate docker socket and substitutes {container#<n>} references with the corresponding instance name.

Service Stop
============

Let do a local, synchronous, service instance stop::

	root@deb1:/etc/opensvc# svcmgr -s svc1 stop --local
	deb1.opensvc.com.svc1.container#1   docker stop 3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   output:
	deb1.opensvc.com.svc1.container#1   3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   wait for down status

	root@deb1:/etc/opensvc# svcmgr -s svc1 print status
	svc1                               down                                               
	`- instances              
	   `- deb1.opensvc.com             down       idle                  
	      `- container#1      ........ down       docker container svc1.container.1@nginx 

See Also
========

.. toctree::
   :maxdepth: 1

   agent.templates/template.service.container.docker
   agent.service.container.docker.multi_containers
   agent.service.container.docker.private_registry
   agent.service.container.docker.relocation
   agent.service.container.docker.high_availability
   agent.service.container.docker.multiple_docker_instances
   agent.service.container.docker.disaster_recovery_plan
   agent.service.container.docker.chargeback
   agent.service.container.docker.enterprise_architecture
   agent.service.container.docker.amazon
