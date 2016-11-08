svc.prov.loop-vg-btrfs-ext4.conf resource template
----

::


	[DEFAULT]
	docker_data_dir = {fs#1.mnt}
	docker_daemon_args = --storage-driver=btrfs
	
	[disk#0]
	type = loop
	file = /srv/{svcname}/disk0
	size = 2G
	post_unprovision = rmdir /srv/{svcname}
	
	[disk#1]
	type = vg
	name = {svcname}
	pvs = {disk#0.file}
	
	[fs#1]
	type = btrfs
	mnt = /srv/{svcname}/docker
	dev = /dev/{svcname}/docker
	size = 1G
	vg = {svcname}
	
	[fs#2]
	type = ext4
	mnt = /srv/{svcname}/data
	dev = /dev/{svcname}/data
	size = 950M
	vg = {svcname}
	post_provision = mkdir -p /{fs#2.mnt}/db/conf /{fs#2.mnt}/db/data /{fs#2.mnt}/web2py
	
	[container#0]
	type = docker
	run_image = ubuntu:16.10
	run_args = -i -t --net=none
		-v /etc/localtime:/etc/localtime:ro
	run_command = /bin/bash
	
	[container#1]
	type = docker
	run_image = opensvc/collector_db:latest
	run_args = -v /{fs#2.mnt}/db/conf:/conf
		-v /{fs#2.mnt}/db/data:/var/lib/mysql:rw
		-v /etc/localtime:/etc/localtime:ro
		-e CUSTO_UID=1001 -e CUSTO_GID=1002
		--net=container:{svcname}.container.0
	
	[container#2]
	type = docker
	run_image = opensvc/collector_nginx:latest
	run_args = -i -t
		-v /etc/localtime:/etc/localtime:ro
		-v /{fs#2.mnt}/web2py/applications:/opt/web2py/applications:rw
		-e SVCNAME={svcname}
		--net=container:{svcname}.container.0
	
	[container#3]
	type = docker
	run_image = opensvc/collector_redis:latest
	run_args = -i -t
		-v /etc/localtime:/etc/localtime:ro
		--net=container:{svcname}.container.0
	
	[container#4]
	type = docker
	run_image = opensvc/collector_web2py:latest
	run_args = -i -t
		-v /etc/localtime:/etc/localtime:ro
		-v /{fs#2.mnt}/web2py/applications:/opt/web2py/applications:rw
		-e CUSTO_UID=1001 -e CUSTO_GID=1002
		--net=container:{svcname}.container.0
	
	[ip#0]
	type = docker
	ipdev = lxcbr0
	ipname = {svcname}
	netmask = 255.255.255.0
	gateway = 10.0.3.1
	container_rid = container#0
	
