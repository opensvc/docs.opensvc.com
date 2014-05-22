Rulesets
========

This page presents detailled information about rulesets.

Base facts about rulesets :

    * Rules are variable/value pairs exported in the execution environment of the modules.
    * Only members of the 'CompManager' group are allowed to create or edit rulesets
    * A rule value can be complex, for example a json-serialized dictionnary. OpenSVC ships with python objects for you to use in your modules and corresponding collector wizard. These objects use such complex rules without you facing the complexity.
    * Rules are grouped into rulesets.
    * Rulesets can be explicitely attached to nodes or services, or contextually presented to nodes and services through a filterset.
    * Rulesets can be published or not
    * Rulesets can encapsulate other rulesets

Variable names
++++++++++++++

Namespace
^^^^^^^^^

The variable namespace is unique and global.

If you set the same variable name in different rulesets you must ensure these rulesets are not exported the same node or service. If such a collision happen, the collector invalidates the variable by :

* replacing the variable value by ``Duplicate variable removed``
* renaming the variable name as ``XXX_<variable name>_XXX``

Doing so, users can easily detect such design errors and nodes and services are protected from doing checks and fixes based on an unexpected rule.

Automatic prefixing
^^^^^^^^^^^^^^^^^^^

All variable names are prefixed by ``OSVC_COMP_`` by the collector before serving the a requesting agent.
As the agent loads these variables in the session's environment, this prefixing ensures no pre-existing variable can be overwritten.

User assigned variable names
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compliance objects always expect a variable prefix name as its first parameter. Such a prefix starts with ``OSVC_COMP_``, as described above, but the rest of the string is user-defined.

The choice of this user-defined prefix is important as it allows a single call to a compliance object to handle a set of variables, eventually picked in different rulesets.

**Example 1**

A module ``com.opensvc.prereq.support`` calls the ``authkeys`` compliance object with the ``OSVC_COMP_SUPPORT_TEAM_AUTHKEYS_`` prefix:

.. code-block:: sh

        ...
	$PATH_LIB/authkeys.py OSVC_COMP_SUPPORT_TEAM_AUTHKEYS_ check
        ...
	$PATH_LIB/authkeys.py OSVC_COMP_SUPPORT_TEAM_AUTHKEYS_ fix
        ...

A ruleset contextually exports the authkey-class variables ``OSVC_COMP_SUPPORT_TEAM_AUTHKEYS_PRD_[0-9]*`` to the production nodes.
A ruleset contextually exports the authkey-class variables ``OSVC_COMP_SUPPORT_TEAM_AUTHKEYS_DEV_[0-9]*`` to the development nodes.

Fixing this same module on a production node will deploy the ssh public keys of the members of the production support team, but will deploy the ssh public keys of the members of the development support team.

Auto-generated rules
++++++++++++++++++++

The collector auto-generates rules for nodes and services. These rules export data known to the collector about the node or the service.

The variables thus exported can be used,

* for variable substitution in other variable values.
  Example, substitution of the operating system architecture in a repository path to set in the package manager configuration
* to simplify modules code, as the developper does not need to implement the os-specific commands to obtain the information provided by the collector
* to implement condition in the modules based on information usually not available to the node, such as its geolocation or power lines.
  Note, this case is better handled by contextual rulesets.

**osvc_node**

This ruleset is exported to nodes and services.
It contains information about the node where the ``nodemgr compliance ...`` command or the ``svcmgr -s <svcname> compliance ...`` command is executed.

Example content:

.. code-block:: sh

  OSVC_COMP_NODES_ID=578327
  OSVC_COMP_NODES_WARRANTY_END=20150301T00:00:00
  OSVC_COMP_NODES_MAINTENANCE_END=None
  OSVC_COMP_NODES_STATUS=Affected
  OSVC_COMP_NODES_ROLE=Office
  OSVC_COMP_NODES_LISTENER_PORT=1215
  OSVC_COMP_NODES_VERSION=1.5-111
  OSVC_COMP_NODES_ENVIRONNEMENT=DEV
  OSVC_COMP_NODES_HOST_MODE=DEV
  OSVC_COMP_NODES_MEM_BYTES=3865
  OSVC_COMP_NODES_MEM_BANKS=2
  OSVC_COMP_NODES_MEM_SLOTS=4
  OSVC_COMP_NODES_OS_VENDOR=Ubuntu
  OSVC_COMP_NODES_OS_NAME=Linux
  OSVC_COMP_NODES_OS_KERNEL=3.13.0-23-generic
  OSVC_COMP_NODES_OS_RELEASE='14.04 LTS'
  OSVC_COMP_NODES_OS_ARCH=x86_64
  OSVC_COMP_NODES_CPU_FREQ=1300
  OSVC_COMP_NODES_CPU_DIES=1
  OSVC_COMP_NODES_CPU_CORES=2
  OSVC_COMP_NODES_CPU_MODEL='Intel(R) Core(TM) i5-4200U CPU @ 1.60GHz'
  OSVC_COMP_NODES_CPU_VENDOR=Intel
  OSVC_COMP_NODES_TYPE=Laptop
  OSVC_COMP_NODES_NODENAME=clementine
  OSVC_COMP_NODES_FQDN=clementine
  OSVC_COMP_NODES_TEAM_RESPONSIBLE=OpenSVC
  OSVC_COMP_NODES_TEAM_INTEG=OpenSVC
  OSVC_COMP_NODES_TEAM_SUPPORT=OpenSVC
  OSVC_COMP_NODES_PROJECT="OpenSVC staff"
  OSVC_COMP_NODES_SERIAL=1005661700762
  OSVC_COMP_NODES_MODEL=20266
  OSVC_COMP_NODES_LOC_ADDR=None
  OSVC_COMP_NODES_LOC_CITY=None
  OSVC_COMP_NODES_LOC_ZIP=None
  OSVC_COMP_NODES_LOC_RACK=None
  OSVC_COMP_NODES_LOC_FLOOR=None
  OSVC_COMP_NODES_LOC_COUNTRY=None
  OSVC_COMP_NODES_LOC_BUILDING=None
  OSVC_COMP_NODES_LOC_ROOM=None
  OSVC_COMP_NODES_POWER_SUPPLY_NB=None
  OSVC_COMP_NODES_POWER_CABINET1=None
  OSVC_COMP_NODES_POWER_CABINET2=None
  OSVC_COMP_NODES_POWER_PROTECT=None
  OSVC_COMP_NODES_POWER_PROTECT_BREAKER=None
  OSVC_COMP_NODES_POWER_BREAKER1=None
  OSVC_COMP_NODES_POWER_BREAKER2=None
  OSVC_COMP_NODES_UPDATED=20140519T05:02:07
  OSVC_COMP_NODES_ENCLOSURE=None
  OSVC_COMP_NODES_ENCLOSURESLOT=None
  OSVC_COMP_NODES_ASSETNAME=clementine
  OSVC_COMP_NODES_CPU_THREADS=4
  OSVC_COMP_NODES_SEC_ZONE=dmz2
  OSVC_COMP_NODES_HVPOOL=None
  OSVC_COMP_NODES_HVVDC=None
  OSVC_COMP_NODES_HV=None
  OSVC_COMP_NODES_HW_OBS_WARN_DATE=20150601T00:00:00
  OSVC_COMP_NODES_HW_OBS_ALERT_DATE=20150701T00:00:00
  OSVC_COMP_NODES_OS_OBS_WARN_DATE=20170401T00:00:00
  OSVC_COMP_NODES_OS_OBS_ALERT_DATE=20180401T00:00:00

**osvc_service**

This ruleset is exported to services only.
It contains information about the service the ``svcmgr -s <svcname> compliance ...`` command is executed on.

Example content:

.. code-block:: sh

  OSVC_COMP_SERVICES_ID=494
  OSVC_COMP_SERVICES_SVC_HA=0
  OSVC_COMP_SERVICES_SVC_STATUS=warn
  OSVC_COMP_SERVICES_SVC_AVAILSTATUS=up
  OSVC_COMP_SERVICES_SVC_CLUSTER_TYPE=failover
  OSVC_COMP_SERVICES_SVC_FLEX_MIN_NODES=1
  OSVC_COMP_SERVICES_SVC_FLEX_MAX_NODES=1
  OSVC_COMP_SERVICES_SVC_FLEX_CPU_LOW_THRESHOLD=10
  OSVC_COMP_SERVICES_SVC_FLEX_CPU_HIGH_THRESHOLD=90
  OSVC_COMP_SERVICES_SVC_HOSTID=152424626916
  OSVC_COMP_SERVICES_SVC_NAME=unxdevweb
  OSVC_COMP_SERVICES_SVC_NODES=clementine
  OSVC_COMP_SERVICES_SVC_DRPNODE=lapoo
  OSVC_COMP_SERVICES_SVC_AUTOSTART=clementine
  OSVC_COMP_SERVICES_SVC_TYPE=DEV
  OSVC_COMP_SERVICES_SVC_DRPNODES=lapoo
  OSVC_COMP_SERVICES_SVC_COMMENT='opensvc web front-end and data collector'
  OSVC_COMP_SERVICES_SVC_APP='OpenSVC'
  OSVC_COMP_SERVICES_SVC_WAVE=3
  OSVC_COMP_SERVICES_SVC_CREATED=20110710T04:11:30
  OSVC_COMP_SERVICES_UPDATED=20140519T05:02:50
  OSVC_COMP_SERVICES_SVC_ENVDATE=None
  OSVC_COMP_SERVICES_SVC_CONTAINERTYPE=hosted
  OSVC_COMP_SERVICES_SVC_ENVFILE='<truncated>'

