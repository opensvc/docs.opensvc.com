Service provisioning
********************

Introduction
============

A service handle resources activation and desactivation: disk, volumes groups, filesystems for example. Upon creation of a service, the resources may or may not already exist. In the later case, the service can provision them, in other words the service can allocate disks and ip address, create volume groups and logical volume, format filesystems, create containers, pull docker images.

This section describes:

* how this provisioning feature work
* how to provision and template services
* some useful examples

Provisioning
============

Each resource driver can implement a provisioner, but not all resources actually do. The list of provisioner can be extracted using::

  $ ls -1 lib/prov*py
  lib/provDiskDcs.py
  lib/provDiskFreenas.py
  lib/provFsBtrfs.py
  lib/provFsExt2.py
  lib/provFsExt3.py
  lib/provFsExt4.py
  lib/provFs.py
  lib/provFsVxfs.py
  lib/provFsZfs.py
  lib/provIpAmazon.py
  lib/provIp.py
  lib/provisioning.py
  lib/provKvm.py
  lib/provLoopLinux.py
  lib/provLxc.py
  lib/provSrp.py
  lib/provVgAmazon.py
  lib/provVgHP-UX.py
  lib/provVgLinux.py
  lib/provVgRadosLinux.py
  lib/provZone.py

The resource provisioner may need additional parameters. The resource configuration templates in ``usr/share/doc/`` highlight these particular parameters with ``provisioning = True``. The list of provisioning parameters can thus be extracted using::

  $ grep -B 3 "provisioning: True" usr/share/doc/template.*env | grep keyword
  usr/share/doc/template.container.esx.env-# keyword:       snap
  usr/share/doc/template.container.esx.env-# keyword:       snapof
  usr/share/doc/template.container.kvm.env-# keyword:       virtinst
  usr/share/doc/template.container.kvm.env-# keyword:       snap
  usr/share/doc/template.container.kvm.env-# keyword:       snapof
  usr/share/doc/template.container.lxc.env-# keyword:       rootfs
  usr/share/doc/template.container.lxc.env-# keyword:       cf
  usr/share/doc/template.container.lxc.env-# keyword:       template
  usr/share/doc/template.container.ovm.env-# keyword:       virtinst
  usr/share/doc/template.container.ovm.env-# keyword:       snap
  usr/share/doc/template.container.ovm.env-# keyword:       snapof
  usr/share/doc/template.container.srp.env-# keyword:       ip
  usr/share/doc/template.container.srp.env-# keyword:       rootpath
  usr/share/doc/template.container.srp.env-# keyword:       prm_cores
  usr/share/doc/template.container.vz.env-# keyword:       rootfs
  usr/share/doc/template.container.vz.env-# keyword:       template
  usr/share/doc/template.container.xen.env-# keyword:       virtinst
  usr/share/doc/template.container.xen.env-# keyword:       snap
  usr/share/doc/template.container.xen.env-# keyword:       snapof
  usr/share/doc/template.container.zone.env-# keyword:       rootfs
  usr/share/doc/template.container.zone.env-# keyword:       template
  usr/share/doc/template.container.zone.env-# keyword:       snap
  usr/share/doc/template.container.zone.env-# keyword:       snapof
  usr/share/doc/template.container.zone.env-# keyword:       container_origin
  usr/share/doc/template.fs.env-# keyword:       vg
  usr/share/doc/template.fs.env-# keyword:       size
  usr/share/doc/template.ip.env-# keyword:       gateway
  usr/share/doc/template.loop.env-# keyword:       size
  usr/share/doc/template.vg.rados.env-# keyword:       size
  usr/share/doc/template.vg.rados.env-# keyword:       image_format

A provisioner can update other service DEFAULT and resources configuration parameters. For example, the amazon ip provisioner can cascade the allocated ip address the ``docker_daemon_args`` as a ``--ip x.x.x.x`` argument, and cascade to a ip resource ``ipname`` parameter.

The provisioners are run in the service start natural order. Each resource is left in the ``up`` state after provisioning, so that following provisioners can count on their availability to proceed. For example, a amazon allocated disk must be left attached for the btrfs provisioner to format it.

As a consequence, when all provisioners have run, the service ``availstatus`` is ``up``.

Provisioning usage
==================

Commandline actions
+++++++++++++++++++

