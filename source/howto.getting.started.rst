Getting Started
***************

This page will help you take your first steps with OpenSVC services setup.

It will guide you through the sequence of tasks to achieve a simple but working dual-node failover cluster.

Prerequisites
=============

The demonstration environment is composed of:

* A pair of Centos7 servers named ``node1`` and ``node2``, respectively acting as first and second cluster node
* Both nodes are connected to the same network segment 192.168.100.0/24
* root access is mandatory

As we plan to create 2 OpenSVC services with dedicated IP adress, we need 2 IP adresses, one for each service :

* service svc1 => 192.168.100.201
* service svc2 => 192.168.100.202


OpenSVC Installation
====================

We will follow the steps described in `Nodeware installation <agent.install.html>`_

Install the OpenSVC Agent on both cluster nodes.

**On both nodes**::

        $ wget -O /tmp/opensvc.latest.rpm https://repo.opensvc.com/rpms/current

        $ sudo yum -y install /tmp/opensvc.latest.rpm

        $ sudo rpm -qa | grep opensvc
        opensvc-1.9-447osvc.el7.noarch

        $ sudo systemctl start opensvc-agent.service

        $ sudo systemctl is-active opensvc-agent.service
        active

We can also check for proper daemon behaviour:

.. raw:: html

    <pre class=output>
        $ sudo svcmon
        Threads                           <span style="font-weight: bold">node1</span>
         <span style="font-weight: bold">listener</span>  <span style="color: #00aa00">running</span> 0.0.0.0:1214
         <span style="font-weight: bold">monitor</span>   <span style="color: #00aa00">running</span>
         <span style="font-weight: bold">scheduler</span> <span style="color: #00aa00">running</span>
        
        Nodes                             <span style="font-weight: bold">node1</span>
        <span style="font-weight: bold"> 15m</span>                            | 0.05 
        <span style="font-weight: bold"> state</span>                          |      
        
        Services                          <span style="font-weight: bold">node1</span>
        $ 
    </pre>

The ``Threads`` section is explained here :ref:`agent.daemon`

The OpenSVC agent is now operational.

SSH Keys Setup
==============

Cluster members needs ssh mutual authentication to exchange some OpenSVC configuration files. Each node must trust its peer through key-based authentication to allow these communications.

* node1 will be able to connect to node2 as root.
* node2 will be able to connect to node1 as root.

.. note::

        It is also possible for the agent to login on a peer cluster node using an unprivileged user, using the ruser node.conf parameter. In this case, the remote user needs sudo priviles to run the following commands as root: ``nodemgr``, ``svcmgr`` and ``rsync``.

**On node1**::

	node1:/ # scp /root/.ssh/id_rsa.pub root@node2:/tmp/

**On node2**::

	node2:/ # scp /root/.ssh/id_rsa.pub root@node1:/tmp/


**On node1 AND node2**::

	cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys2

**On node1**::

	node1:/ # ssh node2 hostname
	node2

**On node2**::

	node2:/ # ssh node1 hostname
	node1

Set Host Environment
====================

As we are in a lab environment, we do not need to specify the host environment : "TST" is the default value, and is adequate.

For other purposes than testing, we would have defined on both nodes the relevant mode with the method described here :ref:`set-node-environment`

Cluster Build
=============

As our first setup consist in a dual node cluster, we have to follow the steps described here :ref:`agent.configure.cluster`

**On node1**::

    $ sudo nodemgr set --param hb#1.type --value unicast

.. raw:: html

    <pre class=output>
        $ sudo svcmon --color=yes | ansi2html -i
        Threads                            <span style="font-weight: bold">node1</span>
         <span style="font-weight: bold">hb#1.rx</span>   <span style="color: #00aa00">running</span> 0.0.0.0:10000 | /    
         <span style="font-weight: bold">hb#1.tx</span>   <span style="color: #00aa00">running</span>               | /    
         <span style="font-weight: bold">listener</span>  <span style="color: #00aa00">running</span> 0.0.0.0:1214 
         <span style="font-weight: bold">monitor</span>   <span style="color: #00aa00">running</span>
         <span style="font-weight: bold">scheduler</span> <span style="color: #00aa00">running</span>
        
        Nodes                              <span style="font-weight: bold">node1</span>
        <span style="font-weight: bold"> 15m</span>                             | 0.05 
        <span style="font-weight: bold"> state</span>                           |      
        
        Services                           <span style="font-weight: bold">node1</span>
    </pre>


Service Creation
================

The OpenSVC service can be created using one of the following two methods:

* wizard : ``svcmgr create`` with interactive option (-i)
* manual : build config file from templates (located in ``<OSVCDOC>``)
* provisioning

