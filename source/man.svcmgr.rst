svcmgr
******

NAME
====

svcmgr

SYNOPSIS
========

svcmgr [options]... command

DESCRIPTION
===========

The svcmgr command controls all OpenSVC concepts relative to services on the local node. Collector querying and alteration of data concerning the node's services, service compliance management, OpenSVC service-specific configuration management, service-relative data push to the collector and service management.

Collector management
--------------------

:command:`collector ack action`
                   acknowledge an action error on the service. an
                   acknowlegment can be completed by --author (defaults to
                   root@nodename) and --comment

:command:`collector ack unavailability`
                   acknowledge an unavailability period. the period is
                   specified by --begin/--end or --begin/--duration. omitting
                   --begin defaults to now. an acknowlegment can be completed
                   by --author (defaults to root@nodename), --account (default
                   to 1) and --comment

:command:`collector alerts`
                   display service alerts

:command:`collector checks`
                   display service checks

:command:`collector events`
                   display service events during the period specified by
                   --begin/--end. --end defaults to now. --begin defaults to 7
                   days ago

:command:`collector list actions`
                   list actions on the service, whatever the node, during the
                   period specified by --begin/--end. --end defaults to now.
                   --begin defaults to 7 days ago

:command:`collector list unavailability ack`
                   list acknowledged periods for the service. the periods can
                   be filtered by --begin/--end. omitting --end defaults to
                   now. the wildcartd for --comment and --author is %

:command:`collector show actions`
                   show actions detailled log. a single action is specified by
                   --id. a range is specified by --begin/--end dates. --end
                   defaults to now. --begin defaults to 7 days ago

:command:`collector status`
                   display service status on all nodes, according to the
                   collector.

Compliance
----------

:command:`compliance attach moduleset`
                   attach moduleset specified by --moduleset to this service

:command:`compliance attach ruleset`
                   attach ruleset specified by --ruleset to this service

:command:`compliance check`
                   run compliance checks. --ruleset <md5> instruct the
                   collector to provide an historical ruleset.

:command:`compliance detach moduleset`
                   detach moduleset specified by --moduleset from this service

:command:`compliance detach ruleset`
                   detach ruleset specified by --ruleset from this service

:command:`compliance fix`
   run compliance fixes. --ruleset <md5> instruct the collector to provide an historical ruleset.

:command:`compliance fixable`
                   verify compliance fixes prerequisites. --ruleset <md5>
                   instruct the collector to provide an historical ruleset.

:command:`compliance list moduleset`
                   list available compliance modulesets. --moduleset f% limit
                   the scope to modulesets matching the f% pattern.

:command:`compliance list ruleset`
                   list available compliance rulesets. --ruleset f% limit the
                   scope to rulesets matching the f% pattern.

:command:`compliance show moduleset`
                   show compliance rules applying to this service

:command:`compliance show ruleset`
                   show compliance rules applying to this service

:command:`compliance show status`
                   show compliance modules status

Service actions
---------------

:command:`boot`
             start a service if executed on the primary node (or one of the primary nodes in case of a flex service), startstandby if not

:command:`disable`
          disable resources passed through --rid in services passed through --service. Specifying no resource disables the whole service.

:command:`enable`
           enable resources passed through --rid in services passed through --service. Specifying no resource enables the whole service.

:command:`freeze`
           set up a flag to block actions on this service

:command:`frozen`
           report on the current blocking of actions on this service

:command:`json disklist`
    provide the service disk list in json format, for use by tier tools

:command:`json status`
      provide the resource and aggregated status in json format, for use by tier tools

:command:`migrate`
          live migrate the service to the remote node. --to <node> specify the remote node to migrate the service to.

:command:`mount`
            prepare devices, logical volumes, mount service filesystems, bootstrap containers

:command:`postsync`
         make use of files received from master nodes in var

:command:`presync`
          update var files associated to resources

:command:`print disklist`
   print service disk list

:command:`print status`
     display service resource status

:command:`printsvc`
         display service live configuration

:command:`prstart`
          reserve scsi disks held by this service

:command:`prstatus`
         report status of reservations on scsi disks held by this service

:command:`prstop`
           release scsi disks held by this service

:command:`push`
             push service configuration to database

:command:`push appinfo`
     push service application launchers appinfo key/value pairs to database

:command:`resource monitor`
                   detect monitored resource failures and trigger monitor_action

:command:`restart`
          combo action, chaining stop-start

:command:`resync`
           combo action, chaining stop-syncresync-start

:command:`shutdown`
         stop a service, disabling the background database logging

:command:`start`
            start a service, chaining startip-diskstart-startapp

:command:`startapp`
         execute service application startup script

:command:`startcontainer`
   start the container resource

:command:`startdisk`
        combo action, activating standby disks, taking reservations, starting loopback devices and volume groups

:command:`startip`
          configure service ip addresses

:command:`startloop`
        attach loop resources of this service

:command:`startpool`
        activate zpool resources of this service

:command:`startstandby`
     start service resources marked always_on