The provisioners are activated by setting the ``--provision`` with the following actions:

* create
  Creates a service using definitions passed as ``--resource`` arguments.

* update
  Add or change a resource definition to an existing service. Definitions are passed as ``--resource`` arguments.

* install
  Creates a service using a configuration file pointed by ``--envfile``.

Commandline arguments
+++++++++++++++++++++

A ``--resource`` argument takes a JSON formatted dictionary. The keys are the resource or DEFAULT section normal parameters, plus extra keys described in the following table.

+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Key      | Description                                                                                                                                                 |
+==========+=============================================================================================================================================================+
| rtype    | The resource main type. The resource identifier (rid) is formed of this rtype concatenated with ``#`` and an increment. Example: a ``fs`` rtype will select |
|          | the fs resource driver for a new resource with rid ``fs#0``                                                                                                 |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+

Configuration template
++++++++++++++++++++++

A template is a normal service configuration file with parts you can replace with placeholder strings. Templates can be stored anywhere.

A template is instanciated by copying it as a service configuration file (``<OSVCETC>/<svcname>.env``), and substituting the placeholder strings. Both actions can be done with a command like::

  sed -e "s/__SVCNAME_PLACEHOLDER__/mysvc/g" -e "s/__NODENAME1_PLACEHOLDER__/g" | sudo tee /etc/opensvc/mysvc.env

Once instanciated the ``install`` service action will take care of the ``etc/mysvc*`` directories and symlinks creation and the provisioning if ``--provision`` is set::

  $ sudo svcmgr -s mysvc --envfile /etc/opensvc/mysvc.env --provision install


Provisioning examples
=====================

Docker service on amazon
++++++++++++++++++++++++

Template ``testec2docker.template``:

::

  [DEFAULT]
  service_type = TST
  nodes = node12.nsx.lab.net
  docker_data_dir = /srv/__SVCNAME__/docker
  docker_daemon_args = 
  
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
  mnt = /srv/__SVCNAME__/docker
  always_on = drpnodes
  dev = /var/lib/opensvc/__SVCNAME__/dev/disk.0.0
  
  [fs#1]
  type = btrfs
  mnt_opt = defaults,subvol=data
  mnt = /srv/__SVCNAME__/data
  dev = /var/lib/opensvc/__SVCNAME__/dev/disk.0.0
  
  [container#0]
  run_image = ubuntu:14.10
  type = docker
  run_args = --net=bridge -p 80:80
  	-v /etc/localtime:/etc/localtime:ro
  run_command = /bin/bash
  
  [container#1]
  run_image = nginx:latest
  type = docker
  run_args = -v /etc/localtime:/etc/localtime:ro
  	--net=container:__SVCNAME__.container.0
  
  
  [sync#0]
  type = docker
  target = nodes drpnodes
  
  [sync#1]
  src = __SVCNAME__.fs.0:data
  dst = __SVCNAME__.fs.0:data
  type = btrfs
  target = drpnodes

Template contextualization into a service configuration file:

::

  sed -e "s/__SVCNAME__/testec2docker4.nsx.lab.net/g" testec2docker.template | sudo tee /etc/opensvc/testec2docker4.nsx.lab.net.env

Provision:

::

  $ sudo svcmgr -s testec2docker4.nsx.lab.net --envfile /etc/opensvc/testec2docker4.nsx.lab.net.env --provision install
  INFO    testec2docker4.nsx.lab.net                  svcmgr -s testec2docker4.nsx.lab.net --envfile /etc/opensvc/testec2docker4.nsx.lab.net.env --provision install
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
  send /etc/opensvc/testec2docker4.nsx.lab.net.env to collector ... OK
  update /var/lib/opensvc/testec2docker4.nsx.lab.net.push timestamp ... OK

Docker service on amazon, btrfs on lvm
++++++++++++++++++++++++++++++++++++++

Template:

::

  [DEFAULT]
  service_type = TST
  nodes = node12.nsx.lab.net
  docker_data_dir = /srv/__SVCNAME__/docker
  docker_daemon_args = --storage-driver=btrfs
  app = NSX
   
  [disk#0]
  type = amazon
  volumes = <size=15>
  
  [disk#1]
  type = lvm
  name = __SVCNAME__
  pvs = /var/lib/opensvc/__SVCNAME__/dev/disk.0.0
  
  [fs#1]
  type = btrfs
  mnt = /srv/__SVCNAME__
  dev = /dev/__SVCNAME__/root
  mnt_opt = defaults,subvol=root
  vg = __SVCNAME__
  size = 14G
   
  [fs#2]
  type = btrfs
  mnt = /srv/__SVCNAME__/data
  dev = /dev/__SVCNAME__/root
  mnt_opt = defaults,subvol=data
   
  [fs#3]
  type = btrfs
  mnt = /srv/__SVCNAME__/docker
  dev = /dev/__SVCNAME__/root
  mnt_opt = defaults,subvol=docker
   
  [container#0]
  type = docker
  run_image = ubuntu:latest
  run_args = --net=none --hostname=__SVCNAME__
  run_command = /bin/bash
   
  [container#1]
  type = docker
  run_image = ubuntu:latest
  run_args = --net=container:__SVCNAME__.container.0
       --volume /srv/__SVCNAME__/data:/data:rw
  run_command = /bin/bash

Docker service on amazon, btrfs on md raid
++++++++++++++++++++++++++++++++++++++++++

Template:

::

  [DEFAULT]
  service_type = TST
  nodes = node12.nsx.lab.net
  docker_data_dir = /srv/__SVCNAME__/docker
  docker_daemon_args = --storage-driver=btrfs
  app = NSX
   
  [disk#0]
  type = amazon
  volumes = <size=5> <size-5> <size-5>
  
  [disk#1]
  type = md
  uuid = 
  devs = /var/lib/opensvc/__SVCNAME__/dev/disk.0.0 /var/lib/opensvc/__SVCNAME__/dev/disk.0.1 /var/lib/opensvc/__SVCNAME__/dev/disk.0.2
  spares = 1
  chunk = 1m
  level = 1
  
  [fs#1]
  type = btrfs
  mnt = /srv/__SVCNAME__
  dev = /dev/md/__SHORT_SVCNAME__.disk.1
  mnt_opt = defaults,subvol=root
   
  [fs#2]
  type = btrfs
  mnt = /srv/__SVCNAME__/data
  dev = /dev/md/__SHORT_SVCNAME__.disk.1
  mnt_opt = defaults,subvol=data
   
  [fs#3]
  type = btrfs
  mnt = /srv/__SVCNAME__/docker
  dev = /dev/md/__SHORT_SVCNAME__.disk.1
  mnt_opt = defaults,subvol=docker
   
  [container#0]
  type = docker
  run_image = ubuntu:latest
  run_args = --net=none --hostname=__SVCNAME__
  run_command = /bin/bash


Cluster-ready HAProxy service on amazon
+++++++++++++++++++++++++++++++++++++++

Single command provisioning:

::

  sudo svcmgr -s haproxy1.nsx.lab.net create --provision \
    --resource '{"rtype": "DEFAULT", "nodes": "node12.nsx.lab.net", "docker_data_dir": "/srv/haproxy1.nsx.lab.net/docker", "service_type": "TST"}' \
    --resource '{"rtype": "ip", "type": "amazon", "ipname": "<allocate>", "ipdev": "eth0", "docker_daemon_ip": true, "cascade_allocation": "ip#1.ipname"}' \
    --resource '{"rtype": "ip", "ipdev": "eth0", "ipname": ""}' \
    --resource '{"rtype": "disk", "type": "amazon", "volumes": "<size=5>"}' \
    --resource '{"rtype": "fs", "type": "btrfs", "mnt_opt": "defaults,subvol=docker", "mnt": "/srv/haproxy1.nsx.lab.net/docker", "dev": "/var/lib/opensvc/haproxy1.nsx.lab.net/dev/disk.0.0"}' \
    --resource '{"rtype": "fs", "type": "btrfs", "mnt_opt": "defaults,subvol=data", "mnt": "/srv/haproxy1.nsx.lab.net/data", "dev": "/var/lib/opensvc/haproxy1.nsx.lab.net/dev/disk.0.0"}' \
    --resource '{"rtype": "container", "type": "docker", "run_image": "haproxy", "run_args": "-v /etc/localtime:/etc/localtime:ro -v /srv/haproxy1.nsx.lab.net/data:/data -p 80:80 -p 443:443 --net=bridge", "run_command": "haproxy -db -f /data/etc/haproxy.cfg"}'

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



