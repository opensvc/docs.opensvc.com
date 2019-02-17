Docker Relocation
=================

All services are not chaos compliant. For some services it is also preferable not to involve storage and network virtualization nor ingress gateways, to beneficit from the best performance and reliability. For those services a failover OpenSVC service, with or without automatic failover (orchestrate=ha), is a valid solution.

With such services, the running instance can be easily relocated, proactively or in reaction to:

* A hardware or software failure involving downtime.
* A planned downtime (hardware tech refresh, firmware updates, os upgrades, ...)

This relocation capability is more important the higher the number of services.

This tutorial explains how to setup a relocatable dockerized postgresql service, with no network virtualization and a dedicated SAN disk.

Pre-requisites
--------------

Two nodes with:

* network attachments on the same ip subnet, with free ip addresses
* shared storage : same block device seen from operating system
* OpenSVC agent installed
* Docker installed

Service details
---------------

* The service data will be stored in a xfs formatted single logical volume of a volume group build on the shared disk.
* The service ip address will be plumbed using ipvlan l2 on a veth given to a google/pause container holding a service-wide netns. This veth will be linked to a node's bonding interface.
* The postgresql database will run in a second container sharing the google/pause container netns.

Create the service
------------------

::

	$ cat - << EOF | svcmgr -s db1 deploy --config=-
	{
	    "DEFAULT": {
		"nodes": "{clusternodes}"
	    },
	    "disk#0": {
		"name": "{svcname}",
		"pvs": "{env.dev}",
		"shared": "true",
		"type": "vg"
	    },
	    "disk#1": {
		"name": "data",
		"shared": "true",
		"size": "100%FREE",
		"type": "lv",
		"vg": "{svcname}"
	    },
	    "fs#1": {
		"dev": "/dev/{svcname}/data",
		"mnt": "/srv/{svcname}/data",
		"shared": "true",
		"type": "xfs"
	    },
	    "ip#0": {
		"gateway": "{env.gateway}",
		"ipdev": "{env.intf}",
		"ipname": "{env.ipaddr}",
		"netmask": "{env.netmask}",
		"netns": "container#0",
		"mode": "ipvlan-l2",
		"type": "netns"
	    },
	    "container#0": {
		"image": "google/pause",
		"rm": "true",
		"type": "docker"
	    },
	    "container#1": {
		"image": "postgres",
		"netns": "container#0",
		"rm": "true",
		"run_args": "-v /srv/{svcname}/data/postgresql:/var/lib/postgresql:rw --user={env.uid}:{env.gid}",
		"type": "docker"
	    },
	    "env": {
		"dev": "/dev/mapper/36589cfc000000e969988ca11344cabb0",
		"gateway": "192.168.100.1",
		"gid": "999",
		"intf": "bond0",
		"ipaddr": "192.168.100.14",
		"netmask": "24",
		"uid": "999"
	    }
	}
	EOF

.. note:: You can change the value of the keywords in the ``env`` section using svcmgr ``--env <kw>=<value>`` options.

After a few seconds, the service will be up and running on the cluster first node.

::

	$ svcmon -s db1 --sections services
	Services               node-1-1 node-1-2
	 db1     up failover | O^       X


Details on node-1-1

