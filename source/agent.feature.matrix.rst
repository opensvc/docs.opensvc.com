Feature Matrices
****************

Features by operating system
============================

+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| Feature     | Linux          | Solaris       | HP-UX         | AIX           | FreeBSD      | Mac OS X     |
+=============+================+===============+===============+===============+==============+==============+
| resources   | * ip           | * ip          | * ip          | * ip          | * ip         | * ip         |
|             | * loop         | * lofs        | * fs          | * fs          | * md         | * fs         |
|             | * fs           | * zfs pool    | * vg          | * namefs      | * fs         | * sync       |
|             | * bind mounts  | * veritas vg  | * sync        | * sync        | * nullfs     |              |
|             | * lvm2 vg      | * sync        |               |               | * zfs pool   |              |
|             | * veritas vg   |               |               |               | * sync       |              |
|             | * sync         |               |               |               |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| containers  | * lxc          | * zone        | * hpvm        |               | * jail       | * vbox       |
|             | * openvz       | * ldom        |               |               |              |              |
|             | * xen          | * xen         |               |               |              |              |
|             | * kvm          | * vbox        |               |               |              |              |
|             | * vbox         |               |               |               |              |              |
|             | * ovm          |               |               |               |              |              |
|             | * esx          |               |               |               |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| scsi        | yes [#f1]_     | yes           | yes [#f2]_    | no            | yes          | no           |
| persistent  | (sg_persist)   | (sg_persist)  | (scu)         |               | (sg_persist) |              |
| reservation |                |               |               |               |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| rsync on    | lvm2 snaps     | zfs snaps     | vxfs snaps    | jfs2 snaps    | zfs snaps    | n/a          |
| snap        |                |               | on lv         | on lv         |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| delta       | dds            | zfs           | n/a           | n/a           | zfs          | n/a          |
| replication |                | send/recv     |               |               | send/recv    |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| HA plugin   | * openha       | openha        | openha        | not tested    | not tested   | not tested   |
|             | * heartbeatd   |               |               |               |              |              |
|             | * keepalived   |               |               |               |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| IPv6        | yes            | yes           | yes           | yes           | yes          | yes          |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+
| Per-service | yes (cgroup)   | no            | no            | no            | no           | no           |
| resource    |                |               |               |               |              |              |
| capping     |                |               |               |               |              |              |
+-------------+----------------+---------------+---------------+---------------+--------------+--------------+

.. rubric:: Footnotes

.. [#f1] Multipaths with queue_if_no_path active are not supported for clustered services, patches coming.
.. [#f2] With dsf devices.

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

+----------------+----------------+-----------------+-------------+-----------------+
| Replication    | Commands       | Transport       | Trigger     | Cluster mode    |
+================+================+=================+=============+=================+
| Rsync          | * syncnodes    | * ip            | * scheduled | * local         |
|                | * syncdrp      |                 | * on-demand | * multi-site    |
|                | * syncall      |                 |             | * cluster       |
|                |                |                 |             | * disaster      |
|                |                |                 |             |   recovery      |
+----------------+----------------+-----------------+-------------+-----------------+
| Netapp         | * syncquiesce  | * iscsi         | * scheduled |                 |
|                | * syncresume   | * fc            | * on-demand | * multi-site    |
|                | * syncupdate   | * ip (nfs, smb) |             |                 |
|                | * syncbreak    |                 |             | * disaster      |
|                | * syncresync   |                 |             |   recovery      |
|                | * syncswap     |                 |             |                 |
+----------------+----------------+-----------------+-------------+-----------------+
| Symmetrix      | * syncbreak    | * fc            | * scheduled | * local         |
| clone          | * syncresync   |                 | * on-demand |                 |
|                |                |                 |             |                 |
+----------------+----------------+-----------------+-------------+-----------------+
| HP EVA snap    | * syncresync   | * fc            | * scheduled | * local         |
|                |                |                 | * on-demand |                 |
+----------------+----------------+-----------------+-------------+-----------------+
| Dds            | * syncfullsync | * ip            | * scheduled |                 |
|                | * syncupdate   |                 | * on-demand | * multi-site    |
|                | * syncverify   |                 |             |                 |
|                |                |                 |             | * disaster      |
|                |                |                 |             |   recovery      |
+----------------+----------------+-----------------+-------------+-----------------+
| Drbd           | * start        | * ip            | * scheduled | * local         |
|                | * stop         |                 | * on-demand | * multi-site    |
|                | * startstandby |                 | * Primary / | * cluster       |
|                |                |                 |   Primary   | * disaster      |
|                |                |                 | * Primary / |   recovery      |
|                |                |                 |   Secondary |                 |
+----------------+----------------+-----------------+-------------+-----------------+
| Zfs            | * syncnodes    | * ip            | * scheduled | * local         |
|                | * syncdrp      |                 | * on-demand | * multi-site    |
|                | * syncall      |                 |             | * cluster       |
|                | * syncupdate   |                 |             | * disaster      |
|                |                |                 |             |   recovery      |
+----------------+----------------+-----------------+-------------+-----------------+
| Datacore snap  | * syncresync   | * fc            | * scheduled | * local         |
|                |                | * iscsi         | * on-demand |                 |
|                |                |                 |             |                 |
|                |                |                 |             |                 |
|                |                |                 |             |                 |
+----------------+----------------+-----------------+-------------+-----------------+
| Datacore       | * syncresume   | * fc            | * scheduled | * local         |
| replication    | * syncupdate   | * iscsi         | * on-demand | * multi-site    |
|                | * syncbreak    |                 |             | * cluster       |
|                |                |                 |             | * disaster      |
|                |                |                 |             |   recovery      |
+----------------+----------------+-----------------+-------------+-----------------+
