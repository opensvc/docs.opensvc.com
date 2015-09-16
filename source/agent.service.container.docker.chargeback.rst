Docker Chargeback
=================

Actually, OpenSVC collector chargeback features are not really specific to docker usage, but just herited from the way the collector works :

* OpenSVC service is explicity tagged with the ``app`` keyword (HRAPP, SALES, RESEARCH, ITAPP1, ...), which is used to identify who is responsible for this service, and who is billable
* As `OpenSVC collector <collector.introduction.html>`_ is fed from agents knowledge, it maintains an up to date inventory of :

  * physical servers/hypervisors (nodes), which can be tagged with a project code
  * OpenSVC services 
  * Resources used per service (nodes, drpnodes, ip, disks, vg, filesystems, containers, applications, ...)

All those aggregated informations provide billing views for storage capacity and backup resources consumption.
Specific needs can be adressed by a csv export, allowing the creation of pivot tables like :

* services with docker containers, per node
* services with docker containers, per application
* services with docker containers, per application, per datacenter, ...

.. note:: lots of criteria are available in the OpenSVC collector database, allowing complex data filtering for pivot tables
