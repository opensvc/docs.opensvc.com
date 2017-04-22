Lxc clustered services on OVH
*****************************

Introduction
============

OVH provides powerful internet-connected servers at an affordable price and a scriptable IPv4 takeover. This is a great combination for clustered services driven by opensvc. This cookbook explains the steps involved in integrating such a cluster with LXC services on a local disk to gain a decent partitioning between services without compromise on performance and memory usage.

Preparing a node
================

Before moving on to the next step, you should have a couple of servers delivered by OVH, setup with Debian Squeeze, which has initscripts and kernel adapted for LXC. You should also have an 'IP failover' available. Finally, the OpenSVC agent should be installed on both nodes (doc)

Additional packages
-------------------

Install:

::

    apt-get install lxc bridge-utils python2.6 python2.5 debootstrap rsync lvm2 ntp python-soappy

And opensvc from https://repo.opensvc.com/deb/

Ethernet bridge
---------------

Create a backend bridge connected to a dummy interface. In ``/etc/network/interfaces`` add the following block and activate the bridge using ifup br0:

::

    auto br0
    iface br0 inet static
	bridge_ports dummy0
	bridge_stp off
	bridge_fd 0
	bridge_maxwait 5
	address 192.168.0.1
	netmask 255.255.255.0
	pre-up /sbin/modprobe dummy

Kernel parameters
-----------------

In ``/etc/sysctl.conf`` set the following parameters and reload the configuration using ``sysctl -p``:

::

    # lxc routing
    net.ipv4.ip_forward=1
    net.ipv4.conf.br0.proxy_arp=1

Cgroup setup
------------

In ``/etc/fstab`` add the following line:

::

    none /cgroup cgroup defaults 0 0

Then:

::

    mkdir /cgroup
    mount /cgroup

Preparing the service
=====================

Disk setup
----------

OVH servers come with a 4 GB root filesystem, a ~4 GB swap partition and the rest of the disk is allocated to /home. The /home filesystem can be replaced by a single physical volume. Create a volume group over this pv and one or a set of logical volumes for each container. Format the logical volumes using the filesystem that suits you. Mount the logical volume set of the first container to create:

::

    umount /home
    vi /etc/fstab   # remove the /home entry
    pvcreate /dev/your_home_dev
    vgcreate vg0 /dev/your_home_dev
    lvcreate -n service_name -L 20G vg0
    mkfs.ext4 /dev/vg0/opt/opensvc_name
    mkdir /opt/opensvc_name
    mount /dev/vg0/opt/opensvc_name /opt/opensvc_name

Container creation
------------------

Prepare the lxc container creation wrapper:

::

    gzip -dc /usr/share/doc/lxc/examples/lxc-debian.gz >/tmp/lxc-debian

Create the container rootfs:

::

    /tmp/lxc-debian -p /opt/opensvc_name

Basic container setup

*   network
*   locale
*   tz
*   hosts
*   rc.sysinit (remove swaps and udev actions)

Create the container
--------------------

create a lxc config file as ``/tmp/lxc.conf`` containing:

::

	lxc.utsname = service_name
	lxc.tty = 4
	lxc.pts = 1024
	lxc.network.type = veth
	lxc.network.flags = up
	lxc.network.link = br0
	lxc.network.name = eth0
	lxc.network.mtu = 1500
	lxc.rootfs = /opt/opensvc_name/rootfs
	lxc.cgroup.devices.deny = a
	lxc.cgroup.devices.allow = c 1:3 rwm
	lxc.cgroup.devices.allow = c 1:5 rwm
	lxc.cgroup.devices.allow = c 5:1 rwm
	lxc.cgroup.devices.allow = c 5:0 rwm
	lxc.cgroup.devices.allow = c 4:0 rwm
	lxc.cgroup.devices.allow = c 4:1 rwm
	lxc.cgroup.devices.allow = c 1:9 rwm
	lxc.cgroup.devices.allow = c 1:8 rwm
	lxc.cgroup.devices.allow = c 136:* rwm
	lxc.cgroup.devices.allow = c 5:2 rwm
	lxc.cgroup.devices.allow = c 254:0 rwm

