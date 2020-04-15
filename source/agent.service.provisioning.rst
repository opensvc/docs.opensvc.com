.. _agent-service-provisioning:

Provisioning
************

Introduction
============

Services and volumes objecs handle resources activation and desactivation: disk, volumes groups, filesystems for example. Upon creation, the resources may or may not already exist. In the later case, the object can provision them, in other words the object can allocate disks and ip address, create volume groups and logical volume, format filesystems, create containers, pull docker images.

This section describes:

* how this provisioning feature work
* how to provision and template services
* some useful examples

Provisioners
============

Each resource driver can implement a provisioner, but not all resources actually do. The list of drivers with provisioning keywords::

	$ egrep -l "provisioning:\s*True" <OSVCDOC>/template.*conf | sed -e "s@<OSVCDOC>/template.service.@@" -e "s@.conf@@" | grep -v "fs\."
	container.esx
	container.kvm
	container.lxc
	container.lxd
	container.ovm
	container.srp
	container.vz
	container.xen
	container.zone
	disk.disk
	disk.gce
	disk.loop
	disk.lv
	disk.lvm
	disk.md
	disk.pool
	disk.rados
	disk.veritas
	disk.vg
	disk.vxdg
	disk.vxvol
	disk.zpool
	disk.zvol
	fs
	ip.amazon
	ip
	ip.crossbow
	ip.docker
	ip.gce
	ip.netns
	volume

Each resource provisioner may require or support additional parameters. The resource configuration templates in ``<OSVCDOC>`` highlight these particular parameters with ``provisioning = True``. The list of provisioning keywords of the ``fs.xfs`` driver can thus be extracted using::

        $ egrep -B 5 "provisioning:\s*True" <OSVCDOC>/template.fs.xfs.conf \
            | grep keyword
        # keyword:          vg
        # keyword:          size

A provisioner can update the DEFAULT and resource configuration parameters. For example, most ip provisioners set the resource ``ipname`` parameter.


Provisioning Workflow
=====================

The provisioning can be either local (--local) or orchestrated.

When orchestrated, the daemon starts provisioning the instance on the placement leaders. When provisioned, these instances stays ``up`` and the daemons move on to provisioning all other instances in parallel. Those are rollbacked after provisioned, so the service is in optimal state at the end of the orchestration.

The CRM command run on the leader node is::

	$ om <path> provision --local --disable-rollback --leader

The CRM command run on the non-leader nodes is::

	$ om <path> provision --local

The provisioners are run in the start natural order. Each resource is left in the ``up`` state after its provisioning, so that the following provisioners can count on their availability to proceed. For example, a amazon allocated disk must be left attached for a fs provisioner to format it.

Shared Resources
================

Shared resources (like SAN disks visible on multiple nodes, filesystems hosted on these disks, failover ip addresses), if any, must only be provisioned on the leader and not reprovisioned on the other nodes. Implementing this behaviour requires the admin to explicitely flag such resources as shared using the generic ``shared = true`` resource keyword. The provisioned state of shared resources is synchronized automatically amongst the service or volume nodes, whereas the provisioned state of local resources is node-affine.

It is possible to provision all or part of the resources manually, before the service creation. In this case, those resources will be reported as unprovisioned (a ``P`` flag in the print status output). A successful resource start will mark the resource as provisioned (if it starts ok, it is sane to consider it provisioned). If starting the resource is not possible or desirable, the agent still provides a way to force the resource status as provisioned::

	$ om <path> set provisioned --rid <rid>,<rid>

Or even all the local instance resources using::

	$ om <path> set provisioned

Provisioning Usage
==================

The provisioners are activated either by the ``provision`` and ``deploy`` action or by setting the ``--provision`` option with the following actions.

Create
++++++

* ``om <path> create --template <uri>|<template>``

  Creates a service using a configuration file pointed by ``--template``. ``<uri>`` being a local or remote path. ``<template>`` being a collector served template id or template name. Served templates can be searched with ``om node collector search --like prov:<substring>``

* ``om <path> create --config <uri>``

  Creates a service using a configuration file pointed by ``--config <uri>``. ``<uri>`` being a local or remote path.

