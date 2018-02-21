Linux
-----

Service Management
++++++++++++++++++

.. rst-class:: fullwidth

+-------------+------------------------------+
| resources   | | ip                         |
|             | | loop                       |
|             | | fs                         |
|             | | bind mounts                |
|             | | lvm2 vg                    |
|             | | veritas vg                 |
|             | | sync                       |
+-------------+------------------------------+
| containers  | | lxc                        |
|             | | openvz                     |
|             | | xen                        |
|             | | kvm                        |
|             | | vbox                       |
|             | | ovm                        |
|             | | esx                        |
|             | | docker instance            |
|             | | docker service             |
+-------------+------------------------------+
| scsi        | | yes [#f1]_ (sg_persist)    |
| persistent  |                              |
| reservation |                              |
+-------------+------------------------------+
| rsync on    | | lvm2 snaps                 |
| snap        |                              |
+-------------+------------------------------+
| delta       | | dds                        |
| replication |                              |
+-------------+------------------------------+
| IPv6        | | yes                        |
+-------------+------------------------------+
| Per-service | | yes (cgroup)               |
| resource    |                              |
| capping     |                              |
+-------------+------------------------------+

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



