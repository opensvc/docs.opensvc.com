Collector evaluation
====================

Prerequisites
*************

System
++++++

The provisioning template targets a Linux deployment on a server/cluster meeting the following requirements:

* Linux kernel >= 3.8
* 12 GB available in a storage pool
* sudo rules to execute opensvc agent commands as root
* docker >= 1.8

Cluster
+++++++

The OpenSVC agent must be installed, as the provisioning method exposed here creates a OpenSVC service.

The agent installation instructions are accessible at :ref:`agent.install`.

Exposing the collector service needs either a dedicated ip address, or a cluster gateway.

Proxies and firewalls
+++++++++++++++++++++

HTTPS access should be allowed for:

* hub.docker.com (docker images registry)
* www.opensvc.com (provisioning template download)

Installation
************

Follow the instructions at https://github.com/opensvc/opensvc_templates/tree/main/collector.

The database still bootstraps for a few minutes after the deploy command exits. An error page can be displayed in the browser while this bootstrap runs.

First steps
***********

The default administrator account is root@localhost.localdomain with the opensvc password.

You can now:

* register the agent on this collector, using instructions at https://docs.opensvc.com/agent.install.html.
* changes default passwords.
* add new users, remove the default admin user
* import compliance designs
* import provisioning templates
* provision a docker private registry service delegating auth to this new collector.
* provision a PowerDNS service serving the collector-maintained zones.

Enjoy the experience, and send feedback to support@opensvc.com.

Contact sales@opensvc.com for meetings, support, training, production licenses.