We will describe the second, manual option, for a better understanding of what happens. 

Step 1 : Service creation
+++++++++++++++++++++++++

A simple command is needed to create the service ``svc1``::

    $ sudo svcmgr -s svc1 create




The expected file name is ``servicename.conf`` located in ``<OSVCETC>``

The DEFAULT section in the service file describes the service itself: human readable name, nodes where the service is expected to run on, default node, ...

Every other section defines a ressource managed by the service.

The following configuration describes a service named ``p26.opensvc.com``, running on the primary node ``node1``, failing-over to node ``node2``, using one IP address named ``p26.opensvc.com`` (name to ip resolution is done by the OpenSVC agent), one LVM volume group ``vgsvc1``, and two filesystems hosted in logical volumes ``/dev/mapper/vgsvc1-lvappsvc1`` and ``/dev/mapper/vgsvc1-lvdatasvc1``.

**On node1 node**::

        node1:/ # cd /etc/opensvc

        node1:/etc/opensvc # cat p26.opensvc.com.env
        [DEFAULT]					# Global section for service description
        app = MyApp					# service application friendly name
        service_type = TST				# specify is service runs production, test, dev, ...
        autostart_node = node1				# default running node, name returned by « hostname » command
        nodes = node1 node2				# cluster nodes where the service is able to run on

        [ip#0]						# Ressource Section for ip address
        ipname = p26.opensvc.com			# specify the ip address on which the service will be bound
        disable = False					# the ip address will be enabled at service startup
        optional = False				# mandatory ressource, the service can't work without it
        ipdev = eth0					# the physical network device on which the ip address will be stacked

        [vg#0]						# Ressource Section for volume group
        vgname=vgsvc1					# volume group name

        [fs#0]						# Ressource Section for filesystem
        type = ext3					# filesystem type
        disable = False					# filesystem is enabled at service startup
        mnt = /svc1/app					# filesystem mountpoint
        optional = False				# mandatory ressource, the service can't work without it
        dev = /dev/mapper/vgsvc1-lvappsvc1		# block device where the filesystem is hosted

        [fs#1]
        type = ext3
        disable = False
        mnt = /svc1/data
        optional = False
        dev = /dev/mapper/vgsvc1-lvdatasvc1


Step 2 : Service startup scripts directory
++++++++++++++++++++++++++++++++++++++++++

As services are used to manage application, we need to specify a directory where all applications startup scripts can be grouped.

As an example, if we want to build a LAMP service, we would use 2 scripts: one for the mysql database, and another for the apache webserver. Those scripts have to be located in the service startup scripts directory ::

        node1:/etc/opensvc # mkdir p26.opensvc.com.dir
        node1:/etc/opensvc # ln -s p26.opensvc.com.dir p26.opensvc.com.d

We will see later in this tutorial that ``/etc/opensvc/p26.opensvc.com.dir`` may not be the best place for hosting the launchers. Anyway, the symlink ``p26.opensvc.com.d`` is the only place where OpenSVC actually search for application launchers defined as basenames.

For now, we just will just create this directory and the symlink. No script is added yet.

Step 3 : Service management facility
++++++++++++++++++++++++++++++++++++

To make service management easy, we create a symlink to OpenSVC core service management command ::

        node1:/etc/opensvc # ln -s /usr/bin/svcmgr p26.opensvc.com

Without this symlink, we have to use the ``svcmgr`` command with arguments to manage our service ::

        node1:/ # svcmgr -s p26.opensvc.com print status

With this symlink, we can directly use ::

        node1:/ # p26.opensvc.com print status

Step 4 : Service configuration check
++++++++++++++++++++++++++++++++++++

As a final check, we can list all entries that match our ``p26.opensvc.com`` service ::

        node1:/etc/opensvc # ls -lart | grep p26
        total 20
        drwxr-xr-x 9 root root 4096 16 févr. 11:14 ..
        -rw-r--r-- 1 root root  423 17 févr. 14:12 p26.opensvc.com.env
        drwxr-xr-x 2 root root 4096 17 févr. 14:14 p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   19 17 févr. 14:15 p26.opensvc.com.d -> p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /usr/bin/svcmgr
        drwxr-xr-x 3 root root 4096 17 févr. 14:15 .

You should be able to see:

- the service configuration file (service.env)
- the directory where are stored the applications launchers (service.dir)
- a symlink to the ``service.dir`` (service.d)
- a symlink to the ``/usr/bin/svcmgr`` command (service)

At this point, we have configured a single service with no application launcher on node node1.

Service Testing
===============

Query service status
++++++++++++++++++++

Our first service is now ready to use. We can query its status.

**On node1**::

        node1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  warn
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   warn
        |  '- sync#i0        .... warn     rsync svc config to drpnodes, nodes
        |                                  # passive node needs update
        '- hb                     n/a

This command collects and displays status for each service ressource :

- overall status is ``warn`` due to the fact that all ressources are not in ``up`` status
- ressource ``vg#0`` is up because the volume group is activated (which is the expected status after vgcreate)
- sync resources are in ``warn`` status because no synchronisation happened yet
- all other ressources are ``down`` or non available ``n/a``

Start service
+++++++++++++

The use of OpenSVC for your services management saves a lot of time and effort.
Once the service is described on a node, you just need one command to start the overall application.

Let's start the service ::

        node1:/ # p26.opensvc.com start
        14:40:06 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        14:40:11 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        14:40:11 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        14:40:11 INFO    P26.OPENSVC.COM.VG#0    vgsvc1 is already up
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    create missing mountpoint /svc1/app
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 11/3072 files, 1530/12288 blocks
        
        14:40:11 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    create missing mountpoint /svc1/data
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 11/3072 files, 1530/12288 blocks
        
        14:40:11 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data

The startup sequence reads as:

- check if service IP address is not already used somewhere
- bring up service ip address 
- volume group activation (if not already in the correct state)
- fsck + mount of each filesystem


Manual filesystem mount check::

        node1:/ # mount | grep svc1
        /dev/mapper/vgsvc1-lvappsvc1 on /svc1/app type ext3 (rw)
        /dev/mapper/vgsvc1-lvdatasvc1 on /svc1/data type ext3 (rw)

Manual ip address plumbing check on eth0 (p26.opensvc.com is 37.59.71.26)::

        node1:/ # ip addr list eth0
        2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
            link/ether 52:54:00:db:db:29 brd ff:ff:ff:ff:ff:ff
            inet 37.59.71.22/27 brd 37.59.71.31 scope global eth0
            inet 37.59.71.26/27 brd 37.59.71.31 scope global secondary eth0:1
            inet6 fe80::5054:ff:fedb:db29/64 scope link
               valid_lft forever preferred_lft forever

We can confirm everything is OK with the service's ``print status`` command::

        node1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |                                  # no checkup scripts
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # node2 need update
        '- hb                     n/a

At this point, we have a running service, configured to run on node1 node.

Application Integration
=======================

We have gone through the setup of a single service, but it does not start applications yet. Let's add an application to our service now.

We will use a very simple example : a tiny webserver with a single index.html file to serve

Applications launcher directory
+++++++++++++++++++++++++++++++

The OpenSVC service integration enables service relocation amongst nodes. The per-service launchers hosting directory layout is a consequence of this relocation feature. The service has an implicit synchronisation resource to replicate the ``<OSVCETC>/<service>*`` files using rsync.

As a refinement, for services with dedicated shared disks, we can relocate the application launchers directory to a filesystem resource hosted in one such disk. The original location was ``<OSVCETC>/p26.opensvc.dir``. Let's move it to ``/svc1/app/init.d``::

        node1:/etc/opensvc # ls -lart | grep p26
        total 20
        drwxr-xr-x 9 root root 4096 16 févr. 11:14 ..
        -rw-r--r-- 1 root root  423 17 févr. 14:12 p26.opensvc.com.env
        drwxr-xr-x 2 root root 4096 17 févr. 14:14 p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   19 17 févr. 14:15 p26.opensvc.com.d -> p26.opensvc.com.dir
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /usr/bin/svcmgr
        drwxr-xr-x 3 root root 4096 17 févr. 14:15 .

        node1:/etc/opensvc # rm -f p26.opensvc.com.d
        node1:/etc/opensvc # rmdir p26.opensvc.com.dir

        node1:/etc/opensvc # mkdir /svc1/app/init.d
        node1:/etc/opensvc # ln -s /svc1/app/init.d p26.opensvc.com.d

        node1:/etc/opensvc # ls -lart | grep p26
        total 12
        lrwxrwxrwx 1 root root  23 17 févr. 14:15 p26.opensvc.com -> /usr/bin/svcmgr
        lrwxrwxrwx 1 root root  16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root 396 17 févr. 14:21 p26.opensvc.com.env

Application Binary
++++++++++++++++++

In the service directory structure, we put a standalone binary of the Mongoose web server (https://code.google.com/p/mongoose/) ::

        node1:/ # cd /svc1/app
        
        node1:/svc1/app # wget -O /svc1/app/webserver http://cesanta.com/downloads/mongoose-lua-sqlite-ssl-static-x86_64-5.2
        --2014-02-18 14:35:12--  http://cesanta.com/downloads/mongoose-lua-sqlite-ssl-static-x86_64-5.2
        Resolving cesanta.com... 54.194.65.250
        Connecting to cesanta.com|54.194.65.250|:80... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 1063420 (1.0M) [text/plain]
        Saving to: `/svc1/app/webserver'
        
        100%[================================================================================================>] 1,063,420    210K/s   in 5.3s
        
        2014-02-18 14:35:18 (197 KB/s) - `/svc1/app/webserver' saved [1063420/1063420]
        
        node1:/svc1/app # ls -l /svc1/app/webserver
        -rwxr-xr-x 1 root root 1063420 Feb  1 18:11 /svc1/app/webserver

And create a dummy web page in ``/svc1/data/``, to be served by our webserver::

        node1:/svc1/app # cd /svc1/data/
        
        node1:/svc1/data # cat index.html
        <html><body>It Works !</body></html>

Applications launcher script
++++++++++++++++++++++++++++

We have to create a management script for our web application. At minimum, this script must support the ``start`` argument.

As a best practice, the script should also support the additional arguments:

- stop
- status
- info

Of course, we will store our script named ``weblauncher`` in the directory previsouly created for this purpose::

        node1:/ # cd /svc1/app/init.d
        
        node1:/svc1/app/init.d # cat weblauncher
        #!/bin/bash
        
        SVCROOT=/svc1
        APPROOT=${SVCROOT}/app
        DAEMON=${APPROOT}/webserver
        DAEMON_BASE=$(basename $DAEMON)
        DAEMONOPTS="-document_root ${SVCROOT}/data -index_files index.html -listening_port 8080"
        
        function status {
        	pgrep $DAEMON_BASE >/dev/null 2>&1
        }
        
        case $1 in
        restart)
        	killall $DAEMON_BASE
        	$DAEMON
        	;;
        start)
        	status && {
        		echo "already started"
        		exit 0
        	}
        	nohup $DAEMON $DAEMONOPTS >> /dev/null 2>&1 &
        	;;
        stop)
        	killall $DAEMON_BASE
        	;;
        info)
        	echo "Name: webserver"
        	;;
        status)
        	status
        	exit $?
        	;;
        *)
        	echo "unsupported action: $1" >&2
        	exit 1
        	;;
        esac

