btrfs data replication
**********************

Introduction
============

The btrfs replication scheme is based on btrfs send/receive. OpenSVC uses btrfs snapshots to ensure incremental send/receive replication.

Source and targets maintain a btrfs snapshot @sent to identify the last incremental synchronization done properly. This state is used to check that the deltas application sequence is not broken. If broken, alerts are emited and a full sync must be scheduled

Command set
===========

:cmd:`syncnodes`
    Initial synchronization or incremental synchronisation. First one will be a Initial synchronisation, next will be incremental

Status
======

:state:`up`
    Last synchronization occured less than sync_max_delay minutes ago.

:state:`warn`
    Last synchronization occured more than sync_max_delay minutes ago.

Internals
=========

A replication action applies the following logic:

- create @tosent readonly snapshots on sender

- for each subvol-remote pair

	- send/receive the @tosent snap

	- rotate @tosent to @sent on remote

	- recursive clean-up of the destination final location on remote

	- install the @sent subvol as rw snapshots on remotes

- rotate @tosent to @sent on sender

Implementation details
======================

There are some shortcomings in the current btrfs send/receive implementation that opensvc works around :

- no recursive snapshot/delete/send : for now you have to declare one sync resource per subvol, even if they are organised as a tree.

- btrfs receive is easily confused when looking for a subvol parent id : for now opensvc has to mount the ID5 root vol on ``<OSVCVAR>/btrfs/<label>`` and uses a flat/root-parented snapshot hosting. Once the btrfs feature matures we might move to a .osvcsnap/ dedicated subvol mounted in ``<OSVCVAR>/btrfs/<label>.osvcnap/`` instead.


Service configuration
=====================

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.sync.btrfs

Examples
========

Extract of a typical btrfs sync env file
----------------------------------------

::

	[DEFAULT]
	nodes = deb1.opensvc.com deb2.opensvc.com
	app = OSVCLAB
	service_type = DEV
	
	[fs#1]
	type = btrfs
	dev = /dev/vdb
	mnt = /btrfssvc
	mnt_opt = subvol=btrfssvc
	
	[sync#1]
	type = btrfs
	src = data:btrfssvc
	dst = data:btrfssvc
	target = nodes
	
	[sync#2]
	type = btrfs
	src = data:btrfssvc/child
	dst = data:btrfssvc/child
	target = nodes


Full synchronization
--------------------

::

	root@deb1.opensvc.com # svcmgr -s btrfssvc syncnodes
	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume snapshot -r /var/lib/opensvc/btrfs/data/btrfssvc /var/lib/opensvc/btrfs/data/btrfssvc@tosend
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a readonly snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc' in '/var/lib/opensvc/btrfs/data/btrfssvc@tosend'
	
	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume snapshot -r /var/lib/opensvc/btrfs/data/btrfssvc/child /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a readonly snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc/child' in '/var/lib/opensvc/btrfs/data/btrfssvc_child@tosend'
	
	* BTRFSSVC.SYNC#1 - INFO - btrfs send /var/lib/opensvc/btrfs/data/btrfssvc@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /var/lib/opensvc/btrfs/data
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /var/lib/opensvc/btrfs/data/btrfssvc@tosend /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc/child && btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc/child'
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc'
	
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /var/lib/opensvc/btrfs/data/btrfssvc@sent /var/lib/opensvc/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc@sent' in '/var/lib/opensvc/btrfs/data/btrfssvc'
	
	* BTRFSSVC.SYNC#1 - INFO - mv /var/lib/opensvc/btrfs/data/btrfssvc@tosend /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - update state file with snap uuid 203
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /var/lib/opensvc/btrfssvc_sync#1_btrfs_state deb2.opensvc.com:/var/lib/opensvc/btrfssvc_sync\#1_btrfs_state
	* BTRFSSVC.SYNC#2 - INFO - btrfs send /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /var/lib/opensvc/btrfs/data
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /var/lib/opensvc/btrfs/data/btrfssvc_child@sent /var/lib/opensvc/btrfs/data/btrfssvc/child
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc_child@sent' in '/var/lib/opensvc/btrfs/data/btrfssvc/child'
	
	* BTRFSSVC.SYNC#2 - INFO - mv /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - update state file with snap uuid 204
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /var/lib/opensvc/btrfssvc_sync#2_btrfs_state deb2.opensvc.com:/var/lib/opensvc/btrfssvc_sync\#2_btrfs_state
	* BTRFSSVC - INFO - exec 'svcmgr -s btrfssvc --waitlock 3600 postsync' on node deb2.opensvc.com

Incremental synchronization
---------------------------

::

	root@deb1.opensvc.com # svcmgr -s btrfssvc syncnodes
	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume snapshot -r /var/lib/opensvc/btrfs/data/btrfssvc /var/lib/opensvc/btrfs/data/btrfssvc@tosend
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a readonly snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc' in '/var/lib/opensvc/btrfs/data/btrfssvc@tosend'

	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume snapshot -r /var/lib/opensvc/btrfs/data/btrfssvc/child /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a readonly snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc/child' in '/var/lib/opensvc/btrfs/data/btrfssvc_child@tosend'

	* BTRFSSVC.SYNC#1 - INFO - btrfs send -i /var/lib/opensvc/btrfs/data/btrfssvc@sent -p /var/lib/opensvc/btrfs/data/btrfssvc@sent /var/lib/opensvc/btrfs/data/btrfssvc@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /var/lib/opensvc/btrfs/data
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc@sent'

	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /var/lib/opensvc/btrfs/data/btrfssvc@tosend /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc/child && btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc/child'
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc'

	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /var/lib/opensvc/btrfs/data/btrfssvc@sent /var/lib/opensvc/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc@sent' in '/var/lib/opensvc/btrfs/data/btrfssvc'

	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc@sent'

	* BTRFSSVC.SYNC#1 - INFO - mv /var/lib/opensvc/btrfs/data/btrfssvc@tosend /var/lib/opensvc/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - update state file with snap uuid 206
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /var/lib/opensvc/btrfssvc_sync#1_btrfs_state deb2.opensvc.com:/var/lib/opensvc/btrfssvc_sync\#1_btrfs_state
	* BTRFSSVC.SYNC#2 - INFO - btrfs send -i /var/lib/opensvc/btrfs/data/btrfssvc_child@sent -p /var/lib/opensvc/btrfs/data/btrfssvc_child@sent /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /var/lib/opensvc/btrfs/data
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc_child@sent'

	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /var/lib/opensvc/btrfs/data/btrfssvc_child@sent /var/lib/opensvc/btrfs/data/btrfssvc/child
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a snapshot of '/var/lib/opensvc/btrfs/data/btrfssvc_child@sent' in '/var/lib/opensvc/btrfs/data/btrfssvc/child'

	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume delete /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - output:
	Delete subvolume '/var/lib/opensvc/btrfs/data/btrfssvc_child@sent'

	* BTRFSSVC.SYNC#2 - INFO - mv /var/lib/opensvc/btrfs/data/btrfssvc_child@tosend /var/lib/opensvc/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - update state file with snap uuid 207
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /var/lib/opensvc/btrfssvc_sync#2_btrfs_state deb2.opensvc.com:/var/lib/opensvc/btrfssvc_sync\#2_btrfs_state
	* BTRFSSVC - INFO - exec '/etc/opensvc/btrfssvc --waitlock 3600 postsync' on node deb2.opensvc.com


