Netapp snapmirror replication
*****************************

Command set
===========

:cmd:`start`
    Acquire read/write access to the snapmirrored resources. Either swapping the syncs direction (in geocluster mode), or breaking-off the syncs (default disaster recovery mode).

:cmd:`stop`
    noop

:cmd:`sync update`
    Trigger a snapmirror sync.

:cmd:`sync quiesce`
    Trigger an ultimate snapmirror sync then suspend the resync scheduling.

:cmd:`sync resume`
    Resume snapmirror sync schedule (rollbacks the effect of quiesce).

:cmd:`sync break`
    Break-off the snapmirror resource.

:cmd:`sync resync`
    Re-establish the snapmirror synchronization.

:cmd:`sync swap`
    Re-establish the snapmirror synchronization using current destination as new source.

Force flag
==========

The --force flag is honored by the 'start' command only. It disables the exit on quiesce failure in the 'quiesce -> break' sequence. Be aware it means that the service will take over with a lagged data cursor.

Status
======

:state:`up`
    The snapmirror are operational and the lag in under :kw:`sync_max_delay`

:state:`warn`
    The snapmirror are in one of the following state:
    *   transfer is in progress
    *   lag is beyond :kw:`sync_max_delay`

:state:`undef`
    slave filer is unreachable

:state:`down`
    resource is not in snapmirrored state

Service configuration for Netapp
================================

Pre-requisites
--------------

Key-based ssh access to the filers. The root account's key-pair is used by OpenSVC. The filer account used is settable in the service configuration file. The filer account must have snapmirror handling capabilities granted.
Cluster mode

:state:`split`
    This is the default disaster recovery mode. Upon service startup on a DRP node, the snapmirrored resources are quiesced if the master filer is still joinable, then broken-off. The DRP node data cursor on the broken-off resources is considered volatile (still can be manually synchronized to the primary filer before failback to production node).

:state:`swap`
    This mode is dedicated to multi-site clusters. Upon service startup on a secondary node, the snapmirrored are quiesced and sync directions are swapped to set the 'source' to the filer local to the secondary node taking over the service.

The mode is deduced from the node's host mode : a PRD host mode implies the swap sync mode, otherwise the split sync mode is selected.

Keywords
--------

.. toctree::
   :maxdepth: 2

   agent.templates/template.service.sync.netapp

Netapp user account setup
=========================

Create a role
-------------

::

	toaster> useradmin role add opensvc -a login-ssh,cli-snapmirror*,cli-snap*

Create account
--------------

::

	toaster> useradmin group add osvc -r opensvc

	toaster> useradmin user add opensvc -g osvc

Setup ssh key-based authentication
----------------------------------
    
.. warning:: If the ssh setup has already been done skip the following command. Run secureadmin status to check.

::

	toaster> secureadmin setup ssh

	SSH Setup
	---------
	Determining if SSH Setup has already been done before...no

	SSH server supports both ssh1.x and ssh2.0 protocols.

	SSH server needs two RSA keys to support ssh1.x protocol. The host key is
	generated and saved to file /etc/sshd/ssh_host_key during setup. The server
	key is re-generated every hour when SSH server is running.

	SSH server needs a RSA host key and a DSA host key to support ssh2.0 protocol.
	The host keys are generated and saved to /etc/sshd/ssh_host_rsa_key and
	/etc/sshd/ssh_host_dsa_key files respectively during setup.


	SSH Setup will now ask you for the sizes of the host and server keys.
	 For ssh1.0 protocol, key sizes must be between 384 and 2048 bits.
	 For ssh2.0 protocol, key sizes must be between 768 and 2048 bits.
	 The size of the host and server keys must differ by at least 128 bits.

	Please enter the size of host key for ssh1.x protocol [768] 
	Please enter the size of server key for ssh1.x protocol [512] 
	Please enter the size of host keys for ssh2.0 protocol [768] 

	You have specified these parameters
		host key size = 768 bits
		server key size = 512 bits
		host key size for ssh2.0 protocol = 768 bits
	Is this correct? [yes]

	Setup will now generate the host keys. It will take a minute.
	After Setup is finished the SSH server will start automatically.

	toaster> Tue Feb  9 10:02:20 GMT [secureadmin.ssh.setup.success:info]
	SSH setup is done and ssh2 should be enabled.
	Host keys are stored in /etc/sshd/ssh_host_key, /etc/sshd/ssh_host_rsa_key, and /etc/sshd/ssh_host_dsa_key.

	toaster>

