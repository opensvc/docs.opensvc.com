VM encapsulation in a service
*****************************

Introduction
============

Managing VM as services has many advantages:

*   Same start/stop/status commands accross non-virtualized services on different operating systems and services encapsulating virtual machines from different technologies (kvm, xen, esx, hpvm, zone, lxc, vz, ...)

*   Mix virtualized and non-virtualized services on the same hosts without increasing complexity (except xen, ldom, esx)

*   Seemless integration of hypervisors in the disaster recovery plan

*   Benefit from all the OpenSVC data replication modes

*   Benefit from the OpenSVC Collector performance monitoring, obsolescence management, alarming, and more. 


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

Follow the :ref:`agent.service.creation` guide.

Customize the service env file
==============================

A typical VM service env file should look like::

	[default]
	vm_name = vm188
	app = ERP
	comment = recette gen db #2
	mode = hpvm
	service_type = DEV
	nodes =  node109 node110 node111 node112
	autostart_node = node109
	;drpnode = vm5
	;scsireserv = false

	[ip#1]
	ipname = vm188
	ipdev = lan0

	[vmdg]
	scsireserv = false

**vm_name**

  If this parameter is not set, the VM name defaults to the service name. When encapsulating an existing VM, chances are that you need to set it to the existing VM hostname. This name is used by the hypervisor to communicate with the VM, so you might need to use a fully qualified name if the hypersisor and the VM do not share the same DNS domain. Communication with zones use the zlogin utility, so fqdn are never needed in this case.

**mode**

  Choose among kvm, xen, esx, hpvm, ldom, vbox, zone, vz and lxc.

**nodes**

  Set to the list of hypervisors able to run the virtual machine in a normal situation.

**autostart_node**

  Set to the hypervisor where the virtual machine should run in a normal situation.

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

This step is recommended but not mandatory. OpenSVC command set allows to start the virtual machine but not the embedded applications through the 'startapp'/'stopapp' commands. For this feature to work as expected, startup scripts should not reside in the operating system's proposed infrastructure (/etc/rcX.d, /sbin/rcX.d, DMF, ...). OpenSVC expects to find app launchers in /svc/etc/init.d in the guest file hierarchy.

Test
====

You should now be able to run succesfully::

	/opt/opensvc/etc/yoursvc print_status
	/opt/opensvc/etc/yoursvc push
	/opt/opensvc/etc/yoursvc diskupdate
	/opt/opensvc/etc/yoursvc stop
	/opt/opensvc/etc/yoursvc start

