btrfs data replication
**********************

Introduction
============

The btrfs replication scheme is based on btrfs send/receive. OpenSVC uses btrfs snapshots to ensure incremental send/receive replication.

Source and targets maintain a btrfs snapshot @sent to identify the last incremental synchronization done properly. This state is used to check that the deltas application sequence is not broken. If broken, alerts are emited and a full sync must be scheduled

Command set
===========

:command:`syncnodes`
    Initial synchronization or incremental synchronisation. First one will be a Initial synchronisation, next will be incremental

Status
======

:command:`up`
    Last synchronization occured less than sync_max_delay minutes ago.

:command:`warn`
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

- btrfs receive is easily confused when looking for a subvol parent id : for now opensvc has to mount the ID5 root vol on ``/opt/opensvc/var/btrfs/<label>`` and uses a flat/root-parented snapshot hosting. Once the btrfs feature matures we might move to a .osvcsnap/ dedicated subvol mounted in ``/opt/opensvc/var/btrfs/<label>.osvcnap/`` instead.


Service configuration
=====================

Service configuration file
--------------------------

::

	[sync#1]
	type = btrfs
	src = some_label:some/subvol
	;dst is optional since it default value is src value (here dst = some_label:some/subvol)
	;dst = some_other_label/some_other_subvol
	target = nodes

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

	root@deb1.opensvc.com # /opt/opensvc/etc/btrfssvc syncnodes
	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume snapshot -r /opt/opensvc/var/btrfs/data/btrfssvc /opt/opensvc/var/btrfs/data/btrfssvc@tosend
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a readonly snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc' in '/opt/opensvc/var/btrfs/data/btrfssvc@tosend'
	
	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume snapshot -r /opt/opensvc/var/btrfs/data/btrfssvc/child /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a readonly snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc/child' in '/opt/opensvc/var/btrfs/data/btrfssvc_child@tosend'
	
	* BTRFSSVC.SYNC#1 - INFO - btrfs send /opt/opensvc/var/btrfs/data/btrfssvc@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /opt/opensvc/var/btrfs/data
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /opt/opensvc/var/btrfs/data/btrfssvc@tosend /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc/child && btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc/child'
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc'
	
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /opt/opensvc/var/btrfs/data/btrfssvc@sent /opt/opensvc/var/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc@sent' in '/opt/opensvc/var/btrfs/data/btrfssvc'
	
	* BTRFSSVC.SYNC#1 - INFO - mv /opt/opensvc/var/btrfs/data/btrfssvc@tosend /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - update state file with snap uuid 203
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/btrfssvc_sync#1_btrfs_state deb2.opensvc.com:/opt/opensvc/var/btrfssvc_sync\#1_btrfs_state
	* BTRFSSVC.SYNC#2 - INFO - btrfs send /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /opt/opensvc/var/btrfs/data
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /opt/opensvc/var/btrfs/data/btrfssvc_child@sent /opt/opensvc/var/btrfs/data/btrfssvc/child
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc_child@sent' in '/opt/opensvc/var/btrfs/data/btrfssvc/child'
	
	* BTRFSSVC.SYNC#2 - INFO - mv /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - update state file with snap uuid 204
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/btrfssvc_sync#2_btrfs_state deb2.opensvc.com:/opt/opensvc/var/btrfssvc_sync\#2_btrfs_state
	* BTRFSSVC - INFO - exec '/opt/opensvc/etc/btrfssvc --waitlock 3600 postsync' on node deb2.opensvc.com

Incremental synchronization
---------------------------

::

	root@deb1.opensvc.com # /opt/opensvc/etc/btrfssvc syncnodes
	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume snapshot -r /opt/opensvc/var/btrfs/data/btrfssvc /opt/opensvc/var/btrfs/data/btrfssvc@tosend
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a readonly snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc' in '/opt/opensvc/var/btrfs/data/btrfssvc@tosend'

	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume snapshot -r /opt/opensvc/var/btrfs/data/btrfssvc/child /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a readonly snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc/child' in '/opt/opensvc/var/btrfs/data/btrfssvc_child@tosend'

	* BTRFSSVC.SYNC#1 - INFO - btrfs send -i /opt/opensvc/var/btrfs/data/btrfssvc@sent -p /opt/opensvc/var/btrfs/data/btrfssvc@sent /opt/opensvc/var/btrfs/data/btrfssvc@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /opt/opensvc/var/btrfs/data
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc@sent'

	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /opt/opensvc/var/btrfs/data/btrfssvc@tosend /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc/child && btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc/child'
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc'

	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /opt/opensvc/var/btrfs/data/btrfssvc@sent /opt/opensvc/var/btrfs/data/btrfssvc
	* BTRFSSVC.SYNC#1 - INFO - output:
	Create a snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc@sent' in '/opt/opensvc/var/btrfs/data/btrfssvc'

	* BTRFSSVC.SYNC#1 - INFO - btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc@sent'

	* BTRFSSVC.SYNC#1 - INFO - mv /opt/opensvc/var/btrfs/data/btrfssvc@tosend /opt/opensvc/var/btrfs/data/btrfssvc@sent
	* BTRFSSVC.SYNC#1 - INFO - update state file with snap uuid 206
	* BTRFSSVC.SYNC#1 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/btrfssvc_sync#1_btrfs_state deb2.opensvc.com:/opt/opensvc/var/btrfssvc_sync\#1_btrfs_state
	* BTRFSSVC.SYNC#2 - INFO - btrfs send -i /opt/opensvc/var/btrfs/data/btrfssvc_child@sent -p /opt/opensvc/var/btrfs/data/btrfssvc_child@sent /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend | /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs receive /opt/opensvc/var/btrfs/data
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc_child@sent'

	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com mv /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/ssh -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 deb2.opensvc.com btrfs subvolume snapshot /opt/opensvc/var/btrfs/data/btrfssvc_child@sent /opt/opensvc/var/btrfs/data/btrfssvc/child
	* BTRFSSVC.SYNC#2 - INFO - output:
	Create a snapshot of '/opt/opensvc/var/btrfs/data/btrfssvc_child@sent' in '/opt/opensvc/var/btrfs/data/btrfssvc/child'

	* BTRFSSVC.SYNC#2 - INFO - btrfs subvolume delete /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - output:
	Delete subvolume '/opt/opensvc/var/btrfs/data/btrfssvc_child@sent'

	* BTRFSSVC.SYNC#2 - INFO - mv /opt/opensvc/var/btrfs/data/btrfssvc_child@tosend /opt/opensvc/var/btrfs/data/btrfssvc_child@sent
	* BTRFSSVC.SYNC#2 - INFO - update state file with snap uuid 207
	* BTRFSSVC.SYNC#2 - INFO - /usr/bin/scp -o StrictHostKeyChecking=no -o ForwardX11=no -o BatchMode=yes -o ConnectTimeout=10 /opt/opensvc/var/btrfssvc_sync#2_btrfs_state deb2.opensvc.com:/opt/opensvc/var/btrfssvc_sync\#2_btrfs_state
	* BTRFSSVC - INFO - exec '/opt/opensvc/etc/btrfssvc --waitlock 3600 postsync' on node deb2.opensvc.com


