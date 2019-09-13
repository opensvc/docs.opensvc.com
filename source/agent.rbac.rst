.. _agent.rbac:

Role-Based Access Control
*************************

Clusters accessed via their agents secure socket require authentication, and a Role-Based Access Crontrol is applied to the API requests.

A user's privileges are described in the ``grant`` keyword of the ``usr`` object. The value is a whitespace-separated list of grant expressions.

Each grant expression can be:

* A cluster-wide role
* A namespace-limited role coupled to a namespace glob
  Example: ``guest:prod* admin:test*``

Cluster Roles
=============

root
----

All privileges.

This role is required to deploy and update non-containerized services.

.. note:: A user granted root has sufficient privilege to read and change system's files and execute commands as the root system user.

squatter
--------

A user granted the squatter role can create new namespaces.

When a new namespace is created, the namespace admin role is automatically granted to its squatter.

The ``system`` namespace is not squattable.

blacklistadmin
--------------

A user granted the blacklistadmin role can clear the client blacklist.

Example:

::

	om daemon blacklist clear --node '*'

heartbeat
---------

A user granted the heartbeat role can use the relay_status, relay_tx and relay_rx api handlers.
A relay-type heartbeat of a cluster can authenticate on a foreign OpenSVC daemon with a user granted this role.

Example:

::

	om daemon relay status --node relay.opensvc.com

Namespace Roles
===============

guest
-----

Can list objects, read status and configurations.

operator
--------

Inherit guest privileges.

Can call:

* set services and volumes target state to:

	* thawed
	* frozen
	* started
	* stopped
	* aborted
	* placed
	* shutdown

* execute the CRM-level actions:

	* clear
	* disable
	* enable
	* freeze
	* push_status
	* push_resinfo
	* push_config
	* push_encap_config
	* presync
	* prstatus
	* resource_monitor
	* restart
	* resync
	* run
	* scale
	* snooze
	* start
	* startstandby
	* status
	* stop
	* stopstandby
	* thaw
	* unsnooze

* wake the monitor thread


admin
-----

Inherit guest and operator privileges.
Can execute any action in the namespace, notably: deploy and purge.

Volumes deployment by configuration injection is not allowed. Use volume resources in services to express the volume requirements, so the service provision can provision the volumes if necessary.

Unautorized in deployed configurations:

* non-containerized resources

	* ip other than ip.cni
	* container other than container.docker and container.podman
	* task other than task.docker and task.podman
	* share, fs, disk, sync (use volumes instead)
	* app (use container)
	* triggers (use detach=false containers instead)

* host paths in keyword values. Use volume-relative paths instead.
* netns=host
* privileged=true
* give grant that the requester does have
* change a usr object cn
* monitor_action value other than freezestop and switch

