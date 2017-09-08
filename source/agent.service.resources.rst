.. _agent.service.resources:

Service Resources
=================

All service resources share common properties and behaviours.

Action Requirements
*******************

to be completed

Tagging
*******

A resource can be tagged using the keyword ``tags``. The value is a whitespace-separated list of tags. Tag names can be user-defined or hardcoded in the agent.

Custom Tags
+++++++++++

Custom tags ease service management on complex configurations, as they can be used in services and resources selector expressions.

Examples:

============= =============
Resource      Tags
============= =============
app#db        database base
app#tomcat1   appsrv base
app#tomcat2   appsrv
app#tomcat3   appsrv
app#nginx1    websrv base
app#nginx2    websrv
============= =============

::

        # stop resources tagged 'websrv'
        $ sudo svcmgr -s <svcname> --tag websrv stop

        # stop resources tagged 'websrv' or 'appsrv'
        $ sudo svcmgr -s <svcname> --tag websrv,appsrv stop

        # stop resources tagged 'websrv' and 'base'
        $ sudo svcmgr -s <svcname> --tag websrv+base stop


Special Tags
++++++++++++

Some tag names are reserved and have a particular meaning.

noaction
--------

This tag keep the agent from executing state-changing actions on the resource.

The agent is still running the resource status evaluations.

For example, the resource mapping the ip address activated at vm boot by the operating system must be tagged ``noaction``.

encap
-----

This tag assigns the resource to the encapsulated/slave service. The agent on the master-part of the service does not handle such a resource.

``svcmgr print status`` highlight such resources with the ``E`` flag::

        $ sudo svcmgr -s mysvc.acme.com print status
        mysvc.acme.com
        overall                   up         
        |- avail                  up         
        |  |- fs#1           .... stdby up   zfs data/mysvc.acme.com@/srv/mysvc.acme.com
        |  |- fs#2           .... stdby up   zfs data/mysvc.acme.com/rootfs@/srv/mysvc.acme.com/rootfs
        |  '- container#1    .... up         mycontainer
        |     '- ip#1        ...E up         mysvc.acme.com@eth0
        '- accessory                         
           |- sync#1         .... up         zfs of data/mysvc.acme.com to nodes
           |- sync#1sd       .... up         zfs 'daily' snapshot data/mysvc.acme.com
           '- sync#i0        .... up         rsync svc config to drpnodes, nodes


.. seealso:: :ref:`agent.service.encapsulation`

nostatus
--------

This tag prevents the resource status evaluation. The resource status is set to ``n/a``.

dedicated
---------

This tag is by the ip.docker driver only. If set, the physical network interface card is moved to the container network namespace. This NIC is thus reserved, and should not be used by other resources and services.


Scoping
+++++++