Explicit rulesets
+++++++++++++++++

Explicit ruleset variables are exported only to nodes or services explicitely attached to the ruleset. This attachment can be configured either through the collector interface (Described below), or through the agent command line tools::

        # nodemgr compliance attach --ruleset rset1

or::

        # svcmgr -s <svcname> compliance attach --ruleset rset1

Contextual rulesets
+++++++++++++++++++

Contextual ruleset variables are exported to the nodes and services matching the ruleset's filterset.

They are not attachable.

Ruleset publication
+++++++++++++++++++

Rulesets can be flagged as published or not published.

* An explicit non-published ruleset is not visible nor attachachable
* A contextual non-published ruleset is not visible from the nodes and services matching or not matching its filterset
* A contextual or explicit non-published ruleset is considered published as a descendant of a top-level publish ruleset

Set the publication flag to ``False`` when

* you want the ruleset variables to be published based on conditions enforced by a parent ruleset
* you want to inhibit a top-level ruleset (backup cloned rulesets or misbehaving rulesets)

Ruleset encapsulation
+++++++++++++++++++++

Ruleset encapsulation is achieved by attaching a ruleset (the child) to another ruleset (the parent).

**Facts**

* Encapsulation can be arbitrarily deep.
* A contextual or explicit ruleset can be encapsulated in a contextual or explicit ruleset
* An encapsulated ruleset is always considered published, even if the publication flag is set to ``False``
* The encapsulated ruleset ownership is only considered when deciding if a collector user can edit the ruleset. The ruleset ownership validation against services and nodes is handled at top-level ruleset only

**Visibility**

Encapsulated rulesets visibility is evaluated by walking the encapsulation tree top-down.

* If a ruleset is not visible, all its child rulesets are not visible
* If a ruleset is visible, all its child explicit rulesets are visible
* If a ruleset is visible, its child contextual rulesets are visible if their filterset matches the node or service properties

**Usage**

Encapsulation is a useful to

* Customize rules of a ruleset based on contextual information. For example, a ruleset describing a monitoring agent configuration might want to point a different tarball based on which operating system and which version is executing the compliance module. For another example, a ruleset publishing the nameservers to use might want to publish different nameserver lists for different datacenters.
* Keep the top level of the ruleset tree clean and lean
* Minimize the number of filtersets necessary to cover all needs. As filters are cumulative in a nested contextual ruleset relationship, encapsulation aleviate the need to define as filtersets most filterset combinations. For example, ``x86 servers => linux servers``, ``x86 servers => solaris servers``, ``x86 servers => freebsd servers``, ``x86_86 servers => linux servers``, ``x86_86 servers => solaris servers``, ``x86_86 servers => freebsd servers`` would require 5 filtersets, where a flat ruleset design would require 6. The factorization factor increases dramatically with ruleset complexity.

Ruleset ownership
+++++++++++++++++

A ruleset is visible and attachable

* from a server, if the team responsible property of the server matches one of the ruleset owner groups.
* from a service, if one of its application code responsible groups matches one of the ruleset owner groups.

A ruleset can also be visible because it is encapsulted in a visible top-level ruleset, whatever the encapsulation depth, and whatever the ownership of the child.

Upon creation or cloning, the new ruleset is stored at the tree head and is owned by the creator's private group (``user_<n>``).

With this default ownership and unencapsulated state, the ruleset

* is not visible nor attachable from any node or service
* is editable only by its creator

The creator can then add, delete, rename, change the value of rules without the rulesets of servers and services being affected.

When the design session is over, the creator's can attach new groups to the ruleset and/or insert the ruleset as a child of a visible ruleset.

