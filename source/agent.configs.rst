.. _agent.configs:

Configs
*******

Configs are key/value stores, replicated on all cluster nodes, and with values unencrypted.

* The configs object kind is ``cfg``
* A secret belongs to a namespace.
* Only services in the same namespace can use the config keys.
* A config can be used by multiple services
* Config key values can be projected in app or container resources environment
* Config key values can be projected as file content in volumes in the same namespace.
* Config key values can be empty, text or binary
* Config key values can be decoded for inspection
* Config key names can contain path separators and installed recursively

Create a Config
===============

::
	om test/cfg/cfg1 create

Add Keys
========

From Value
----------

::

	om test/cfg/cfg1 add --key max_fds --value 100000

From Stdin
----------

::

	cat /etc/hosts | om test/cfg/cfg1 add --key hosts_from_stdin --from -
	cat /bin/ls    | om test/cfg/cfg1 add --key ls_from_stdin    --from -

From File
---------

::
	om test/cfg/cfg1 add --key hosts_from_file --from /etc/hosts 
	om test/cfg/cfg1 add --key ls_from_file    --from /bin/ls

From a File Tree
----------------

::
	mkdir /tmp/head /tmp/head/a /tmp/head/b
	touch /tmp/head/a/alex /tmp/head/b/bob

The head can be named:

::

	om test/cfg/cfg1 add --key tree  --from /tmp/head
	...
	  config key 'tree/b/bob' added (166)
	  config key 'tree/a/alex' added (166)

Or left as-is:

::

	om test/cfg/cfg1 add --from /tmp/head
	...
	  config key 'head/b/bob' added (166)
	  config key 'head/a/alex' added (166)

From a Remote Location
----------------------

::
	om test/cfg/cfg1 add --key logo --from https://www.opensvc.com/init/static/images/opensvc-logo-2018.svg

Listing Keys
============

::

	om test/cfg/cfg1 keys

Decode Keys
===========

::

	om test/cfg/cfg1 decode --key key1
	om test/cfg/cfg1 decode --key key3 > /tmp/ls

Update Keys
===========

Just re-add the key.

::

	om test/cfg/cfg1 add --key key1 --value newval1

Delete Keys
===========

::

	om test/cfg/cfg1 delete --key key5

Delete Config
=============

::

	om test/cfg/cfg1 delete

All keys are lost when deleting a config.
This action is orchestrated, asynchronous, and the config is deleted from all cluster nodes.

Project Config Keys in App Environment
======================================

::

	...

	[app#1]
	start = /bin/true
	configs_environment = MAX_FDS=cfg1/max_fds

Project Config Keys in Container Environment
============================================

::

	...

	[container#1]
	image = postgres
	volume_mounts = {name}/data:/var/lib/postgresql/data
	configs_environment = MAX_FDS=cfg1/max_fds
	rm = true
	shared = true

Project Config Keys in Container Filesystem
===========================================

::

	...

	[volume#2]
	type = shm
	name = {name}-configs
	configs = cfg1/max_fds:/

	[container#1]
	image = postgres
	volume_mounts = {name}/data:/var/lib/postgresql/data
		        {name}-configs/max_fds:/var/lib/postgresql/max_fds
	rm = true
	shared = true

