Oracle VM
*********

The Oracle VM infrastructure is based on the Xen virtualization technology and Oracle own clusterware. VM images are stored as files in either a network filesystem or Oracle's cluster filesystem (OCFS2). Hypervisors are called OVM servers. A OVM manager is mandatory to create OVM server pools and to configure per-VM failover policy.

Oracle provides downloadable OVM server installation media and manager installation archives through its E-delivery website.

Oracle has a unique value proposition with OVM:

*   the billing is based on support
*   Oracle's products are certified on OVM (Oracle Linux, Solaris, database, PeopleSoft, middleware, ...)
*   Oracle provides tuned and easily instanciable VM templates for those products

The OpenSVC driver for OVM supports:

*   start, stop, migrate of virtual machines
*   HA enabled or disabled

OVM server configuration
========================

The OVM servers may want to communicate with their manager, for example to change vms HA flag. This communication uses the ovmcli tool provided by Oracle.

Install ovmcli
--------------

Make sure you set up the following repositories in ``/etc/yum.conf`` or ``/etc/yum.repo.d/``

::

        [el5_addons]
        name=Enterprise Linux $releasever - $basearch - addons
        baseurl=http://public-yum.oracle.com/repo/EnterpriseLinux/EL5/addons/$basearch/
        gpgkey=http://public-yum.oracle.com/RPM-GPG-KEY-oracle-el5
        gpgcheck=1
        enabled=1
        
        [el5_oracle_addons]
        name=Enterprise Linux $releasever - $basearch - oracle_addons
        baseurl=http://public-yum.oracle.com/repo/EnterpriseLinux/EL5/oracle_addons/$basearch/
        gpgkey=http://public-yum.oracle.com/RPM-GPG-KEY-oracle-el5
        gpgcheck=1
        enabled=1

Then you can install ovmcli with

::

        yum install ovmcli

For reference, Oracle Linux public repositories are available at http://public-yum.oracle.com/public-yum-ovm2.repo

ovmcli configuration
--------------------

You have to run the :cmd:`ovm config` command one time. You will then be prompted for the manager's access information

::

        [root@ovm2 ~]# ovm config
        This is a wizard for configuring the Oracle VM Manager Command Line Interface. 
        CTRL-C to exit.
        
        Oracle VM Manager hostname: ovmguest1
        Oracle VM Manager port number: 4443
        Deploy path (leave blank for default): 
        Location of vncviewer (leave blank to skip): 
        Enable HTTPS support? (Y/n): 
        
        Configuration complete.
        Please rerun the Oracle VM Manager Command Line Interface.

Service configuration
=====================

::

        [DEFAULT]
        app = OSVC
        nodes = ovm1 ovm2
        orchestrate = start
        env = DEV
        mode = ovm
        
        [ip#1]
        ipdev = xenbr0
        ipname = ovmguest1
        
        [hb#1]
        type = ovm

The hb resource instruct OpenSVC that the virtual machine must have HA enabled. In this case, manual commands on the service must be submitted using svcmgr --cluster. OpenSVC will disable HA on stop and enable HA on start.

Examples
========

Stop a OVM service
------------------

::

        [root@ovm1 opensvc]# svcmgr --cluster --service ovmguest1 stop
        10:52:36 INFO    OVMGUEST1.HB#1    ovm -u admin -p XXXXXX vm conf -n ovmguest1 -s pool1 -d
        10:52:39 INFO    OVMGUEST1.HB#1    High availability has been disabled.
        
        10:52:47 INFO    OVMGUEST1.OVM     xm shutdown ovmguest1
        10:52:47 INFO    OVMGUEST1.OVM     wait for container down status

Start a OVM service
-------------------

::

        [root@ovm1 opensvc]# svcmgr --cluster --service ovmguest1 start
        10:54:46 INFO    OVMGUEST1.OVM     xm create /var/ovs/mount/6A17B0B225C6485D8E2D03275FD3B842/running_pool/ovmguest1/vm.cfg
        10:54:49 INFO    OVMGUEST1.OVM     output:
        Using config file "/var/ovs/mount/6A17B0B225C6485D8E2D03275FD3B842/running_pool/ovmguest1/vm.cfg".
        Started domain ovmguest1 (id=2)
        
        10:54:49 INFO    OVMGUEST1.OVM     wait for container up status
        10:54:49 INFO    OVMGUEST1.OVM     wait for container ping
        10:55:22 INFO    OVMGUEST1.OVM     wait for container operational
        10:55:16 INFO    OVMGUEST1.HB#1    ovm -u admin -p XXXXXX vm conf -n ovmguest1 -s pool1 -e
        10:55:23 INFO    OVMGUEST1.HB#1    High availability has been enabled.

Migrate a OVM service
---------------------

::

        [root@ovm2 opensvc]# svcmgr --cluster --service ovmguest1 migrate --to ovm1
        12:25:14 INFO    OVMGUEST1         exec '/usr/bin:svcmgr -s ovmguest1 --cluster --waitlock 60 mount' on node ovm1
        12:25:19 INFO    OVMGUEST1.OVM     xm migrate -l ovmguest1 ovm1
        12:26:59 INFO    OVMGUEST1         exec '/usr/bin/svcmgr -s ovmguest1 --cluster --waitlock 60 prstart' on node ovm1