Make sure the script is working fine outside of the OpenSVC context::

        node1:/svc1/app # ./weblauncher status
        node1:/svc1/app # echo $?
        1
        node1:/svc1/app # ./weblauncher start
        node1:/svc1/app # ./weblauncher status
        node1:/svc1/app # echo $?
        0
        node1:/svc1/app # ./weblauncher stop
        node1:/svc1/app # ./weblauncher status
        node1:/svc1/app # echo $?
        1

Now we can instruct OpenSVC to handle this script for service application management ::

        node1:/svc1/app/init.d # ln -s weblauncher S10weblauncher
        node1:/svc1/app/init.d # ln -s weblauncher K90weblauncher
        node1:/svc1/app/init.d # ln -s weblauncher C10weblauncher

        node1:/svc1/app/init.d # ls -l
        total 1
        lrwxrwxrwx 1 root root  11 Feb 17 16:49 C10weblauncher -> weblauncher
        lrwxrwxrwx 1 root root  11 Feb 17 16:48 K90weblauncher -> weblauncher
        lrwxrwxrwx 1 root root  11 Feb 17 16:47 S10weblauncher -> weblauncher
        -rwxr-xr-x 1 root root 570 Feb 17 16:45 weblauncher


This configuration tells OpenSVC to call the ``weblauncher`` script with :

