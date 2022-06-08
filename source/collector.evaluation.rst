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
This agent does not need to be registered on the ``collector.opensvc.com`` collector.

The agent installation instructions are accessible at https://docs.opensvc.com/agent.install.html.

Exposing the collector service needs either a dedicated ip address, or a cluster gateway.

Proxies and firewalls
+++++++++++++++++++++

HTTPS access should be allowed for:

* collector.opensvc.com (registry JWT auth)
* www.opensvc.com (evaluation license agreement download, provisioning template)

Docker registry access
++++++++++++++++++++++

The installation procedure requires a collector.opensvc.com account, which is free to create, to pull the collector docker images from registry.opensvc.com because this registry delegates the authentication to collector.opensvc.com.

The register form is at https://collector.opensvc.com/init/default/user/register.

Login to the OpenSVC registry

::

	# sudo docker login registry.opensvc.com
	Username: <your collector login>
	Password: <your collector password>

Verify

::

	# sudo docker search registry.opensvc.com/opensvc
	INDEX         NAME                                            DESCRIPTION   STARS     OFFICIAL   AUTOMATED
	opensvc.com   registry.opensvc.com/opensvc/collector_db                     0                    
	opensvc.com   registry.opensvc.com/opensvc/collector_nginx                  0                    
	opensvc.com   registry.opensvc.com/opensvc/collector_redis                  0                    
	opensvc.com   registry.opensvc.com/opensvc/collector_web2py                 0                    
	...

Installation
************


::

	# om eval/svc/collector deploy --config https://www.opensvc.com/init/static/templates/collector.conf


The database still bootstraps for a few minutes after this command exits. An error page can be displayed in the browser while this bootstrap runs.

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

End of evaluation
*****************

Clean up the service and data volume using the command

::

	# om 'eval/*/collector' purge

