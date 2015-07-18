nodemgr
*******

NAME
====

nodemgr

SYNOPSIS
========

nodemgr [options]... command

DESCRIPTION
===========

The nodemgr command controls all OpenSVC concepts relative to the node. Collector querying and alteration of data concerning the node, compliance management, OpenSVC node-specific configuration management, node-relative data push to the collector, node-wide service management.

Collector management
--------------------

:command:`collector ack action`
                   acknowledge an action error on the node. an acknowlegment
                   can be completed by --author (defaults to root@nodename)
                   and --comment

:command:`collector alerts`
                   display node alerts

:command:`collector checks`
                   display node checks

:command:`collector events`
                   display node events during the period specified by
                   --begin/--end. --end defaults to now. --begin defaults to 7
                   days ago

:command:`collector list actions`
                   list actions on the node, whatever the service, during the
                   period specified by --begin/--end. --end defaults to now.
                   --begin defaults to 7 days ago

:command:`collector show actions`
                   show actions detailled log. a single action is specified by
                   --id. a range is specified by --begin/--end dates. --end
                   defaults to now. --begin defaults to 7 days ago

:command:`collector status`
                   display node services status according to the collector

Compliance
----------

:command:`compliance attach`
                   attach moduleset specified by --moduleset and rulesets specified by --ruleset to this node

:command:`compliance check`
                   run compliance checks. --ruleset <md5> instruct the
                   collector to provide an historical ruleset.

:command:`compliance detach`
                   detach moduleset specified by --moduleset and rulesets specified by --ruleset from this node

:command:`compliance fix`
                   run compliance fixes. --ruleset <md5> instruct the
                   collector to provide an historical ruleset.

:command:`compliance fixable`
                   verify compliance fixes prerequisites. --ruleset <md5>
                   instruct the collector to provide an historical ruleset.

:command:`compliance list module`
                   list compliance modules available on this node

:command:`compliance list moduleset`
                   list available compliance modulesets. --moduleset f% limit
                   the scope to modulesets matching the f% pattern.

:command:`compliance list ruleset`
                   list available compliance rulesets. --ruleset f% limit the
                   scope to rulesets matching the f% pattern.

:command:`compliance show moduleset`
                   show compliance rules applying to this node

:command:`compliance show ruleset`
                   show compliance rules applying to this node

:command:`compliance show status`
                   show compliance modules status

Misc
----

:command:`prkey`
                   show persistent reservation key of this node

Node actions
------------

:command:`reboot`
                   reboot the node

:command:`shutdown`
                   shutdown the node to powered off state

Node configuration edition
--------------------------

:command:`get`
                   get the value of the node configuration parameter pointed
                   by --param

:command:`register`
                   obtain a registration number from the collector, used to
                   authenticate the node

:command:`set`
                   set a node configuration parameter (pointed by --param)
                   value (pointed by --value)

:command:`unset`
                   unset a node configuration parameter (pointed by --param)

Push data to the collector
--------------------------

:command:`checks`
                   run node sanity checks, push results to collector

:command:`push appinfo`
                   push services application launchers appinfo key/value pairs
                   to database

:command:`pushasset`
                   push asset information to collector

:command:`pushdcs`
                   push Datacore configuration to collector

:command:`pushdisks`
                   push disks usage information to collector

:command:`pusheva`
                   push HP EVA configuration to collector

:command:`pushibmsvc`
                   push IBM SVC configuration to collector

:command:`pushpatch`
                   push patch/version list to collector

:command:`pushpkg`
                   push package/version list to collector

:command:`pushservices`
                   push services configuration to collector

:command:`pushstats`
                   push performance metrics to collector. By default pushed
                   stats interval begins yesterday at the beginning of the
                   allowed interval and ends now. This interval can be changed
                   using --begin/--end parameters. The location where stats
                   files are looked up can be changed using --stats-dir.

:command:`pushsym`
                   push symmetrix configuration to collector

Service actions
---------------

:command:`syncservices`
                   send var files, config files and configured replications to
                   other nodes for each node service

:command:`updateservices`
                   refresh var files associated with services

Options
-------

:command:`--version`
             show program's version number and exit
:command:`-h, --help`
            show this help message and exit
:command:`--debug`
               debug mode
:command:`--stats-dir=STATS_DIR`
                        points the directory where the metrics files are
                        stored for pushstats
:command:`--module=MODULE`
       compliance, set module list
:command:`--moduleset=MODULESET`
                        compliance, set moduleset list. The 'all' value can be
                        used in conjonction with detach.
:command:`--ruleset=RULESET`
     compliance, set ruleset list. The 'all' value can be used in conjonction with detach.
:command:`--ruleset-date=RULESET_DATE`
                        compliance, use rulesets valid on specified date
:command:`--attach`
              attach the modulesets specified during a compliance check/fix/fixable command
:command:`--cron`
                cron mode
:command:`--force`
               force action
:command:`--symcli-db-file=SYMCLI_DB_FILE`
                        [pushsym option] use symcli offline mode with the
                        specified file. aclx files are expected to be found in
                        the same directory and named either <symid>.aclx or
                        <same_prefix_as_bin_file>.aclx
:command:`--param=PARAM`
         point a node configuration parameter for the 'get' and 'set' actions
:command:`--value=VALUE`
         set a node configuration parameter value for the 'set --param' action
:command:`--duration=DURATION`
   a duration expressed in minutes. used with the 'collector ack action' action
:command:`--begin=BEGIN`
         a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack action' and pushstats action
:command:`--end=END`
             a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack action' and pushstats action
:command:`--comment=COMMENT`
     a comment to log when used with the 'collector ack action' action
:command:`--author=AUTHOR`
       the acker name to log when used with the 'collector ack action' action
:command:`--id=ID`
               specify an id to act on

REPORTING BUGS
==============

Report bugs to opensvc-users@opensvc.com.

OpenSVC homepage: http://www.opensvc.com

COPYRIGHT
=========

Copyright © 2012 OpenSVC SARL. License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
========

svcmgr(8)
