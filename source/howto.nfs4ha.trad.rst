NFS 4 High Availability setup - Traditional integration
*******************************************************

This howto describes a NFS 4 Only HA service setup. It has been tested on a Red Hat Enterprise Linux 8.7.

Prerequisites
=============

* 2 (or more) nodes
* OpenSVC agent 2.1+ installed
* 1 public ip addr for nfs service
* shared storage (drbd, san, iscsi, ...)


Nodes setup
-----------

This howto will use a 2-nodes cluster

* node1 ``5.196.34.132``
* node2 ``5.196.34.133``

A floating public ip address has been reserved for the nfs server

* nfsv4.opensvc.com ``5.196.34.141``
 
DRBD setup
----------

Kernel module & utils
^^^^^^^^^^^^^^^^^^^^^

`Linbit <https://www.linbit.com/>`_ DRBD kernel modules for RHEL are available on `ElRepo <https://www.elrepo.org/>`_

::

    dnf -y install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
    rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
    sed -i 's/^mirrorlist/#mirrorlist/' /etc/yum.repos.d/elrepo.repo
    dnf -y install kmod-drbd90 drbd90-utils


You can verify that drbd is ready with the command below

.. raw:: html

    <pre class=output>
    [root@node1 ~]# modinfo drbd | grep ^version
    version:        9.1.13
    </pre>


LVM2 setup
^^^^^^^^^^

We configure a lvm2 volume group, to host a lvm2 logical volume, which will be used as drbd backing device

::

        dnf -y install lvm2
        pvcreate /dev/vdb
        vgcreate datavg /dev/vdb


Cluster setup
-------------

Install OpenSVC
^^^^^^^^^^^^^^^

**On both nodes**

::

        dnf -y install python3 python3-cryptography
        curl -o opensvc-2.1-latest.rpm https://repo.opensvc.com/rpms/2.1/current
        dnf -y install ./opensvc-2.1-latest.rpm


Join cluster nodes
^^^^^^^^^^^^^^^^^^

**On node1**

::

        [root@node1 ~]# om cluster set --kw hb#1.type=unicast
        [root@node1 ~]# om cluster set --kw cluster.name=nfsprod
        [root@node1 ~]# om cluster get --kw cluster.secret
        b26a1e28b84a11edab28525400d67af6


**On node2**

::

        [root@node2 ~]# om daemon join --node node1 --secret b26a1e28b84a11edab28525400d67af6
        @ n:node2
        local node is already frozen
        join node node1
        W local node is left frozen as it was already before join

**On node1**

Unfreeze nodes and setup root ssh trust::

        om node thaw
        om node update ssh authorized keys --node='*'


.. note:: Ensure that you can ssh as root from one node to another without being prompted for a password

