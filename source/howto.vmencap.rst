VM encapsulation in a service
*****************************

Introduction
============

Managing VM as services has many advantages:

*   Same start/stop/status commands accross non-virtualized services on different operating systems and services encapsulating virtual machines from different technologies (kvm, xen, docker, esx, hpvm, zone, lxc, vz, ...). This is very convenient for people responsible of production run because they are always capable of standard management tasks (start/stop/status), regardless of the virtualisation/container technologies that are used in your company

*   Mix virtualized and non-virtualized services on the same hosts without increasing complexity (except xen, ldom, esx)

*   Seemless integration of hypervisors in the disaster recovery plan

*   Benefit from all the OpenSVC data replication modes

*   Benefit from the OpenSVC Collector compliance features, performance monitoring, obsolescence management, alarming, and more. 


OpenSVC deployment on an existing hypervisor is a straight-forward process which does not require service disruption. This cookbook details the steps involved:

*   Install a package

*   Configure some ssh key trusts

*   Setup a node configuration file (single word)

*   Setup a service configuration file (~15 lines)

Nodeware installation
=====================

Follow the :ref:`agent.install` guide.

Service creation
================

Follow the :ref:`agent.apps.create` guide.

Customize the service env file
==============================

A typical VM service env file should look like:

::

	[default]
	app = ERP
	comment = recette gen db #2
	service_type = DEV
	nodes =  node109 node110 node111 node112
	orchestrate = start

        [container#1]
        name = vm188
        type = hpvm

	[ip#1]
	ipname = vm188
	ipdev = lan0

	[vmdg]
	scsireserv = false

**name**

  If this parameter is not set, the VM name defaults to the service name. When encapsulating an existing VM, chances are that you need to set it to the existing VM hostname. This name is used by the hypervisor to communicate with the VM, so you might need to use a fully qualified name if the hypersisor and the VM do not share the same DNS domain. Communication with zones use the zlogin utility, so fqdn are never needed in this case.

**type**

  Choose among kvm, xen, docker, esx, hpvm, ldom, vbox, zone, vz and lxc.

**nodes**

  Set to the list of hypervisors able to run the virtual machine in a normal situation.

**orchestrate**

  Set to ``start`` to start the instance on the placement leader on boot.

**drpnode**

  Set to the hypervisor where the virtual machine should run in a disaster recovery situation.

**drpnodes**

  Set to the list of hypervisors where the virtual machine may run in a disaster recovery situation.

**scsireserv**

  Set this parameter to true if:

  * the disks are shared amongst hypervisors

  * *and* the disks are dedicated to the service

  * *and* the disks support the scsi3 persistent reservation commands

**ip resources**

  All OpenSVC VM drivers except 'zone' leave the ip plumbing to the guest operating system. The ip resources described in the env file are used to check the resource availability. This checks are:

  * ping 'ipname'

  * *and* execute in the context of the guest operating system a command verifying the plumbing on the 'ipdev' adapter.

**vmdg resource**

  Add this resource configlet if you pass-through block devices not handled by a volume manager to the virtual machine. The 'vmdg' resource is a special kind of 'vg' resource whose disklist is obtained from the virtual machine configuration. 'start' and 'stop' OpenSVC commands are reduced to scsi reservation handling for this resource as the necessary operations are taken care of by the hypervisor software. It is also necessary for disk inventory completeness.

Trust the hypervisor-to-hypervisor ssh root sessions
====================================================

OpenSVC use ssh as root to execute commands in the other hypervisors context. Such commands are limited to:

*   remote host mode checking

*   remote host replication target mount point checking

Trust the hypervisor-to-guest ssh root sessions
===============================================

This step does not apply to zones, as zlogin is always trusted. Other drivers use ssh as root to execute commands in the guest context. Such commands are limited to:

*   ip resources health checking

*   application start-up scripts execution in the context of the guest

Populate the application startup scripts directory
==================================================

This step is recommended but not mandatory. OpenSVC command set allows to start the virtual machine but not the embedded applications through the 'startapp'/'stopapp' commands. For this feature to work as expected, startup scripts should not reside in the operating system's proposed infrastructure (/etc/rcX.d, /sbin/rcX.d, DMF, ...). OpenSVC expects to find app launchers in /svc/etc/init.d in the guest file hierarchy. This feature is useless in docker's context, where docker image maintainer should have dealt with applications startup when docker container is started.

Test
====

You should now be able to run succesfully:

::

	sudo svcmgr -s yoursvc print status
	sudo svcmgr -s yoursvc push
	sudo svcmgr -s yoursvc diskupdate
	sudo svcmgr -s yoursvc stop
	sudo svcmgr -s yoursvc start


