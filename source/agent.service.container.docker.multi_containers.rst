Docker Multi Containers
=======================

This tutorial highlights the netns sharing and ip.netns driver.

The service created will have a shared netns held by the google/pause container, where the ip.netns driver will plumb an ipvlan-l2 ip address.

Pre-requisites
--------------

* A OpenSVC/docker setup, as described in the `parent topic <agent.service.container.docker.html>`_

Provision
---------

Let's use the following stack as an example:

* google/pause 
* nginx
* redis

::

	cat - <<EOF | svcmgr -s svc2 create --config=- --provision --local
	{
		"DEFAULT": {
			"id": "fd1196ad-fbf1-49bb-ab52-12ed2a1fbf0e"
		},
		"container#1": {
			"image": "google/pause",
			"run_command": "/bin/sh",
			"type": "docker"
		},
		"container#2": {
			"image": "nginx",
			"netns": "container#1",
			"type": "docker"
		},
		"container#3": {
			"image": "redis",
			"netns": "container#1",
			"type": "docker"
		},
		"ip#1": {
			"gateway": "5.196.34.158",
			"ipdev": "eth0",
			"ipname": "5.196.34.151",
			"mode": "ipvlan-l2",
			"netmask": "255.255.255.224",
			"netns": "container#1",
			"type": "netns"
		}
	}
	EOF

Service Configuration File
--------------------------