::

	$ db1 print status
	db1
	`- instances
	   |- node-1-2                   down       idle
	   `- node-1-1                   up         idle, started
	      |- ip#0           ........ up         netns bridge 192.168.100.14/24 br-prd@container#0
	      |- disk#0         ........ up         vg db1
	      |- disk#1         ........ up         lv db1/data
	      |- fs#1           ........ up         xfs /dev/db1/data@/srv/db1/data
	      |- container#0    ........ up         docker container db1.container.0@google/pause
	      |- container#1    ........ up         docker container db1.container.1@postgres
	      `- sync#i0        ...O./.. up         rsync svc config to nodes


Relocate Service
----------------

::

	$ svcmgr -s db1 switch
	node-1-1.db1             service db1 target state set to placed@node-1-2

You can follow the progress of this asynchronous action with ``svcmon -w -s db1``.

After a few seconds, the service is switched

::

	$ svcmon -s db1 --sections services
	Services                node-1-1 node-1-2
	 db1     up^ failover | X^       O       

Switch logs
-----------

For reference and timings, here are the logs of this action

::

	$ svcmgr -s db1 logs

	# orchestrator logs
	20:35:50,004 node-1-1.db1             INFO    service db1 target state set to placed@node-1-2
	20:35:50,175 node-1-1.db1             INFO    stop failover up instance to satisfy the placed@node-1-2 target

	# on the source node, stop instance
	20:35:50,434 node-1-1.db1             INFO    do stop --local (daemon origin)
	20:35:50,522 node-1-1.db1.container#1 INFO    docker stop b196b8204a5add752680de49f8c9a306888c41db489063455924ada4febb6905
	20:35:50,630 node-1-1.db1.container#1 INFO    output:
	20:35:50,631 node-1-1.db1.container#1 INFO    b196b8204a5add752680de49f8c9a306888c41db489063455924ada4febb6905
	20:35:50,663 node-1-1.db1.container#1 INFO    docker rm db1.container.1
	20:35:50,664 node-1-1.db1.container#1 INFO    wait for down status
	20:35:51,001 node-1-1.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/21c851c4646b ip addr del 192.168.100.14/24 dev eth0
	20:35:51,008 node-1-1.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/21c851c4646b ip link del dev eth0
	20:35:51,023 node-1-1.db1.ip#0        INFO    checking 192.168.100.14 availability
	20:35:52,210 node-1-1.db1.container#0 INFO    docker stop 0363bb5834f23b394065b9a1e31b911e8d848bf01c8e697b55afa926e7849570
	20:35:52,305 node-1-1.db1.container#0 INFO    output:
	20:35:52,307 node-1-1.db1.container#0 INFO    0363bb5834f23b394065b9a1e31b911e8d848bf01c8e697b55afa926e7849570
	20:35:52,363 node-1-1.db1.container#0 INFO    docker rm db1.container.0
	20:35:52,363 node-1-1.db1.container#0 INFO    wait for down status
	20:35:52,986 node-1-1.db1.fs#1        INFO    umount /srv/db1/data
	20:35:53,249 node-1-1.db1.disk#1      INFO    lvchange -a n db1/data
	20:35:53,391 node-1-1.db1.disk#0      INFO    vg db1 is already down

	# on the destination node, start instance
	20:35:53,880 node-1-2.db1             INFO    start failover down instance to satisfy the placed@node-1-2 target
	20:35:54,076 node-1-2.db1             INFO    do start --local (daemon origin)
	20:35:54,252 node-1-2.db1.ip#0        INFO    checking 192.168.100.14 availability
	20:35:59,323 node-1-2.db1.disk#0      INFO    vgchange --deltag @node-1-1 db1
	20:35:59,370 node-1-2.db1.disk#0      INFO    Volume group "db1" successfully changed
	20:35:59,370 node-1-2.db1.disk#0      INFO    output:
	20:35:59,372 node-1-2.db1.disk#0      INFO    vgchange --addtag @node-1-2 db1
	20:35:59,426 node-1-2.db1.disk#0      INFO    output:
	20:35:59,427 node-1-2.db1.disk#0      INFO    Volume group "db1" successfully changed
	20:35:59,539 node-1-2.db1.disk#0      INFO    vgchange -a y db1
	20:35:59,616 node-1-2.db1.disk#0      INFO    1 logical volume(s) in volume group "db1" now active
	20:35:59,616 node-1-2.db1.disk#0      INFO    output:
	20:35:59,766 node-1-2.db1.disk#1      INFO    lv db1/data is already up
	20:35:59,861 node-1-2.db1.fs#1        INFO    mount -t xfs /dev/db1/data /srv/db1/data
	20:36:00,160 node-1-2.db1.container#0 INFO    docker run --name=db1.container.0 --detach --net=none google/pause
	20:36:00,436 node-1-2.db1.container#0 INFO    output:
	20:36:00,437 node-1-2.db1.container#0 INFO    8d4947414095d12186ea250b966cb8666d8734b5b8d481739ab1722e79927114
	20:36:00,462 node-1-2.db1.container#0 INFO    wait for up status
	20:36:00,506 node-1-2.db1.container#0 INFO    wait for container operational
	20:36:00,671 node-1-2.db1.ip#0        INFO    bridge mode
	20:36:00,773 node-1-2.db1.ip#0        INFO    /sbin/ip link add name veth0pl25524 mtu 1500 type veth peer name veth0pg25524 mtu 1500
	20:36:00,798 node-1-2.db1.ip#0        INFO    /sbin/ip link set veth0pl25524 master br-prd
	20:36:00,812 node-1-2.db1.ip#0        INFO    /sbin/ip link set veth0pl25524 up
	20:36:00,824 node-1-2.db1.ip#0        INFO    /sbin/ip link set veth0pg25524 netns 25524
	20:36:00,835 node-1-2.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/2bbcf661b019 ip link set veth0pg25524 name eth0
	20:36:00,843 node-1-2.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/2bbcf661b019 ip addr add 192.168.100.14/24 dev eth0
	20:36:00,850 node-1-2.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/2bbcf661b019 ip link set eth0 up
	20:36:00,867 node-1-2.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/2bbcf661b019 ip route replace default via 192.168.100.1
	20:36:00,874 node-1-2.db1.ip#0        INFO    /usr/bin/nsenter --net=/var/run/docker/netns/2bbcf661b019 /usr/bin/python /usr/share/opensvc/lib/arp.py eth0 192.168.100.14
	20:36:01,267 node-1-2.db1.container#1 INFO    docker run --name=db1.container.1 -v /srv/db1/data/postgresql:/var/lib/postgresql:rw --user=999:999 --detach --net=container:db1.container.0 postgres
	20:36:01,480 node-1-2.db1.container#1 INFO    output:
	20:36:01,481 node-1-2.db1.container#1 INFO    ee21ce46ffd922582228cb86d2cabc098e7d02141b87b65b210ec4c40f382d43
	20:36:01,536 node-1-2.db1.container#1 INFO    wait for up status
	20:36:01,624 node-1-2.db1.container#1 INFO    wait for container operational

Activate Automatic Failover
---------------------------

::

	$ svcmgr -s db1 set --kw orchestrate=ha


