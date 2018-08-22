.. _agent-service-references:

References
==========

Intra-Configuration References
------------------------------

The reference format is ``{[<section>.]<option>}``, where

* ``<section>`` is a configuration file section name
* ``<option>`` is the option name in the pointed section.

If section is ommited, the ``DEFAULT`` section is implicitely used.
A reference can also contain arithmetic evaluations.

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

Hard Coded References
---------------------

=========================== ============================================================== ======================= ==========================
Reference                   Description                                                    Node Configuration File Service Configuration File
=========================== ============================================================== ======================= ==========================
{nodename}                  The running node fqdn                                          Yes                     Yes
{short_nodename}            The running node base name (without domain)                    Yes                     Yes 
{svcname}                   The running service name                                       No                      Yes 
{short_svcname}             The running service base name (without domain)                 No                      Yes
{id}                        The service id                                                 No                      Yes
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
{svcmgr}                    The full path the the svcmgr executable                        Yes                     Yes
{nodemgr}                   The full path the the nodemgr executable}                      Yes                     Yes
{etc}                       The agent etc/ directory path: /etc/opensvc/ for agents        Yes                     Yes
                            installed through the packages, /opt/opensvc/etc/ for an agent Yes                     Yes
                            installed via git pull in /opt
{var}                       The agent var/ directory path /var/lib/opensvc/ for agents     Yes                     Yes
                            installed through the packages, /opt/opensvc/var/ for an agent
                            installed via git pull in /opt
{initd}                     The service init directory path, /etc/opensvc/etc/<svcname>.d/ Yes                     Yes
                            for agents installed through the packages,
                            /opt/opensvc/etc/<svcname>.d/ for an agent installed via git
                            pull in /opt
{<rid>.exposed_devs}        The whitespace-separated list of devpaths exposed by <rid>     No                      Yes
{<rid>.exposed_devs[<n>]}   The <n>-th element of the list of devpaths exposed by <rid>    No                      Yes
{<rid>.exposed_devs[#]}     The length of the list of devpaths exposed by <rid>            No                      Yes
=========================== ============================================================== ======================= ==========================