You should now have a cluster which looks like below:

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om mon
    Threads                               <span style="font-weight: bold">node1</span>        <span style="font-weight: bold">node2</span>       
     <span style="font-weight: bold">daemon</span>         <span style="color: #00aa00">running</span>             |                          
     <span style="font-weight: bold">hb#1.rx</span>        <span style="color: #00aa00">running</span>  [::]:10000 | <span style="color: #767676">/</span>            <span style="color: #00aa00">O</span>           
     <span style="font-weight: bold">hb#1.tx</span>        <span style="color: #00aa00">running</span>             | <span style="color: #767676">/</span>            <span style="color: #00aa00">O</span>           
     <span style="font-weight: bold">listener</span>       <span style="color: #00aa00">running</span>       :1214
     <span style="font-weight: bold">monitor</span>        <span style="color: #00aa00">running</span>            
     <span style="font-weight: bold">scheduler</span>      <span style="color: #00aa00">running</span>            
    
    Nodes                                 <span style="font-weight: bold">node1</span>        <span style="font-weight: bold">node2</span>       
    <span style="font-weight: bold"> score</span>                              | 69           69           
    <span style="font-weight: bold">  load 15m</span>                          | 0.0          0.0         
    <span style="font-weight: bold">  mem</span>                               | 12/98%:1.77g 11/98%:1.77g
    <span style="font-weight: bold">  swap</span>                              | <span style="color: #767676">-</span>            <span style="color: #767676">-</span>           
    <span style="font-weight: bold"> state</span>                              |                              

    */svc/*                               <span style="font-weight: bold">node1</span>        <span style="font-weight: bold">node2</span>       
    </pre>




NFS4 service configuration
==========================

Service creation
----------------

Create the opensvc service using the name ``nfsv4``, in the ``prod`` namespace, storing a ``5G`` drbd filesystem in ``datavg`` lvm2 volume group, reachable using the public dns name ``nfsv4.opensvc.com`` configured on interface named ``eth0`` 

**On node1**

:: 

        om prod/svc/nfsv4 create \
        --config https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/nfsv4.conf \
        --env vg=datavg \
        --env size=5G \
        --env fqdn=nfsv4.opensvc.com \
        --env nic=eth0

Disable all application ressources, to test fs and ip ressource, before continuing with the nfs layer::

        om prod/svc/nfsv4 disable --rid app

Service provisioning
--------------------

The provisioning step will create all the ressources needed for the service:

* 5GB logical volume in datavg volume group
* drbd ressources on both nodes (creation and synchronisation)
* ext4 filesystem

**On node1**

::

        om prod/svc/nfsv4 provision --wait

After a few minutes (needed for DRBD synchronisation), your service should looks like

.. raw:: html

    <pre class=output>

        [root@node1 ~]# om prod/svc/nfsv4 print status -r
        <span style="font-weight: bold">prod/svc/nfsv4         </span>          <span style="color: #00aa00">up        </span>                                                     
        `- instances            
           |- <span style="font-weight: bold">node2            </span>          <span style="color: #00aa00">stdby up  </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>                              
           `- <span style="font-weight: bold">node1            </span>          <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span>   
              |- ip#1           ........ <span style="color: #00aa00">up        </span> 5.196.34.141/255.255.255.224 eth0 nfsv4.opensvc.com 
              |- disk#1         ......S. <span style="color: #00aa00">stdby up  </span> lv datavg/nfsv4.prod.svc.nfsprod                    
              |- disk#2         ......S. <span style="color: #00aa00">stdby up  </span> drbd nfsv4.prod.svc.nfsprod                         
              |                                     info: Primary                                       
              |- fs#1           ........ <span style="color: #00aa00">up        </span> ext4 /dev/drbd0@/srv/nfsv4.prod.svc.nfsprod         
              |- app#1          ..D../.. <span style="color: #767676">n/a       </span> simple: nfsdcld                                     
              |- app#2          ..D../.. <span style="color: #767676">n/a       </span> simple: rpc.idmapd                                  
              |- app#3          ..D../.. <span style="color: #767676">n/a       </span> simple: rpc.mountd                                  
              |- app#4          ..D../.. <span style="color: #767676">n/a       </span> forking: rpc.nfsd                                   
              `- sync#i0        ..DO./.. <span style="color: #767676">n/a       </span> rsync svc config to nodes                           
        
        [root@node1 ~]# df -h /srv/nfsv4.prod.svc.nfsprod
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/drbd1      4,9G   40K  4,6G   1% /srv/nfsv4.prod.svc.nfsprod
        
        [root@node1 ~]# drbdadm status
        nfsv4.prod.svc.nfsprod role:Primary
          disk:UpToDate
          node2 role:Secondary
            peer-disk:UpToDate
        </pre>


Test service failover
---------------------

This step is only useful to ensure ip+drbd+filesystem failover between nodes, before continuing with the the NFS layer setup. 

Initial situation
^^^^^^^^^^^^^^^^^

The green ``O`` means that the service is currently running on ``node1``

**On node1 or node2**

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om prod/svc/nfsv4 mon
    prod/svc/nfsv4                   <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
     <span style="font-weight: bold">prod/svc/nfsv4</span> <span style="color: #00aa00">up</span> ha    1/1   | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>    <span style="color: #767676">S</span>    
    </pre>

Move service to node2
^^^^^^^^^^^^^^^^^^^^^

The ``switch`` action will relocate the service to the other node.
The red ``^`` means that the service is not running on its preferred node.

**On node1 or node2**

.. raw:: html

    <pre class=output>
        [root@node1 ~]# om prod/svc/nfsv4 switch
        @ n:node1 o:prod/svc/nfsv4 sc:n
        prod/svc/nfsv4 defer target state set to placed@node2

        [root@node1 ~]# om prod/svc/nfsv4 mon
        prod/svc/nfsv4                    <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
         <span style="font-weight: bold">prod/svc/nfsv4</span> <span style="color: #00aa00">up</span><span style="color: #aa0000">^</span> ha    1/1   | <span style="color: #767676">S</span><span style="color: #767676">^</span>    <span style="color: #00aa00">O</span>    
    </pre>

Move back service to node1
^^^^^^^^^^^^^^^^^^^^^^^^^^

We can use either ``switch`` action, or ``giveback`` to move the service to its preferred node.

**On node1 or node2**

.. raw:: html

    <pre class=output>
        [root@node1 ~]# om prod/svc/nfsv4 giveback
        @ n:node1 o:prod/svc/nfsv4 sc:n
        prod/svc/nfsv4 defer target state set to placed

        [root@node1 ~]# om prod/svc/nfsv4 mon
        prod/svc/nfsv4                   <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
         <span style="font-weight: bold">prod/svc/nfsv4</span> <span style="color: #00aa00">up</span> ha    1/1   | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>    <span style="color: #767676">S</span>    
    </pre>



NFS4 setup
----------

We have to ensure that systemd won't manage NFS services, only OpenSVC have to be in charge of this responsability.

Disable NFS related systemd unit files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**On both nodes**

::

        systemctl mask --now rpc-statd.service \
                             rpcbind.service \
                             rpcbind.socket \
                             nfs-server.service \
                             nfs-mountd.service \
                             nfs-idmapd.service \
                             nfsdcld.service

Download NFS server config files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The NFS configuration files are stored into the replicated filesystem.

**On node1**

::

        curl -o /srv/nfsv4.prod.svc.nfsprod/etc/nfs.conf \
          https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/etc.nfs.conf
        
        curl -o /srv/nfsv4.prod.svc.nfsprod/etc/exports \
          https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/etc.exports.conf


Install NFS server config files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**On noth nodes**

::

        rm -f /etc/nfs.conf ; rm -f /etc/exports ; rmdir /etc/exports.d
        ln -s /srv/nfsv4.prod.svc.nfsprod/etc/nfs.conf /etc/nfs.conf
        ln -s /srv/nfsv4.prod.svc.nfsprod/etc/exports /etc/exports


Adjust the config files
^^^^^^^^^^^^^^^^^^^^^^^

**On node1**

::

        sed -i 's@ROOTFS@/srv/nfsv4.prod.svc.nfsprod@' /srv/nfsv4.prod.svc.nfsprod/etc/nfs.conf
        sed -i 's@FQDN@nfsv4.opensvc.com@' /srv/nfsv4.prod.svc.nfsprod/etc/nfs.conf
        sed -i 's@ROOTFS@/srv/nfsv4.prod.svc.nfsprod@' /srv/nfsv4.prod.svc.nfsprod/etc/exports

Enable & start OpenSVC app resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**On node1**

.. raw:: html

    <pre class=output>
        [root@node1 ~]# om prod/svc/nfsv4 enable --rid app
        @ n:node1 o:prod/svc/nfsv4 sc:n
        remove app#3.disable
        remove app#2.disable
        remove app#1.disable
        remove app#4.disable
        
        [root@node1 ~]# om prod/svc/nfsv4 start --rid app
        @ n:node1 o:prod/svc/nfsv4 r:app#1 sc:n
        exec '/usr/sbin/nfsdcld --foreground' as user root
        @ n:node1 o:prod/svc/nfsv4 r:app#2 sc:n
        exec '/usr/sbin/rpc.idmapd -f' as user root
        @ n:node1 o:prod/svc/nfsv4 r:app#3 sc:n
        exec '/usr/sbin/rpc.mountd --foreground' as user root
        @ n:node1 o:prod/svc/nfsv4 r:app#4 sc:n
        pre_start: /usr/sbin/exportfs -r
        exec /usr/sbin/rpc.nfsd 8 as user root
        start done in 0:00:00.403523 - ret 0
        post_start: /bin/sh -c 'if systemctl -q is-active gssproxy; then systemctl reload gssproxy ; fi'
        
        [root@node1 ~]# om prod/svc/nfsv4 print status -r
        <span style="font-weight: bold">prod/svc/nfsv4         </span>          <span style="color: #00aa00">up        </span>                                                     
        `- instances            
           |- <span style="font-weight: bold">node2            </span>          <span style="color: #00aa00">stdby up  </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>                              
           `- <span style="font-weight: bold">node1            </span>          <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span>   
              |- ip#1           ........ <span style="color: #00aa00">up        </span> 5.196.34.141/255.255.255.224 eth0 nfsv4.opensvc.com 
              |- disk#1         ......S. <span style="color: #00aa00">stdby up  </span> lv datavg/nfsv4.prod.svc.nfsprod                    
              |- disk#2         ......S. <span style="color: #00aa00">stdby up  </span> drbd nfsv4.prod.svc.nfsprod                         
              |                                     info: Primary                                       
              |- fs#1           ........ <span style="color: #00aa00">up        </span> ext4 /dev/drbd0@/srv/nfsv4.prod.svc.nfsprod         
              |- app#1          ...../.. <span style="color: #00aa00">up        </span> simple: nfsdcld                                     
              |- app#2          ...../.. <span style="color: #00aa00">up        </span> simple: rpc.idmapd                                  
              |- app#3          ...../.. <span style="color: #00aa00">up        </span> simple: rpc.mountd                                  
              |- app#4          ...../.. <span style="color: #00aa00">up        </span> forking: rpc.nfsd                                   
              `- sync#i0        ..DO./.. <span style="color: #767676">n/a       </span> rsync svc config to nodes                           
        </pre>



Epilog
======

You should be able to mount the nfsroot share from any client.

::

        [root@client ~]# mount -v -t nfs4 -o proto=tcp,port=2049 nfsv4.opensvc.com:/ /mnt
        mount.nfs4: timeout set for Thu Mar  2 17:11:37 2023
        mount.nfs4: trying text-based options 'proto=tcp,port=2049,vers=4.2,addr=5.196.34.141,clientaddr=37.59.71.10'

        [root@client ~]# df -h /mnt
        Filesystem           Size   Used  Avail Use% Mounted on
        nfsv4.opensvc.com:/  4860M     0  4560M   0% /mnt

Reboot the nodes and start testing io & service failover.

.. warning:: Please note that this howto uses quite default parameters for NFS, you may need to adjust them to fit your needs.