- ``start`` argument when OpenSVC service starts (symlink S10weblauncher)
- ``stop`` argument when OpenSVC service stops (symlink K90weblauncher)
- ``status`` argument when OpenSVC service needs status on application (symlink C10weblauncher)

When integrating multiple software into an OpenSVC service, you can to use the digits after [SKC] in the symlink name to specify the scripts execution sequencing for start/stop/check actions.

Now we can give a try to our launcher script, using OpenSVC commands::

        node1:~ # p26.opensvc.com start
        16:52:31 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:52:36 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        16:52:36 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        16:52:36 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @node1 vgsvc1
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        16:52:37 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        16:52:37 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        16:52:37 INFO    P26.OPENSVC.COM.APP     spawn: /etc/opensvc/p26.opensvc.com.d/S10weblauncher start
        16:52:37 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.007657 - ret 0 - logs in /var/tmp/opensvc/svc_p26.opensvc.com_S10weblauncher.log

We can see that OpenSVC is now calling our startup script after mounting filesystems.
        
Querying the service status, the ``app`` ressource is now reporting ``up``::

        node1:~ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # node2 need update
        '- hb                     n/a

Let's check if that is really the case::

        node1:/ # ps auxww|grep web
        root      5902  0.0  0.1   4596  2304 pts/2    S    16:52   0:00 /svc1/app/webserver -document_root /svc1/data -index_files index.html -listening_port 8080
        root      5958  0.0  0.0   7780   888 pts/2    S+   16:53   0:00 grep web
        
        node1:~ # wget -qO - http://p26.opensvc.com:8080/
        <html><body>It Works !</body></html>