and create the container with:

::

    lxc-create -f /tmp/lxc.conf -n service_name

Start the container:

::

    lxc-start -n service_name

Opensvc service creation
------------------------

Trust the node root account to ssh-login into the container:

::

    mkdir /opt/opensvc_name/rootfs/root/.ssh
    cat /root/.ssh/id_dsa.pub >>/opt/opensvc_name/rootfs/root/.ssh/authorized_keys

Create the service configuration file:

::

	[default]
	app = MYAPP
	vm_name = service_name
	mode = lxc
	service_type = PRD
	nodes = node1.mydomain node2.mydomain
	autostart_node = node1.mydomain
	drpnode = 

	[fs#1]
	dev = /dev/mapper/vg0-service_name
	mnt = /opt/opensvc_name
	mnt_opt = defaults
	type = ext4
	always_on = nodes

	[ip#1]
	ipdev = br0
	ipname = service_name
	post_start = /etc/opensvc/opensvc_name.d/ovh_routes start service_name 1.2.3.4
	pre_stop = /etc/opensvc/opensvc_name.d/ovh_routes stop service_name 1.2.3.4

	[sync#0]
	src = /opt/opensvc_name/
	dst = /opt/opensvc_name
	dstfs = /opt/opensvc_name
	target = nodes
	snap = true

OVH routing and ipfailover
--------------------------

create the trigger scripts store, which is synchronized across nodes:

::

	mkdir -p /etc/opensvc/opensvc_name.dir
	cd /etc/opensvc/
	ln -s opensvc_name.dir opensvc_name.d

create and adapt the trigger scripts as ``/etc/opensvc/opensvc_name.dir/ovh_routes``:

::

	#!/bin/bash

	svc=$2
	vip=$3

	route="$vip dev br0"

	function has_route {
		ip route ls | grep "$route" >/dev/null >&1
	}

	case $1 in
	start)
		has_route || ip route add $route
		/etc/opensvc/etc/$svc.d/ipfailover
		# make sure proxy_arp and ip_forwarding settings are set
		sysctl -p >/dev/null 2>&1
		# containers are not able to load kernel modules.
		# trigger loading of common ones from here
		iptables -L -n >/dev/null 2>&1
		;;
	stop)
		has_route && ip route del $route
		;;
	esac

and ``/etc/opensvc/opensvc_name.dir/ipfailover``:

::

	#!/usr/bin/python2.5

	vip = '1.2.3.4'

	nodes_ip = {
	 'n2': dict(
	    otheracc='ksXXXXX.kimsufi.com',
	    thisip='a.b.c.d'),
	 'n1': dict(
	    otheracc='ksYYYYY.kimsufi.com',
	    thisip='d.c.b.a'),
	}

	# login information
	nic = 'xxxx-ovh'
	password = 'xxxx'

	#
	# don't change below
	#
	from SOAPpy import WSDL
	import sys

	soap = WSDL.Proxy('https://www.ovh.com/soapi/ovh.wsdl')

	try:
	    session = soap.login( nic, password )
	except:
	    print >>sys.stderr, "Error login"

	from os import uname
	x, nodename, x, x, x = uname()

	# dedicatedFailoverUpdate
	try:
	    result = soap.dedicatedFailoverUpdate(session,
					       nodes_ip[nodename]['otheracc'],
					       vip,
					       nodes_ip[nodename]['thisip']);
	    print "dedicated Failover Update successfull";
	except:
	    print >>sys.stderr, "Error dedicated Failover Update"

	# logout
	try:
	    result = soap.logout( session )
	except:
	    print >>sys.stderr, "Error logout"

Make sure this last script is owned by ``root`` and has ``700`` permissions, as it contains important credentials.
