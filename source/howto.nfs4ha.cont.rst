NFS4 High Availability setup - Container integration
****************************************************

This howto describes a NFS4 Only HA service setup using modern OpenSVC features.

It has been tested on Red Hat Enterprise Linux 8.7 nodes.

.. toctree::
   :maxdepth: 3
   :caption: Content:

   howto.nfs4ha.cont

Prerequisites
=============

========================================== ====================================
Prerequisite                               Example
========================================== ====================================
2 nodes                                    | node1 ``5.196.34.132``
                                           | node2 ``5.196.34.133``
------------------------------------------ ------------------------------------
A failover ip address for NFS4 server      nfsv4.opensvc.com ``5.196.34.141``
------------------------------------------ ------------------------------------
Shared storage (san, iscsi, ...) or drbd
------------------------------------------ ------------------------------------
OpenSVC agent 2.1+ installed
========================================== ====================================

Setup LVM2
----------

Configure a lvm2 volume group, to host a lvm2 logical volume to use as the drbd backing device

::

        dnf -y install lvm2
        pvcreate /dev/vdb
        vgcreate datavg /dev/vdb


Setup DRBD
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


Setup podman
------------

Install and configure podman for container management on Red Hat systems

::

        dnf -y install podman
        podman network create loopback
        curl -o /etc/cni/net.d/loopback.conflist https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/loopback.conflist
        mkdir -p /etc/containers/containers.conf.d
        echo -e '[network]\ndefault_network = "loopback"' > /etc/containers/containers.conf.d/opensvc.loopback.conf

.. note::

By default, cni connect a container on the ``podman`` network, and assign an ip addr in the ``10.88.0.0/16`` network.
As we expect that the network configuration is managed by the opensvc agent, we configure podman to connect containers on a basic private network namespace with only a loopback ip address


Setup OpenSVC
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
        [root@node1 ~]# om cluster set --kw cluster.name=cluster1
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

You should now have a configured cluster, like:

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



Setup storage pool
^^^^^^^^^^^^^^^^^^

We configure a cluster storage pool for volume objects automated provisioning. It is a drbd pool backed by a lvm2 volume group. `More setups <agent.configure.pool.html#cluster-storage-pools>`_ relying on other technologies are also supported.

**On node1**

::

    om cluster set --kw pool#drbd.type=drbd --kw pool#drbd.vg=datavg --kw pool#drbd.status_schedule=@1
    om pool status

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om pool status
    <span style="font-weight: bold">name      </span>  <span style="font-weight: bold">type     </span>  <span style="font-weight: bold">caps                           </span>  <span style="font-weight: bold">head                           </span>  <span style="font-weight: bold">vols</span>  <span style="font-weight: bold">size  </span>  <span style="font-weight: bold">used </span>  <span style="font-weight: bold">free </span>
    |- <span style="color: #aa5500">default</span>  directory  rox,rwx,roo,rwo,blk              /var/lib/opensvc/pool/directory  0     9.89g   3.34g  6.55g
    `- <span style="color: #aa5500">shm    </span>  shm        rox,rwx,roo,rwo,blk              /dev/shm                         0     906m    84.0k  906m

    [root@node1 ~]# om cluster set --kw pool#drbd.type=drbd --kw pool#drbd.vg=datavg --kw pool#drbd.status_schedule=@1

    [root@node1 ~]# om pool status
    <span style="font-weight: bold">name      </span>  <span style="font-weight: bold">type     </span>  <span style="font-weight: bold">caps                           </span>  <span style="font-weight: bold">head                           </span>  <span style="font-weight: bold">vols</span>  <span style="font-weight: bold">size  </span>  <span style="font-weight: bold">used </span>  <span style="font-weight: bold">free </span>
    |- <span style="color: #aa5500">default</span>  directory  rox,rwx,roo,rwo,blk              /var/lib/opensvc/pool/directory  0     9.89g   3.34g  6.55g
    |- <span style="color: #aa5500">drbd   </span>  drbd       rox,rwx,roo,rwo,snap,blk,shared  datavg                           1     100.0g  0m   100.0g
    `- <span style="color: #aa5500">shm    </span>  shm        rox,rwx,roo,rwo,blk              /dev/shm                         0     906m    84.0k  906m

    </pre>


Setup network configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^

We configure OpenSVC to share CNI configuration path with podman

::
    
    om cluster set --kw cni.config="/etc/cni/net.d"


Deploy the service
==================

Install config map
------------------

We create a config map object ``test/cfg/nfsv4`` to store a ``exports`` key containing the ``/etc/exports`` file. The config map is replicated accross cluster nodes, and injected in the nfs container.

