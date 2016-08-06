Usage
*****

Scheduling
==========

A node and service compliance check run is scheduled once a week at the initiative of the OpenSVC agent. Upon execution, the agent fetches from the collector the node or service applicable ruleset and the applicable moduleset.

The modules are merged in a single, deduplicated, ordered by module filename list. Modules not present on the node will be silently bypassed.

The default schedule can be altered in ``<OSVCETC>/node.conf``:

::

    [compliance]
    schedule = 02:00-06:00@241 sun,wed

Manual execution
================

A compliance check of all attached modulesets on a node can be triggered by:

::

    sudo nodemgr compliance check

A compliance check of all attached modulesets on a service can be triggered by:

::

    sudo svcmgr -s <svcname> compliance check

A specific module compliance check:

::

    sudo svcmgr -s svcname> compliance check --module <modname>

Managing moduleset attachments
==============================

Attach a moduleset to the node:

::

    sudo nodemgr compliance attach --moduleset <modname>

Attach a moduleset to a service:

::

    sudo svcmgr -s <svcname> compliance attach --moduleset <modname>

Detach a moduleset from the node:

::

    sudo nodemgr compliance detach --moduleset <modname>

Detach a moduleset from a service:

::

    sudo svcmgr -s <svcname> compliance detach --moduleset <modname>

Managing ruleset attachments
============================

Attach a ruleset to the node:

::

    sudo nodemgr compliance attach --ruleset <rsetname>

Attach a moduleset to a service:

::

    sudo svcmgr -s <svcname> compliance attach --ruleset <rsetname>

Detach a moduleset from the node:

::

    sudo nodemgr compliance detach --ruleset <rsetname>

Detach a moduleset from a service:

::

    sudo svcmgr -s <svcname> compliance detach --ruleset <rsetname>

Querying the framework
======================

List the installed modules:

::

    sudo nodemgr compliance list module

List the available modulesets:

::

    sudo nodemgr compliance list moduleset

List the available explicit rulesets:

::

    sudo nodemgr compliance list ruleset

Show the currently attached modulesets:

::

    sudo nodemgr compliance show moduleset

Show the currently presented rulesets:

::

    sudo nodemgr compliance show ruleset

Show the status of the modules last run, as known by the collector:

::

    sudo nodemgr compliance show status

Show the status of modules, specified by pattern, last run, as known by the collector:

::

    sudo nodemgr compliance show status --module "%init%"

