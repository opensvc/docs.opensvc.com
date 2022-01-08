Collector evaluation
====================

The evaluation license is accessible at https://www.opensvc.com/init/static/eval/evaluation_agreement.txt.


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

This agent does not need to be registered on the ``collector.opensvc.com`` collector.

The agent installation instructions are accessible at https://docs.opensvc.com/agent.install.html.

Exposing the collector service needs either a dedicated ip address, or a cluster gateway.

Proxies and firewalls
+++++++++++++++++++++

HTTPS access should be allowed for:

* collector.opensvc.com (registry JWT auth)
* www.opensvc.com (evaluation license agreement download, provisioning template)


Installation
************

The collector installation is described at https://github.com/opensvc/opensvc_templates/tree/main/collector.

The database still bootstraps for a few seconds after this command exits. An error page can be displayed in the browser while this bootstrap runs.

First steps
***********

The default administrator account is root@localhost.localdomain with the opensvc password.

You can now:

* register the agent on this collector, using instructions at https://docs.opensvc.com/latest/agent.install.html.
* changes default passwords.
* add new users, remove the default admin user
* import compliance designs
* import provisioning templates
* provision a docker private registry service delegating auth to this new collector.
* provision a PowerDNS service serving the collector-maintained zones.

Enjoy the experience, and send feedback to support@opensvc.com.

Contact sales@opensvc.com for meetings, support, training, production licenses.

End of evaluation
*****************

Clean up the service and data volume using the command

::

	# om 'eval/*/collector' purge