::

    om test/cfg/nfsv4 create ;
    curl -o - \
    https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/etc.exports.conf | \
    sed -e 's@ROOTFS@@' | \
    om test/cfg/nfsv4 add --key exports --from=-

.. note::

   The key ``export`` can be modified with the command ``om test/cfg/nfsv4 edit --key exports``. The container is immediately updated with new content. Depending on applications, it may be needed to send signals or restart some process to reflect the change.


Deploy with NFS container disabled
----------------------------------

Create the opensvc service using the name ``nfsv4``, in the ``test`` namespace, using a ``5G`` volume provisioned in the ``drbd`` pool, backed by ``datavg`` lvm2 volume group, reachable using the public dns name ``nfsv4.opensvc.com`` configured on interface named ``eth0`` and default gateway ``5.196.34.158``

**On node1**

:: 

        om test/svc/nfsv4 deploy \
        --config https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/nfsv4-container-disabled.conf \
        --env size=5G \
        --env fqdn=nfsv4.opensvc.com \
        --env gateway=5.196.34.158 \
        --env nic=eth0

.. note:: 
	The config used in this command has NFS container ressource disabled.
	Using that trick, we can configure NFS later, and test core (ip, disk, fs) failovers early.

	This is convenient for tutoring, but in other situations you may want to use `--config https://raw.githubusercontent.com/opensvc/opensvc_templates/main/nfs/nfsv4-container.conf` for a one-step deployment.


This command creates and configures the system resources needed by the service on both nodes:

* OpenSVC volume object ``test/vol/nfsv4.test.svc.cluster1``

  * 5GB logical volume in datavg volume group
  * drbd ressources on both nodes (creation and synchronisation)
  * ext4 filesystem

* OpenSVC service object ``test/svc/nfsv4``

After a few minutes (DRBD synchronisation time), you should end up in this situation:

Service object test/svc/nfsv4 status
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om test/svc/nfsv4 print status -r
    <span style="font-weight: bold">test/svc/nfsv4          </span>          <span style="color: #00aa00">up        </span>                                                     
    `- instances             
       |- <span style="font-weight: bold">node2             </span>          <span style="color: #aa0000">down      </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>                              
       `- <span style="font-weight: bold">node1             </span>          <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span>   
          |- ip#1            ........ <span style="color: #00aa00">up        </span> netns macvlan nfsv4.opensvc.com/27 eth0@container#0 
          |- volume#cfg      ........ <span style="color: #00aa00">up        </span> nfsv4-cfg                                           
          |- volume#data     ........ <span style="color: #00aa00">up        </span> nfsv4-data                                          
          |- container#0     ...../.. <span style="color: #00aa00">up        </span> podman docker.io/google/pause                       
          |- container#debug ...O./.. <span style="color: #00aa00">up        </span> podman docker.io/opensvc/container_toolbox:latest   
          |- container#nfs   ..D../.. <span style="color: #767676">n/a       </span> podman docker.io/joebiellik/nfs4                    
          |- sync#i0         ..DO./.. <span style="color: #767676">n/a       </span> rsync svc config to nodes                           
          `- task#export     ...O./.. <span style="color: #767676">n/a       </span> task.host                                                               
        </pre>


Volume object test/vol/nfsv4-data status
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om test/vol/nfsv4-data print status -r
    <span style="font-weight: bold">test/vol/nfsv4-data         </span>          <span style="color: #00aa00">up        </span>                                                   
    |- instances                 
    |  |- <span style="font-weight: bold">node2                 </span>          <span style="color: #00aa00">stdby up  </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>                            
    |  `- <span style="font-weight: bold">node1                 </span>          <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span> 
    |     |- disk#1              ......S. <span style="color: #00aa00">stdby up  </span> lv datavg/nfsv4-data.test.vol.cluster1            
    |     |- disk#2              ......S. <span style="color: #00aa00">stdby up  </span> drbd nfsv4-data.test.vol.cluster1                 
    |     |                                          info: Primary                                     
    |     |- fs#1                ........ <span style="color: #00aa00">up        </span> xfs /dev/drbd0@/srv/nfsv4-data.test.vol.cluster1  
    |     `- sync#i0             ..DO./.. <span style="color: #767676">n/a       </span> rsync svc config to nodes                         
    `- children                  
       `- <span style="font-weight: bold">test/svc/nfsv4        </span>          <span style="color: #00aa00">up        </span> 
    
    [root@node1 ~]# 
        </pre>



.. note::
       The agent automatically manages the dependency between the volume object and the service that uses it.


Test the core failover
----------------------

This step is only useful to ensure ip, drbd and filesystem fails over forth and back between nodes, before continuing with the the NFS4 layer setup. 

Initial situation
^^^^^^^^^^^^^^^^^

The green ``O`` means that the service is currently running on ``node1``

**On node1 or node2**

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om test/svc/nfsv4 mon
    test/svc/nfsv4                   <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
     <span style="font-weight: bold">test/svc/nfsv4</span> <span style="color: #00aa00">up</span> ha    1/1   | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>    <span style="color: #767676">S</span>    
    </pre>

Move service to node2
^^^^^^^^^^^^^^^^^^^^^

The ``switch`` action will relocate the service to the other node.
The red ``^`` means that the service is not running on its preferred node.

**On node1 or node2**

.. raw:: html

    <pre class=output>
        [root@node1 ~]# om test/svc/nfsv4 switch
        @ n:node1 o:test/svc/nfsv4 sc:n
        test/svc/nfsv4 defer target state set to placed@node2

        [root@node1 ~]# om test/svc/nfsv4 mon
        test/svc/nfsv4                    <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
         <span style="font-weight: bold">test/svc/nfsv4</span> <span style="color: #00aa00">up</span><span style="color: #aa0000">^</span> ha    1/1   | <span style="color: #767676">S</span><span style="color: #767676">^</span>    <span style="color: #00aa00">O</span>    
    </pre>

Move back service to node1
^^^^^^^^^^^^^^^^^^^^^^^^^^

We can use either ``switch`` action, or ``giveback`` to move the service to its preferred node.

**On node1 or node2**

.. raw:: html

    <pre class=output>
        [root@node1 ~]# om test/svc/nfsv4 giveback
        @ n:node1 o:test/svc/nfsv4 sc:n
        test/svc/nfsv4 defer target state set to placed

        [root@node1 ~]# om test/svc/nfsv4 mon
        test/svc/nfsv4                   <span style="font-weight: bold">node1</span> <span style="font-weight: bold">node2</span>
         <span style="font-weight: bold">test/svc/nfsv4</span> <span style="color: #00aa00">up</span> ha    1/1   | <span style="color: #00aa00">O</span><span style="color: #767676">^</span>    <span style="color: #767676">S</span>    
    </pre>


Enable NFS4
-----------

We only have to start the NFS container to open the service to nfs clients.

Enable & start NFS container resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**On node1**

.. raw:: html

    <pre class=output>
    [root@node1 ~]# om test/svc/nfsv4 enable --rid container#nfs
    @ n:node1 o:test/svc/nfsv4 sc:n
      remove container#nfs.disable

    [root@node1 ~]# om test/svc/nfsv4 start --rid container#nfs
    @ n:node1 o:test/svc/nfsv4 sc:n
      add rid volume#cfg, volume#data to satisfy dependencies
    @ n:node1 o:test/vol/nfsv4-cfg r:fs#1 sc:n
      shmfs@/srv/nfsv4-cfg.test.vol.cluster1 is already mounted
    @ n:node1 o:test/vol/nfsv4-data r:disk#1 sc:n
      lv datavg/nfsv4-data.test.vol.cluster1 is already up
    @ n:node1 o:test/vol/nfsv4-data r:disk#2 sc:n
      drbd resource nfsv4-data.test.vol.cluster1 is already connected
      drbd resource nfsv4-data.test.vol.cluster1 is already Primary
    @ n:node1 o:test/vol/nfsv4-data r:fs#1 sc:n
      xfs /dev/drbd0@/srv/nfsv4-data.test.vol.cluster1 is already mounted
    @ n:node1 o:test/svc/nfsv4 r:container#nfs sc:n
      push start timeout to 05s (cached) + 02m (pull)
      /usr/bin/podman --cgroup-manager cgroupfs --namespace test/svc/nfsv4 --cni-config-dir /opt/cni/net.d run --detach --name=test..nfsv4.container.nfs --label=com.opensvc.id=2148c70b-6c1e-4b95-bb94-739d28e23507.container#nfs --label=com.opensvc.path=test/svc/nfsv4 --label=com.opensvc.namespace=test --label=com.opensvc.name=nfsv4 --label=com.opensvc.kind=svc --label=com.opensvc.rid=container#nfs --net=container:nfsv4.test.svc.cluster1 --privileged --interactive --tty --volume=/srv/nfsv4-data.test.vol.cluster1/nfsroot:/nfsroot:rw --volume=/srv/nfsv4-cfg.test.vol.cluster1/exports:/etc/exports:rw --cgroup-parent /opensvc.slice/test.slice/nfsv4.slice/container.slice/container.nfs.slice/libpod docker.io/joebiellik/nfs4
      command successful but stderr:
      | Trying to pull docker.io/joebiellik/nfs4:latest...
      | Getting image source signatures
      | Copying blob sha256:9d73dea3c93cc738c79106e22047202fb44c2aedc67363efde3d800b9d0db133
      | Copying blob sha256:a2256e557c9708413c79ce773b7836c1404f7854b23fcf98acb689f605b1d4f1
      | Copying blob sha256:c9b1b535fdd91a9855fb7f82348177e5f019329a58c53c47272962dd60f71fc9
      | Copying blob sha256:6d139d4da1b78cf4ee0252c4cf11a5cf1533c0cf335193994d7ba8adca3871af
      | Copying blob sha256:3b70709af63f2cddee828caa2b67ce6955d9970764c9fd1417b0f8897cea0158
      | Copying blob sha256:629143a5f3af431ab94b4eb287ee0cb674398f5e8743190ee73578f671072893
      | Copying blob sha256:f5fa07c1b71752a226cc735949df3b1de3809ffb9878ba7fd63aac12ddbed1c9
      | Copying config sha256:cffcaf83b3f51ae506d98c18ae7409cc659a62d546321248d1f462f1a2fc9ba0
      | Writing manifest to image destination
      | Storing signatures
      | e3ccb669cf66358dd7e37860bec0b0b29c131fd66f269ae451458342c982c9ba
      wait for up status
      wait for container operational

    [root@node1 ~]# om test/svc/nfsv4 print status -r
    <span style="font-weight: bold">test/svc/nfsv4          </span>          <span style="color: #00aa00">up        </span>                                                     
    `- instances             
      |- <span style="font-weight: bold">node2             </span>          <span style="color: #aa0000">down      </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>                              
      `- <span style="font-weight: bold">node1             </span>          <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span>   
         |- ip#1            ........ <span style="color: #00aa00">up        </span> netns macvlan nfsv4.opensvc.com/27 eth0@container#0 
         |- volume#cfg      ........ <span style="color: #00aa00">up        </span> nfsv4-cfg                                           
         |- volume#data     ........ <span style="color: #00aa00">up        </span> nfsv4-data                                          
         |- container#0     ...../.. <span style="color: #00aa00">up        </span> podman docker.io/google/pause                       
         |- container#debug ...O./.. <span style="color: #00aa00">up        </span> podman docker.io/opensvc/container_toolbox:latest   
         |- container#nfs   ...../.. <span style="color: #00aa00">up        </span> podman docker.io/joebiellik/nfs4                    
         |- sync#i0         ..DO./.. <span style="color: #767676">n/a       </span> rsync svc config to nodes                           
         `- task#export     ...O./.. <span style="color: #767676">n/a       </span> task.host                                                                    
    [root@node1 ~]#
    </pre>


