.. _agent-service-references:

References
==========

A reference is a marker in the value of a configuration keyword, replaced during evaluation.

A reference is formatted as ``{<expression>}``.

A reference can contain arithmetic evaluations.

An arithmetic evaluation can contain references.

References can be used to:

* Abstract changing parts of a configuration, so this configuration can be used as a template
  Example: The object name, object id, the devices that hosts the data

* Factorize information, so changing it is easier and safer
  Example: A projet name used to format the name of different resources (volume group, filesystem path, ...)

* Contextualize part of a configuration with information known to the agent
  Example: The cluster nodes, cluster dns ip addresses, ...

Intra-Configuration References
------------------------------

The reference format is ``{[<section>.]<option>}``, where

* ``<section>`` is a configuration file section name
* ``<option>`` is the option name in the pointed section.

If section is ommited, the referencing keyword's section is implicitely used if the reference can be found locally, or the ``DEFAULT`` section is implicitely used.

Intra-Section References
------------------------

These references can be used inside a configuration section and their evaluated value depends on the section.

================= ============================================================== ======================= ==========================
Reference         Description                                                    Node Configuration File Service Configuration File
================= ============================================================== ======================= ==========================
{rid}             The name of the section the reference is under                 No                      Yes
{rindex}          The part after the dash of the name of the section the         No                      Yes
                  reference is under
{<keyword>}       Reference to another keyword's value inside the same section   Yes                     Yes
================= ============================================================== ======================= ==========================

Hard Coded References
---------------------

=========================== ============================================================== ======================= ==========================
Reference                   Description                                                    Node Configuration File Service Configuration File
=========================== ============================================================== ======================= ==========================
{nodename}                  The running node fqdn                                          Yes                     Yes
{short_nodename}            The running node base name (without domain)                    Yes                     Yes
{namespace}                 The name of the hosting namespace                              No                      Yes
{kind}                      The object kind, ie "svc", "vol", "sec", "cfg", "ccfg"         No                      Yes
{name}                      The object name                                                No                      Yes 
{path}                      The object path, ie <namespace>/<kind>/<name>                  No                      Yes
{short_name}                The object base name (name with domain suffix stripped)        No                      Yes
{fqdn}                      The object fully qualified name, as registered in the cluster  No                      Yes
                            DNS, ie <name>.<namespace>.<kind>.<clustername>
{scaler_name}               The scaler name (because {name} resolves to the slice name)    No                      Yes
{scaler_short_name}         The scaler base name (name with domain suffix stripped)        No                      Yes
{id}                        The object id                                                  No                      Yes
{safe://<id>}               Substitute the reference with the content of the safe file     Yes                     Yes
                            identified by <id>. Usually passwords or private keys. The
                            content is cached locally so the collector dependency is
                            loose.
{clustername}               The cluster.name node keyword value                            Yes                     Yes
{clusterid}                 The cluster.id node keyword value                              Yes                     Yes
{clusternodes}              The cluster.nodes node keyword value                           Yes                     Yes
{clusterdrpnodes}           The cluster.drpnodes node keyword value                        Yes                     Yes
{dns}                       The cluster.dns node keyword value (ip adressses)              Yes                     Yes
{dnsnodes}                  The cluster.dns node keyword value (resolved names)            Yes                     Yes
{dnsuxsock}                 The path to the dns thread unix socket                         Yes                     Yes
{dnsuxsockd}                The path to the directory hosting the dns thread unix socket   Yes                     Yes
{collector_api}             The uri of the collector Rest API                              Yes                     Yes
{nodemgr}                   The full path the the om node executable}                      Yes                     Yes
{svcmgr}                    The full path the the svcmgr executable                        Yes                     Yes
{etc}                       The agent etc/ directory path: /etc/opensvc/ for agents        Yes                     Yes
                            installed through the packages, /opt/opensvc/etc/ for an agent Yes                     Yes
                            installed via git pull in /opt
{var}                       The agent var/ directory path /var/lib/opensvc/ for agents     Yes                     Yes
                            installed through the packages, /opt/opensvc/var/ for an agent
                            installed via git pull in /opt
{initd}                     The object init directory path. ex: /etc/opensvc/etc/<name>.d  Yes                     Yes
{private_var}               The object private directory under {var}                       Yes                     Yes
{<rid>.exposed_devs}        The whitespace-separated list of devpaths exposed by <rid>     No                      Yes
{<rid>.exposed_devs[<n>]}   The <n>-th element of the list of devpaths exposed by <rid>    No                      Yes
{<rid>.exposed_devs[#]}     The length of the list of devpaths exposed by <rid>            No                      Yes
=========================== ============================================================== ======================= ==========================

Deprecated references:

=========================== ============================================================== ======================= ==========================
Reference                   Description                                                    Node Configuration File Service Configuration File
=========================== ============================================================== ======================= ==========================
{svcname}                   Deprecated by {name}                                           No                      Yes 
{svcpath}                   Deprecated by {path}                                           No                      Yes
{short_svcname}             Deprecated by {short_name}                                     No                      Yes
=========================== ============================================================== ======================= ==========================

References and ``env`` Section
------------------------------

The ``env`` section can be used to store arbitrary factorized information to make available as references in other parts of the configuration.

Example:

::

	[disk#0]
	name = {id}
	pvs = {env.devs}

	[env]
	devs = /dev/vdb

These values can be overridden when creating a new object from this configuration file or template,

* Interactively
  ``om <path> create --config <template> --interactive``

* In the commandline
  ``om <path> create --config <template> --env devs=/dev/vdc``

