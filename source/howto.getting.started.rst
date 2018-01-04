Getting Started
***************

This page will help you take your first steps with OpenSVC services setup.

It will guide you through the sequence of tasks to achieve a simple but working dual-node failover cluster.

Prerequisites
=============

The demonstration environment is composed of:

* A pair of Centos7 servers named ``node1`` and ``node2``, respectively acting as first and second cluster node
* Both nodes are connected to the same network segment 192.168.121.0/24
* root access is mandatory

OpenSVC Installation
====================

We will follow the steps described in `Nodeware installation <agent.install.html>`_

Install the OpenSVC Agent on both cluster nodes.

**On both nodes**::

        $ wget -O /tmp/opensvc.latest.rpm https://repo.opensvc.com/rpms/current

        $ sudo yum -y install /tmp/opensvc.latest.rpm

        $ sudo rpm -qa | grep opensvc
        opensvc-1.9-906.noarch

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
     <span style="font-weight: bold"> 15m</span>                            | 0.1
     <span style="font-weight: bold"> state</span>                          |

    Services                          <span style="font-weight: bold">node1</span>
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

	node1:/ # ssh-copy-id root@node2

**On node2**::

	node2:/ # ssh-copy-id root@node1


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
      $ sudo svcmon

      Threads                            <span style="font-weight: bold">node1</span>
       <span style="font-weight: bold">hb#1.rx</span>   <span style="color: #00aa00">running</span> 0.0.0.0:10000 | <span style="color: #767676">/</span>
       <span style="font-weight: bold">hb#1.tx</span>   <span style="color: #00aa00">running</span>               | <span style="color: #767676">/</span>
       <span style="font-weight: bold">listener</span>  <span style="color: #00aa00">running</span> 0.0.0.0:1214
       <span style="font-weight: bold">monitor</span>   <span style="color: #00aa00">running</span>
       <span style="font-weight: bold">scheduler</span> <span style="color: #00aa00">running</span>

      Nodes                              <span style="font-weight: bold">node1</span>
       <span style="font-weight: bold"> 15m</span>                             | 0.1
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

A simple command is needed to create an empty service named ``svc1``::

    $ sudo svcmgr -s svc1 create




The expected file name is ``svc1.conf`` located in ``<OSVCETC>``
At this time, the configuration file should be empty. You have to edit it in order to define your service.

We are going to define a service running on the primary node node ``node1``, failing-over to node ``node2``, using one IP address named ``svc1.opensvc.com`` (name to ip resolution is done by the OpenSVC agent), one LVM volume group ``vgsvc1`` and two filesystems hosted in logical volumes ``/dev/mapper/vgsvc1-lvappsvc1`` and ``/dev/mapper/vgsvc1-lvdatasvc1``.

