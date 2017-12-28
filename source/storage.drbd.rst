drbd storage driver
*******************

Introduction
============

Drbd is a Linux kernel driver presenting shared block devices from pairs of local block devices. Replication data goes over the network and can be synchronous ou near-synchronous. It supports the active-active or active-passive operation modes. The former being a prerequisite for cluster filesystem.

OpenSVC does not configure the drbd framework. It just handles the actions needed upon service 'start' and 'stop'.

Node configuration
==================

The drbd resource configuration is expected to reside in :file:`/etc/drbd.d/${res}.res`.

If a vg is layered above drbd, a specific LVM configuration is recommended (link)

::

        Set write_cache_state = 0 in /etc/lvm/lvm.conf
        Remove /etc/lvm/cache/.cache

Files contributed to sync#i0
============================

::

        /etc/drbd.d/${res}.res

This file is thus replicated from the node running the service to the other nodes and drpnodes.

Command set
===========

The drbd driver is a member of the 'disk group' class.

:cmd:`start`

    Promote to 'primary' state

:cmd:`stop`

    Demote to 'secondary' state

Tags
====

:c-tag:`prevg`

    Upon service 'start', drbd 'start' is scheduled before volume group 'start'. To use when the volume group is layered over the drbd.

:c-tag:`postvg`

    Upon service 'start', drbd 'start' is scheduled after volume group 'start'. To use when the the drbd is layered over the volume group.

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.disk.drbd

Examples
========

In this example the service drives an OpenVZ container installed in a filesystem (fs#1) build on a drbd (drbd#1, resource name 'data'). OpenSVC Also handles the :file:`svc/etc/init.d/foo` start-up script inside the vz container.

Start
-----

::

        root@deb1:/# svcmgr -s drbdsvc.opensvc.com start
        DRBD#0  INFO    drbd resource data is already up
        DRBD#0  INFO    drbdadm primary data
        FS#1    INFO    e2fsck -p /dev/drbd0
        FS#1    INFO    output:
        /dev/drbd0: clean, 27663/131072 files, 161431/524263 blocks
        
        FS#1    INFO    mount -t ext3 -o defaults /dev/drbd0 /drbdsvc
        VZ      INFO    vzctl start 101
        VZ      INFO    output:
        Starting container ...
        Container is mounted
        Adding IP address(es): 192.168.0.204
        Setting CPU units: 1000
        Set hostname: drbdsvc.opensvc.com
        Container start in progress...
        
        VZ      INFO    wait for container up status
        VZ      INFO    wait for container operational
        APP     INFO    spawn: vzctl exec 101 /svc/etc/init.d/S10foo start
        APP     INFO    start done in 0:00:00.068714 - ret 0 - logs in /var/tmp/opensvc/svc_drbdsvc.opensvc.com_S10foo.log

Stop
----

::

        APP     INFO    spawn: vzctl exec 101 /svc/etc/init.d/K90foo stop
        APP     INFO    stop done in 0:00:00.039901 - ret 0 - logs in /var/tmp/opensvc/svc_drbdsvc.opensvc.com_K90foo.log
        VZ      INFO    vzctl stop 101
        VZ      INFO    output:
        Stopping container ...
        Container was stopped
        Container is unmounted
        
        VZ      INFO    wait for container down status
        FS#1    INFO    umount /drbdsvc
        DRBD#0  INFO    drbd resource data is already up
        DRBD#0  INFO    drbdadm secondary data

