.. _agent.service.resources:

Service Resources
=================

Each service resource can be completed with some specific parameters, they are described below.

Action Requirements
*******************

to be completed

Tagging
*******

A resource can be tagged using the keyword ``tags`` followed by tag names separated by space

Custom Tags
+++++++++++

Some custom tags can be added to make easier service management on complex configurations. As an example, let's imagine a service with multiple application launchers like

============= ========
Resource Name Tag Name
============= ========
app#db        database
app#tomcat1   appsrv
app#tomcat2   appsrv
app#tomcat3   appsrv
app#nginx1    websrv
app#nginx2    websrv
============= ========

Service management action can be triggered upon a tag, making the action applied to all the resources tagged by this tag.
A svcmgr stop action upon tag ``websrv`` will stop resource ``app#nginx1`` and ``app#nginx2``


Special Tags
++++++++++++

Some tags are reserved keywords and have a particular meaning described below.

noaction
--------

The ``tags = noaction`` statement will prevent the agent from changing any state about this resource.

In the context of an encapsulated container hosting an operating system, we can tag an IP resource as ``noaction``.
In such a setup, the encapsulated operating is in charge of IP management and the agent only checks whether the IP is dup or down.

encap
-----

The ``tags = encap`` statement will assign the resource to the encapsulated service. 

The ``svcmgr print status`` will display the string ``...E`` adjacent to the encapsulated resource as shown below ::

        user@node:~# svcmgr -s mysvc.acme.com print status
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

The ``tags = nostatus`` statement will prevent status evaluation for a resource, and will always be displayed as status ``n/a`` in the ``svcmgr print status``

dedicated
---------

The ``tags = dedicated`` statement is only used in the context of Docker network management. It tells the IP driver that a physical network interface card is reserved for Docker network namespace. At service startup, the physical nic will be assigned and configured into the Docker network namespace.

Tagged Actions
++++++++++++++

When resources are tagged in a service, multiple tags combinations can be submitted ::

        svcmgr --tags A,B start : start rids of resource with either tag A or B
        svcmgr --tags A+B stop  : stop rids of resource with both tags A and B
        svcmgr --tags A+B,B+C disable : disable rids of resource with either tags A and B or tags B and C


Scoping
+++++++

Like any other resource parameter, tags can be scoped ::

        [ip#0]
        tags = encap
        tags@host1 = encap noaction


Subsets
*******

to be completed

Disable
*******

A resource can be marked as disabled using the ``disable`` parameter, like in the configlet below ::

        [container#1]
        type = docker
        run_image = ubuntu:14.04
        run_command = /bin/bash
        run_args = -i -t
        disable = true

This will make the agent ignore any action upon this resource.

The ``svcmgr print status`` will display the string ``.D..`` adjacent to the optional resource as shown below ::

        user@node:~# svcmgr -s app1.dev print status --refresh
        app1.dev
        overall                   up                                                            
        `- avail                  up         
           |- ip#0           .... up         192.168.1.1@lo                                     
           `- container#1    .D.. n/a        docker container app1.dev.container.1@ubuntu:14.04 


Optional
********

It is possible to explicitely mark a resource as ``optional``, like in the configlet below ::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        optional = true


This parameter allow defining non critical resources in the service configuration file. The avail service status won't be degraded if this resource goes down.

The ``svcmgr print status`` will display the string ``..O.`` adjacent to the optional resource as shown below ::

        [user@node ~]# sudo svcmgr -s redis.acme.com print status
        redis.acme.com
        overall                   up                                             
        |- avail                  up         
        |  `- app#1          ..O. up         redis_init_script
        `- accessory         
           `- sync#i0        .... up         rsync svc config to drpnodes, nodes 


Monitor
*******

A resource can be configured with parameter ``monitor`` in order to enable HA monitoring features for this resource ::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        monitor = true

It means that this resource is ``critical`` for the service availability.
If the resource goes down, then the agent will initiate a service failover to ensure service continuity.

The ``svcmgr print status`` will display the string ``M...`` adjacent to the optional resource as shown below ::

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


Restart
*******

The ``restart`` parameter can be set to make agent restart a resource if it fails ::

        [app#1]
        script = redis_init_script
        start = 10
        stop = 90
        check = 10
        info = 10
        restart = 3

The previous configlet will trigger the resource restart up to 3 times.
If combined with ``monitor``, the agent will try to restart the failed resource before actively triggering service failover.

Always_On
*********

Some resources must remain up, even when the service is stopped.

As an example, let's imagine a 2-nodes active/passive service with a filesystem resource, and also a rsync resource, configured to replicate this filesystem. Altough the service is stopped on the passive node, we have to keep the filesystem mounted, so as the rsync replication copy files into the filesystem (and not in the root filesystem !)

The ``always_on`` keyword is made for this purpose, like in the configlet below ::

        [fs#1]
        mnt_opt = rw
        mnt = /path/to/mountpoint
        dev = /dev/mapper/rootvg-lv
        type = ext4
        always_on = nodes


Possible values are 'nodes', 'drpnodes' or 'nodes drpnodes', or a list of nodes.

Any resource tagged with ``always_on`` keyword will be started at service ``boot`` action, and stopped at service ``shutdown`` action.

As soon as this flag is enabled and the service is started, a ``svcgr print status`` will no more display ``up`` or ``down`` status, but only ``stdby up`` ::

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