:command:`startvg`
          activate/import volume group resources of this service

:command:`status`
           return service overall status code

:command:`stonith`
          command provided to the heartbeat daemon to fence peer node in case of split brain

:command:`stop`
             stop a service, chaining stopapp-stopdisk-stopip

:command:`stopapp`
          execute service application stop script

:command:`stopcontainer`
    stop the container resource

:command:`stopdisk`
         combo action, stopping volume groups and loopback devices, droping reservations, disabling standby disks

:command:`stopip`
           unconfigure service ip addresses

:command:`stoploop`
         detach loop resources of this service

:command:`stoppool`
         deactivate zpool resources of this service

:command:`stopvg`
           deactivate/deport volume group resources of this service

:command:`switch`
           stop the service on the local node and start on the remote node. --to <node> specify the remote node to switch the service to.

:command:`syncall`
          combo action, chaining syncnodes-syncdrp-syncupdate.  --force bypass the schedule check.

:command:`syncbreak`
        split a storage hardware-assisted disk synchronization

:command:`syncdrp`
          send to drp nodes the service config files and additional files described in the config file. --force bypass the schedule check.

:command:`syncfullsync`
     trigger a full copy of the volume to its target

:command:`syncnodes`
        send to peer nodes the service config files and additional files described in the config file. --force bypass the schedule check.

:command:`syncquiesce`
      trigger a storage hardware-assisted disk synchronization

:command:`syncresume`
       re-establish a broken storage hardware-assisted synchronization

:command:`syncresync`
       like syncupdate, but not triggered by the scheduler (thus adapted for clone/snap operations)

:command:`syncupdate`
       trigger a one-time resync of the volume to its target

:command:`syncverify`
       trigger a one-time checksum-based verify of the volume and its target

:command:`thaw`
             remove the flag to unblock actions on this service

:command:`umount`
           shutdown container, umount service filesystems, deactivate logical volumes

Service configuration
---------------------

:command:`create`
           create a new service configuration file. --interactive triggers the interactive mode

:command:`delete`
           delete resources passed through --rid in services passed through --service

:command:`get`
              get the value of the service configuration parameter pointed by --param

:command:`set`
              set a service configuration parameter (pointed by --param) value (pointed by --value)

:command:`unset`
            unset a service configuration parameter pointed by --param

:command:`update`
           update definitions in an existing service configuration file

Options:
--------

:command:`--version`
             show program's version number and exit
:command:`-h, --help`
            show this help message and exit
:command:`--debug`
               debug mode
:command:`-p, --parallel`
        start actions on specified services in parallel
:command:`-f, --force`
           force action, ignore sanity check warnings
:command:`--cron`
                used by cron'ed action to tell the collector to treat the log entries as such
:command:`-c, --cluster`
         option to set when excuting from a clusterware to disable safety net
:command:`-i, --interactive`
     prompt user for a choice instead of going for defaults or failing
:command:`--rid=PARM_RID`
        comma-separated list of resource to limit action to
:command:`--tags=PARM_TAGS`
      comma-separated list of resource tags to limit action to
:command:`--resource=RESOURCE`
   a resource definition in json dictionary format fed to create or update
:command:`--provision`
           provision the service in addition to env file creation. defaults to False.
:command:`--waitlock=PARM_WAITLOCK`
                        comma-separated list of resource tags to limit action to
:command:`--to=PARM_DESTINATION_NODE`
                        remote node to start or migrate the service to
:command:`--attach`
              attach the modulesets specified during a compliance check/fix/fixable command
:command:`--module=MODULE`
       compliance, set module list
:command:`--moduleset=MODULESET`
                        compliance, set moduleset list. The 'all' value can be used in conjonction with detach.
:command:`--ruleset=RULESET`
     compliance, set ruleset list. The 'all' value can be used in conjonction with detach.
:command:`--ruleset-date=RULESET_DATE`
                        compliance, use rulesets valid on specified date
:command:`--param=PARAM`
         point a service configuration parameter for the 'get' and 'set' actions
:command:`--value=VALUE`
         set a service configuration parameter value for the 'set --param' action
:command:`--duration=DURATION`
   a duration expressed in minutes. used with the 'collector ack unavailability' action
:command:`--account`
             decides that the unavailabity period should be deduced from the service availability anyway. used with the 'collector ack unavailability' action
:command:`--begin=BEGIN`
         a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack unavailability' action
:command:`--end=END`
             a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack unavailability' action
:command:`--comment=COMMENT`
     a comment to log when used with the 'collector ack unavailability' action
:command:`--author=AUTHOR`
       the acker name to log when used with the 'collector ack unavailability' action
:command:`--id=ID`
               specify an id to act on
:command:`-s PARM_SVCS, --service=PARM_SVCS`
                        comma-separated list of service to operate on
:command:`--status=PARM_STATUS`
  operate only on service in the specified status (up/down/warn)
:command:`--onlyprimary`
         operate only on service flagged for autostart on this node
:command:`--onlysecondary`
       operate only on service not flagged for autostart on this node

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