Like any other resource parameter, tags can be scoped ::

        [ip#0]
        tags = encap
        tags@host1 = encap noaction

.. seealso:: :ref:`agent-service-scoping`

Subsets
*******

to be completed

Disabled
********

A resource can be marked as disabled using the ``disable`` keyword::

        [container#1]
        type = docker
        run_image = ubuntu:14.04
        run_command = /bin/bash
        run_args = -i -t
        disable = true

This will make the agent ignore any action upon this resource.

``svcmgr print status`` will highlight disabled resources with the ``D`` flag::

        user@node:~# svcmgr -s app1.dev print status --refresh
        app1.dev
        overall                   up                                                            
        `- avail                  up         
           |- ip#0           .... up         192.168.1.1@lo                                     
           `- container#1    .D.. n/a        docker container app1.dev.container.1@ubuntu:14.04 


Optional
********

A resource can be marked as optional using the ``optional`` keyword::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        optional = true


This parameter allow defining non critical resources in the service.

Service actions won't stop on error reported by optional resources.

``svcmgr print status`` will highlight optional resources with the ``O`` flag::

        [user@node ~]# sudo svcmgr -s redis.acme.com print status
        redis.acme.com
        overall                   up                                             
        |- avail                  up         
        |  `- app#1          ..O. up         redis_init_script
        `- accessory         
           `- sync#i0        .... up         rsync svc config to drpnodes, nodes 


Monitoring
**********

A resource can be marked as monitored using the ``monitor`` keyword::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        monitor = true

It means that this resource is **critical** for the service availability.

If the resource goes down, then the agent triggers the ``monitor_action``, which may cause a crash or reboot of the node, or stop of the service, to force a failover.

``svcmgr print status`` will highlight monitored resources with the ``M`` flag::

        [user@node ~]# sudo svcmgr -s redis.acme.com print status
        redis.acme.com
        overall                   up                                             
        |- avail                  up         
        |  `- app#1          M... up         redis_init_script
        `- accessory         
           `- sync#i0        .... up         rsync svc config to drpnodes, nodes 

.. note::

    * High Availability topic is described in :ref:`howto.ha`
    * ``restart`` parameter can be combined with ``monitor`` setting, as explained below


Automatic Restart
*****************

The ``restart`` parameter can be set to make the agent daemon monitor restart the resource if it fails::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        restart = 3

The ``restart`` value is the number of times the daemon will attempt to restart the resource before giving up.

If combined with ``monitor``, the agent will try to restart the failed resource before triggering the ``monitor_action``

Standby resources
*****************

Some resources must remain up, even when the service instance is stopped.

For example, in a 2-nodes failover service with a fs resource and a sync.rsync resource replicating the fs, the fs resource must be up on the passive node receive the rsync'ed data. If not, the data gets written to the underlying filesystem.

The ``always_on`` keyword can be set in these cases::

        [fs#1]
        mnt_opt = rw
        mnt = /path/to/mountpoint
        dev = /dev/mapper/rootvg-lv
        type = ext4
        always_on = nodes


Possible values are 'nodes', 'drpnodes' or 'nodes drpnodes', or a list of nodes.

Resources tagged with ``always_on`` keyword are started on service ``boot`` and ``start`` actions, and stopped only on service ``shutdown`` action.

``svcgr print status`` will display the ``stdby up`` status for up always_on resources, and ``stdby down`` status for down always_on resources::

        # Primary Node
        user@node1:~$ sudo mysvc.acme.com print status
        mysvc.acme.com
        overall                   up         
        |- avail                  up         
        |  |- ip#0           .... up         67.89.12.3@br0@container#0
        |  |- fs#1           .... stdby up   zfs data/mysvc.acme.com@/srv/mysvc.acme.com
        |  |- fs#3           .... stdby up   zfs data/mysvc.acme.com/data@/srv/mysvc.acme.com/data
        '- accessory                         
           |- sync#1         .... up         zfs of data/mysvc.acme.com to nodes
           '- sync#i0        .... up         rsync svc config to drpnodes, nodes

        # Secondary Node
        user@node2:~$ sudo mysvc.acme.com print status
        mysvc.acme.com
        overall                   down       
        |- avail                  down       
        |  |- ip#0           .... down       67.89.12.3@br0@container#0
        |  |- fs#1           .... stdby up   zfs data/mysvc.acme.com@/srv/mysvc.acme.com
        |  |- fs#3           .... stdby up   zfs data/mysvc.acme.com/data@/srv/mysvc.acme.com/data
        '- accessory                         
           |- sync#1         .... up         zfs of data/mysvc.acme.com to nodes
           '- sync#i0        .... up         rsync svc config to drpnodes, nodes


.. warning:: Don't set this on shared disk !! danger !!


Device Tree
***********

to be completed

svcmgr print_devs
svcmgr print_base_devs
svcmgr print_exposed_devs
svcmgr print_sub_devs

nodemgr print_devs
nodemgr print_devs --reverse
nodemgr print_devs --reverse --verbose


Triggers
********

to be completed
