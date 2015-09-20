Feature Matrices
****************

Service management features by operating system
===============================================

+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| Feature     | Linux          | Solaris       | HP-UX         | AIX           | FreeBSD      | Mac OS X     | Tru64      | Windows    |
+=============+================+===============+===============+===============+==============+==============+============+============+
| resources   | * ip           | * ip          | * ip          | * ip          | * ip         | * ip         | * ip       |            |
|             | * loop         | * lofs        | * fs          | * fs          | * md         | * fs         | * fs       |            |
|             | * fs           | * zfs pool    | * vg          | * namefs      | * fs         | * sync       | * sync     |            |
|             | * bind mounts  | * veritas vg  | * sync        | * sync        | * nullfs     |              |            |            |
|             | * lvm2 vg      | * sync        |               | * vg          | * zfs pool   |              |            |            |
|             | * veritas vg   |               |               |               | * sync       |              |            |            |
|             | * sync         |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| containers  | * lxc          | * zone        | * hpvm        |               | * jail       | * vbox       |            |            |
|             | * openvz       | * ldom        | * srp         |               |              |              |            |            |
|             | * xen          | * xen         |               |               |              |              |            |            |
|             | * kvm          | * vbox        |               |               |              |              |            |            |
|             | * vbox         |               |               |               |              |              |            |            |
|             | * ovm          |               |               |               |              |              |            |            |
|             | * esx          |               |               |               |              |              |            |            |
|             | * docker       |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| scsi        | yes [#f1]_     | yes           | yes [#f2]_    | no            | yes          | no           | yes        |            |
| persistent  | (sg_persist)   | (sg_persist)  | (scu)         |               | (sg_persist) |              | (scu)      |            |
| reservation |                |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| rsync on    | lvm2 snaps     | zfs snaps     | vxfs snaps    | jfs2 snaps    | zfs snaps    | n/a          | advfs      |            |
| snap        |                |               | on lv         | on lv         |              |              | clonefset  |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| delta       | dds            | zfs           | n/a           | n/a           | zfs          | n/a          | n/a        |            |
| replication |                | send/recv     |               |               | send/recv    |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| HA plugin   | * openha       | openha        | openha        | not tested    | not tested   | not tested   | not tested |            |
|             | * heartbeatd   |               |               |               |              |              |            |            |
|             | * keepalived   |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| IPv6        | yes            | yes           | yes           | yes           | yes          | yes          | not tested |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| Per-service | yes (cgroup)   | no            | no            | no            | no           | no           | no         |            |
| resource    |                |               |               |               |              |              |            |            |
| capping     |                |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+

.. rubric:: Footnotes

.. [#f1] Multipaths with queue_if_no_path active are not supported for clustered services, patches coming.
.. [#f2] With dsf devices.

Inventory features by operating system
======================================

+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| Inventory   | Linux          | Solaris       | HP-UX         | AIX           | FreeBSD      | Mac OS X     | Tru64      | Windows    |
+=============+================+===============+===============+===============+==============+==============+============+============+
| network     | yes            | yes           | yes           | yes           | yes          | yes          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| disks       | yes            | yes           | yes           | yes           | yes          | yes          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| os packages | yes            | yes           | yes           | yes           | yes          | yes          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| os patches  | n/a            | yes           | yes           | yes           | n/a          | n/a          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| os stats    | yes            | yes           | yes           | yes           | no           | no           | no         | no         |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| server hw   | yes            | yes           | yes           | yes           | yes          | yes          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| server os   | yes            | yes           | yes           | yes           | yes          | yes          | yes        | yes        |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| san arrays  | yes            | yes           | yes           | yes           | yes          | yes          | yes        | no         |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| san switch  | yes            | yes           | yes           | yes           | yes          | yes          | yes        | no         |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+
| networker   | yes            | yes           | yes           | yes           | yes          | yes          | yes        | no         |
| index       |                |               |               |               |              |              |            |            |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+------------+------------+

Host and guest operating systems by virtualization product
==========================================================

+----------------+----------------+-----------------+
| Virtualization | Host operating | Guest operating |
| technology     | systems        | systems         |
+================+================+=================+
| lxc            | * Linux        | * Linux         |
+----------------+----------------+-----------------+
| vz             | * Linux        | * Linux         |
+----------------+----------------+-----------------+
| docker         | * Linux        | * Linux         |
+----------------+----------------+-----------------+
| jail           | * FreeBSD      | * FreeBSD       |
+----------------+----------------+-----------------+
| zone           | * Solaris      | * Solaris       |
|                | * Solaris      | * Solaris       |
|                |   Express      |   Express       |
+----------------+----------------+-----------------+
| kvm            | * Linux        | * Linux         |
|                |                | * FreeBSD       |
|                |                | * Solaris       |
|                |                | * Solaris       |
|                |                |   Express       |
|                |                | * Windows       |
+----------------+----------------+-----------------+
| xen            | * Linux        | * Linux         |
|                | * Solaris      | * FreeBSD       |
|                |   Express      | * Solaris       |
|                |                | * Solaris       |
|                |                |   Express       |
|                |                | * Windows       |
+----------------+----------------+-----------------+
| esx            | * ESX (Linux)  | * Linux         |
|                |                | * FreeBSD       |
|                |                | * Solaris       |
|                |                | * Solaris       |
|                |                |   Express       |
|                |                | * Windows       |
+----------------+----------------+-----------------+
| ovm            | * Linux        | * Linux         |
|                |                | * FreeBSD       |
|                |                | * Solaris       |
|                |                | * Solaris       |
|                |                |   Express       |
|                |                | * Windows       |
+----------------+----------------+-----------------+
| hpvm           | * HP-UX        | * HP-UX         |
|                |                | * Linux         |
|                |                | * FreeBSD       |
|                |                | * Windows       |
+----------------+----------------+-----------------+
| srp            | * HP-UX        | * HP-UX         |
+----------------+----------------+-----------------+
| ldom           | * Solaris on   | * Solaris       |
|                |   T-series     | * Solaris       |
|                |                |   Express       |
|                |                | * Linux         |
|                |                | * FreeBSD       |
+----------------+----------------+-----------------+
| vbox           | * Linux        | * Linux         |
|                | * Solaris      | * FreeBSD       |
|                | * Mac OS X     | * Solaris       |
|                |                | * Solaris       |
|                |                |   Express       |
|                |                | * Windows       |
+----------------+----------------+-----------------+

Supported data replication modes
================================

+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Replication    | Commands       | Sync/Async   |Transport        | Trigger     | Cluster mode    |
|                |                | (typical     |                 |             |                 |
|                |                |  period)     |                 |             |                 |
+================+================+==============+=================+=============+=================+
| Rsync          | * syncnodes    | Asynchronous | * ip            | * scheduled | * local         |
|                | * syncdrp      | (hours)      |                 | * on-demand | * multi-site    |
|                | * syncall      |              |                 |             | * cluster       |
|                |                |              |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Netapp         | * syncquiesce  | Asynchronous | * iscsi         | * scheduled | * local         |
| snapmirror     | * syncresume   | (seconds)    | * fc            | * on-demand | * multi-site    |
|                | * syncupdate   |              | * ip (nfs, smb) |             |                 |
|                | * syncbreak    |              |                 |             | * disaster      |
|                | * syncresync   |              |                 |             |   recovery      |
|                | * syncswap     |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Symmetrix      | * syncbreak    | Synchronous  | * fc            | * on-demand | * local         |
| SRDF-S         | * syncresume   |              |                 | * start on  | * multi-site    |
|                | * syncswap     |              |                 |   R2-side   |                 |
|                |                |              |                 |   nodes     | * disaster      |
|                |                |              |                 |             |   recovery      |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| HP 3Par        | * syncupdate   | Synchronous  | * fc            | * scheduled | * local         |
| Remote Copy    | * syncbreak    | or           |                 | * on-demand | * multi-site    |
|                | * syncresume   | Asynchronous |                 |             |                 |
|                | * syncswap     | (seconds)    |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Datacore       | * syncresume   | Asynchronous | * fc            | * scheduled | * local         |
| replication    | * syncupdate   | (seconds)    | * iscsi         | * on-demand | * multi-site    |
|                | * syncbreak    |              |                 |             | * cluster       |
|                |                |              |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Dds            | * syncfullsync | Asynchronous | * ip            | * scheduled | * local         |
|                | * syncupdate   | (minutes)    |                 | * on-demand | * multi-site    |
|                | * syncverify   |              |                 |             |                 |
|                |                |              |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Drbd           | * start        | Synchronous  | * ip            | * scheduled | * local         |
|                | * stop         | or           |                 | * on-demand | * multi-site    |
|                | * startstandby | Asynchronous |                 | * Primary / | * cluster       |
|                |                | (seconds)    |                 |   Primary   | * disaster      |
|                |                |              |                 | * Primary / |   recovery      |
|                |                |              |                 |   Secondary |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Zfs            | * syncnodes    | Asynchronous | * ip            | * scheduled | * local         |
|                | * syncdrp      | (minutes)    |                 | * on-demand | * multi-site    |
|                | * syncall      |              |                 |             | * cluster       |
|                | * syncupdate   |              |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Btrfs          | * syncnodes    | Asynchronous | * ip            | * scheduled | * local         |
|                | * syncdrp      | (minutes)    |                 | * on-demand | * multi-site    |
|                | * syncall      |              |                 |             | * disaster      |
|                | * syncfullsync |              |                 |             |   recovery      |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Docker images  | * syncnodes    | Asynchronous | * ip            | * scheduled | * local         |
|                | * syncdrp      | (minutes)    |                 | * on-demand | * multi-site    |
|                | * syncall      |              |                 |             | * disaster      |
|                |                |              |                 |             |   recovery      |
|                |                |              |                 |             | * cluster       |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Symmetrix      | * syncbreak    |              | * fc            | * scheduled | * local         |
| clone          | * syncresync   |              |                 | * on-demand |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| HP EVA snap    | * syncresync   |              | * fc            | * scheduled | * local         |
|                |                |              |                 | * on-demand |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Datacore snap  | * syncresync   |              | * fc            | * scheduled | * local         |
|                |                |              | * iscsi         | * on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| IBM DS8xxx     | * syncresync   |              | * fc            | * scheduled | * local         |
| snap           |                |              |                 | * on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| NEC ISM, Bull  | * syncresync   |              | * fc            | * scheduled | * local         |
| Optima snap    |                |              |                 | * on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+
| Ceph RADOS     | * syncresync   |              | * ip            | * scheduled | * local         |
| snap           |                |              |                 | * on-demand |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
|                |                |              |                 |             |                 |
+----------------+----------------+--------------+-----------------+-------------+-----------------+

