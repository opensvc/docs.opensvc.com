Docker
******

Docker (https://www.docker.io/) is now a standard container technology. drastically changing the way applications are deployed.

OpenSVC is a powerful containers orchestrator. In this field, OpenSVC aims to be a sysops-friendly, easy to deploy, manage and troubleshoot alternative to Kubernetes.

This tutorial walks the reader through simple to advanced deployment scenarios.


Pre-Requisites
==============

* A linux distribution with docker up and running
* A OpenSVC Agent up and running

Simplest Service Configuration
==============================

One single-node service with one container.

::

	root@deb1:/etc/opensvc# echo '{"container#1": {"type": "docker", "image": "nginx"}}' | svcmgr create -s svc1 --config=- --provision
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

	root@deb1:/etc/opensvc# svc1 print status 
	svc1                               up                                                           
	`- instances              
	   `- deb1.opensvc.com             up         idle, started 
	      `- container#1      ........ up         docker container svc1.container.1@nginx           

All ressources are down when the service is just created.

Docker Commands via OpenSVC
===========================

The service eases the docker commands on its containers. The following commands work wether the service uses a private docker daemon or the system's (shared) docker daemon.

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

Local, synchronous, service instance stop::

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

Service Start
=============

Local, synchronous, service instance start::

	root@deb1:/etc/opensvc# svc1 start --local
	deb1.opensvc.com.svc1.container#1   docker start 3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   output:
	deb1.opensvc.com.svc1.container#1   3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   wait for up status
	deb1.opensvc.com.svc1.container#1   wait for container operational

The instance was not removed on stop nor start. OpenSVC started the same instance. Setting the ``rm`` keyword to ``true`` would change that behaviour, and cause OpenSVC to remove the instance on start (and start if not already removed).

::

	root@deb1:/etc/opensvc# svc1 set --kw container#1.rm=true
	root@deb1:/etc/opensvc# svc1 restart
	deb1.opensvc.com.svc1.container#1   docker stop 3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   output:
	deb1.opensvc.com.svc1.container#1   3c9bc5d7a09ac1b4a80123929166e1242b9aefb6d2842a5fc85d066b88fb8db8
	deb1.opensvc.com.svc1.container#1   docker rm svc1.container.1
	deb1.opensvc.com.svc1.container#1   wait for down status
	deb1.opensvc.com.svc1             instance stopped, ready for restart.
	deb1.opensvc.com.svc1.container#1   docker run -d --name=svc1.container.1 --net=none --cgroup-parent /opensvc.slice/svc1.slice/container.slice/container.1.slice nginx
	deb1.opensvc.com.svc1.container#1   output:
	deb1.opensvc.com.svc1.container#1   d7613f30811040a7d18f8e3e2c1f9caf7ebe31b3240ce34a211fd463cf030f3c
	deb1.opensvc.com.svc1.container#1   wait for up status
	deb1.opensvc.com.svc1.container#1   wait for container operational


Next Topics
===========

.. toctree::
   :maxdepth: 1

   agent.templates/template.service.container.docker
   agent.service.container.docker.multi_containers
   agent.service.container.docker.relocation
   agent.service.container.docker.hosting
   agent.service.container.docker.disaster_recovery_plan
   agent.service.container.docker.private_registry
   agent.service.container.docker.enterprise_architecture
   agent.service.container.docker.amazon
