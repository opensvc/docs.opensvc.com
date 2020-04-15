Docker Private Registry
=======================

Docker depends on registry component, which is a repository where docker images are stored, and served from to allow pull/push by docker daemons. Although Docker (https://www.docker.io/) offers private registries SaaS, you may prefer to avoid exposing your docker containers outside of your private IT infrastructure, provide a close-to-consumer registries mesh, dedicate registries to consumer populations.

This tutorial describes how you can install and run your own Docker registry.

Pre-requisites
--------------

* An OpenSVC node with docker installed and running
* CNI binaries installed
* Access to the docker.io registry from the node

Service Creation
----------------

::

	cat > /tmp/registry.template << EOF
	[DEFAULT]
	orchestrate = ha
	nodes = {clusternodes}

	[ip#1]
	type = cni
	netns = container#0

	[container#0]
	type = docker
	image = google/pause

	[container#1]
	type = docker
	image = registry
	volume_mounts = {svcname}-data/registry:/var/lib/registry
	netns = container#0

	[volume#1]
	name = {svcname}-data
	size = {env.size}
	access = rwo

	[env]
	size = 10g

	EOF

::

	svcmgr create -s test/registry --config /tmp/registry.template --provision

After a few seconds

::

	$ om test/registry print status
	registry                         up                                                                  
	`- instances            
	   |- nuc-cva                    down       idle                                   
	   `- aubergine                  up         idle, started        
	      |- ip#1           ........ up         cni default 10.22.0.122/16 eth12                         
	      |- volume#1       ........ up         registry-data                                            
	      |- container#0    ........ up         docker container test..registry.container.0@google/pause 
	      |- container#1    ........ up         docker container test..registry.container.1@registry     
	      `- sync#i0        ...O./.. up         rsync svc config to nodes                                


The registry is up and running.

.. warning:: The docker registry does not deal with access control. As soon as the docker container is up, everyone is allowed to push/pull images to/from the registry. You can add authentification via the OpenSVC collector or a tiers solution, or simply bind the registry to the loopback ip address for a development laptop.

Testing the registry
--------------------

On the demonstration setup, the cluster name is "homepool2", so the created registry is accessible via the cluster dns name ``registry.test.svc.homepool2``.

**Tag an image to push to the private registry** ::

	$ sudo docker tag google/pause:latest registry.test.svc.homepool2:5000/google/pause:latest

**Push the tagged image to the private registry** ::

	$ sudo docker push registry.test.svc.homepool2:5000/google/pause:latest
	The push refers to a repository [registry.test.svc.homepool2:5000/google/pause]
	5f70bf18a086: Pushed 
	e16a89738269: Pushed 
	latest: digest: sha256:b31bfb4d0213f254d361e0079deaaebefa4f82ba7aa76ef82e90b4935ad5b105 size: 938

