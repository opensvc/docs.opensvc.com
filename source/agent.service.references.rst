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

Hard Coded References
---------------------

================= ============================================================== ======================= ==========================
Reference         Description                                                    Node Configuration File Service Configuration File
================= ============================================================== ======================= ==========================
{nodename}        The running node fqdn                                          Yes                     Yes
{short_nodename}  The running node base name (without domain)                    Yes                     Yes 
{svcname}         The running service name                                       No                      Yes 
{short_svcname}   The running service base name (without domain)                 No                      Yes
{cluster_nodes}   The cluster nodes list. Usually set as the :kw:`DEFAULT.nodes` Yes                     Yes
{svcmgr}          The full path the the svcmgr executable                        Yes                     Yes
{nodemgr          The full path the the nodemgr executable}                      Yes                     Yes
{etc}             The agent etc/ directory path: /etc/opensvc/ for agents        Yes                     Yes
                  installed through the packages, /opt/opensvc/etc/ for an agent Yes                     Yes
                  installed via git pull in /opt
{var}             The agent var/ directory path /var/lib/opensvc/ for agents     Yes                     Yes
                  installed through the packages, /opt/opensvc/var/ for an agent
                  installed via git pull in /opt
{initd}           The service init directory path, /etc/opensvc/etc/<svcname>.d/ Yes                     Yes
                  for agents installed through the packages,
                  /opt/opensvc/etc/<svcname>.d/ for an agent installed via git
                  pull in /opt
================= ============================================================== ======================= ==========================


