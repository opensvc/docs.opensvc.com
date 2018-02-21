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