Now we can stop our service::

        node1:/ # p26.opensvc.com stop
        15:32:31 INFO    P26.OPENSVC.COM.APP     spawn: /etc/opensvc/p26.opensvc.com.d/K90weblauncher stop
        15:32:31 INFO    P26.OPENSVC.COM.APP     stop done in 0:00:00.004676 - ret 0 - logs in /var/tmp/opensvc/svc_p26.opensvc.com_K90weblauncher.log
        15:32:32 INFO    P26.OPENSVC.COM.FS#1    umount /svc1/data
        15:32:32 INFO    P26.OPENSVC.COM.FS#0    umount /svc1/app
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    vgchange --deltag @node1 vgsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvappsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvdatasvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    vgchange -a n vgsvc1
        15:32:32 INFO    P26.OPENSVC.COM.VG#0    output:
          0 logical volume(s) in volume group "vgsvc1" now active
        
        15:32:32 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 down
        15:32:32 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability

Once again, a single command:

- brings down the application
- unmounts filesystems
- deactivates the volume group
- disables the service ip address

The overall status is now reported as being down ::

        node1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   down
        |- avail                  down
        |  |- vg#0           .... down     vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   down
        |  '- sync#i0        .... down     rsync svc config to drpnodes, nodes
        |                                  # node2 need update
        '- hb                     n/a

Let's restart the service to continue this tutorial::

        node1:/ # p26.opensvc.com start
        15:53:44 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        15:53:48 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        15:53:48 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @node1 vgsvc1
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        15:53:49 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        15:53:49 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        15:53:49 INFO    P26.OPENSVC.COM.APP     spawn: /etc/opensvc/p26.opensvc.com.d/S10weblauncher start
        15:53:49 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.008936 - ret 0 - logs in /var/tmp/opensvc/svc_p26.opensvc.com_S10weblauncher.log

At this point, we have a running service on node node1, with a webserver application embedded.

Service Failover
================

Our service is running fine, but what happens if the ``node1`` node fails ? Our ``p26.opensvc.com`` service will also fail.
That's why we want to extend the service configuration to declare ``node2`` as a failover node for this service.
After this change, the service configuration needs replication to the ``node2`` node. 

First we check ``<OSVCETC>`` on node2, it should be empty because we've done a fresh install::

        node1:/etc/opensvc # ssh node2 ls /etc/opensvc/ | grep p26.opensvc.com
        node1:/etc/opensvc # 

The configuration replication will be possible if the following conditions are met:

- the new node is declared in the service configuration file ``<OSVCETC>/p26.opensvc.com.env`` (parameter "nodes" in the .env file)
- the node sending config files (node1) is trusted on the new node (node2) (as described in a previous chapter of this tutorial)
- the node sending config files (node1) must be running the service (the service availability status, apps excluded, is up).
- the previous synchronisation is older than the configured minimum delay, or the --force option is set to bypass the delay check.

Let's replicate the configuration files::

        node1:/ # svcmgr -s p26.opensvc.com syncnodes
        17:20:37 INFO    P26.OPENSVC.COM.SYNC#I0 skip sync: not in allowed period (['03:59', '05:59'])
        
        node1:/ # svcmgr -s p26.opensvc.com syncnodes --force
        17:20:41 INFO    P26.OPENSVC.COM         exec 'svcmgr -s p26.opensvc.com --waitlock 3600 postsync' on node node2
        
        node1:/ # ssh node2 ls -l /etc/opensvc | grep p26.opensvc.com
        total 8
        lrwxrwxrwx 1 root root  23 17 févr. 14:15 p26.opensvc.com -> /usr/bin/svcmgr
        lrwxrwxrwx 1 root root  16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root 396 17 févr. 14:21 p26.opensvc.com.env

We can see that the ``node2`` node is now ready to start our service.

**On node1**::

        node1:/ # svcmgr -s p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

Note that the ``sync#i0`` ressource is now up, due to both nodes being in sync from a service configuration point of view.