::

	root@deb1:/# svcmgr -s svc2 print config
	[container#1]
	type = docker
	image = google/pause
	run_command = /bin/sh
	
	[container#2]
	type = docker
	image = nginx
	netns = container#1
	
	[container#3]
	type = docker
	image = redis
	netns = container#1
	
	[ip#1]
	type = netns
	mode = ipvlan-l2
	netns = container#1
	ipdev = eth0
	ipname = 5.196.34.151
	netmask = 255.255.255.224
	gateway = 5.196.34.158
	
Service Startup
---------------

**docker images** ::

	root@deb1:/# svcmgr -s svc2 docker images
	REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
	redis                  latest              ce25c7293564        10 days ago         95MB
	nginx                  latest              f895b3fb9e30        12 months ago       108MB
	google/pause           latest              f9d5de079539        4 years ago         240kB
	
**docker instances** ::

	root@deb1:/opt/opensvc# svc2 docker ps
	CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS               NAMES
	1bf08bf89063        redis                    "docker-entrypoint.s…"   4 minutes ago       Up 4 minutes                            svc2.container.3
	acccaedca18a        nginx                    "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes                            svc2.container.2
	c6d7e098fed0        google/pause             "/pause /bin/sh"         4 minutes ago       Up 4 minutes                            svc2.container.1

**OpenSVC print status** ::

	root@deb1:/opt/opensvc# svc2 print status
	svc2                               up                                                                               
	`- instances              
	   `- deb1.opensvc.com             up         frozen, idle, started 
	      |- ip#1             ........ up         netns ipvlan-l2 5.196.34.151/27 eth0@container#1                      
	      |- container#1      ........ up         docker container svc2.container.1@google/pause                        
	      |- container#2      ........ up         docker container svc2.container.2@nginx                               
	      `- container#3      ........ up         docker container svc2.container.3@redis                               

Containers Management
---------------------

All containers
^^^^^^^^^^^^^^

It is possible to manage containers together, either start or stop, by using the ``start --rid container`` or ``stop --rid container`` OpenSVC keywords.

::

	root@deb1:/opt/opensvc# svc2 stop --rid container
	deb1.opensvc.com.svc2             add rid ip#1 to satisfy dependencies
	deb1.opensvc.com.svc2.container#3   docker stop 1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   wait for down status
	deb1.opensvc.com.svc2.container#2   docker stop acccaedca18a2493e244009203d6bd03037278df8b70cfb9712f27578740c621
	deb1.opensvc.com.svc2.container#2   output:
	deb1.opensvc.com.svc2.container#2   acccaedca18a2493e244009203d6bd03037278df8b70cfb9712f27578740c621
	deb1.opensvc.com.svc2.container#2   wait for down status
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/96ccdf8068e8 ip addr del 5.196.34.151/27 dev eth0
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/96ccdf8068e8 ip link del dev eth0
	deb1.opensvc.com.svc2.ip#1        checking 5.196.34.151 availability
	deb1.opensvc.com.svc2.container#1   docker stop c6d7e098fed0e1e20e7ce8120c5cec13b56ca2454a974fd6bcc40a8a0c328b01
	deb1.opensvc.com.svc2.container#1   output:
	deb1.opensvc.com.svc2.container#1   c6d7e098fed0e1e20e7ce8120c5cec13b56ca2454a974fd6bcc40a8a0c328b01
	deb1.opensvc.com.svc2.container#1   wait for down status

::

	root@deb1:/opt/opensvc# svc2 start --rid container
	deb1.opensvc.com.svc2             add rid ip#1 to satisfy dependencies
	deb1.opensvc.com.svc2.ip#1        checking 5.196.34.151 availability
	deb1.opensvc.com.svc2.container#1   docker start c6d7e098fed0e1e20e7ce8120c5cec13b56ca2454a974fd6bcc40a8a0c328b01
	deb1.opensvc.com.svc2.container#1   output:
	deb1.opensvc.com.svc2.container#1   c6d7e098fed0e1e20e7ce8120c5cec13b56ca2454a974fd6bcc40a8a0c328b01
	deb1.opensvc.com.svc2.container#1   wait for up status
	deb1.opensvc.com.svc2.container#1   wait for container operational
	deb1.opensvc.com.svc2.ip#1        ipvlan-l2 mode
	deb1.opensvc.com.svc2.ip#1        /sbin/ip link add link eth0 dev ph21982eth0 mtu 1500 type ipvlan mode l2
	deb1.opensvc.com.svc2.ip#1        /sbin/ip link set eth0 up
	deb1.opensvc.com.svc2.ip#1        /sbin/ip link set ph21982eth0 netns 21982
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/47afbeb05199 ip link set ph21982eth0 name eth0
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/47afbeb05199 ip addr add 5.196.34.151/27 dev eth0
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/47afbeb05199 ip link set eth0 up
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/47afbeb05199 ip route replace default via 5.196.34.158
	deb1.opensvc.com.svc2.ip#1        /usr/bin/nsenter --net=/var/run/docker/netns/47afbeb05199 /usr/bin/python /opt/opensvc/lib/arp.py eth0 5.196.34.151
	deb1.opensvc.com.svc2.container#2   docker start acccaedca18a2493e244009203d6bd03037278df8b70cfb9712f27578740c621
	deb1.opensvc.com.svc2.container#2   output:
	deb1.opensvc.com.svc2.container#2   acccaedca18a2493e244009203d6bd03037278df8b70cfb9712f27578740c621
	deb1.opensvc.com.svc2.container#2   wait for up status
	deb1.opensvc.com.svc2.container#2   wait for container operational
	deb1.opensvc.com.svc2.container#3   docker start 1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   wait for up status
	deb1.opensvc.com.svc2.container#3   wait for container operational

.. note:: the ip#1 resource, being dependent of container#1, is also selected for stop and for start.

Single container
^^^^^^^^^^^^^^^^

Like any other OpenSVC resource in the service configuration file, it is possible to manage it with its resource id, using the ``--rid <resource_id>`` option.

::

	root@deb1:/# svcmgr -s svc2 restart --rid container#3
	deb1.opensvc.com.svc2.container#3   docker stop 1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   wait for down status
	deb1.opensvc.com.svc2             instance stopped, ready for restart.
	deb1.opensvc.com.svc2.container#3   docker start 1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   wait for up status
	deb1.opensvc.com.svc2.container#3   wait for container operational

Container Upgrade
^^^^^^^^^^^^^^^^^

Switch container#3 image to tag 3.0::

	root@deb1:/opt/opensvc# svc2 set --kw container#3.rm=true --kw container#3.image=redis:3.0

.. note:: container#3.rm=true causes the agent to remove the instance after stop, so a new instance based on the changed image will be spawn on the following start.

And restart::

	root@deb1:/opt/opensvc# svc2 restart --rid container#3
	deb1.opensvc.com.svc2.container#3   docker stop 1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   1bf08bf890635aa334d22a0a040e03861def0fbcc9635e39cf352a517b7045ac
	deb1.opensvc.com.svc2.container#3   docker rm svc2.container.3
	deb1.opensvc.com.svc2.container#3   wait for down status
	deb1.opensvc.com.svc2             instance stopped, ready for restart.
	deb1.opensvc.com.svc2             pulling docker image redis:3.0
	deb1.opensvc.com.svc2.container#3   docker run -d --name=svc2.container.3 --net=container:svc2.container.1 --cgroup-parent /opensvc.slice/svc2.slice/container.slice/container.3.slice redis:3.0
	deb1.opensvc.com.svc2.container#3   output:
	deb1.opensvc.com.svc2.container#3   ffd52fb707589afc92a88220a7fe1f0ecb6f78272ed3393a6ac93b64c93c1dc2
	deb1.opensvc.com.svc2.container#3   wait for up status
	deb1.opensvc.com.svc2.container#3   wait for container operational


Complex Orchestration
---------------------

When implementing applications as Docker containers, you may need to organize the containers startup in a specific order or benefit from starting multiple containers in parrallel. 

The following example describes:

* 1 database server : this container have to be started first, and stopped at the very end.
* 4 application servers : those containers have to be started in parrallel, and just after the database server.
* 2 webservers : last to be launched, just after the appservers.

To get straight to the point, all containers will use the ``opensvc/busybox`` image.

.. note:: If one of the container startup fails, the action is rolled back.

OpenSVC Syntax
^^^^^^^^^^^^^^

This service will highligth two configuration mecanisms:

* Assigning a resource to a subset::

	[container#<n>]
	subset = 01appservers

* Optionaly, configuring a subset for starting its resources in parallel::

	[subset#container.docker:01appservers]
	parallel = true

Subsets are processed in alphanumerical order.

Example
^^^^^^^

Example service configuration file

::

	[DEFAULT]
	autostart_node = deb1.opensvc.com
	app = OSVCLAB
	env = DEV
	nodes = deb1.opensvc.com
	docker_data_dir = /opt/busybox.opensvc.com/appdata
	docker_daemon_args = --ip 37.59.71.25
	
	[container#1]
	type = docker
	image = b073e328878e
	subset = 00database
	
	[container#2]
	type = docker
	image = b073e328878e
	subset = 01appservers
	
	[container#3]
	type = docker
	image = b073e328878e
	subset = 01appservers
	
	[container#4]
	type = docker
	image = b073e328878e
	subset = 01appservers
	
	[container#5]
	type = docker
	image = b073e328878e
	subset = 01appservers
	
	[subset#container.docker:01appservers]
	parallel = true
	
	[container#6]
	type = docker
	image = b073e328878e
	subset = 02webservers
	
	[container#7]
	type = docker
	image = b073e328878e
	subset = 02webservers
	
	[subset#container.docker:02webservers]
	parallel = false
	
	[ip#1]
	ipdev = eth0
	ipname = busybox.opensvc.com
	
	[vg#1]
	vgname = vgbusybox
	scsireserv = false
	
	[fs#1]
	mnt_opt = rw
	mnt = /opt/busybox.opensvc.com
	dev = /dev/mapper/vgbusybox-lvbusyboxroot
	type = ext4
	
	[fs#2]
	mnt_opt = rw
	mnt = /opt/busybox.opensvc.com/appdata
	dev = /dev/mapper/vgbusybox-lvbusyboxdata
	type = ext4


Service startup
^^^^^^^^^^^^^^^

Actions are processed in the following order

* ip/vg/fs start
* subset 00database start
* subset 01appservers parallel start
* subset 02webservers sequential start

::

	root@deb1:/# busybox.opensvc.com print status
	busybox.opensvc.com
	overall                   down
	|- avail                  down
	|  |- container#1    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#2    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#3    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#4    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#5    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#6    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- container#7    .... down     b073e328878e
	|  |  |                            # docker daemon is not running
	|  |- vg#1           .... down     vgbusybox
	|  |- fs#1           .... down     /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
	|  |- fs#2           .... down     /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
	|  '- ip#1           .... down     busybox.opensvc.com@eth0
	|- sync                   n/a
	'- hb                     n/a

	root@deb1:/# busybox.opensvc.com start
	09:10:18 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
	09:10:21 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 37.59.71.25 netmask 255.255.255.224 up
	09:10:21 INFO    BUSYBOX.OPENSVC.COM.IP#1    arping -U -c 1 -I eth0 -s 37.59.71.25 37.59.71.25
	09:10:21 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --addtag @deb1.opensvc.com vgbusybox
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
	  Volume group "vgbusybox" successfully changed
	
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a y vgbusybox
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
	  2 logical volume(s) in volume group "vgbusybox" now active
	
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxroot
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    output:
	/dev/mapper/vgbusybox-lvbusyboxroot: clean, 13/65536 files, 12637/262144 blocks
	
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    mount -t ext4 -o rw /dev/mapper/vgbusybox-lvbusyboxroot /opt/busybox.opensvc.com
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    e2fsck -p /dev/mapper/vgbusybox-lvbusyboxdata
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    output:
	/dev/mapper/vgbusybox-lvbusyboxdata: clean, 656/65536 files, 25170/262144 blocks
	
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.FS#2    mount -t ext4 /dev/mapper/vgbusybox-lvbusyboxdata /opt/busybox.opensvc.com/appdata
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 starting docker daemon
	09:10:22 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock -r=false -d -g /opt/busybox.opensvc.com/appdata -p /var/lib/opensvc/busybox.opensvc.com/docker.pid --ip 37.59.71.25
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start b82cf3232b79
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 output:
	b82cf3232b79
	
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container up status
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container operational
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 action start started in child process 23635
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 action start started in child process 23636
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 action start started in child process 23638
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 action start started in child process 23640
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 185751ce205b
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 6212757a24c6
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 68b2e591147a
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 7e0f85484429
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 output:
	185751ce205b
	
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 output:
	6212757a24c6
	
	09:10:23 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container operational
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 output:
	68b2e591147a
	
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container operational
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 output:
	7e0f85484429
	
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container operational
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container operational
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start 6b82e882acf0
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 output:
	6b82e882acf0
	
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container operational
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock start a825bb126088
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 output:
	a825bb126088
	
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container up status
	09:10:24 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container operational

	root@deb1:/# busybox.opensvc.com print status
	busybox.opensvc.com
	overall                   up
	|- avail                  up
	|  |- container#1    .... up       b82cf3232b79@opensvc/busybox:date
	|  |- container#2    .... up       7e0f85484429@opensvc/busybox:date
	|  |- container#3    .... up       185751ce205b@opensvc/busybox:date
	|  |- container#4    .... up       6212757a24c6@opensvc/busybox:date
	|  |- container#5    .... up       68b2e591147a@opensvc/busybox:date
	|  |- container#6    .... up       6b82e882acf0@opensvc/busybox:date
	|  |- container#7    .... up       a825bb126088@opensvc/busybox:date
	|  |- vg#1           .... up       vgbusybox
	|  |- fs#1           .... up       /dev/mapper/vgbusybox-lvbusyboxroot@/opt/busybox.opensvc.com
	|  |- fs#2           .... up       /dev/mapper/vgbusybox-lvbusyboxdata@/opt/busybox.opensvc.com/appdata
	|  '- ip#1           .... up       busybox.opensvc.com@eth0
	|- sync                   n/a
	'- hb                     n/a


Service stop
^^^^^^^^^^^^

Actions are processed in the following order

* subset 02webservers sequential stop
* subset 01appservers parallel stop
* subset 00database stop
* ip/vg/fs stop

::

	root@deb1:/# busybox.opensvc.com stop
	09:10:40 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop a825bb126088
	09:10:50 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 output:
	a825bb126088
	
	09:10:50 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#7 wait for container down status
	09:10:51 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 6b82e882acf0
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 output:
	6b82e882acf0
	
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:02WEBSERVERS#6 wait for container down status
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 action stop started in child process 27048
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 action stop started in child process 27049
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 action stop started in child process 27051
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 action stop started in child process 27052
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 185751ce205b
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 6212757a24c6
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 7e0f85484429
	09:11:01 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop 68b2e591147a
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 output:
	7e0f85484429
	
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#2 wait for container down status
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 output:
	185751ce205b
	
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#3 wait for container down status
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 output:
	68b2e591147a
	
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#5 wait for container down status
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 output:
	6212757a24c6
	
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:01APPSERVERS#4 wait for container down status
	09:11:11 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 docker -H unix:///var/lib/opensvc/busybox.opensvc.com/docker.sock stop b82cf3232b79
	09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 output:
	b82cf3232b79
	
	09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 wait for container down status
	09:11:21 INFO    BUSYBOX.OPENSVC.COM.CONTAINER.DOCKER:00DATABASE#1 no more container handled by docker daemon. shut it down
	09:11:21 INFO    BUSYBOX.OPENSVC.COM.FS#2    umount /opt/busybox.opensvc.com/appdata
	09:11:22 INFO    BUSYBOX.OPENSVC.COM.FS#1    umount /opt/busybox.opensvc.com
	09:11:22 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange --deltag @deb1.opensvc.com vgbusybox
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
	  Volume group "vgbusybox" successfully changed
	
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxdata
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    kpartx -d /dev/vgbusybox/lvbusyboxroot
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    vgchange -a n vgbusybox
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.VG#1    output:
	  0 logical volume(s) in volume group "vgbusybox" now active
	
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.IP#1    ifconfig eth0:1 down
	09:11:23 INFO    BUSYBOX.OPENSVC.COM.IP#1    checking 37.59.71.25 availability
