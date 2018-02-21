Solaris
-------

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+------------------------+
| resources   | | ip                   |
|             | | lofs                 |
|             | | zfs pool             |
|             | | veritas vg           |
|             | | sync                 |
+-------------+------------------------+
| containers  | | zone                 |
|             | | ldom                 |
|             | | xen                  |
|             | | vbox                 |
+-------------+------------------------+
| scsi        | | yes (sg_persist)     |
| persistent  |                        |
| reservation |                        |
+-------------+------------------------+
| rsync on    | | zfs snaps            |
| snap        |                        |
+-------------+------------------------+
| delta       | | zfs send/recv        |
| replication |                        |
+-------------+------------------------+
| IPv6        | | yes                  |
+-------------+------------------------+
| Per-service | | no                   |
| resource    |                        |
| capping     |                        |
+-------------+------------------------+

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


