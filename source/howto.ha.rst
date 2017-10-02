.. _howto.ha:

High Availability setup
***********************

Introduction
============

This cookbook presents the steps to setup an automated OpenSVC service failover using open-ha for the heartbeat. open-ha is our preferred heartbeat daemon because it runs on all Unix operating systems, proposes multiple multicast heartbeat paths using a mix of IP and SCSI, and has a flexible trigger support.

Best practice for heartbeat infrastructure:

*   Try to use more than 2 heartbeat links
*   Try to mix heartbeat drivers
*   Don't use the same LAN twice for heartbeat
*   Don't use LANs with a common point of failure
*   Try to configure one heartbeat on a dedicated LAN

Installation
============

OpenSVC
-------

This cookbook focuses on adding HA to an existing OpenSVC clustered service. Please refer to:

*   `Nodeware installation <agent.install.html>`_
*   `Service creation <agent.service.creation.html>`_

In addition to the above instructions, services handled by a clusterware have to:

*   Declare a heartbeat resource in the env file: (Refer to :file:`<OSVCDOC>/template.env` for detailled syntax information).

   ::

      [hb#1]
      type = OpenHA
      name = svc1

.. warning:: OpenHA service names are limited to 15 characters and node names are limited to 127 characters.

*   Create an additional symlink in :file:`<OSVCETC>`:

   ::

      cd /etc/opensvc && ln -s ../bin/svcmgr svc1.cluster

Open-HA
-------

Download open-ha from `here <https://repo.opensvc.com/>`_. The default location of all this program's files is :file:`/usr/local/cluster`. Before using any open-ha commands, you have to setup some environment variables:

::

   # export EZ=/usr/local/cluster
   # . /usr/local/cluster/env.sh

Setup
=====

Describe cluster nodes
----------------------

In file :file:`/usr/local/cluster/conf/nodes`:

::

   node108
   node109

.. note::

    * No trailing spaces.
    * One node per line.
    * All members of this cluster must be listed.

Describe heartbeat paths
------------------------

OpenHA supported heartbeat types are :

- IP Multicast (net) 
- IP Unicast (unicast)
- Disk (dio)
- Raw device (raw)

Heartbeats types can be mixed in the same OpenHA configuration

To setup 3 multicast heartbeats, in file :file:`/usr/local/cluster/conf/monitor`:

::

   node108  net  eth1  239.131.50.10    1780  60
   node108  dio  /dev/mapper/3600512341234123412341234  0  60
   node108  unicast  eth0  192.168.0.109    1700  60
   node109  net  eth1  239.131.50.10    1781  60
   node109  dio  /dev/mapper/3600512341234123412341234  16  60
   node109  unicast  eth0  192.168.0.108    1700  60

``net`` heartbeart parameters:

*   param#1: node hostname
*   param#2: heartbeat type
*   param#3: multicast IP
*   param#4: port number
*   param#5: heartbeat timeout

``unicast`` heartbeart parameters:

*   param#1: node hostname
*   param#2: heartbeat type
*   param#3: remote ip address
*   param#4: port number
*   param#5: heartbeat timeout

``dio`` or ``disk`` heartbeart parameters:

*   param#1: node hostname
*   param#2: heartbeat type
*   param#3: device path (block for ``dio``, raw for ``raw``)
*   param#4: offset of the exchanged data, in blocks
*   param#5: heartbeat timeout

With this setup :

- the ``heartd`` process on node108 will send heartbeat data through eth1 on multicast IP 239.131.50.10 port 1780
- the ``heartd_dio`` process on node108 will write heartbeat data on /dev/mapper/3600512341234123412341234 at offset 0
- the ``heartd_unicast`` process on node108 will send heartbeat data through eth0 on unicast IP 192.168.0.109 port 1700
- the ``heartc`` process on node108 will listen for heartbeat data received on eth1 on multicast IP 239.131.50.10 port 1781, with a 60 seconds timeout
- the ``heartc_dio`` process on node108 will listen read heartbeat data on /dev/mapper/3600512341234123412341234 at offset 16, with a 60 seconds timeout
- the ``heartc_unicast`` process on node108 will listen for heartbeat data received on eth0 on unicast IP 192.168.0.108 port 1700, with a 60 seconds timeout

.. note::

    * Each heartbeat end-point has a unique port number.
    * Each heartbeat path has a unique multicast IP.
    * The monitor file can be copied as-is to the other, except when Solaris IPMP is active (more listeners than senders in this case).

Add services
------------

Without STONITH:

::

   $EZ_BIN/service -a svc1 /etc/opensvc/svc_name.cluster node108 node109 /bin/true

With STONITH:

::

   $EZ_BIN/service -a svc1 /etc/opensvc/svc_name.cluster node108 node109 /etc/opensvc/svc_name.stonith

Where:

*   '-a': add open-ha service
*   param#1: service name, align to OpenSVC is not required, advised anyway (15 characters maximum)
*   param#2: OpenSVC service start/stop script
*   param#3: primary node
*   param#4: secondary node
*   param#5: pre-launch checkup script

  * this script is executed before starting the service. If its return code is anything else than 0, the service startup is aborted. It is often used to trigger the STONITH

Startup
-------

Make sure the heartbeat daemons are setup for startup at boot. If not, depending on your system, apply some commands similar to:

::

   ln -s /usr/local/cluster/ezha /etc/rc3.d/S99cluster
   ln -s /usr/local/cluster/ezha /etc/rc0.d/K01cluster
   ln -s /usr/local/cluster/ezha /etc/rcS.d/K01cluster

Then run:

::

   /usr/local/cluster/ezha.init start

Daemons
-------

Starting the ezha init script will spawn the following daemons:

    :cmd:`nmond`
       state transition and trigger initiator daemon
    :cmd:`heartc`
       multicast listener daemons, one per local heartbeat receiving end-point
    :cmd:`heartd`
       multicast sender daemons, one per local heartbeat sending end-point

Use
===

Querying
--------

Display the service cluster status:

::

   # /usr/local/cluster/bin/service -s
   service       owned_by  nodeA        nodeB
   svc1          nodeB     FROZEN_STOP  STARTED
   svc2          nodeA     STARTED      STOPPED"

Service states
--------------

============== ================================================================================================================================
State          Description
============== ================================================================================================================================
STOPPED        last run of the opensvc service shutdown command returned successfully.
STARTED        last run of the opensvc service startup command returned successfully.
STOP_FAILED    last run of the opensvc service shutdown command returned some error. open-ha restrains from running further service commands.
START_FAILED   last run of the opensvc service startup command returned some error. open-ha restrains from running further service commands.
STOPPING       last run of the opensvc service shutdown command is pending completion.
STARTING       last run of the opensvc service startup command is pending completion.
START_READY    node is ready to take over the service.
FROZEN_STOP    state reached after a successful 'freeze-stop' open-ha command. open-ha restrains from running further service commands.
FROZEN_START   state reached after freezing through open-ha a stopped service. open-ha restrains from running further service commands.
============== ================================================================================================================================

Trigger a failover
------------------

When a service is handled to any heartbeat daemon, you must not use stop/start OpenSVC commands to drive this service: the heartbeat daemon being in charge, you must use its command set only.

On the node where the service is RUNNING:

::

   # /usr/local/cluster/bin/service -A mysvc freeze-stop
   # /usr/local/cluster/bin/service -A mysvc unfreeze

Resource monitoring
===================

Resource monitoring can be setup to trigger a service failover upon service resource failure: in other words, a TOC, short for Transfer Of Control. Client-side service ip adresses and data hosting filesystems are typical monitored resources.

Flag resources for monitoring
-----------------------------

A subset of the service's resources can be flagged for monitoring through:

::

   [res#1]
   monitor = True

   [res#2]
   monitor_on = nodes

Monitor action
--------------

The ``resource_monitor`` service action triggers the ``DEFAULT.monitor_action`` if:

*   the service has a heartbeat resource
*   AND the heartbeat resource reports up status
*   AND one or more monitored resources report a not up status

The ``DEFAULT.monitor_action`` can be either:

================  ==================================================================================
Action            Description
================  ==================================================================================
freezestop        Tell the OpenHA heartbeat to tear down the service and jump to FROZEN_STOP state
reboot            Fast reboot the node
crash             Crash the node
================  ==================================================================================

Stonith
=======

The stonith mecanism is used to arbitrate split-brain situations, where nodes can't see each other and they can't determine if they can safely take over the service. In such situation a node will power cycle it's peer to be sure only one node has the service responsability at a time.

The stonith mecanism is triggered by executing :file:`etc/svcname.stonith`. OpenHA can be configured to stonith by setting :file:`etc/svcname.stonith` as a check-up script.

The stonith action returns 1 to abort the switch-over, 0 otherwise.

Stonith methods are implemented as resource drivers.

Ilo stonith driver
------------------

In service configuration file:

::

   [stonith#1]
   type = ilo
   target@node1 = node2-ilo
   target@node2 = node1-ilo

The Ilo stonith driver uses key-based ssh authentication. The specific key can be pointed by the following configuration in :file:`etc/auth.conf`:

::

   [node1-ilo]
   username = opensvc
   key = /home/opensvc/.ssh/id_dsa

   [node2-ilo]
   username = opensvc
   key = /home/opensvc/.ssh/id_dsa

.. note::

    * Some Ilo firmware versions refuse rsa authentication. To be on the safe side, use dsa keys.
    * You may also be required to remove or change the key's comment to match the ILo login username.

