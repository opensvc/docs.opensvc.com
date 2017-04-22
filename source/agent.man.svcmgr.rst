svcmgr manpage
**************

::

	SVCMGR(1)                       General Commands Manual                       SVCMGR(1)
	
	NAME
	       svcmgr - OpenSVC agent's services instances management command.
	
	SYNOPSIS
	       svcmgr [ OPTIONS ] COMMAND
	
	DESCRIPTION
	       In  the OpenSVC infrastructure, the node is an operating system instance with an
	       OpenSVC agent installed. The node  may  host  OpenSVC  services  instances.  The
	       svcmgr program provides commands to provision, configure, stop, start and repli‐
	       cate services instances on the local node.
	
	COMMANDS
	       COLLECTOR MANAGEMENT
	
	       svcmgr collector ack action
	
	              acknowledge an action error on the service. an acknowlegment can be  com‐
	              pleted by --author (defaults to root@nodename) and --comment
	
	              --author=AUTHOR
	                     the  acker  name to log when used with the 'collector ack unavail‐
	                     ability' action
	
	              --comment=COMMENT
	                     a comment to log when used with the 'collector ack unavailability'
	                     action
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector ack unavailability
	
	              acknowledge  an  unavailability  period.  the  period  is  specified   by
	              --begin/--end or --begin/--duration. omitting --begin defaults to now. an
	              acknowlegment can be completed by --author (defaults  to  root@nodename),
	              --account (default to 1) and --comment
	
	              --author=AUTHOR
	                     the  acker  name to log when used with the 'collector ack unavail‐
	                     ability' action
	
	              --account
	                     decides that the unavailabity period should be  deduced  from  the
	                     service availability anyway. used with the 'collector ack unavail‐
	                     ability' action
	
	              --begin=BEGIN
	                     a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the  'col‐
	                     lector ack unavailability' action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack unavailability' action
	
	              --comment=COMMENT
	                     a comment to log when used with the 'collector ack unavailability'
	                     action
	
	              --duration=DURATION
	                     a  duration  expressed  in  minutes.  used with the 'collector ack
	                     unavailability' action
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector alerts
	
	              display service alerts
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector asset
	
	              display asset information known to the collector
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector checks
	
	              display service checks
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector create tag
	
	              create a new tag
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector disks
	
	              display service disks
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector events
	
	              display  service  events  during  the  period specified by --begin/--end.
	              --end defaults to now. --begin defaults to 7 days ago
	
	              --begin=BEGIN
	                     a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the  'col‐
	                     lector ack unavailability' action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack unavailability' action
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector list actions
	
	              list actions on the service, whatever the node, during the period  speci‐
	              fied  by --begin/--end. --end defaults to now. --begin defaults to 7 days
	              ago
	
	              --begin=BEGIN
	                     a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the  'col‐
	                     lector ack unavailability' action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack unavailability' action
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector list tags
	
	              list all available tags. use --like to filter the output.
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --like=LIKE
	                     a  sql  like  filtering expression. leading and trailing wildcards
	                     are automatically set.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector list unavailability ack
	
	              list acknowledged periods for the service. the periods can be filtered by
	              --begin/--end. omitting --end defaults to now. the wildcard for --comment
	              and --author is %
	
	              --author=AUTHOR
	                     the  acker  name to log when used with the 'collector ack unavail‐
	                     ability' action
	
	              --begin=BEGIN
	                     a begin date expressed as 'YYYY-MM-DD hh:mm'. used with the  'col‐
	                     lector ack unavailability' action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack unavailability' action
	
	              --comment=COMMENT
	                     a comment to log when used with the 'collector ack unavailability'
	                     action
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector log
	
	              log a message in the collector's service log
	
	              --message=MESSAGE
	                     the message to send to the collector for logging
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector networks
	
	              display network information known to the collector for each service ip
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector show actions
	
	              show  actions detailed log. a single action is specified by --id. a range
	              is specified by --begin/--end  dates.  --end  defaults  to  now.  --begin
	              defaults to 7 days ago
	
	              --begin=BEGIN
	                     a  begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'col‐
	                     lector ack unavailability' action
	
	              --id=ID
	                     specify an object id to act on
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack unavailability' action
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector show tags
	
	              list all service tags
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector tag
	
	              set a service tag (pointed by --tag)
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr collector untag
	
	              unset a service tag (pointed by --tag)
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	                     COMPLIANCE
	
	       svcmgr compliance attach
	
	              attach  ruleset  specified  by  --ruleset  and/or  moduleset specified by
	              --moduleset to this service
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --ruleset=RULESET
	                     compliance,  set ruleset list. The 'all' value can be used in con‐
	                     jonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance attach moduleset
	
	              attach moduleset specified by --moduleset to this service
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance attach ruleset
	
	              attach ruleset specified by --ruleset to this service
	
	              --ruleset=RULESET
	                     compliance,  set ruleset list. The 'all' value can be used in con‐
	                     jonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance auto
	
	              run  compliance  checks  or fixes depending on the autofixmodule property
	              values.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance check
	
	              run compliance checks.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance detach
	
	              detach ruleset specified  by  --ruleset  and/or  moduleset  specified  by
	              --moduleset from this service
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance detach moduleset
	
	              detach moduleset specified by --moduleset from this service
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance detach ruleset
	
	              detach ruleset specified by --ruleset from this service
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance env
	
	              show the compliance modules environment variables.
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance fix
	
	              run compliance fixes.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance fixable
	
	              verify compliance fixes prerequisites.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance list moduleset
	
	              list available compliance modulesets. --moduleset f% limit the  scope  to
	              modulesets matching the f% pattern.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance list ruleset
	
	              list available compliance rulesets. --ruleset f% limit the scope to rule‐
	              sets matching the f% pattern.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance show moduleset
	
	              show compliance rules applying to this service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance show ruleset
	
	              show compliance rules applying to this node
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr compliance show status
	
	              show compliance modules status
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	                     SERVICE ACTIONS
	
	       svcmgr boot
	
	              start  a  service  if executed on the primary node (or one of the primary
	              nodes in case of a flex service), startstandby if not
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr disable
	
	              disable  resources passed through --rid in services passed through --ser‐
	              vice. Specifying no resource disables the whole service.
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr dns update
	
	              update the collector dns records for the service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr docker
	
	              wrap  the docker client command, setting automatically the socket parame‐
	              ter to join the service-private docker daemon. The %as_service%, %images%
	              and  %instances%  words  in  the wrapped command are replaced by, respec‐
	              tively, the registry login username/password/email parameters to log as a
	              service  using  <svcname>@<nodename> as the username and the node uuid as
	              password (which is what is expected when the opensvc collector is used as
	              the  JWT  manager for the registry), the set of docker instance names and
	              images for container resources passing the --tags,  --rid  and  --subsets
	              filters.  This  is  useful  to  remove  all instances of a service or all
	              instances of resources with a tag like "frontend". Note the opensvc  fil‐
	              ters must be positioned before the docker command in the arguments list.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr enable
	
	              enable resources passed through --rid in services passed  through  --ser‐
	              vice. Specifying no resource enables the whole service.
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr freeze
	
	              set up a flag to block actions on this service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr frozen
	
	              report on the current blocking of actions on this service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr logs
	
	              display the service logs in the pager
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr ls
	
	              display the installed service list
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr migrate
	
	              live  migrate  the  service  to  the remote node. --to <node> specify the
	              remote node to migrate the service to.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --to=PARM_DESTINATION_NODE
	                     remote node to start or migrate the service to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr pg freeze
	
	              freeze the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr pg kill
	
	              kill the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr pg thaw
	
	              thaw the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr postsync
	
	              make use of files received from master nodes in var
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr presync
	
	              update var files associated to resources
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print config mtime
	
	              display service configuration file modification time
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print devlist
	
	              print service device list
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print disklist
	
	              print service disk list
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print resource status
	
	              display a specific service resource status, pointed by --rid
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --refresh
	                     drop last resource status cache and  re-evaluate  before  printing
	                     with the 'print [json] status' commands
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print schedule
	
	              print the service tasks schedule
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --verbose
	                     add  more  information  to  some  print  commands: +next in 'print
	                     schedule'
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print status
	
	              display service resource status
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --hide-disabled
	                     tell  print|json  status  action  to  not  include  the   disabled
	                     resources in the output, irrespective of the show_disabled service
	                     configuration setting.
	
	              --refresh
	                     drop last resource status cache and  re-evaluate  before  printing
	                     with the 'print [json] status' commands
	
	              --show-disabled
	                     tell print|json status action to include the disabled resources in
	                     the output, irrespective of the show_disabled  service  configura‐
	                     tion setting.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr provision
	
	              provision and start the service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr prstart
	
	              reserve scsi disks held by this service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr prstatus
	
	              report status of reservations on scsi disks held by this service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr prstop
	
	              release scsi disks held by this service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr pull
	
	              pull a service configuration from the collector
	
	              --provision
	                     with  the  install  or  create  actions,  provision  the   service
	                     resources after config file creation. defaults to False.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr push
	
	              push service configuration to the collector
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr push resinfo
	
	              push service resources and application launchers info key/value pairs the
	              collector
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr push service status
	
	              push service and its resources status to database
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr resource monitor
	
	              detect monitored resource failures and trigger monitor_action
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr restart
	
	              combo action, chaining stop-start
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr resync
	
	              combo action, chaining stop-sync_resync-start
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr run
	
	              run  all  tasks,  or tasks specified by --rid --tags and --subset, disre‐
	              garding their schedule
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr scheduler
	
	              run the service task scheduler
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr shutdown
	
	              stop a service, disabling the background database logging
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr start
	
	              start all service resources
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startapp
	
	              execute service application startup script
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startcontainer
	
	              start the container resource
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startdisk
	
	              combo action, activating standby  disks,  taking  reservations,  starting
	              loopback devices and volume groups
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startfs
	
	              prepare devices, logical volumes, mount  service  filesystems,  bootstrap
	              containers
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startip
	
	              configure service ip addresses
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startshare
	
	              start network shares
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr startstandby
	
	              start service resources flagged always on
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr status
	
	              return service overall status code
	
	              --refresh
	                     drop  last  resource  status cache and re-evaluate before printing
	                     with the 'print [json] status' commands
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stonith
	
	              command  provided  to  the heartbeat daemon to fence peer node in case of
	              split brain
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stop
	
	              stop  all service resources not flagged always on. With --force, stop all
	              service resources, even those flagged always on.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopapp
	
	              execute service application stop script
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopcontainer
	
	              stop the container resource
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopdisk
	
	              combo action, stopping volume groups and loopback devices, droping reser‐
	              vations, disabling standby disks
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopfs
	
	              shutdown  container,  umount service filesystems, deactivate logical vol‐
	              umes
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopip
	
	              unconfigure service ip addresses
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr stopshare
	
	              stop network shares
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr switch
	
	              stop  the  service  on  the local node and start on the remote node. --to
	              <node> specify the remote node to switch the service to.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --disable-rollback
	                     Exit without resource activation rollback on start action error
	
	              --ignore-affinity
	                     ignore service anti-affinity with other services check
	
	              --to=PARM_DESTINATION_NODE
	                     remote node to start or migrate the service to
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync all
	
	              combo action, chaining sync_nodes-sync_drp-sync_update.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync break
	
	              split a storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync drp
	
	              send to drp nodes the service config files and additional files described
	              in the config file.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync establish
	
	              establish a EMC SRDF storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync full
	
	              trigger a full copy of the volume to its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync nodes
	
	              send  to  peer  nodes  the  service  config  files  and  additional files
	              described in the config file.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync quiesce
	
	              trigger a storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync restore
	
	              trigger a restore of the sync resources data to their target  path  (DAN‐
	              GEROUS: make sure you understand before running this action).
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync resume
	
	              re-establish a broken storage hardware-assisted synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync resync
	
	              like  sync_update,  but  not triggered by the scheduler (thus adapted for
	              clone/snap operations)
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync revert
	
	              revert to the pre-failover data (looses current data)
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync split
	
	              split a EMC SRDF storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync update
	
	              trigger a one-time resync of the volume to its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr sync verify
	
	              trigger a one-time checksum-based verify of the volume and its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr thaw
	
	              remove the flag to unblock actions on this service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr unprovision
	
	              stop and unprovision the service. beware: data will be lost upon  fs  and
	              disk unprovisioning.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	                     SERVICE CONFIGURATION
	
	       svcmgr create
	
	              create a new  service  configuration  file.  --interactive  triggers  the
	              interactive  mode.  --template <template name>|<template id>|<uri>|<local
	              path>  fetchs  and  installs  a   service   config   template.   --config
	              <uri>|<local path> fetchs and installs a service config file. --provision
	              create the system resources defined in the service config.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --config=PARM_CONFIG
	                     the configuration file to use when creating or installing  a  ser‐
	                     vice
	
	              --env=ENV
	                     with  the  create  action,  set  a env section parameter. multiple
	                     --env <key>=<val> can be specified.
	
	              -i, --interactive
	                     prompt user for a choice instead of going for defaults or failing
	
	              --provision
	                     with  the  install  or  create  actions,  provision  the   service
	                     resources after config file creation. defaults to False.
	
	              --resource=RESOURCE
	                     a  resource  definition in json dictionary format fed to create or
	                     update
	
	              --template=PARM_TEMPLATE
	                     the configuration file template name or id, served by the  collec‐
	                     tor, to use when creating or installing a service
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr delete
	
	              delete the service instance on the local node if no --rid  is  specified,
	              or  delete  the  resources  pointed  by  --rid in services passed through
	              --service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option  to  set to limit the action scope to the service resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option to set to limit the  action  scope  to  all  slave  service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated  list  of  resource tags to limit action to. The +
	                     separator can be used to impose multiple tag conditions.  Example:
	                     tag1+tag2,tag3  limits  the action to resources with both tag1 and
	                     tag2, or tag3.
	
	              --unprovision
	                     with the delete action, unprovision the service  resources  before
	                     config files file deletion. defaults to False.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr edit config
	
	              edit service configuration
	
	              --discard
	                     Discard the stashed erroneous configuration file in a  'edit  con‐
	                     fig' command
	
	              --recover
	                     Recover  the  stashed erroneous configuration file in a 'edit con‐
	                     fig' command
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr get
	
	              get the raw or dereferenced value of a service configuration parameter
	
	              --eval If  set  with  the  'get'  action, the printed value of --param is
	                     scoped and dereferenced.
	
	              --param=PARAM
	                     point a service configuration parameter for the  'get'  and  'set'
	                     actions
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr print config
	
	              display service current configuration
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr set
	
	              set a service configuration parameter
	
	              --param=PARAM
	                     point a service configuration parameter for the  'get'  and  'set'
	                     actions
	
	              --value=VALUE
	                     set  a service configuration parameter value for the 'set --param'
	                     action
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr unset
	
	              unset a node configuration parameter pointed by --param
	
	              --param=PARAM
	                     point  a  service  configuration parameter for the 'get' and 'set'
	                     actions
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr update
	
	              update definitions in an existing service configuration file
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              --slave=SLAVE
	                     option to set to limit the action scope to the  service  resources
	                     in the specified, comma-separated, slaves
	
	              --slaves
	                     option  to  set  to  limit  the  action scope to all slave service
	                     resources
	
	              --subsets=PARM_SUBSETS
	                     comma-separated list of resource subsets to limit action to
	
	              --tags=PARM_TAGS
	                     comma-separated list of resource tags to limit action  to.  The  +
	                     separator  can be used to impose multiple tag conditions. Example:
	                     tag1+tag2,tag3 limits the action to resources with both  tag1  and
	                     tag2, or tag3.
	
	              -i, --interactive
	                     prompt user for a choice instead of going for defaults or failing
	
	              --provision
	                     with   the  install  or  create  actions,  provision  the  service
	                     resources after config file creation. defaults to False.
	
	              --resource=RESOURCE
	                     a resource definition in json dictionary format fed to  create  or
	                     update
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option  to  set when excuting from a clusterware to disable safety
	                     net
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used  by  cron'ed  action  to  tell the collector to treat the log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag  action  as  triggered by a remote node. used to avoid recur‐
	                     sively triggering actions amongst nodes
	
	       svcmgr validate config
	
	              check the sections and parameters are valid.
	
	              --onlyprimary
	                     operate only on service flagged for autostart on this node
	
	              --onlysecondary
	                     operate only on service not flagged for autostart on this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     comma-separated list of service to operate on
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     option to set when excuting from a clusterware to  disable  safety
	                     net
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron used by cron'ed action to tell the  collector  to  treat  the  log
	                     entries as such
	
	              --daemon
	                     a flag inhibiting the daemonization. set by the daemonization rou‐
	                     tine.
	
	              --debug
	                     debug mode
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     comma-separated list of resource tags to limit action to
	
	              -h, --help
	                     show this help message and exit
	
	              --remote
	                     flag action as triggered by a remote node. used  to  avoid  recur‐
	                     sively triggering actions amongst nodes
	
	OPTIONS
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2017-04-22                             SVCMGR(1)
