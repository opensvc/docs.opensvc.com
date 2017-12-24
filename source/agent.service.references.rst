.. _agent-service-references:

References
==========

Intra-Service References
------------------------

The reference format is ``{[<section>.]<option>}``, where

* ``<section>`` is a configuration file section name
* ``<option>`` is the option name in the pointed section.

If section is ommited, the ``DEFAULT`` section is implicitely used.
A reference can also contain arithmetic evaluations.

Hard Coded References
---------------------

================= =============================================================
Reference         Description
================= =============================================================
{nodename}        The running node fqdn
{short_nodename}  The running node base name (without domain)
{svcname}         The running service name
{short_svcname}   The running service base name (without domain)
{cluster_nodes}   The cluster nodes list. Usually set as the :kw:`DEFAULT.nodes`
{svcmgr}          The full path the the svcmgr executable
{nodemgr          The full path the the nodemgr executable}
{etc}             The agent etc/ directory path: /etc/opensvc/ for agents
                  installed through the packages, /opt/opensvc/etc/ for an agent
                  installed via git pull in /opt
{var}             The agent var/ directory path /var/lib/opensvc/ for agents
                  installed through the packages, /opt/opensvc/var/ for an agent
                  installed via git pull in /opt
================= =============================================================


