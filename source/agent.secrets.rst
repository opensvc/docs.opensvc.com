.. _agent.secrets:

Secrets
*******

Secrets are key/value stores, replicated on all cluster nodes, and with values encrypted.

* The secrets object kind is ``sec``
* A secret belongs to a namespace.
* Only services in the same namespace can use the secret keys.
* A secret can be used by multiple services
* Secret key values can be projected in app or container resources environment
* Secret key values can be projected as file content in volumes in the same namespace.
* Secret key values can be empty, text or binary
* Secret key values can be decoded for inspection
* Secret key names can contain path separators and installed recursively

Create a Secret
===============

::
	om test/sec/sec1 create

Add Keys
========

From Value
----------

::

	om test/sec/sec1 add --key password --value changeme

From Stdin
----------

::

	cat /etc/hosts | om test/sec/sec1 add --key hosts_from_stdin --from -
	cat /bin/ls    | om test/sec/sec1 add --key ls_from_stdin    --from -

From File
---------

::
	om test/sec/sec1 add --key hosts_from_file --from /etc/hosts 
	om test/sec/sec1 add --key ls_from_file    --from /bin/ls

From a File Tree
----------------

::
	mkdir /tmp/head /tmp/head/a /tmp/head/b
	touch /tmp/head/a/alex /tmp/head/b/bob

The head can be named:

::

	om test/sec/sec1 add --key tree  --from /tmp/head
	...
	  secret key 'tree/b/bob' added (166)
	  secret key 'tree/a/alex' added (166)

Or left as-is:

::

	om test/sec/sec1 add --from /tmp/head
	...
	  secret key 'head/b/bob' added (166)
	  secret key 'head/a/alex' added (166)

From a Remote Location
----------------------

::
        om test/sec/sec1 add --key logo --from https://www.opensvc.com/init/static/images/opensvc-logo-2018.svg

Listing Keys
============

::

	om test/sec/sec1 keys

Decode Keys
===========

::

	om test/sec/sec1 decode --key key1
	om test/sec/sec1 decode --key key3 > /tmp/ls

Update Keys
===========

Just re-add the key.

::

	om test/sec/sec1 add --key key1 --value newval1

Delete Keys
===========

::

	om test/sec/sec1 delete --key key5

Delete Secret
=============

::

	om test/sec/sec1 delete

All keys are lost when deleting a secret.
This action is orchestrated, asynchronous, and the secret is deleted from all cluster nodes.

Project Secret Keys in App Environment
======================================

::

	...

	[app#1]
	start = /bin/true
	secrets_environment = PASSWORD=sec1/password

Project Secret Keys in Container Environment
============================================

::

	...

	[container#1]
	image = postgres
	volume_mounts = {name}/data:/var/lib/postgresql/data
	secrets_environment = POSTGRES_PASSWORD=sec1/password
	rm = true
	shared = true

Project Secret Keys in Container Filesystem
===========================================

::

	...

	[volume#2]
	type = shm
	name = {name}-secrets
	secrets = sec1/password:/

	[container#1]
	image = postgres
	volume_mounts = {name}/data:/var/lib/postgresql/data
		        {name}-secrets/password:/var/lib/postgresql/password
	rm = true
	shared = true

