Docker services on Amazon EC2 instances
***************************************

Introduction
============

This section shows how to setup docker services failover on amazon EC2 instances.

Amazon constraints
==================

Amazon EC2 networking doesn't allow to use private ips in the containers through bridges or macvlan.
Dedicating a network interface to a container makes it directly unreachable from the host.
This leaves us no other option that using the docker NATing.

Instance configuration
======================

Dependencies
++++++++++++

* Install ``awscli`` and configure the root account credentials.
* Install arping
* Install docker
* Install the OpenSVC agent

/etc/hosts
++++++++++

Each nodes should be able to resolve all cluster node names to their primary private instance ip.

Example::

  10.0.0.93 node11.nsx.lab.net
  10.0.0.62 node12.nsx.lab.net

Root trust
++++++++++

Each node should be able to execute root commands on its peers and on drpnodes using ssh.

VPC configuration
=================

Security groups
+++++++++++++++

* Allow icmp between instances in both directions
* Allow ssh between instances in both directions
* Allow services' middlewares' ingress ports for all services's instances

Addresses
+++++++++

* Allocate one secondary private ip per service
* Allocate one public Elastic ip per service that need public access
* Associate the public Elastic ips to their corresponding service private ip

Service configuration
=====================

::

  [DEFAULT]
  service_type = TST
  nodes = node12.nsx.lab.net
  drpnodes = node11.nsx.lab.net
  docker_data_dir = /srv/testeip/docker
  docker_daemon_args = --ip 10.0.0.5
  
  [ip#0]
  ipname = 10.0.0.5
  ipdev = eth0
  post_start@node12.nsx.lab.net = aws ec2 assign-private-ip-addresses --network-interface-id eni-033adc4b --private-ip-address 10.0.0.5 --allow-reassignment
  post_start@node11.nsx.lab.net = aws ec2 assign-private-ip-addresses --network-interface-id eni-473adc0f --private-ip-address 10.0.0.5 --allow-reassignment
  
  [container#0]
  type = docker
  run_image = ubuntu:14.10
  run_args = --net=bridge -p 80:80
             -v /etc/localtime:/etc/localtime:ro
  run_command = /bin/bash
  
  [container#1]
  type = docker
  run_image = nginx:latest
  run_args = -v /etc/localtime:/etc/localtime:ro
             --net=container:testeip.container.0
  
  [fs#0]
  dev = /dev/xvdf
  mnt = /srv/testeip/docker
  mnt_opt = defaults,subvol=docker
  standby@drpnodes = true
  
  [fs#1]
  dev = /dev/xvdf
  mnt = /srv/testeip/data
  mnt_opt = defaults,subvol=data
  
  [sync#0]
  type = docker
  target = drpnodes
  
  [sync#1]
  type = btrfs
  target = drpnodes
  src = testeip:data
  dst = testeip:data

References
==========

* Handling VIP relocation on Amazon EC2: https://aws.amazon.com/articles/2127188135977316

