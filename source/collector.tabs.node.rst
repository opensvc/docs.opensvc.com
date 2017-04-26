Node tabs
---------

properties
++++++++++

.. figure:: _static/doc_collector_node_tabs.png

Asset information can be loaded from a tiers enterprise asset manager or filled-in manually.

stats
+++++

Generate and display graphs of performance metrics on the user-selected time range. The metrics are gathered daily from tools like glance and sar running on the nodes. The opensvc agent pushes this information to database.

Metrics collection depend on the operating system. Some of them are:

*   cpu: usr, sys, wait, irq, guest, steal, idle, nice, iowait, soft

*   mem: commit, free, used by usr, buffer, cache, sys

*   swap: free, used, used but cached

*   load: avg1, avg5, avg15, runq size, proc list size

*   all-disks: io/s, bandwidth

*   per-disk: io/s, request size, wait time, service time, %util, bandwidth

Compliance
++++++++++

Displays:

* The current per-module compliance status of the node
* The node rulesets and modulesets attachments
* Compliance alerts details

Wiki
++++

A wiki page the node responsibles can use to share information about the node.