Test
====

Connect clients
---------------

You should be able to mount the nfsroot share from any client.

::

        [root@client ~]# mount -v -t nfs4 -o proto=tcp,port=2049 nfsv4.opensvc.com:/ /mnt
        mount.nfs4: timeout set for Thu Mar  2 17:11:37 2023
        mount.nfs4: trying text-based options 'proto=tcp,port=2049,vers=4.2,addr=5.196.34.141,clientaddr=37.59.71.10'

        [root@client ~]# df -h /mnt
        Filesystem           Size   Used  Avail Use% Mounted on
        nfsv4.opensvc.com:/  4860M     0  4560M   0% /mnt

Test the failover
-----------------

Start nfs clients activity (fio runs for example).

Reboot the node hosting the active service instance.


.. warning:: Please note that OpenSVC is not responsible of the NFS4 container image joebiellik/nfs4. It may need adaptations to fit your requirements. You can also change it for another image.


Admin Tasks
===========

modify exports
--------------

You may want to change the nfs exports list using the 2-steps procedure below

::

        om test/cfg/nfsv4 edit --key exports
        om test/svc/nfsv4 run --rid task#export

.. note::

       The agent automatically push the new export file into the container once it is saved on disk. The ``task#export`` ressource execution proceed with the new nfs shares export.


network troubleshoot
--------------------

If you experience any network issue, you can troubleshoot by entering the container network namespace using ``container#debug``. It has all network tools (netstat, ip, ...)

::

        om test/svc/nfsv4 enter --rid container#debug
