.. index:: features

Features
********

Operating System
================

Linux
-----

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+-------------------+
| resources   | | ip              |
|             | | loop            |
|             | | fs              |
|             | | bind mounts     |
|             | | lvm2 vg         |
|             | | veritas vg      |
|             | | sync            |
+-------------+-------------------+
| containers  | | lxc             |
|             | | openvz          |
|             | | xen             |
|             | | kvm             |
|             | | vbox            |
|             | | ovm             |
|             | | esx             |
|             | | docker instance |
|             | | docker service  |
+-------------+-------------------+
| scsi        | yes [#f1]_        |
| persistent  | (sg_persist)      |
| reservation |                   |
+-------------+-------------------+
| rsync on    | lvm2 snaps        |
| snap        |                   |
+-------------+-------------------+
| delta       | dds               |
| replication |                   |
+-------------+-------------------+
| HA plugin   | | openha          |
|             | | heartbeatd      |
|             | | keepalived      |
+-------------+-------------------+
| IPv6        | yes               |
+-------------+-------------------+
| Per-service | yes (cgroup)      |
| resource    |                   |
| capping     |                   |
+-------------+-------------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+----------------+
| network     | yes            |
+-------------+----------------+
| disks       | yes            |
+-------------+----------------+
| os packages | yes            |
+-------------+----------------+
| os patches  |                |
+-------------+----------------+
| os stats    | yes            |
+-------------+----------------+
| server hw   | yes            |
+-------------+----------------+
| server os   | yes            |
+-------------+----------------+
| san arrays  | yes            |
+-------------+----------------+
| san switch  | yes            |
+-------------+----------------+
| networker   | yes            |
| index       |                |
+-------------+----------------+


Solaris
-------

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| resources   | | ip          |
|             | | lofs        |
|             | | zfs pool    |
|             | | veritas vg  |
|             | | sync        |
+-------------+---------------+
| containers  | | zone        |
|             | | ldom        |
|             | | xen         |
|             | | vbox        |
+-------------+---------------+
| scsi        | yes           |
| persistent  | (sg_persist)  |
| reservation |               |
+-------------+---------------+
| rsync on    | zfs snaps     |
| snap        |               |
+-------------+---------------+
| delta       | zfs           |
| replication | send/recv     |
+-------------+---------------+
| HA plugin   | openha        |
+-------------+---------------+
| IPv6        | yes           |
+-------------+---------------+
| Per-service | no            |
| resource    |               |
| capping     |               |
+-------------+---------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| network     | yes           |
+-------------+---------------+
| disks       | yes           |
+-------------+---------------+
| os packages | yes           |
+-------------+---------------+
| os patches  | yes           |
+-------------+---------------+
| os stats    | yes           |
+-------------+---------------+
| server hw   | yes           |
+-------------+---------------+
| server os   | yes           |
+-------------+---------------+
| san arrays  | yes           |
+-------------+---------------+
| san switch  | yes           |
+-------------+---------------+
| networker   | yes           |
| index       |               |
+-------------+---------------+

HP-UX
-----

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| resources   | | ip          |
|             | | fs          |
|             | | vg          |
|             | | sync        |
+-------------+---------------+
| containers  | | hpvm        |
|             | | srp         |
+-------------+---------------+
| scsi        | yes [#f2]_    |
| persistent  | (scu)         |
| reservation |               |
+-------------+---------------+
| rsync on    | vxfs snaps    |
| snap        | on lv         |
+-------------+---------------+
| delta       | n/a           |
| replication |               |
+-------------+---------------+
| HA plugin   | openha        |
+-------------+---------------+
| IPv6        | yes           |
+-------------+---------------+
| Per-service | no            |
| resource    |               |
| capping     |               |
+-------------+---------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| network     | yes           |
+-------------+---------------+
| disks       | yes           |
+-------------+---------------+
| os packages | yes           |
+-------------+---------------+
| os patches  | yes           |
+-------------+---------------+
| os stats    | yes           |
+-------------+---------------+
| server hw   | yes           |
+-------------+---------------+
| server os   | yes           |
+-------------+---------------+
| san arrays  | yes           |
+-------------+---------------+
| san switch  | yes           |
+-------------+---------------+
| networker   | yes           |
| index       |               |
+-------------+---------------+

AIX
---

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| resources   | | ip          |
|             | | fs          |
|             | | namefs      |
|             | | sync        |
|             | | vg          |
+-------------+---------------+
| containers  |               |
+-------------+---------------+
| scsi        | no            |
| persistent  |               |
| reservation |               |
+-------------+---------------+
| rsync on    | jfs2 snaps    |
| snap        | on lv         |
+-------------+---------------+
| delta       | n/a           |
| replication |               |
+-------------+---------------+
| HA plugin   | not tested    |
+-------------+---------------+
| IPv6        | yes           |
+-------------+---------------+
| Per-service | no            |
| resource    |               |
| capping     |               |
+-------------+---------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+---------------+
| network     | yes           |
+-------------+---------------+
| disks       | yes           |
+-------------+---------------+
| os packages | yes           |
+-------------+---------------+
| os patches  | yes           |
+-------------+---------------+
| os stats    | yes           |
+-------------+---------------+
| server hw   | yes           |
+-------------+---------------+
| server os   | yes           |
+-------------+---------------+
| san arrays  | yes           |
+-------------+---------------+
| san switch  | yes           |
+-------------+---------------+
| networker   | yes           |
| index       |               |
+-------------+---------------+

FreeBSD
-------

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+--------------+
| resources   | | ip         |
|             | | md         |
|             | | fs         |
|             | | nullfs     |
|             | | zfs pool   |
|             | | sync       |
+-------------+--------------+
| containers  | | jail       |
+-------------+--------------+
| scsi        | yes          |
| persistent  | (sg_persist) |
| reservation |              |
+-------------+--------------+
| rsync on    | zfs snaps    |
| snap        |              |
+-------------+--------------+
| delta       | zfs          |
| replication | send/recv    |
+-------------+--------------+
| HA plugin   | not tested   |
+-------------+--------------+
| IPv6        | yes          |
+-------------+--------------+
| Per-service | no           |
| resource    |              |
| capping     |              |
+-------------+--------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+--------------+
| network     | yes          |
+-------------+--------------+
| disks       | yes          |
+-------------+--------------+
| os packages | yes          |
+-------------+--------------+
| os patches  |              |
+-------------+--------------+
| os stats    |              |
+-------------+--------------+
| server hw   | yes          |
+-------------+--------------+
| server os   | yes          |
+-------------+--------------+
| san arrays  | yes          |
+-------------+--------------+
| san switch  | yes          |
+-------------+--------------+
| networker   | yes          |
| index       |              |
+-------------+--------------+

Mac OS X
--------

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+-------------------+
| resources   | | ip              |
|             | | fs              |
|             | | sync            |
+-------------+-------------------+
| containers  | | vbox            |
|             | | docker instance |
|             | | docker service  |
+-------------+-------------------+
| scsi        | no                |
| persistent  |                   |
| reservation |                   |
+-------------+-------------------+
| rsync on    | n/a               |
| snap        |                   |
+-------------+-------------------+
| delta       | n/a               |
| replication |                   |
+-------------+-------------------+
| HA plugin   | not tested        |
+-------------+-------------------+
| IPv6        | yes               |
+-------------+-------------------+
| Per-service | no                |
| resource    |                   |
| capping     |                   |
+-------------+-------------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+--------------+
| network     | yes          |
+-------------+--------------+
| disks       | yes          |
+-------------+--------------+
| os packages | yes          |
+-------------+--------------+
| os patches  |              |
+-------------+--------------+
| os stats    |              |
+-------------+--------------+
| server hw   | yes          |
+-------------+--------------+
| server os   | yes          |
+-------------+--------------+
| san arrays  | yes          |
+-------------+--------------+
| san switch  | yes          |
+-------------+--------------+
| networker   | yes          |
| index       |              |
+-------------+--------------+

Tru64
-----

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+------------+
| resources   | | ip       |
|             | | fs       |
|             | | sync     |
+-------------+------------+
| containers  |            |
+-------------+------------+
| scsi        | yes        |
| persistent  | (scu)      |
| reservation |            |
+-------------+------------+
| rsync on    | advfs      |
| snap        | clonefset  |
+-------------+------------+
| delta       | n/a        |
| replication |            |
+-------------+------------+
| HA plugin   | not tested |
+-------------+------------+
| IPv6        | not tested |
+-------------+------------+
| Per-service | no         |
| resource    |            |
| capping     |            |
+-------------+------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+------------+
| network     | yes        |
+-------------+------------+
| disks       | yes        |
+-------------+------------+
| os packages | yes        |
+-------------+------------+
| os patches  | yes        |
+-------------+------------+
| os stats    |            |
+-------------+------------+
| server hw   | yes        |
+-------------+------------+
| server os   | yes        |
+-------------+------------+
| san arrays  | yes        |
+-------------+------------+
| san switch  | yes        |
+-------------+------------+
| networker   | yes        |
| index       |            |
+-------------+------------+

Windows
-------

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+------------+
| resources   |            |
+-------------+------------+
| containers  |            |
+-------------+------------+
| scsi        |            |
| persistent  |            |
| reservation |            |
+-------------+------------+
| rsync on    |            |
| snap        |            |
+-------------+------------+
| delta       |            |
| replication |            |
+-------------+------------+
| HA plugin   |            |
+-------------+------------+
| IPv6        |            |
+-------------+------------+
| Per-service |            |
| resource    |            |
| capping     |            |
+-------------+------------+

Inventories
+++++++++++

.. rst-class:: fullwidth

+-------------+------------+
| network     | yes        |
+-------------+------------+
| disks       | yes        |
+-------------+------------+
| os packages | yes        |
+-------------+------------+
| os patches  | yes        |
+-------------+------------+
| os stats    |            |
+-------------+------------+
| server hw   | yes        |
+-------------+------------+
| server os   | yes        |
+-------------+------------+
| san arrays  |            |
+-------------+------------+
| san switch  |            |
+-------------+------------+
| networker   |            |
| index       |            |
+-------------+------------+

Virtualization
==============

.. rst-class:: fullwidth

+----------------+----------------+-----------------+
| Virtualization | Host operating | Guest operating |
| technology     | systems        | systems         |
+================+================+=================+
| lxc            | | Linux        | | Linux         |
+----------------+----------------+-----------------+
| vz             | | Linux        | | Linux         |
+----------------+----------------+-----------------+
| docker         | | Linux        | | Linux         |
+----------------+----------------+-----------------+
| jail           | | FreeBSD      | | FreeBSD       |
+----------------+----------------+-----------------+
| zone           | | Solaris      | | Solaris       |
|                | | Solaris      | | Solaris       |
|                |   Express      |   Express       |
+----------------+----------------+-----------------+
| kvm            | | Linux        | | Linux         |
|                |                | | FreeBSD       |
|                |                | | Solaris       |
|                |                | | Solaris       |
|                |                |   Express       |
|                |                | | Windows       |
+----------------+----------------+-----------------+
| xen            | | Linux        | | Linux         |
|                | | Solaris      | | FreeBSD       |
|                |   Express      | | Solaris       |
|                |                | | Solaris       |
|                |                |   Express       |
|                |                | | Windows       |
+----------------+----------------+-----------------+
| esx            | | ESX (Linux)  | | Linux         |
|                |                | | FreeBSD       |
|                |                | | Solaris       |
|                |                | | Solaris       |
|                |                |   Express       |
|                |                | | Windows       |
+----------------+----------------+-----------------+
| ovm            | | Linux        | | Linux         |
|                |                | | FreeBSD       |
|                |                | | Solaris       |
|                |                | | Solaris       |
|                |                |   Express       |
|                |                | | Windows       |
+----------------+----------------+-----------------+
| hpvm           | | HP-UX        | | HP-UX         |
|                |                | | Linux         |
|                |                | | FreeBSD       |
|                |                | | Windows       |
+----------------+----------------+-----------------+
| srp            | | HP-UX        | | HP-UX         |
+----------------+----------------+-----------------+
| ldom           | | Solaris on   | | Solaris       |
|                |   T-series     | | Solaris       |
|                |                |   Express       |
|                |                | | Linux         |
|                |                | | FreeBSD       |
+----------------+----------------+-----------------+
| vbox           | | Linux        | | Linux         |
|                | | Solaris      | | FreeBSD       |
|                | | Mac OS X     | | Solaris       |
|                |                | | Solaris       |
|                |                |   Express       |
|                |                | | Windows       |
+----------------+----------------+-----------------+

Data replication
================

.. rst-class:: fullwidth

+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Replication    | Commands       | Sync/Async   |Transport        | Trigger     | Cluster mode    |
|                |                | (typical     |                 |             |                 |
|                |                | period)      |                 |             |                 |
+================+================+==============+=================+=============+=================+
| Rsync          | | syncnodes    | Asynchronous | | ip            | | scheduled | | local         |
|                | | syncdrp      | (hours)      |                 | | on-demand | | multi-site    |
|                | | syncall      |              |                 |             | | cluster       |
|                |                |              |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Netapp         | | syncquiesce  | Asynchronous | | iscsi         | | scheduled | | local         |
| snapmirror     | | syncresume   | (seconds)    | | fc            | | on-demand | | multi-site    |
|                | | syncupdate   |              | | ip (nfs, smb) |             |                 |
|                | | syncbreak    |              |                 |             | | disaster      |
|                | | syncresync   |              |                 |             |   recovery      |
|                | | syncswap     |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Symmetrix      | | syncbreak    | Synchronous  | | fc            | | on-demand | | local         |
| SRDF-S         | | syncresume   |              |                 | | start on  | | multi-site    |
|                | | syncswap     |              |                 |   R2-side   |                 |
|                |                |              |                 |   nodes     | | disaster      |
|                |                |              |                 |             |   recovery      |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| HP 3Par        | | syncupdate   | Synchronous  | | fc            | | scheduled | | local         |
| Remote Copy    | | syncbreak    | or           |                 | | on-demand | | multi-site    |
|                | | syncresume   | Asynchronous |                 |             |                 |
|                | | syncswap     | (seconds)    |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Datacore       | | syncresume   | Asynchronous | | fc            | | scheduled | | local         |
| replication    | | syncupdate   | (seconds)    | | iscsi         | | on-demand | | multi-site    |
|                | | syncbreak    |              |                 |             | | cluster       |
|                |                |              |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Dds            | | syncfullsync | Asynchronous | | ip            | | scheduled | | local         |
|                | | syncupdate   | (minutes)    |                 | | on-demand | | multi-site    |
|                | | syncverify   |              |                 |             |                 |
|                |                |              |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Drbd           | | start        | Synchronous  | | ip            | | scheduled | | local         |
|                | | stop         | or           |                 | | on-demand | | multi-site    |
|                | | startstandby | Asynchronous |                 | | Primary / | | cluster       |
|                |                | (seconds)    |                 |   Primary   | | disaster      |
|                |                |              |                 | | Primary / |   recovery      |
|                |                |              |                 |   Secondary |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Zfs            | | syncnodes    | Asynchronous | | ip            | | scheduled | | local         |
|                | | syncdrp      | (minutes)    |                 | | on-demand | | multi-site    |
|                | | syncall      |              |                 |             | | cluster       |
|                | | syncupdate   |              |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Btrfs          | | syncnodes    | Asynchronous | | ip            | | scheduled | | local         |
|                | | syncdrp      | (minutes)    |                 | | on-demand | | multi-site    |
|                | | syncall      |              |                 |             | | disaster      |
|                | | syncfullsync |              |                 |             |   recovery      |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Docker images  | | syncnodes    | Asynchronous | | ip            | | scheduled | | local         |
|                | | syncdrp      | (minutes)    |                 | | on-demand | | multi-site    |
|                | | syncall      |              |                 |             | | disaster      |
|                |                |              |                 |             |   recovery      |
|                |                |              |                 |             | | cluster       |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Symmetrix      | | syncbreak    |              | | fc            | | scheduled | | local         |
| clone          | | syncresync   |              |                 | | on-demand |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| HP EVA snap    | | syncresync   |              | | fc            | | scheduled | | local         |
|                |                |              |                 | | on-demand |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Datacore snap  | | syncresync   |              | | fc            | | scheduled | | local         |
|                |                |              | | iscsi         | | on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| IBM DS8xxx     | | syncresync   |              | | fc            | | scheduled | | local         |
| snap           |                |              |                 | | on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| NEC ISM, Bull  | | syncresync   |              | | fc            | | scheduled | | local         |
| Optima snap    |                |              |                 | | on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Ceph RADOS     | | syncresync   |              | | ip            | | scheduled | | local         |
| snap           |                |              |                 | | on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+

.. rubric:: Footnotes

.. [#f1] Multipaths with queue_if_no_path active are not supported for clustered services, patches coming.
.. [#f2] With dsf devices.


