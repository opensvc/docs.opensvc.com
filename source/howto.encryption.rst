.. _howto.encryption:

Disk Encryption
***************

Introduction
============

The OpenSVC agent can manage encrypted block devices.

This section describes how to deploy a simple filesystem over encrypted block device stack.

Prerequisites
=============

This feature requires:

* OpenSVC agent version 2.1-1405 minimum
* cryptsetup binary (LUKS implementation)

Configuration
=============

Loopback device
---------------

Service configuration
^^^^^^^^^^^^^^^^^^^^^

We can use a loop device to demonstrate the encrypted datas.

First, we build the service template file::

  # cat > /tmp/loopback.conf <<-EOF
  [DEFAULT]
  id = e60306f6-e429-4a02-bd8f-a537a918a217

  [disk#0]
  type = loop
  file = /opt/{fqdn}.img
  size = 1G

  [disk#1]
  type = crypt
  dev = {disk#0.exposed_devs[0]}
  name = {fqdn}-crypt

  [fs#0]
  type = ext4
  dev = {disk#1.exposed_devs[0]}
  mnt = /srv/{svcname}  
  EOF
  

Service creation
^^^^^^^^^^^^^^^^

Then, we can deploy the ``loopcrypt`` service, in the ``demo`` namespace::

  # om demo/svc/loopcrypt create --config=/tmp/loopback.conf
  create demo/svc/loopcrypt

The service is created, but not provisioned::

  # om demo/svc/loopcrypt print status -r
  demo/svc/loopcrypt                   down                                                                        
  `- instances                
     `- demo1                          down       not provisioned, idle              
        |- disk#0             .....P.. down       loop /opt/loopcrypt.demo.svc.default.img                         
        |- disk#1             .....P.. down       crypt /dev/mapper/loopcrypt.demo.svc.default-crypt               
        `- fs#0               .....P.. down       ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt 


Service start
^^^^^^^^^^^^^

We first have to provision the service, which will build and start ressources::

  # om demo/svc/loopcrypt provision --wait
  @ n:demo1 o:demo/svc/loopcrypt sc:n
    demo/svc/loopcrypt defer target state set to provisioned

The new service state is now provisioned, and all resources are up::

  # om demo/svc/loopcrypt print status -r
  demo/svc/loopcrypt                   up                                                                          
  `- instances                
     `- demo1                          up         idle, started                
        |- disk#0             ........ up         loop /opt/loopcrypt.demo.svc.default.img                         
        |- disk#1             ........ up         crypt /dev/mapper/loopcrypt.demo.svc.default-crypt               
        `- fs#0               ........ up         ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt 

  # om demo/svc/loopcrypt print devs
  demo/svc/loopcrypt                                     
  |- disk#0 (disk.loop)                                  
  |  |- base                                             
  |  |  `- /dev/sda                                      
  |  `- exposed                                          
  |     `- /dev/loop1
  `- disk#1 (disk.crypt)                                 
     |- base                                             
     |  `- /dev/sda                                      
     |- sub                                              
     |  `- /dev/loop1                                    
     `- exposed                                          
        `- /dev/mapper/loopcrypt.demo.svc.default-crypt  

  # losetup
  NAME       SIZELIMIT OFFSET AUTOCLEAR RO BACK-FILE                             DIO LOG-SEC
  /dev/loop1         0      0         0  0 /opt/loopcrypt.demo.svc.default.img     0     512

  # df -h /srv/loopcrypt
  Filesystem                                    Size  Used Avail Use% Mounted on
  /dev/mapper/loopcrypt.demo.svc.default-crypt  977M  2.5M  908M   1% /srv/loopcrypt

.. note::

  LUKS encryption requires space to store metadatas (16kB) and keyslots (16MB), that's why the usable space in the ``df`` is less than the ``1GB`` size requested initially.


While running provision actions, the agent did the following tasks in the background:

- create the ``/opt/loopcrypt.demo.svc.default.img`` file with a 1GB size
- configure a loop device ``/dev/loop1`` over ``/opt/loopcrypt.demo.svc.default.img`` file
- create an opensvc secret object ``demo/sec/loopcrypt`` to store the passphrase (if it did not exist yet)
- generate a random passphrase and store it in the ``demo/sec/loopcrypt`` object, associated with key ``disk_1_crypt_passphrase`` (change the passphrase if it already existed, see the ``manage_passphrase`` keyword documentation for more information about this policy)
- run a ``cryptsetup luksFormat`` command to encrypt the loop device contents
- run a ``cryptsetup luksOpen`` command to expose ``/dev/mapper/loopcrypt.demo.svc.default-crypt`` which is the unencrypted block device to store data
- create a ``/srv/loopcrypt`` mountpoint
- run a mkfs.ext4 on the ``/dev/mapper/loopcrypt.demo.svc.default-crypt`` block device
- mount the ``/dev/mapper/loopcrypt.demo.svc.default-crypt`` block device on the ``/srv/loopcrypt`` mountpoint

We can see that the secret object has been created by the agent::

  # om demo/sec/loopcrypt keys
  disk_1_crypt_passphrase

  # om demo/sec/loopcrypt decode --key disk_1_crypt_passphrase
  <Cev~1nU38Mlt&b55)pn>>#pQ$R)|n%PBORIXhU]A;pM[4q|{o1H!z|Z;fk<eyDTp)HGn,CWw,nV||X,R.o"6REKtr?x{vc&-GxP-#K?T1sbr.OrBEYA"#,8h71y}jQ!?WFT~Ym5XiU~^U/e%h2tQfOdjy[(Ba?7YR{4)bE@83V98S@M$*VSSu|d$vp{UKTxcvar1_"I@ee7%</^]I,,j~f*?UkTk>rvP[(;xueG[qs(g%_p^cn>TP!W/C<O]ZT&

The orchestrated ``start`` service action produces the following entries in the service log file ``/var/log/opensvc/namespaces/demo/svc/loopcrypt.log``::

  2022-01-14 14:15:27,005 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt sc:n | do start --local (daemon origin)
  2022-01-14 14:15:27,061 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:disk#0 sc:n | /sbin/losetup -f /opt/loopcrypt.demo.svc.default.img
  2022-01-14 14:15:29,098 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:disk#0 sc:n | /dev/loop1 now loops to /opt/loopcrypt.demo.svc.default.img
  2022-01-14 14:15:29,211 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:disk#1 sc:n | cryptsetup luksOpen /dev/loop5 loopcrypt.demo.svc.default-crypt -
  2022-01-14 14:15:31,357 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n | e2fsck -p /dev/mapper/loopcrypt.demo.svc.default-crypt
  2022-01-14 14:15:31,364 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n | | /dev/mapper/loopcrypt.demo.svc.default-crypt: clean, 12/64512 files, 8786/258048 blocks
  2022-01-14 14:15:31,365 INFO sid:4580f356-999e-49bf-ab80-97202d8aa91b n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n | mount -t ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt /srv/loopcrypt

Service stop
^^^^^^^^^^^^

When the service is stopped, are ressources are brought down::

  # om demo/svc/loopcrypt print status
  demo/svc/loopcrypt                   up                                                                          
  `- instances                
     `- demo1                          up         idle, started                
        |- disk#0             ........ up         loop /opt/loopcrypt.demo.svc.default.img                         
        |- disk#1             ........ up         crypt /dev/mapper/loopcrypt.demo.svc.default-crypt               
        `- fs#0               ........ up         ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt 
  
  # om demo/svc/loopcrypt stop
  @ n:demo1 o:demo/svc/loopcrypt sc:n
    demo/svc/loopcrypt defer target state set to stopped
  
  # om demo/svc/loopcrypt print status
  demo/svc/loopcrypt                   down                                                                        
  `- instances                
     `- demo1                          down       frozen, idle                       
        |- disk#0             ........ down       loop /opt/loopcrypt.demo.svc.default.img                         
        |- disk#1             ........ down       crypt /dev/mapper/loopcrypt.demo.svc.default-crypt               
        `- fs#0               ........ down       ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt 

During the ``stop`` action, the steps below are executed:

- unmount the ``/srv/loopcrypt`` filesystem
- run a ``cryptsetup luksClose`` command to stop the exposure of unencrypted blockdevice ``/dev/mapper/loopcrypt.demo.svc.default-crypt``
- unconfigure the loop device ``/dev/loop1``

The orchestrated ``stop`` service action produces the following entries in the service log file ``/var/log/opensvc/namespaces/demo/svc/loopcrypt.log``::

  2022-01-14 14:19:22,165 INFO sid:364cb3df-a8f8-4068-8d8c-3fe7fcabaf9e n:demo1 o:demo/svc/loopcrypt sc:n | do stop --local (daemon origin)
  2022-01-14 14:19:22,446 INFO sid:364cb3df-a8f8-4068-8d8c-3fe7fcabaf9e n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n | umount /srv/loopcrypt
  2022-01-14 14:19:22,498 INFO sid:364cb3df-a8f8-4068-8d8c-3fe7fcabaf9e n:demo1 o:demo/svc/loopcrypt r:disk#1 sc:n | cryptsetup luksClose /dev/mapper/loopcrypt.demo.svc.default-crypt
  2022-01-14 14:19:22,615 INFO sid:364cb3df-a8f8-4068-8d8c-3fe7fcabaf9e n:demo1 o:demo/svc/loopcrypt r:disk#0 sc:n | /sbin/losetup -d /dev/loop1

SAN device
----------

For production use, using real block devices is strongly recommended

In the example, we use the multipathed disk below::

  # multipath -l 36589cfc000000b4f42b70859f9e9dbee
  36589cfc000000b4f42b70859f9e9dbee dm-12 FreeNAS,iSCSI Disk
  size=1.0G features='0' hwhandler='1 alua' wp=rw
  |-+- policy='service-time 0' prio=0 status=active
  | `- 3:0:0:10 sdk  8:160  active undef running
  `-+- policy='service-time 0' prio=0 status=enabled
    `- 4:0:0:10 sdx  65:112 active undef running

Service configuration
^^^^^^^^^^^^^^^^^^^^^

First, we build the service template file::

  # cat > /tmp/sancrypt.conf <<-EOF
  [DEFAULT]
  id = 2d683ea4-5006-4e82-aae1-169d10d1f34a

  [disk#1]
  type = crypt
  dev = /dev/mapper/36589cfc000000b4f42b70859f9e9dbee
  name = {fqdn}-crypt

  [fs#0]
  type = ext4
  dev = {disk#1.exposed_devs[0]}
  mnt = /srv/{svcname}  
  EOF

Service creation
^^^^^^^^^^^^^^^^

Then, we can deploy the ``sancrypt`` service, in the ``demo`` namespace::

  # om demo/svc/sancrypt create --config=/tmp/sancrypt.conf
  create demo/svc/sancrypt

Service start
^^^^^^^^^^^^^

We first have to provision the service, which will build and start ressources::

  # om demo/svc/sancrypt provision --wait
  @ n:demo1 o:demo/svc/sancrypt sc:n
    demo/svc/sancrypt defer target state set to provisioned

The new service state is now provisioned, and all resources are up::

  # om demo/svc/sancrypt print status -r
  demo/svc/sancrypt                   up                                                                        
  `- instances               
     `- demo1                         up         idle, started              
        |- disk#1            ........ up         crypt /dev/mapper/sancrypt.demo.svc.default-crypt              
        `- fs#0              ........ up         ext4 /dev/mapper/sancrypt.demo.svc.default-crypt@/srv/sancrypt 
  
  # om demo/svc/sancrypt print devs
  demo/svc/sancrypt                                       
  |- fs#0 (fs)                                            
  |  |- base                                              
  |  |  |- /dev/dm-12                                     
  |  |  `- /dev/sdx                                       
  |  `- sub                                               
  |     |- /dev/sdk                                       
  |     `- /dev/sdx                                       
  `- disk#1 (disk.crypt)                                  
     |- base                                              
     |  `- /dev/dm-12                                     
     |- sub                                               
     |  `- /dev/mapper/36589cfc000000b4f42b70859f9e9dbee  
     `- exposed                                           
        `- /dev/mapper/sancrypt.demo.svc.default-crypt    

  # df -h /srv/sancrypt 
  Filesystem                                   Size  Used Avail Use% Mounted on
  /dev/mapper/sancrypt.demo.svc.default-crypt  977M  2.5M  908M   1% /srv/sancrypt

We can see that the secret object has been created by the agent::

  # om demo/sec/sancrypt keys
  disk_1_crypt_passphrase

  # om demo/sec/sancrypt decode --key disk_1_crypt_passphrase
  Rc)ovE#k|tw?E,6Y@L}f+Vg,KGzi*]{EU,YNot5rJRbN^2hln`~-]~7LPAKb8;4zAM,g7:X?[fLXa,lCQN[yF<E~^k(&x6nnspM;PNlO6B(YyC}J"f%AF8xmfe:F,-]N]K$mUH3RLG#^AJc<rip=RB:Q(nT.V+68&A-}/^][s5X5<9l2Zvhp:ASt:EH(CA-a)G)CQ5:LqR|7Och(HKm+1+gbT>%zz8jocb@7^-Z~[WR^5fA<RDPI.{y*PS<Qum9A

.. note::

  More complex setups can be configured (encrypted drbd device, encrypted mdadm device, ...).

Passphrase
==========

LUKS needs a random passphrase to format the encrypted block device.

By default, the opensvc agent deals with the passphrase creation and store it encrypted in a secret object, replicated across cluster nodes.

The generated passphrase is made of 256 characters randomly choosen from uppercase, lowercase, punctuation (except ``'`` and ``\`` )

It is possible to disable the automatic passphrase management from opensvc agent, using the parameter ``manage_passphrase = false``. You will have to create the secret object, and associated key by yourself.

.. note::

  Whatever the value of ``manage_passphrase``, the secret object is always replicated accross cluster nodes

Loss protection
---------------

In case the passphrase is manually deleted from the opensvc secret object, the agent won't accept to stop the encrypted disk ressource, to have a last chance to backup the filesystem for example (or restore the passphrase)

An orchestrated ``stop`` service action will end in ``stop failed`` status, while a CRM ``stop`` action will propose the ``--force`` cli option to bypass the security::


First we simulate the passphrase loss by deleting the key containing the passphrase::

  # om demo/sec/loopcrypt keys
  disk_1_crypt_passphrase
  # om demo/sec/loopcrypt remove --key disk_1_crypt_passphrase
  # om demo/sec/loopcrypt keys
  #

The service is still operational without the passphrase, because the unencrypted blockdevice is still opened::

  # om demo/svc/loopcrypt print status -r
  demo/svc/loopcrypt                   up                                                                               
  `- instances                
     `- demo1                          up         frozen, idle, started 
        |- disk#0             ........ up         loop /opt/loopcrypt.demo.svc.default.img                              
        |- disk#1             ........ up         crypt /dev/mapper/loopcrypt.demo.svc.default-crypt                    
        `- fs#0               ........ up         ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt      
  
  # om demo/svc/loopcrypt mon
  demo/svc/loo...                      demo1 demo2
   demo/svc/loopcrypt up       1/1   | O^         
  

The orchestrated ``stop`` action fails (root cause explained in the service logfile)::

  # om demo/svc/loopcrypt stop
  @ n:demo1 o:demo/svc/loopcrypt sc:n
    demo/svc/loopcrypt defer target state set to stopped
  # om demo/svc/loopcrypt mon
  demo/svc/loo...                         demo1           demo2
   demo/svc/loopcrypt warn!       0/1   | !!* stop failed      
  
The CRM ``stop`` action display on stdout why the ``disk#1`` ressource can not be stopped::

  # om demo/svc/loopcrypt stop --local
  @ n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n
    ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt is already umounted
  @ n:demo1 o:demo/svc/loopcrypt r:disk#1 sc:n
  E abort crypt deactivate, so you can backup the device that we won't be able to activate again: demo/sec/loopcrypt has no disk_1_crypt_passphrase key. restore the key or use --force to skip this safeguard
  
Supposing that the filesystem has been saved somewhere, we can force the agent to close the unencrypted block device::

  # om demo/svc/loopcrypt stop --local --force
  @ n:demo1 o:demo/svc/loopcrypt r:fs#0 sc:n
    ext4 /dev/mapper/loopcrypt.demo.svc.default-crypt@/srv/loopcrypt is already umounted
  @ n:demo1 o:demo/svc/loopcrypt r:disk#1 sc:n
    cryptsetup luksClose /dev/mapper/loopcrypt.demo.svc.default-crypt
  @ n:demo1 o:demo/svc/loopcrypt r:disk#0 sc:n
    /sbin/losetup -d /dev/loop1
  @ n:demo1 o:demo/svc/loopcrypt sc:n
    /bin/echo 1 >/sys/fs/cgroup/freezer/opensvc.slice/demo.slice/loopcrypt.slice/cgroup.clone_children
    no task to kill

The ``cryptsetup luksClose`` definitely close the unencrypted block device. To reopen it, the sysadmin would have to restore the passphrase in the secret object key, and start the service.

Unprovision/Purge
=================


.. warning::

  Be aware that running ``unprovision`` or ``purge`` service actions will lead to **data loss**
