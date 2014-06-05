.. _agent.service.creation:

Service creation
****************

Choose a service name
=====================

Guidelines:

*   Make application code part of the name (first)
*   Make service type (PRD, DEV) part of the name (second)
*   Make the last part descriptive of the application role (web, transco)
*   In case of multiple instance of similar services, happen a number as a suffix

This guidelines result in names like gieprdtransco01, infraprddns01, ...

Following this naming will help grasp importance, clients and role of service from the output of ``/opt/opensvc/bin/svcmon``

Allocate generic account and ip addresses
=========================================

We recommend to allocate service-dedicated ip addresses, to permit service failover to secondary nodes.

We recommend to allocate service-dedicated generic accounts (one is ok most of the time), at least for ``hosted`` services, for better control on privileges. All service files should be owned by these accounts except the application launchers, which must be owned by root as they are executed with root privileges. The generic account home directory should be a link redirecting to a subdirectory of one of the service-dedicated filesystems (the one hosting data is a good candidate).

Select a service mode
=====================

.. function:: hosted.

Where virtualisation is unwanted : low-latency applications, restrictive product compatibility matrices, ...

.. function:: zone, lxc, vz, jail, docker

Prefered mode where it is supported : quite low-latency, low mem and cpu overhead, good control of virtual system from the host system.

.. function:: xen, kvm, hpvm, ldom, vbox, esx

Perceptible latency and memory overhead. Host system must rely on tcp/ip communication with the virtual machine to control its resources (change ip addresses, start service applications, ...)

Create a filesystem skeleton for the service
============================================

Here is a set of guidelines you should respect.

Give each service dedicated filesystems. Ideally one for data, one for tools (mysql, apache, ...) and one for launchers and eventually the virtual operating system instance. We recommand the following layout:

.. function:: /gieprdweb01

App launchers in etc/init.d/

.. function:: /gieprdweb01/tools

Private installation of tools. Tools must listen only on the private address to avoid conflicts with same tool of other services running on the same node.

.. function:: /gieprdweb01/data

Application data files

For hosted service mode, prefer per-service private tools installations to enhance system/service insulation. This makes the service installation more painful, but there are no clients at this point, and it will make service relocation more reliable and operating system upgrades safer.

Install virtual host and applications
=====================================

The virtual host is not required for ``hosted`` services.

Create configuration files
==========================

Those are created automatically by the ``svcmgr create`` command. Experienced users will find it easier to start from a copy of the env file of an existing similar service. The following information describes the steps needed to create a service manually.

Service configuration files are in ``/opt/opensvc/etc``. Each service must have these three files present to be fully functional. Services using the internet shared collector must be named using the domainname as a suffix to avoid naming conflicts::

	/opt/opensvc/etc/unxdevweb01.mydomain.com -> ../bin/svcmgr
	/opt/opensvc/etc/unxdevweb01.mydomain.com.env
	/opt/opensvc/etc/unxtstsvc01.mydomain.com.d -> /unxtstscv01/etc/init.d

or::

	/opt/opensvc/etc/unxtstsvc01.mydomain.com.d -> unxdevweb01.mydomain.com.dir
	/opt/opensvc/etc/unxdevweb01.mydomain.com.dir

Configuration files role
========================

.. function:: /opt/opensvc/etc/unxdevweb01.mydomain.com -> ../bin/svcmgr

    This symbolic link is meant to be used as a shortcut to pass commands to a specific service. Like /opt/opensvc/etc/unxdevweb01.mydomain.com start for example

.. function:: /opt/opensvc/etc/unxdevweb01.mydomain.com.env

    This is the configuration file proper, including service description and resource definitions. A fully commented template is available on each node at /opt/opensvc/usr/share/doc/template.env. More on this below.

.. function:: /opt/opensvc/etc/unxdevweb01.mydomain.com.d -> /unxtstscv01/etc/init.d

    This symbolic link points to the directory hosting the service application launchers. The service is not considered active if this link is not present. The directory pointed is best hosted on a service-dedicated filesystem. The service application launchers are expected to be in SysV style: [SK][0-9]*appname. S for starters, K for stoppers, number for ordering. Starters and stoppers can be symlink to a single script. Starter are passed 'start' as first parameter, stoppers are passed 'stop' as first parameter.

.. function:: /opt/opensvc/etc/unxdevweb01.mydomain.com.dir

    This optional directory can be used to store locally the startup scripts. As such, it can be linked from /opt/opensvc/etc/unxdevweb01.mydomain.com.d. OpenSVC synchronize this directory to nodes and drpnodes as part of the sync#i0 internal sync resource. If you placed your startup script on a shared volume, this .dir is not needed but you will still have to create a sync resource to send them to the drpnodes.

Customize the service env file
==============================

At that point you should describe your service's ip addresses, filesystems, disk groups, file synchronizations ... The ``/opt/opensvc/usr/share/doc/template.env`` template presents you with all possible configurations available. The ``svcmgr create -s newsvc -i`` command prompts you about all possible configurations, explains the role of each keyword, proposes candidate values and defaults, and validate input sanity. This same command in non-interactive mode can be used to provision service. In this mode, the resources are passed as json-serialized keyword-value dictionaries.

Test
====

You should now be able to run succesfully::

	/opt/opensvc/etc/gieprdweb01 print status
	/opt/opensvc/etc/gieprdweb01 start
	/opt/opensvc/etc/gieprdweb01 stop