* ``om <path> create --resource <json definition> ...``

  Creates a service using definitions passed as ``--resource`` arguments.

Each ``--resource`` argument takes a JSON formatted dictionary. The keys are the resource or DEFAULT section normal parameters, plus extra keys described in the following table.

+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Key      | Description                                                                                                                                                 |
+==========+=============================================================================================================================================================+
| rtype    | The resource main type. The resource identifier (rid) is formed of this rtype concatenated with ``#`` and an increment. Example: a ``fs`` rtype will select |
|          | the fs resource driver for a new resource with rid ``fs#0``                                                                                                 |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+

The ``create`` service action will take care of the ``etc/mysvc*`` directories and symlinks creation and the provisioning if ``--provision`` is set.

Example::

  $ om mysvc create --config /etc/opensvc/mysvc.conf --provision

Update
++++++

Add or change a resource definition to an existing service. Definitions are passed as ``--resource`` arguments.

Pull
++++

Creates a service using the configuration file of the service fetched from the collector.

Service Templates
=================

A template is a normal service configuration file with parts you can replace with references and/or arithmetic evaluations. Templates can be stored in the local fs, served through ftp, http, https, or served by the collector with publications ACL.

A template is instanciated by copying its content as a service configuration file (``<OSVCETC>/<svcname>.conf`` or ``<OSVCETC>/<namespace>/<kind>/<name>.conf``).

Arithmetic Expressions
++++++++++++++++++++++

The arithmetic evaluation format is ``$(<expr>)``. An evaluation can contain references.

References
++++++++++

The reference format is ``{[<section>.]<option>}``, where section is a configuration file section name, and <option> is the option name in the pointed section. If section is ommited, the ``DEFAULT`` section is implicitely used. A reference can also contain arithmetic evaluations.

.. seealso:: :ref:`agent-service-references`

Env section
+++++++++++

References to the ``env`` section are special:

* Options in the ``env`` are not submitted the synthaxic checks run by ``om <path> validate config`` and ``om <path> edit``.

* ``om <path> create --interactive`` prompts for each env key value, suggesting the value set in the template as default.

* ``om <path> create --env <option>=<value>`` overrides the env options default values.

* System's uppercased environment variables override the env options default values and values specified with ``--env``.


Provisioning Examples
=====================

Docker Service on Amazon
++++++++++++++++++++++++

Template ``testec2docker.template``:

::

  [DEFAULT]
  env = TST
  nodes = node12.nsx.lab.net
  docker_data_dir = /srv/{svcname}/docker
  
  [ip#0]
  ipname = <allocate>
  #eip = <allocate>
  type = amazon
  ipdev = eth0
  docker_daemon_ip = true
  cascade_allocation = ip#1.ipname
  
  [ip#1]
  ipname = localhost
  ipdev = eth0
  
  [disk#0]
  type = amazon
  volumes = <size=15>
  
  [fs#0]
  type = btrfs
  mnt_opt = defaults,subvol=docker
  mnt = /srv/{svcname}/docker
  standby = true
  dev = /var/lib/opensvc/{svcname}/dev/disk.0.0
  
  [fs#1]
  type = btrfs
  mnt_opt = defaults,subvol=data
  mnt = /srv/{svcname}/data
  dev = /var/lib/opensvc/{svcname}/dev/disk.0.0
  
  [container#0]
  image = ubuntu:14.10
  type = docker
  run_args = --net=bridge -p 80:80
  command = /bin/bash
  
  [container#1]
  image = nginx:latest
  type = docker
  netns = container#0
  
  [sync#0]
  type = docker
  target = nodes drpnodes
  
  [sync#1]
  src = {svcname}.fs.0:data
  dst = {svcname}.fs.0:data
  type = btrfs
  target = drpnodes

Provision:

::

  $ om testec2docker4.nsx.lab.net --config testec2docker.template --provision create --leader --disable-rollback
  INFO    testec2docker4.nsx.lab.net                  svcmgr -s testec2docker4.nsx.lab.net --config /etc/opensvc/testec2docker4.nsx.lab.net.conf --provision create
  INFO    testec2docker4.nsx.lab.net.ip#0             aws --output=json ec2 assign-private-ip-addresses --network-interface-id eni-033adc4b --secondary-private-ip-address-count 1
  INFO    testec2docker4.nsx.lab.net.ip#0             public ip already provisioned
  INFO    testec2docker4.nsx.lab.net.ip#0             cascade 10.0.0.221 to ip#1.ipname
  INFO    testec2docker4.nsx.lab.net.ip#0             provisioned
  INFO    testec2docker4.nsx.lab.net.ip#0             ec2 ip 10.0.0.221 is already assigned to this node
  INFO    testec2docker4.nsx.lab.net.ip#1             checking 10.0.0.221 availability
  INFO    testec2docker4.nsx.lab.net.ip#1             ifconfig eth0:3 10.0.0.221 netmask 255.255.255.0 up
  INFO    testec2docker4.nsx.lab.net.ip#1             arping -U -c 1 -I eth0 -s 10.0.0.221 10.0.0.221
  INFO    testec2docker4.nsx.lab.net.disk#0           aws --output=json ec2 create-volume --size 15 --availability-zone us-west-2b
  INFO    testec2docker4.nsx.lab.net.disk#0           vol-464a8f87 state: creating
  INFO    testec2docker4.nsx.lab.net.disk#0           vol-464a8f87 state: creating
  INFO    testec2docker4.nsx.lab.net.disk#0           vol-464a8f87 state: available
  INFO    testec2docker4.nsx.lab.net.disk#0           provisioned
  INFO    testec2docker4.nsx.lab.net.disk#0           aws --output=json ec2 attach-volume --instance-id i-40753486 --volume-id vol-464a8f87 --device /dev/sdh
  INFO    testec2docker4.nsx.lab.net.disk#0           /dev/xvdh is not present yet
  INFO    testec2docker4.nsx.lab.net.disk#0           /dev/xvdh is not present yet
  INFO    testec2docker4.nsx.lab.net.disk#0           /dev/xvdh is not present yet
  INFO    testec2docker4.nsx.lab.net.disk#0           /dev/xvdh is not present yet
  INFO    testec2docker4.nsx.lab.net.disk#0           /dev/xvdh is not present yet
  INFO    testec2docker4.nsx.lab.net.fs#1             /var/lib/opensvc/testec2docker4.nsx.lab.net/dev/disk.0.0 is not formatted
  INFO    testec2docker4.nsx.lab.net.fs#1             mkfs.btrfs /var/lib/opensvc/testec2docker4.nsx.lab.net/dev/disk.0.0
  WARNING testec2docker4.nsx.lab.net.fs#1             command succesful but stderr:
  Turning ON incompat feature 'extref': increased hardlink limit per file to 65536
  INFO    testec2docker4.nsx.lab.net.fs#1             output:
  WARNING! - Btrfs v3.12 IS EXPERIMENTAL
  WARNING! - see http://btrfs.wiki.kernel.org before using
  fs created label (null) on /var/lib/opensvc/testec2docker4.nsx.lab.net/dev/disk.0.0
  nodesize 16384 leafsize 16384 sectorsize 4096 size 15.00GiB
  Btrfs v3.12
  INFO    testec2docker4.nsx.lab.net.fs#1             mount -t btrfs -o subvolid=0 /var/lib/opensvc/testec2docker4.nsx.lab.net/dev/disk.0.0 /tmp/tmpuVZnvv
  INFO    testec2docker4.nsx.lab.net.fs#1             btrfs filesystem label /tmp/tmpuVZnvv testec2docker4.nsx.lab.net.fs.1
  INFO    testec2docker4.nsx.lab.net.fs#1             btrfs subvol create /tmp/tmpuVZnvv/data
  INFO    testec2docker4.nsx.lab.net.fs#1             output:
  Create subvolume '/tmp/tmpuVZnvv/data'
  INFO    testec2docker4.nsx.lab.net.fs#1             umount /tmp/tmpuVZnvv
  INFO    testec2docker4.nsx.lab.net.fs#1             provisioned
  INFO    testec2docker4.nsx.lab.net.fs#1             btrfs device scan
  INFO    testec2docker4.nsx.lab.net.fs#1             output:
  Scanning for Btrfs filesystems
  INFO    testec2docker4.nsx.lab.net.fs#1             mount -t btrfs -o defaults,subvol=data LABEL=testec2docker4.nsx.lab.net.fs.1 /srv/testec2docker4.nsx.lab.net/data
  INFO    testec2docker4.nsx.lab.net.fs#0             mount -t btrfs -o subvolid=0 /var/lib/opensvc/testec2docker4.nsx.lab.net/dev/disk.0.0 /tmp/tmpNPV_d8
  INFO    testec2docker4.nsx.lab.net.fs#0             btrfs subvol create /tmp/tmpNPV_d8/docker
  INFO    testec2docker4.nsx.lab.net.fs#0             output:
  Create subvolume '/tmp/tmpNPV_d8/docker'
  INFO    testec2docker4.nsx.lab.net.fs#0             umount /tmp/tmpNPV_d8
  INFO    testec2docker4.nsx.lab.net.fs#0             provisioned
  INFO    testec2docker4.nsx.lab.net.fs#0             btrfs device scan
  INFO    testec2docker4.nsx.lab.net.fs#0             output:
  Scanning for Btrfs filesystems
  INFO    testec2docker4.nsx.lab.net.fs#0             mount -t btrfs -o defaults,subvol=docker LABEL=testec2docker4.nsx.lab.net.fs.1 /srv/testec2docker4.nsx.lab.net/docker
  INFO    testec2docker4.nsx.lab.net.container#0      starting docker daemon
  INFO    testec2docker4.nsx.lab.net.container#0      docker -H unix:///var/lib/opensvc/testec2docker4.nsx.lab.net/docker.sock -r=false -d -g /srv/testec2docker4.nsx.lab.net/docker -p /var/lib/opensvc/testec2docker4.nsx.lab.net/docker.pid --ip 10.0.0.221 --exec-opt native.cgroupdriver=cgroupfs
  INFO    testec2docker4.nsx.lab.net.container#0      docker -H unix:///var/lib/opensvc/testec2docker4.nsx.lab.net/docker.sock run -t -i -d --name=testec2docker4.nsx.lab.net.container.0 --net=bridge -p 80:80 -v /etc/localtime:/etc/localtime:ro --cgroup-parent /testec2docker4.nsx.lab.net/container.docker/container.0 ubuntu:14.10 /bin/bash
  WARNING testec2docker4.nsx.lab.net.container#0      command succesful but stderr:
  Unable to find image 'ubuntu:14.10' locally
  14.10: Pulling from ubuntu
  6d370c930acc: Pulling fs layer
  9a63f1e91c4c: Pulling fs layer
  74364530838d: Pulling fs layer
  dce38fb57986: Pulling fs layer
  dce38fb57986: Pulling fs layer
  dce38fb57986: Layer already being pulled by another client. Waiting.
  74364530838d: Verifying Checksum
  74364530838d: Download complete
  dce38fb57986: Verifying Checksum
  dce38fb57986: Download complete
  dce38fb57986: Download complete
  9a63f1e91c4c: Verifying Checksum
  9a63f1e91c4c: Download complete
  6d370c930acc: Verifying Checksum
  6d370c930acc: Download complete
  6d370c930acc: Pull complete
  9a63f1e91c4c: Pull complete
  74364530838d: Pull complete
  dce38fb57986: Pull complete
  dce38fb57986: Already exists
  ubuntu:14.10: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
  Digest: sha256:6341c688b4b0b82ec735389b3c97df8cf2831b8cb8bd1856779130a86574ac5c
  Status: Downloaded newer image for ubuntu:14.10
  INFO    testec2docker4.nsx.lab.net.container#0      output:
  bed299be99fabccf55087d0af1e9ebcf886158c5f83c32efd0819c457c579d03
  INFO    testec2docker4.nsx.lab.net.container#0      wait for container up status
  INFO    testec2docker4.nsx.lab.net.container#0      wait for container operational
  INFO    testec2docker4.nsx.lab.net.container#1      docker -H unix:///var/lib/opensvc/testec2docker4.nsx.lab.net/docker.sock run -t -i -d --name=testec2docker4.nsx.lab.net.container.1 -v /etc/localtime:/etc/localtime:ro --net=container:testec2docker4.nsx.lab.net.container.0 --cgroup-parent /testec2docker4.nsx.lab.net/container.docker/container.1 nginx:latest
  WARNING testec2docker4.nsx.lab.net.container#1      command succesful but stderr:
  Unable to find image 'nginx:latest' locally
  latest: Pulling from nginx
  843e2bded498: Pulling fs layer
  8c00acfb0175: Pulling fs layer
  426ac73b867e: Pulling fs layer
  d6c6bbd63f57: Pulling fs layer
  4ac684e3f295: Pulling fs layer
  91391bd3c4d3: Pulling fs layer
  b4587525ed53: Pulling fs layer
  0240288f5187: Pulling fs layer
  28c109ec1572: Pulling fs layer
  063d51552dac: Pulling fs layer
  d8a70839d961: Pulling fs layer
  ceab60537ad2: Pulling fs layer
  063d51552dac: Verifying Checksum
  063d51552dac: Download complete
  ceab60537ad2: Verifying Checksum
  ceab60537ad2: Download complete
  28c109ec1572: Verifying Checksum
  28c109ec1572: Download complete
  91391bd3c4d3: Verifying Checksum
  91391bd3c4d3: Download complete
  426ac73b867e: Verifying Checksum
  426ac73b867e: Download complete
  4ac684e3f295: Verifying Checksum
  4ac684e3f295: Download complete
  0240288f5187: Verifying Checksum
  0240288f5187: Download complete
  d6c6bbd63f57: Verifying Checksum
  d6c6bbd63f57: Download complete
  8c00acfb0175: Verifying Checksum
  8c00acfb0175: Download complete
  d8a70839d961: Verifying Checksum
  d8a70839d961: Download complete
  b4587525ed53: Verifying Checksum
  b4587525ed53: Download complete
  843e2bded498: Verifying Checksum
  843e2bded498: Download complete
  843e2bded498: Pull complete
  8c00acfb0175: Pull complete
  426ac73b867e: Pull complete
  d6c6bbd63f57: Pull complete
  4ac684e3f295: Pull complete
  91391bd3c4d3: Pull complete
  b4587525ed53: Pull complete
  0240288f5187: Pull complete
  28c109ec1572: Pull complete
  063d51552dac: Pull complete
  d8a70839d961: Pull complete
  ceab60537ad2: Pull complete
  Digest: sha256:9d0768452fe8f43c23292d24ec0fbd0ce06c98f776a084623d62ee12c4b7d58c
  Status: Downloaded newer image for nginx:latest
  INFO    testec2docker4.nsx.lab.net.container#1      output:
  3512b1265a540d74d4deb1598434e9be7ddc14252a85b94b372d81cb3a5a8b34
  INFO    testec2docker4.nsx.lab.net.container#1      wait for container up status
  INFO    testec2docker4.nsx.lab.net.container#1      wait for container operational
  send /etc/opensvc/testec2docker4.nsx.lab.net.conf to collector ... OK
  update /var/lib/opensvc/testec2docker4.nsx.lab.net.push timestamp ... OK

Docker Service on Amazon, Btrfs on Lvm
++++++++++++++++++++++++++++++++++++++

Template:

::

  [DEFAULT]
  env = TST
  docker_data_dir = /srv/{svcname}/docker
  docker_daemon_args = --storage-driver=btrfs
  app = NSX
   
  [disk#0]
  type = amazon
  volumes = <size=15>
  
  [disk#1]
  type = lvm
  name = {svcname}
  pvs = /var/lib/opensvc/{svcname}/dev/disk.0.0
  
  [fs#1]
  type = btrfs
  mnt = /srv/{svcname}
  dev = /dev/{svcname}/root
  mnt_opt = defaults,subvol=root
  vg = {svcname}
  size = 14G
   
  [fs#2]
  type = btrfs
  mnt = /srv/{svcname}/data
  dev = /dev/{svcname}/root
  mnt_opt = defaults,subvol=data
   
  [fs#3]
  type = btrfs
  mnt = /srv/{svcname}/docker
  dev = /dev/{svcname}/root
  mnt_opt = defaults,subvol=docker
   
  [container#0]
  type = docker
  image = google/pause
  rm = true
   
  [container#1]
  type = docker
  image = ubuntu:latest
  netns = container#0
  run_args = -v /srv/{svcname}/data:/data:rw
  command = /bin/bash

Docker Service on Amazon, Btrfs on Md Raid
++++++++++++++++++++++++++++++++++++++++++

Template:

::

  [DEFAULT]
  env = TST
  docker_data_dir = /srv/{svcname}/docker
  docker_daemon_args = --storage-driver=btrfs
  app = NSX
   
  [disk#0]
  type = amazon
  volumes = <size=5> <size-5> <size-5>
  
  [disk#1]
  type = md
  uuid = 
  devs = /var/lib/opensvc/{svcname}/dev/disk.0.0 /var/lib/opensvc/{svcname}/dev/disk.0.1 /var/lib/opensvc/{svcname}/dev/disk.0.2
  spares = 1
  chunk = 1m
  level = 1
  
  [fs#1]
  type = btrfs
  mnt = /srv/{svcname}
  dev = /dev/md/{svcname}.disk.1
  mnt_opt = defaults,subvol=root
   
  [fs#2]
  type = btrfs
  mnt = /srv/{svcname}/data
  dev = /dev/md/{svcname}.disk.1
  mnt_opt = defaults,subvol=data
   
  [fs#3]
  type = btrfs
  mnt = /srv/{svcname}/docker
  dev = /dev/md/{svcname}.disk.1
  mnt_opt = defaults,subvol=docker
   
  [container#0]
  type = docker
  image = google/pause
  rm = true


Cluster-Ready HAProxy Service on Amazon
+++++++++++++++++++++++++++++++++++++++

Single command provisioning:

::

  om haproxy1.nsx.lab.net create --provision --leader --disable-rollback \
    --resource '{"rtype": "DEFAULT", "nodes": "node12.nsx.lab.net", "docker_data_dir": "/srv/haproxy1.nsx.lab.net/docker", "env": "TST"}' \
    --resource '{"rtype": "ip", "type": "amazon", "ipname": "<allocate>", "ipdev": "eth0", "docker_daemon_ip": true, "cascade_allocation": "ip#1.ipname"}' \
    --resource '{"rtype": "ip", "ipdev": "eth0", "ipname": ""}' \
    --resource '{"rtype": "disk", "type": "amazon", "volumes": "<size=5>"}' \
    --resource '{"rtype": "fs", "type": "btrfs", "mnt_opt": "defaults,subvol=docker", "mnt": "/srv/haproxy1.nsx.lab.net/docker", "dev": "/var/lib/opensvc/haproxy1.nsx.lab.net/dev/disk.0.0"}' \
    --resource '{"rtype": "fs", "type": "btrfs", "mnt_opt": "defaults,subvol=data", "mnt": "/srv/haproxy1.nsx.lab.net/data", "dev": "/var/lib/opensvc/haproxy1.nsx.lab.net/dev/disk.0.0"}' \
    --resource '{"rtype": "container", "type": "docker", "image": "haproxy", "run_args": "-v /etc/localtime:/etc/localtime:ro -v /srv/haproxy1.nsx.lab.net/data:/data -p 80:80 -p 443:443 --net=bridge", "command": "haproxy -db -f /data/etc/haproxy.cfg"}'

Example haproxy.cfg file in ``/srv/haproxy1.nsx.lab.net/data/etc/haproxy.cfg``:

::

  global
  	daemon
  	maxconn 256
  
  defaults
  	mode http
  	timeout connect 5000ms
  	timeout client 50000ms
  	timeout server 50000ms
  
  frontend http-in
  	bind *:80
  	default_backend servers
  
  backend servers
  	server server1 10.0.0.60:8000 maxconn 32
  	server server1 10.0.0.61:8000 maxconn 32



