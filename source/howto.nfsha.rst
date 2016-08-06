NFS High Availability setup
***************************

NFS is a tricky beast to setup for high availability. Without proper configuration NFS clients tend to hang waiting for i/o completion on the shares. This guide exposes the Linux NFS servers configuration for smooth failover.

OpenSVC HA setup
================

Create a HA service, using the :ref:`howto.ha` howto.

Make sure the ``<OSVCETC>/nfssvc.d`` symlink points to a directory hosted on a shared filesystem, handled by the nfssvc OpenSVC service. This howto uses ``/nfssvc`` as the root service shared filesystem.

**On the master node**

::

        $ mkdir -p /nfssvc/etc/init.d
        $ ln -s /nfssvc/etc/init.d /etc/opensvc/nfssvc.d

NFS configuration
=================

Linux NFS service uses ``/var/lib/nfs`` to store both node-private and service-private data. The tricky part of the HA setup is to separate this data.

NFS server startup
------------------

NFS startup will be handled by the OpenSVC service. Stop the NFS service and inhibit its launch at server startup.

**On both nodes**

::

        $ /etc/init.d/nfs stop
        $ /etc/init.d/nfslock stop

        $ chkconfig nfs off
        $ chkconfig nfslock off

Create the OpenSVC service startup script.

**On the master node**:

::

        $ cat <<EOF >/etc/opensvc/nfssvc.d/nfs
        #!/bin/bash
        
        nfsstart(){
        	/etc/init.d/nfs start
        	/etc/init.d/nfslock start
        }
        
        nfsstop(){
        	/etc/init.d/nfslock stop
        	/etc/init.d/nfs stop
        }
        
        case "$1" in
        start)
        	nfsstart
        	;;
        stop)
        	nfsstop
        	;;
        restart)
        	nfsstop
        	nfsstart
        	;;
        *)
        	echo "usage $0 { start | stop | restart }"
        	;;
        esac
        
        exit 0
        EOF

And activate this script.

On the master node

::

        $ cd /etc/opensvc/nfssvc.d
        $ ln -s nfs S10nfs
        $ ln -s nfs K10nfs

Node private data
-----------------

The data that must remain local to each node is the RPC pipefs pseudo filesystem. It is mounted by default under ``/var/lib/nfs/rpc_pipefs``. As ``/var/lib/nfs`` will be moved to the shared filesystem, we need to change the location of this mount point.

Create the new mount point.

**On both nodes**

::

        $ mkdir /var/lib/rpc_pipefs

Change these system configuration files to use this new mountpoint.

**On both nodes**

::

        /etc/modprobe.d/modprobe.conf.dist
        /etc/idmapd.conf

Service private data
--------------------

``/var/lib/nfs`` contains data essential for nfs client sessions takeover. Thus, this directory must follow the service in case of failover.

**On the master node**

::

        $ mkdir -p /nfssvc/var/lib
        $ mv /var/lib/nfs /nfssvc/var/lib/nfs

The exports list should also move with the service, to avoid configuration drift between the 2 nodes.

**On the master node**

::

        $ mv /etc/exports /etc/opensvc/nfssvc.d/

**On both nodes**

::

        $ ln -sf /nfssvc/var/lib/nfs /var/lib/nfs
        $ ln -sf /etc/opensvc/nfssvc.d/exports /etc/exports

Configure nfs to listen on the service IP address

**On both nodes**

	Modify STATD_HOSTNAME in /etc/sysconfig/nfs

Epilog
======

Reboot the nodes to activate the new ``rpc_pipefs`` location and start testing failovers.