Trust keys
----------

Trust all PRD nodes root public keys on all filers. Trust DRP nodes root public keys only on their local filer.

Append the keys to :file:`/nasprd/vol/vol0/etc/sshd/opensvc/.ssh/authorized_keys2`:

::

	$ cat /nasprd/vol/vol0/etc/sshd/opensvc/.ssh/authorized_keys2
	ssh-dss AAAAB3NzaC1kc3MAAACBAMGX7dH ... == root@vm5
	ssh-dss AAAAB3NzaC1kc3MAAACBAIPCpkA ... == root@vm4

Snapmirror configuration
========================

OpenSVC does not provide assistance in initial snapmirror configuration. The necessary steps are described below to help you kickstart a service setup. OpenSVC declines liability for your breaking your filers. For accurate information please refer to Netapp documentations.

On Source toaster : Ensure target toaster is trusted
----------------------------------------------------

::

	nasprd> rdfile /etc/snapmirror.allow

Check that target toaster hostname in present in the file

On Target toaster : Restrict destination volume
-----------------------------------------------

::

	nasdrp> vol restrict vol1

On Target toaster : Initialize snapmirror replication
-----------------------------------------------------

::

	nasdrp> snapmirror initialize -S nasprd:vol1 nasdrp:vol1

On Target toaster : Fill in the /etc/snapmirror.conf to specify the snapmirror policy
-------------------------------------------------------------------------------------

::

	nasdrp> rdfile /etc/snapmirror.conf

	nasprd:vol1 nasdrp:vol1 - - * * *

	nasdrp:vol1 nasprd:vol1 - - * * *

.. note::

    The scheduling is disabled because syncs are drived by OpenSVC and that both replication directions are provisionned for swaps (one of them will appear as 'Uninitialized' in status).

Examples
========

Quiesce a replication
---------------------

::

	# om unxprdencap sync quiesce
	2010-02-09 16:51:22,419 - SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror quiesce nasdrp:vol1

Resume a replication
--------------------

::

	# om unxprdencap sync resume
	2010-02-09 16:49:29,059 - SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror resume nasdrp:vol1

Split a replication
-------------------

::

	# om unxprdencap sync break
	2010-02-09 16:41:15,359 - SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror break nasdrp:vol1

Resync a replication
--------------------

::

	# om unxprdencap sync resync
	2010-02-09 16:54:59,290 - SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror resync -f nasdrp:vol1

Diskstart in disaster recovery (split) mode
-------------------------------------------

::

	# om unxprdencap start --rid disk
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror quiesce nasdrp:vol1
	* SYNC.NETAPP - INFO - start waiting quiesce to finish (max 300 seconds)
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror break nasdrp:vol1
	* FS - INFO - mount -t nfs -o rw,intr,soft nasdrp:/vol/vol1 /unxprdencap/netapp

Diskstart in multi-site cluster (swap) mode
-------------------------------------------

::

	# om unxprdencap startdisk
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasprd snapmirror quiesce nasprd:vol1
	* SYNC.NETAPP - INFO - start waiting quiesce to finish (max 60 seconds)
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasprd snapmirror break nasprd:vol1
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror resync -f -S nasprd:vol1 nasdrp:vol1
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasdrp snapmirror release vol1 nasprd:vol1
	* SYNC.NETAPP - INFO - /usr/bin/ssh opensvc@nasprd snap delete vol1 nasprd(0099904947)_vol1.1
	* FS - INFO - mount -t nfs -o rw,intr,soft nasprd:/vol/vol1 /unxprdencap/netapp
