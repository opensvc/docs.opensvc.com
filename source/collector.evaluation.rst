Collector evaluation
====================

The evaluation license is accessible at http://www.opensvc.com/init/views/evaluation_license.txt.


Prerequisites
*************

System
++++++

* The provisioning template is made for a Linux system supporting btrfs, ext4 and docker 1.8+.
* 12 GB available in a single mounted writeable filesystem.
* sudo rules to execute opensvc agent commands as root.
* A configured bridge, either backend or frontend depending on the desired evaluation collector visibility.
* A free ip address useable on the bridge, either routable or non-routable depending on the desired evaluation collector visibility.

OpenSVC agent
+++++++++++++

The OpenSVC must be installed, as the provisioning method exposed here creates a OpenSVC service.
This agent does not need registering on the collector.opensvc.com collector.

The agent installation instructions are accessible at http://docs.opensvc.com/agent.install.html.
Agent packages are available at http://repo.opensvc.com.

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


Interactive method::

	# sudo svcmgr -s collector_eval create \
		--template https://www.opensvc.com/init/static/eval/opensvc.collector.template \
		--provision \
		--interactive

Or non-interactive method::

	# sudo svcmgr -s collector_eval create \
		--template https://www.opensvc.com/init/static/eval/opensvc.collector.template \
		--env accept_license=yes \
		--env ipaddr=<ipaddr> \
		--env netmask=<netmask> \
		--env gateway=<gateway> \
		--env bridge=<bridge interface> \
		--env datafile_dir=/srv \
		--provision

The database still bootstraps for a few minutes after this command exits. An error page can be displayed in the browser while this bootstrap runs.

First steps
***********

The default administrator account is root@localhost.localdomain with the opensvc password.

You can now:

* register the agent on this collector, using instructions at http://docs.opensvc.com/agent.install.html.
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

Clean up the service and all data using the command

::

	# sudo svcmgr -s collector_eval delete --unprovision
