LDAP and Active Directory authentication and permission
=======================================================

The OpenSVC collector can delegate authentication to a tiers LDAP server, and map LDAP groups to local groups. If configured to do so, no user and group management is necessary on the collector.

Login process
-------------

* The user is presented a login form prompting for a user name instead of the default user email, and a password
* The user (username, password) tuple is passed for authentication to the LDAP server
* The LDAP server validates the tuple
* The collector does not store the password
* If the user does not exist locally it is created
* If the first name, last name and email properties are found on the LDAP, this information is also stored locally

If group management is activated and configured, the process continues:

* The collector fetches the user's groups from the LDAP server
* If a group mapping is configured, the LDAP group names are replaced with local group names
* Missing groups are created
* The user is added to all LDAP user's groups, or remapped LDAP user's groups

Configuration
-------------

The collector configuration file is ``init/modules/config.py``

User authentication
+++++++++++++++++++

::

	ldap_mode = "ad"
	ldap_server = "ad.my.corp.com"
	ldap_bind_dn = "CN=admin,OU=IT,OU=Service accounts,OU=Users,OU=Managed objects,DC=ad,DC=mycorp,DC=com"
	ldap_bind_pw = "mysecret"
	ldap_base_dn = "DC=ad,DC=mycorp,DC=com"

Group management
++++++++++++++++

::

	ldap_manage_groups = True
	ldap_group_dn = "OU=Applications,OU=Groups,OU=Managed objects,DC=ad,DC=mycorp,DC=com"
	ldap_group_member_attrib = "member"
	ldap_allowed_groups = ["OPENSVC_ADMIN", "OPENSVC_CONSULTATION", "OPENSVC_EP", "OPENSVC_DBA"]

	ldap_group_mapping = {
	 "OPENSVC_ADMIN": ["OPENSVC_ADMIN", "Manager", "CompManager", "NodeManager", "CheckManager", "CompExec", "ObsManager", "NetworkManager", "DnsManager", "StorageManager", "StorageExec", "ProvisioningManager", "CheckExec", "FormsManager", "CheckRefresh", "TagManager", "SafeUploader", "NodeExec", "UserManager", "Everybody"],
	 "OPENSVC_RO": ["OPENSVC_RO", "Everybody"],
	 "OPENSVC_DBA": ["OPENSVC_DBA", "Everybody"],
	}


Logging
-------

The login module logs in the web2py.log file.

Example::

	2016-03-18 13:47:15,128 - web2py.auth.ldap_auth - DEBUG - Ldap bind connect...
	2016-03-18 13:47:15,134 - web2py.auth.ldap_auth - DEBUG - User groups: ['OPENSVC_ADMIN']
	2016-03-18 13:47:15,134 - web2py.auth.ldap_auth - INFO - [ad.my.corp.com] Initialize ldap connection
	2016-03-18 13:47:15,148 - web2py.auth.ldap_auth - INFO - [Opensvc] Manage user data
	2016-03-18 13:47:15,149 - web2py.auth.ldap_auth - INFO - [Opensvc] Manage user groups
	2016-03-18 13:47:15,149 - web2py.auth.ldap_auth - INFO - [Opensvc] Get user groups from ldap
	2016-03-18 13:47:15,149 - web2py.auth.ldap_auth - INFO - [ad.my.corp.com] Initialize ldap connection
	2016-03-18 13:47:15,150 - web2py.auth.ldap_auth - DEBUG - Username init: [Opensvc]
	2016-03-18 13:47:15,156 - web2py.auth.ldap_auth - DEBUG - Ldap bind connect...
	2016-03-18 13:47:15,162 - web2py.auth.ldap_auth - DEBUG - User groups: ['OPENSVC_ADMIN']