We can now try to start the service on ``node2``, after stopping it on ``node1``::

        node1:/ # svcmgr -s p26.opensvc.com stop
        16:07:40 INFO    P26.OPENSVC.COM.APP     spawn: /etc/opensvc/p26.opensvc.com.d/K90weblauncher stop
        16:07:40 INFO    P26.OPENSVC.COM.APP     stop done in 0:00:00.004513 - ret 0 - logs in /var/tmp/opensvc/svc_p26.opensvc.com_K90weblauncher.log
        16:07:40 INFO    P26.OPENSVC.COM.FS#1    umount /svc1/data
        16:07:40 INFO    P26.OPENSVC.COM.FS#0    umount /svc1/app
        16:07:40 INFO    P26.OPENSVC.COM.VG#0    vgchange --deltag @node1 vgsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvappsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    kpartx -d /dev/vgsvc1/lvdatasvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    vgchange -a n vgsvc1
        16:07:41 INFO    P26.OPENSVC.COM.VG#0    output:
          0 logical volume(s) in volume group "vgsvc1" now active
        
        16:07:41 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 down
        16:07:41 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        
**On node2**::
        
        node2:~ # p26.opensvc.com start
        16:08:38 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:08:41 INFO    P26.OPENSVC.COM.IP#0    ifconfig eth0:1 37.59.71.26 netmask 255.255.255.224 up
        16:08:41 INFO    P26.OPENSVC.COM.IP#0    arping -U -c 1 -I eth0 -s 37.59.71.26 0.0.0.0
        ARPING 0.0.0.0 from 37.59.71.26 eth0
        Sent 1 probes (1 broadcast(s))
        Received 0 response(s)
        16:08:42 INFO    P26.OPENSVC.COM.VG#0    vgchange --addtag @node2 vgsvc1
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    output:
          Volume group "vgsvc1" successfully changed
        
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    vgchange -a y vgsvc1
        16:08:43 INFO    P26.OPENSVC.COM.VG#0    output:
          2 logical volume(s) in volume group "vgsvc1" now active
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    output:
        /dev/mapper/vgsvc1-lvappsvc1: clean, 19/3072 files, 2579/12288 blocks
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#0    mount -t ext3 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    output:
        /dev/mapper/vgsvc1-lvdatasvc1: clean, 13/3072 files, 1532/12288 blocks
        
        16:08:43 INFO    P26.OPENSVC.COM.FS#1    mount -t ext3 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data
        16:08:43 INFO    P26.OPENSVC.COM.APP     spawn: /etc/opensvc/p26.opensvc.com.d/S10weblauncher start
        16:08:43 INFO    P26.OPENSVC.COM.APP     start done in 0:00:00.009601 - ret 0 - logs in /var/tmp/opensvc/svc_p26.opensvc.com_S10weblauncher.log

        node2:~ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     n/a

Service p26.opensvc.com is now running on node ``node2``. Service relocation operational, easy as that.

Now, what happens if I try to start my service on ``node1`` while already running on ``node2`` ?::

        node1:/ # p26.opensvc.com start
        16:19:39 INFO    P26.OPENSVC.COM.IP#0    checking 37.59.71.26 availability
        16:19:39 ERROR   P26.OPENSVC.COM         'start' action stopped on execution error: start aborted due to resource ip#0 conflict
        16:19:39 INFO    P26.OPENSVC.COM         skip rollback start: no resource activated

Fortunately, OpenSVC IP address check prevent the service from starting on ``node1``.

.. note::

        At this point, we have a 2-node failover cluster. Although this setup meets most needs, the failover is _manual_, so does not qualify as a high availability cluster.

        To learn how to meet HA requirements with OpenSVC, we will now describe the OpenHA heartbeat setup.

OpenHA Integration
==================

This chapters presents the steps to upgrade a service from "manual failover" to "automated failover".
It follows the instructions from `High Availability setup <howto.ha.html>`_

OpenSVC Heartbeat Ressource
+++++++++++++++++++++++++++

A HA OpenSVC service handles a special resource: the heartbeat resource, which reports the service status from the point of view of the heartbeat. No action is handled by this resource type.

