Release Notes
*************

Internal changes
================

* The agent source is now organized as a "opensvc" python package.
* The om commands can be run using ``python -m opensvc <args>``.
* The daemon is launched using ``python -m opensvc.daemon``.
* Support out-of-tree drivers. They are looked up in a ``site-opensvc`` package installed in ``sys.path``.
* ``status.json`` and object configuration files are no long overwriten (write in a tempfile and atomic rename).
* Provisioning code is now merged in the resource drivers, instead of in a separate file.
* Move the resource drivers keyword definitions to the driver file.
* On object build, prepare resource driver class arguments using only the keyword dictionnary.
* Use pytest instead of nose for unit testing.
* Discover available API handlers instead of hardcoding the list.
* Allow drivers to register their own api handlers.

Policy changes
==============

* Python 2.6 is no longer supported as an interpreter.
* Set pr status to n/a instead of undef when the resource handles no disks.
* Report n/a for disk.raw devices with no evaluated devs.
* Serialize volume creation cluster-wide.

New Features
============

* Automatically reinstall files projected from cfg/sec keys into volumes upon content changes.
* Support piping ini-format configuration files to ``om create``.
* Support ``om create --config <uri to json content>``.
* Auto provision disk.loop resources when hosted on shm.
* Add the GET /object_status API handler.
* Add --confirm to the ``run`` action.
* Add user/group/perm/dirperm keywords to the volume resource driver.
* Support the ``enter`` action on container.lxc resources.
* Add a container.zone provisioner.
* Add node capabilities detection on daemon startup.
* Allow ``edit`` and ``edit --key`` on usr objects.
* Add a provisioner to the disk.drbd driver.
* Support drbd9 connection mesh and multi-slave.
* Support volume path translation in app resource keywords.
* Add the ``app.retcodes`` keyword.
* Add a ``--format compact`` option to ``om mon``, for clusters with many nodes.
* Add a ``cluster.default_mon_format`` node/cluster keyword to define ``om mon`` default format to ``compact`` by default.
* Display the daemon init progress in ``om mon``.
* Support ubuntu 20.04 CNI location.
* Dump daemon threads stack on SIGUSR1.
* Support piping binaey data to ``om <sec> add --key <key> --from -```. 

New Drivers
===========

* drbd pool

New Commands
============

| :cmd:`om node drain`
|

Agent Migration
===============

Live migration from 2.0 to 2.1 requires no particular precaution.