**On node1 node**::

        $ sudo svcmgr -s svc1 edit config

        [DEFAULT]
        app = MyApp
        nodes = node1 node2

        [ip#0]
        ipname = svc1.opensvc.com
        ipdev = eth0

        [disk#0]
        type = vg
        name = vgsvc1
        pvs = /dev/loop0

        [fs#app]
        type = ext4
        dev = /dev/mapper/vgsvc1-lvappsvc1
        mnt = /svc1/app

        [fs#data]
        type = ext4
        dev = /dev/mapper/vgsvc1-lvdatasvc1
        mnt = /svc1/data


The DEFAULT section in the service file describes the service itself: human readable name, nodes where the service is expected to run on...

Every other section defines a ressource managed by the service.


Step 2 : Service startup scripts directory
++++++++++++++++++++++++++++++++++++++++++

As services are used to manage application, we need to specify a directory where all applications startup scripts can be grouped.

As an example, if we want to build a LAMP service, we would use 2 scripts: one for the mysql database, and another for the apache webserver. Those scripts have to be located in the service startup scripts directory : ``/etc/opensvc/svc1.dir``

We will see later in this tutorial that ``/etc/opensvc/svc1.dir`` may not be the best place for hosting the launchers. Anyway, the symlink ``svc1.d`` is the only place where OpenSVC actually search for application launchers defined as basenames.


Step 3 : Service management facility
++++++++++++++++++++++++++++++++++++

To make service management easy, OpenSVC creates a symlink to OpenSVC core service management command : ``/etc/opensvc/svc1``
Without this symlink, we have to use the ``svcmgr`` command with arguments to manage our service ::

        node1:/ # svcmgr -s svc1 print status

With this symlink, we can directly use ::

        node1:/ # svc1 print status

Step 4 : Service configuration check
++++++++++++++++++++++++++++++++++++

As a final check, we can list all entries that match our ``svc1`` service ::

        node1:/etc/opensvc # ls -lart | grep svc1
        drwxr-xr-x.  2 root root    6 janv.  2 14:36 svc1.dir
        lrwxrwxrwx.  1 root root    8 janv.  2 14:36 svc1.d -> svc1.dir
        lrwxrwxrwx.  1 root root   15 janv.  2 14:36 svc1 -> /usr/bin/svcmgr
        -rw-r--r--.  1 root root  287 janv.  2 15:15 svc1.conf

You should be able to see:

- the service configuration file (svc1.conf)
- the directory where are stored the applications launchers (svc1.dir)
- a symlink to the ``svc1.dir`` (svc1.d)
- a symlink to the ``/usr/bin/svcmgr`` command (svc1)

At this point, we have configured a single service with no application launcher on node node1.

Service Testing
===============

Query service status
++++++++++++++++++++

Our first service is now ready to use. We can query its status.

**On node1**::

        $ sudo svcmgr -s svc1 print status
        svc1                           down
        `- instances
           |- node2                    undef      daemon down
           `- node1                    warn       warn, frozen, idle
              |- ip#0           ...... down       svc1.opensvc.com@eth0
              |- disk#0         ...... up         vg vgsvc1
              |- fs#app         ...... down       ext4 /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
              |- fs#data        ...... down       ext4 /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
              `- sync#i0        ..O./. n/a        rsync svc config to drpnodes, nodes
                                                                                      info: paused, service not up

This command collects and displays status for each service ressource :

- overall status is ``warn`` due to the fact that all ressources are not in ``up`` status
- ressource ``vg#0`` is up because the volume group is activated (which is the expected status after vgcreate)
- all other ressources are ``down`` or non available ``n/a``

Start service
+++++++++++++

The use of OpenSVC for your services management saves a lot of time and effort.
Once the service is described on a node, you just need one command to start the overall application.

Let's start the service on the local node::

        node1:/ # svc1 start --local
        node1.svc1.ip#0        checking 192.168.121.42 availability
        node1.svc1.ip#0        ifconfig eth0:1 192.168.121.42 netmask 255.255.255.0 up
        node1.svc1.ip#0        arping -U -c 1 -I eth0 -s 192.168.121.42 192.168.121.42
        node1.svc1.disk#0      vgchange --addtag @node1 vgsvc1
        node1.svc1.disk#0      output:
        node1.svc1.disk#0        Volume group "vgsvc1" successfully changed
        node1.svc1.disk#0
        node1.svc1.disk#0      vg vgsvc1 is already up
        node1.svc1.fs#app      e2fsck -p /dev/mapper/vgsvc1-lvappsvc1
        node1.svc1.fs#app      output:
        node1.svc1.fs#app      /dev/mapper/vgsvc1-lvappsvc1: clean, 12/25688 files, 8898/102400 blocks
        node1.svc1.fs#app
        node1.svc1.fs#app      mount -t ext4 /dev/mapper/vgsvc1-lvappsvc1 /svc1/app
        node1.svc1.fs#data     e2fsck -p /dev/mapper/vgsvc1-lvdatasvc1
        node1.svc1.fs#data     output:
        node1.svc1.fs#data     /dev/mapper/vgsvc1-lvdatasvc1: clean, 12/23616 files, 8637/94208 blocks
        node1.svc1.fs#data
        node1.svc1.fs#data     mount -t ext4 /dev/mapper/vgsvc1-lvdatasvc1 /svc1/data

The startup sequence reads as:

- check if service IP address is not already used somewhere
- bring up service ip address 
- volume group activation (if not already in the correct state)
- fsck + mount of each filesystem


Manual filesystem mount check::

        node1:/ # mount | grep svc1
        /dev/mapper/vgsvc1-lvappsvc1 on /svc1/app type ext4 (rw,relatime,seclabel,data=ordered)
        /dev/mapper/vgsvc1-lvdatasvc1 on /svc1/data type ext4 (rw,relatime,seclabel,data=ordered)

Manual ip address plumbing check on eth0 (svc1.opensvc.com is 192.168.121.42)::

        node1:/ # ip addr list eth0
        2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
            link/ether 52:54:00:a6:c3:d7 brd ff:ff:ff:ff:ff:ff
            inet 192.168.121.249/24 brd 192.168.121.255 scope global dynamic eth0
               valid_lft 2205sec preferred_lft 2205sec
            inet 192.168.121.42/24 brd 192.168.121.255 scope global secondary eth0:1
               valid_lft forever preferred_lft forever

We can confirm everything is OK with the service's ``print status`` command::

        node1:/ # svc1 print status
        svc1                           up
        `- instances
           |- node2                    undef      daemon down
           `- node1                    up         frozen, idle,
              |                                   started
              |- ip#0           ...... up         192.168.121.42@eth0
              |- disk#0         ...... up         vg vgsvc1
              |- fs#app         ...... up         ext4 /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
              |- fs#data        ...... up         ext4 /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
              `- sync#i0        ..O./. n/a        rsync svc config to drpnodes, nodes
                                                                                            info: paused, service not up


At this point, we have a running service, configured to run on node1 node.

Application Integration
=======================

We have gone through the setup of a single service, but it does not start applications yet. Let's add an application to our service now.

We will use a very simple example : a tiny webserver with a single index.html file to serve

Applications launcher directory
+++++++++++++++++++++++++++++++

The OpenSVC service integration enables service relocation amongst nodes. The per-service launchers hosting directory layout is a consequence of this relocation feature. The service has an implicit synchronisation resource to replicate the ``<OSVCETC>/<service>*`` files using rsync.

As a refinement, for services with dedicated shared disks, we can relocate the application launchers directory to a filesystem resource hosted in one such disk. The original location was ``<OSVCETC>/svc1.dir``. Let's move it to ``/svc1/app/init.d``::

        node1:/etc/opensvc # ls -lart | grep svc1
        drwxr-xr-x.  2 root root    6 janv.  2 14:36 svc1.dir
        lrwxrwxrwx.  1 root root    8 janv.  2 14:36 svc1.d -> svc1.dir
        lrwxrwxrwx.  1 root root   15 janv.  2 14:36 svc1 -> /usr/bin/svcmgr
        -rw-r--r--.  1 root root  287 janv.  2 15:15 svc1.conf

        node1:/etc/opensvc # rm -f svc1.d
        node1:/etc/opensvc # rmdir svc1.dir

        node1:/etc/opensvc # mkdir /svc1/app/init.d
        node1:/etc/opensvc # ln -s /svc1/app/init.d svc1.d

        node1:/etc/opensvc # ls -lart | grep svc1
        lrwxrwxrwx.  1 root root   15 janv.  2 14:36 svc1 -> /usr/bin/svcmgr
        -rw-r--r--.  1 root root  287 janv.  2 15:15 svc1.conf
        lrwxrwxrwx.  1 root root   16 janv.  2 15:52 svc1.d -> /svc1/app/init.d

Application Binary
++++++++++++++++++

In the service directory structure, we put a standalone binary of the Mongoose web server (https://code.google.com/p/mongoose/) ::

        node1:/ # cd /svc1/app
        
        node1:/svc1/app # wget -O /svc1/app/webserver https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mongoose/mongoose-lua-sqlite-ssl-static-x86_64-5.1
        --2018-01-02 15:56:28--  https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mongoose/mongoose-lua-sqlite-ssl-static-x86_64-5.1
        Resolving storage.googleapis.com (storage.googleapis.com)... 216.58.204.112, 2a00:1450:4007:80a::2010
        Connecting to storage.googleapis.com (storage.googleapis.com)|216.58.204.112|:443... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 2527016 (2,4M) [application/octet-stream]
        Saving to: ‘/svc1/app/webserver’

        100%[=====================================================================>] 2 527 016   8,96MB/s   in 0,3s

        2018-01-02 15:56:29 (8,96 MB/s) - ‘/svc1/app/webserver’ saved [2527016/2527016]
        
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

Now we need to instruct OpenSVC to handle this script for service application management ::

        # svc1 edit config

        (...)
        [app#web]
        script = weblauncher
        start = 10
        check = 10
        stop = 90


This configuration tells OpenSVC to call the ``weblauncher`` script with :

- ``start`` argument when OpenSVC service starts
- ``stop`` argument when OpenSVC service stops
- ``status`` argument when OpenSVC service needs status on application

Now we can give a try to our launcher script, using OpenSVC commands::

        node1:~ # svc1 start --local
        node1.svc1.ip#0        192.168.121.42 is already up on eth0
        node1.svc1.disk#0      vg vgsvc1 is already up
        node1.svc1.fs#app      ext4 /dev/mapper/vgsvc1-lvappsvc1@/svc1/app is already mounted
        node1.svc1.fs#data     ext4 /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data is already mounted
        node1.svc1.app#web     exec /svc1/app/init.d/weblauncher start as user root
        node1.svc1.app#web     start done in 0:00:00.009874 ret 0

We can see that OpenSVC is now calling our startup script after mounting filesystems.
        
Querying the service status, the ``app`` ressource is now reporting ``up``::

        node1:~ # svc1 print status
        svc1                           up
        `- instances
           |- node2                    undef      daemon down
           `- node1                    up         frozen, idle,
              |                                   started
              |- ip#0           ...... up         192.168.121.42@eth0
              |- disk#0         ...... up         vg vgsvc1
              |- fs#app         ...... up         ext4 /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
              |- fs#data        ...... up         ext4 /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
              |- app#web        ..../. up         weblauncher
              `- sync#i0        ..O./. n/a        rsync svc config to drpnodes, nodes
                                                                                                  info: paused, service not up


Let's check if that is really the case::

        node1:/ # ps auxww | grep web
        root     18643  0.0  0.0   2540   320 pts/0    S    16:13   0:00 /svc1/app/webserver -document_root /svc1/data -index_files index.html -listening_port 8080
        
        node1:~ # wget -qO - http://svc1.opensvc.com:8080/
        <html><body>It Works !</body></html>

Now we can stop our service::

        node1:/ # svc1 stop --local
        node1.svc1.app#web     exec /svc1/app/init.d/weblauncher stop as user root
        node1.svc1.app#web     stop done in 0:00:00.010940 ret 0
        node1.svc1.fs#data     umount /svc1/data
        node1.svc1.fs#app      umount /svc1/app
        node1.svc1.disk#0      vgchange --deltag @node1 vgsvc1
        node1.svc1.disk#0      output:
        node1.svc1.disk#0        Volume group "vgsvc1" successfully changed
        node1.svc1.disk#0
        node1.svc1.disk#0      vgchange -a n vgsvc1
        node1.svc1.disk#0      output:
        node1.svc1.disk#0        0 logical volume(s) in volume group "vgsvc1" now active
        node1.svc1.disk#0
        node1.svc1.ip#0        ifconfig eth0:1 down
        node1.svc1.ip#0        checking 192.168.121.42 availability

Once again, a single command:

- brings down the application
- unmounts filesystems
- deactivates the volume group
- disables the service ip address

The overall status is now reported as being down ::

        node1:/ # svc1 print status
        svc1                           down       warn
        `- instances
           |- node2                    undef      daemon down
           `- node1                    down       warn, frozen, idle
              |- ip#0           ...... down       192.168.121.42@eth0
              |- disk#0         ...... down       vg vgsvc1
              |- fs#app         ...... down       ext4 /dev/mapper/vgsvc1-lvappsvc1@/svc1/app
              |- fs#data        ...... down       ext4 /dev/mapper/vgsvc1-lvdatasvc1@/svc1/data
              |- app#web        ..../. down       weblauncher
              `- sync#i0        ..O./. warn       rsync svc config to drpnodes, nodes
                                                                                            warn: passive node needs update

Let's restart the service to continue this tutorial::

        node1:/ # svc1 start --local

At this point, we have a running service on node node1, with a webserver application embedded.

Service Failover
================

Our service is running fine, but what happens if the ``node1`` node fails ? Our ``svc1`` service will also fail.
That's why we want to extend the service configuration to declare ``node2`` as a failover node for this service.
After this change, the service configuration needs replication to the ``node2`` node. 

First, we are going to add ``node2`` in the same cluster than ``node1``

On node1::

        $ sudo nodemgr get --param cluster.secret
        7e801abaefc611e780a2525400a6c3d7
        

On node2::

        $ sudo nodemgr daemon join --secret 7e801abaefc611e780a2525400a6c3d7 --node node1
        node2        freeze local node
        node2        add heartbeat hb#1
        node2        join node node1
        node2        thaw local node

        $ sudo svcmon

        Threads                            node1 node2
         hb#1.rx   running 0.0.0.0:10000 | O     /
         hb#1.tx   running               | O     /
         listener  running 0.0.0.0:1214
         monitor   running
         scheduler running

        Nodes                              node1 node2
         15m                             | 0.1   0.1
         state                           |       *

        Services                           node1 node2
         svc1      up!     failover      | O!*


OpenSVC will synchronize configuration files for your service since this one should be able to run on node1 or node2.
In order to force it now, run on ``node1`` ::

        # svc1 sync nodes

The configuration replication will be possible if the following conditions are met:

- the new node is declared in the service configuration file ``<OSVCETC>/svc1.conf`` (parameter "nodes" in the .conf file)
- the node sending config files (node1) is trusted on the new node (node2) (as described in a previous chapter of this tutorial)
- the node sending config files (node1) must be running the service (the service availability status, apps excluded, is up).
- the previous synchronisation is older than the configured minimum delay, or the --force option is set to bypass the delay check.


**On node1**

We can now try to start the service on ``node2``, after stopping it on ``node1``::

        node1:/ # svcmgr -s svc1  stop
        
**On node2**::

        node2:~ # svc1 start --local

Service svc1 is now running on node ``node2``. Service relocation operational is easy as that.

Now, what happens if I try to start my service on ``node1`` while already running on ``node2`` ? ::

        node1:/ # svc1 start --local
        node1.svc1.ip#0        checking 192.168.121.42 availability
        node1.svc1           E start aborted due to resource ip#0 conflict
        node1.svc1             skip rollback start: no resource activated

Fortunately, OpenSVC IP address check prevent the service from starting on ``node1``.

.. note::

        At this point, we have a 2-node failover cluster. Although this setup meets most needs, the failover is _manual_, so does not qualify as a high availability cluster.


High Availability
+++++++++++++++++

Now, we have to configure your service to be able to failover without any intervention.
You only have to change the orchestration mode to ``ha``. For more information about orchestration : `Orchestration <agent.service.orchestration.html>`_

On the node currently running your service, add ``orchestrate = ha`` in the ``DEFAULT`` section::

        # svc1 edit config
        
        [DEFAULT]
        app = MyApp
        nodes = node1 node2
        orchestrate = ha
        (...)

Once this setup is in place, OpenSVC will be able to failover your service.

The last needed step is to define some resources that will trigger relocation. Those resources have to be marked as ``monitor=True`` in the service configuration file.

For example::

        # svc1 edit config
        (...)
        [app#web]
        monitor = True
        script = weblauncher
        start = 10
        check = 10
        stop = 90

Unfreeze your service to allow the daemon to orchestrate your service::

        # svc1 thaw

Now, if your webserver resource failed, OpenSVC will relocate the service on the other node without any human intervention.