The following section is appended to the ``p26.opensvc.com.env`` file on node ``node1``::

        [hb#0]
        type = OpenHA

The ``name`` parameter can be set if the OpenSVC service name is different from the OpenHA service name. In this example, we use the same service name, so we omitted this parameter.

The next ``svcmon`` or ``print status`` action will automatically complete the ``<OSVCETC>`` directory with 2 new symlinks::

        node1:/ # svcmgr -s p26.opensvc.com print status
        send /etc/opensvc/p26.opensvc.com.env to collector ... OK
        update /var/lib/opensvc/p26.opensvc.com.push timestamp ... OK
        p26.opensvc.com
        11:19:37 INFO    P26.OPENSVC.COM.HB#0  /etc/opensvc/p26.opensvc.com.cluster: not regular file nor symlink. fix. 
        11:19:37 INFO    P26.OPENSVC.COM.HB#0  /etc/opensvc/p26.opensvc.com.stonith: not regular file nor symlink. fix.
        overall                   warn
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     warn
           '- hb#0           .... warn     hb.openha
                                           # open-ha daemons are not running
        
        node1:/etc/opensvc # ls -lart | grep p26
        lrwxrwxrwx 1 root root   23 17 févr. 14:15 p26.opensvc.com -> /usr/bin/svcmgr
        lrwxrwxrwx 1 root root   16 17 févr. 16:48 p26.opensvc.com.d -> /svc1/app/init.d
        -rw-r--r-- 1 root root  428 19 févr. 08:29 p26.opensvc.com.env.before.openha
        -rw-r--r-- 1 root root  450 19 févr. 08:30 p26.opensvc.com.env
        lrwxrwxrwx 1 root root   13 19 févr. 11:19 p26.opensvc.com.stonith -> /usr/bin/svcmgr
        lrwxrwxrwx 1 root root   13 19 févr. 11:19 p26.opensvc.com.cluster -> /usr/bin/svcmgr

The new service configuration must now be pushed to the peer node ``node2``::

        node1:/ # svcmgr -s p26.opensvc.com syncnodes --force 
        11:55:50 INFO    P26.OPENSVC.COM         exec '/etc/opensvc/p26.opensvc.com --waitlock 3600 postsync' on node node2

        node1:/ # ssh node2 svcmgr -s p26.opensvc.com print status
        18:18:56 INFO    P26.OPENSVC.COM.HB#0    /etc/opensvc/p26.opensvc.com.cluster: not regular file nor symlink. fix.
        18:18:56 INFO    P26.OPENSVC.COM.HB#0    /etc/opensvc/p26.opensvc.com.stonith: not regular file nor symlink. fix.
        p26.opensvc.com
        overall                   down
        |- avail                  down
        |  |- vg#0           .... down     vgsvc1
        |  |- fs#0           .... down     /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... down     /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... down     p26.opensvc.com@eth0
        |  '- app            .... n/a      app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     warn
           '- hb#0           .... warn     hb.openha
                                           # open-ha daemons are not running

OpenHA Installation
+++++++++++++++++++

Install the OpenHA package on both cluster nodes.

**On both nodes**::

        # wget -O /tmp/openha.latest.rpm https://repo.opensvc.com/rpms/deps/el6/openha-0.3.6.osvc2-0.x86_64.rpm
        # rpm -Uvh /tmp/openha.latest.rpm
        # rpm -qa | grep openha
        openha-0.3.6.osvc2-0
        # ls /usr/local/cluster
        bin  conf  doc  env.sh  ezha.init  log  services

As specified in the documentation, we have to set environment variables to be able to use OpenHA commands. You can either set them system-wide (/etc/profile), or just set them when needed::

        # export EZ=/usr/local/cluster
        # . /usr/local/cluster/env.sh


OpenHA Configuration
++++++++++++++++++++

First, we describe the cluster nodes in the file ``/usr/local/cluster/conf/nodes``

**On both nodes**::

        # cat /usr/local/cluster/conf/nodes
        node1
        node2

In this example, we implement two heartbeats:

- A network multicast ip heartbeat
- A shared disk heartbeat (a new lun has been provisionned from the OpenFiler host : /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c)

The heartbeat configuration file ``/usr/local/cluster/conf/monitor`` contains the following lines on both nodes: 

**On both nodes**::

        # cat /usr/local/cluster/conf/monitor
        node1 net eth0 239.131.50.10 1234 10
        node1 dio /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c 0 10
        node2 net eth0 239.131.50.10 4321 10
        node2 dio /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c 2 10

These lines mean:

- node1 node will send heartbeat through eth0 on multicast IP 239.131.50.10 port 1234, with a 10 seconds timeout
- node1 node will write heartbeat on the first block of disk /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c, with a 10 seconds timeout
- node1 will listen heartbeat through eth0 on multicast IP 239.131.50.10 port 4321, with a 10 seconds timeout
- node1 node will read heartbeat on the third block of disk /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c, with a 10 seconds timeout

OpenHA also requires monitored services to be declared :

**On both nodes**::

        # $EZ_BIN/service -a p26.opensvc.com /etc/opensvc/p26.opensvc.com.cluster node1 node2 /bin/true
        Creating service p26.opensvc.com :
        Make of services directory done
        Done.

Please note that the configuration applied does not include any stonith callout, as the stonith is best handled through OpenSVC.

The last setup step concerns OpenHA start/stop scripts.

**On both nodes**::

        # ln -s /usr/local/cluster/ezha /etc/rc.d/rc3.d/S99cluster
        # ln -s /usr/local/cluster/ezha /etc/rc.d/rc0.d/K01cluster
        # ln -s /usr/local/cluster/ezha /etc/rc.d/rcS.d/K01cluster

OpenHA Testing
++++++++++++++

Once this setup is in place, OpenHA takes over the OpenSVC service management. 

.. warning:: In this example the service p26.opensvc.com was stopped when the OpenHA daemons were started. It's also possible to install-configure-start or stop-upgrade-start OpenHA while keeping the service operational, but these procedures are not covered in this tutorial.

We start the OpenHA agents:

**On both nodes**::

        # /usr/local/cluster/ezha.init start

You can query the OpenHA service configuration and states with the ``$EZ_BIN/service -s`` command:

**On both nodes**::

        # $EZ_BIN/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : node1, FROZEN_STOP
        	Secondary: node2, FROZEN_STOP

The double ``FROZEN_STOP`` status means that neither ``node1`` nor ``node2`` are capable of taking over the service.

We can also check for hearbeats status with the ``$EZ_BIN/hb -s`` command:

**On both nodes**::

        # $EZ_BIN/hb -s
        interface eth0:239.131.50.10:1234 pid 25633 status UP, updated at Feb 19 20:59:57
        interface /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c:0 pid 25636 status UP, updated at Feb 19 20:59:57
        interface eth0:239.131.50.10:4321 pid 23801 status UP, updated at Feb 19 20:59:57
        interface /dev/mapper/14f504e46494c45526967724d32682d553243692d4f336a4c:2 pid 23804 status UP, updated at Feb 19 20:59:55


Everything is working as expected. We can now allow ``node1`` node to take over the service using the ``unfreeze`` command:

**On node1 node**::

        node1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -A p26.opensvc.com unfreeze

Querying the OpenHA service status at a ~1 second interval, we can see to status transitions:

**On node1 node**::

        node1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : node1, START_READY
        	Secondary: node2, FROZEN_STOP

=> The ``START_READY`` state means that ``node1`` node is ready to start the service, but waits for a couple of seconds to see if its peer node also transition to this same ``START_READY`` state. In this case OpenHA would start the service where it was previously running. In our case we keep ``node2`` in the ``FROZEN_STOP`` state, and a couple of seconds later we observe:

**On node1 node**::

        node1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : node1, STARTING
        	Secondary: node2, FROZEN_STOP

=> The ``STARTING`` state means that ``node1`` node have initiated the service startup by calling the script ``<OSVCETC>/p26.opensvc.com.cluster`` specified in OpenHA service configuration with the ``start`` parameter.

**On node1 node**::

        node1:/usr/local/cluster/conf # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : node1, STARTED
        	Secondary: node2, FROZEN_STOP

=> The ``STARTED`` state means that ``node1`` node has finished the startup of the service, and the script return code was 0.

We can confirm that the service is running by querying its state through OpenSVC commands:

**On node1 node**::
        
        node1:/ # p26.opensvc.com print status
        p26.opensvc.com
        overall                   up
        |- avail                  up
        |  |- vg#0           .... up       vgsvc1
        |  |- fs#0           .... up       /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
        |  |- fs#1           .... up       /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
        |  |- ip#0           .... up       p26.opensvc.com@eth0
        |  '- app            .... up       app
        |- sync                   up
        |  '- sync#i0        .... up       rsync svc config to drpnodes, nodes
        '- hb                     up
           '- hb#0           .... up       hb.openha


The second node ``node2`` is still in the ``FROZEN_STOP`` state. We have to allow it to take over the service, if need be.

**On node2 node**::

        node2:/ # /usr/local/cluster/bin/service -A p26.opensvc.com unfreeze

        node2:/usr/local/cluster/log # /usr/local/cluster/bin/service -s
        1 service(s) defined:
        Service: p26.opensvc.com
        	Primary  : node1, STARTED
        	Secondary: node2, STOPPED

=> The ``node2`` node is not ready to take over the service, which is accurately reported as ``STOPPED``.

The OpenSVC service management is now delegated to the OpenHA agents. OpenSVC makes sure administrators can not bypass the heartbeat daemon to submit actions directly to the OpenSVC service:

**On node1 node**::

        node1:/ # p26.opensvc.com stop
        21:34:10 INFO    P26.OPENSVC.COM         this service is managed by a clusterware, thus direct service manipulation is disabled. the --cluster option circumvent this safety net.
        node1:/ #

