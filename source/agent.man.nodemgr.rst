nodemgr manpage
**************

::

	NODEMGR(1)                      General Commands Manual                      NODEMGR(1)
	
	NAME
	       nodemgr - OpenSVC agent's node management command.
	
	SYNOPSIS
	       nodemgr [ OPTIONS ] COMMAND
	
	DESCRIPTION
	       In  the OpenSVC infrastructure, the node is an operating system instance with an
	       OpenSVC agent installed. The node  may  host  OpenSVC  services  instances.  The
	       nodemgr  program  provides commands to configure and execute all the agent func‐
	       tions that interact with the node.
	
	COMMANDS
	       COLLECTOR MANAGEMENT
	
	       nodemgr collector ack action
	
	              acknowledge an action error on the node. an  acknowlegment  can  be  com‐
	              pleted by --author (defaults to root@nodename) and --comment
	
	              --author=AUTHOR
	                     the  acker  name  to log when used with the 'collector ack action'
	                     action
	
	              --comment=COMMENT
	                     a comment to log when used with the 'collector ack action' action
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector alerts
	
	              display node alerts
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector asset
	
	              display asset information known to the collector
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector checks
	
	              display node checks
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector cli
	
	              open a Command Line Interface to the collector rest API. The  CLI  offers
	              autocompletion  of paths and arguments, piping JSON data from files. This
	              command accepts the --user, --password, --api,  --insecure  and  --config
	              parameters. If executed as root, the collector is logged in with the node
	              credentials.
	
	              --user=USER
	                     authenticate with the collector using the specified  user  creden‐
	                     tials instead of the node credentials. Required for the 'register'
	                     action when the collector is configured to refuse anonymous regis‐
	                     ter.
	
	              --password=PASSWORD
	                     authenticate  with  the collector using the specified user creden‐
	                     tials instead of the node credentials. Prompted if  necessary  but
	                     not specified.
	
	              --api=API
	                     specify  a  collector  api  url  different  from  the  one  set in
	                     node.conf. Honored by the 'collector cli' action.
	
	              --insecure
	                     allow communications with a collector  presenting  unverified  SSL
	                     certificates.
	
	              --config=CONFIG
	                     specify  a  user-specific  collector  api connection configuration
	                     file. defaults to '~/.opensvc-cli'. Honored by the 'collector cli'
	                     action.
	
	              --refresh-api
	                     The OpenSVC collector api url
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector create tag
	
	              create a new tag with name specified by --tag
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector disks
	
	              display node disks
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector events
	
	              display node events during the period specified by  --begin/--end.  --end
	              defaults to now. --begin defaults to 7 days ago.
	
	              --begin=BEGIN
	                     a  begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'col‐
	                     lector ack action' and pushstats action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack action' and pushstats action
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector list actions
	
	              list  actions on the node, whatever the service, during the period speci‐
	              fied by --begin/--end. --end defaults to now. --begin defaults to 7  days
	              ago
	
	              --begin=BEGIN
	                     a  begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'col‐
	                     lector ack action' and pushstats action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack action' and pushstats action
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector list filtersets
	
	              show  the  list  of  filtersets available on the collector. if specified,
	              --filterset <pattern> limits the resulset to  filtersets  matching  <pat‐
	              tern>
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector list nodes
	
	              show the list of nodes matching the filterset pointed by --filterset
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector list services
	
	              show the list of services matching the filterset pointed by --filterset
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector list tags
	
	              list all available tags. use --like to filter the output.
	
	              --like=LIKE
	                     a  sql  like  filtering expression. leading and trailing wildcards
	                     are automatically set.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector log
	
	              log a message in the collector's node log
	
	              --message=MESSAGE
	                     the message to send to the collector for logging
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector networks
	
	              display network information known to the collector for each node ip
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector search
	
	              report the collector objects matching --like [<type>:]<substring>,  where
	              <type>  is  the object type acronym as shown in the collector search wid‐
	              get.
	
	              --like=LIKE
	                     a sql like filtering expression. leading  and  trailing  wildcards
	                     are automatically set.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector show actions
	
	              show  actions detailed log. a single action is specified by --id. a range
	              is specified by --begin/--end  dates.  --end  defaults  to  now.  --begin
	              defaults to 7 days ago
	
	              --begin=BEGIN
	                     a  begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'col‐
	                     lector ack action' and pushstats action
	
	              --id=ID
	                     specify an id to act on
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack action' and pushstats action
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector show tags
	
	              list all node tags
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector tag
	
	              set a node tag (pointed by --tag)
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr collector untag
	
	              unset a node tag (pointed by --tag)
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     COMPLIANCE
	
	       nodemgr compliance attach
	
	              attach ruleset specified  by  --ruleset  and/or  moduleset  specified  by
	              --moduleset for this node
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance attach moduleset
	
	              attach moduleset specified by --moduleset for this node
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance attach ruleset
	
	              attach ruleset specified by --ruleset for this node
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance auto
	
	              run  compliance  checks or fix, according to the autofix property of each
	              module. --ruleset <md5> instruct the collector to provide  an  historical
	              ruleset.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance check
	
	              run  compliance checks. --ruleset <md5> instruct the collector to provide
	              an historical ruleset.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              --force
	                     force action
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance detach
	
	              detach ruleset specified  by  --ruleset  and/or  moduleset  specified  by
	              --moduleset for this node
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance detach moduleset
	
	              detach moduleset specified by --moduleset for this node
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance detach ruleset
	
	              detach ruleset specified by --ruleset for this node
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance env
	
	              show the compliance modules environment variables.
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance fix
	
	              run compliance fixes. --ruleset <md5> instruct the collector  to  provide
	              an historical ruleset.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              --force
	                     force action
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance fixable
	
	              verify  compliance fixes prerequisites. --ruleset <md5> instruct the col‐
	              lector to provide an historical ruleset.
	
	              --attach
	                     attach the modulesets specified during a compliance check/fix/fix‐
	                     able command
	
	              --force
	                     force action
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset-date=RULESET_DATE
	                     compliance, use rulesets valid on specified date
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance list module
	
	              list compliance modules available on this node
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance list moduleset
	
	              list available compliance modulesets. --moduleset f% limit the  scope  to
	              modulesets matching the f% pattern.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance list ruleset
	
	              list available compliance rulesets. --ruleset f% limit the scope to rule‐
	              sets matching the f% pattern.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance show moduleset
	
	              show compliance rules applying to this node
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance show ruleset
	
	              show compliance rules applying to this node
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr compliance show status
	
	              show compliance modules status
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     MISC
	
	       nodemgr prkey
	
	              show persistent reservation key of this node
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     NODE ACTIONS
	
	       nodemgr collect stats
	
	              write in local files metrics not found in the standard metrics collector.
	              these files will be fed to the collector by the 'pushstat' action.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr dequeue actions
	
	              dequeue  and  execute  actions from the collector's action queue for this
	              node and its services.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr logs
	
	              fancy display of the node logs
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr print schedule
	
	              print the node tasks schedule
	
	              --verbose
	                     add more information to  some  print  commands:  +next  in  'print
	                     schedule'
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr provision
	
	              provision the resources described in --resource arguments
	
	              --resource=RESOURCE
	                     a  resource definition in json dictionary format fed to the provi‐
	                     sion action
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr reboot
	
	              reboot the node
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr rotate root pw
	
	              set a new root password and store it in the collector
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr scanscsi
	
	              scan the scsi hosts in search of new disks
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr schedule reboot
	
	              mark the node for reboot at the next allowed period. the  allowed  period
	              is defined by a "reboot" section in node.conf.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr schedule reboot status
	
	              tell if the node is scheduled for reboot
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr scheduler
	
	              run the node task scheduler
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr schedulers
	
	              execute  a  run  of  the  node  and  services  schedulers. this action is
	              installed in the system scheduler
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr shutdown
	
	              shutdown the node to powered off state
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr unschedule reboot
	
	              unmark the node for reboot at the next allowed period.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr updatecomp
	
	              upgrade the opensvc compliance modules. the modules must be available  as
	              a tarball behind the node.repo/compliance url.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr updatepkg
	
	              upgrade  the opensvc agent version. the packages must be available behind
	              the node.repo/packages url.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr wol
	
	              forge and send udp wake on lan packet to mac address specified  by  --mac
	              and --broadcast arguments
	
	              --broadcast=BROADCAST
	                     list  of  broadcast  addresses, comma separated, used by the 'wol'
	                     action
	
	              --mac=MAC
	                     list of mac addresses, comma separated, used by the 'wol' action
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     NODE CONFIGURATION
	
	       nodemgr edit authconfig
	
	              open the auth.conf configuration file with the preferred editor
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr edit config
	
	              open the node.conf configuration file with the preferred editor
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr get
	
	              get the value of the node configuration parameter pointed by --param
	
	              --param=PARAM
	                     point a node configuration  parameter  for  the  'get'  and  'set'
	                     actions
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr print authconfig
	
	              open the node.conf configuration file with the preferred editor
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr print config
	
	              open the node.conf configuration file with the preferred editor
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr register
	
	              obtain a registration number from the collector, used to authenticate the
	              node
	
	              --app=APP
	                     Optional with the register command, register the node in the spec‐
	                     ified  app.  If not specified, the node is registered in the first
	                     registering user's app found.
	
	              --password=PASSWORD
	                     authenticate with the collector using the specified  user  creden‐
	                     tials  instead  of the node credentials. Prompted if necessary but
	                     not specified.
	
	              --user=USER
	                     authenticate with the collector using the specified  user  creden‐
	                     tials instead of the node credentials. Required for the 'register'
	                     action when the collector is configured to refuse anonymous regis‐
	                     ter.
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr set
	
	              set a node configuration parameter (pointed by --param) value (pointed by
	              --value)
	
	              --param=PARAM
	                     point a node configuration  parameter  for  the  'get'  and  'set'
	                     actions
	
	              --value=VALUE
	                     set  a  node  configuration  parameter value for the 'set --param'
	                     action
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr unset
	
	              unset a node configuration parameter (pointed by --param)
	
	              --param=PARAM
	                     point a node configuration  parameter  for  the  'get'  and  'set'
	                     actions
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     PUSH DATA TO THE COLLECTOR
	
	       nodemgr checks
	
	              run node sanity checks, push results to collector
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushasset
	
	              push asset information to collector
	
	              --sync use  synchronous  collector rpc. to use when chaining a compliance
	                     run, to make sure the node ruleset is up-to-date.
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushbrocade
	
	              push Brocade switch configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushcentera
	
	              push EMC Centera configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushdcs
	
	              push Datacore configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushdisks
	
	              push disks usage information to collector
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushemcvnx
	
	              push EMC CX/VNX configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pusheva
	
	              push HP EVA configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushfreenas
	
	              push FreeNAS configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushgcedisks
	
	              push Google Compute Engine disks configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushhds
	
	              push HDS configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushhp3par
	
	              push HP 3par configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushibmds
	
	              push IBM DS configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushibmsvc
	
	              push IBM SVC configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushnecism
	
	              push NEC ISM configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushnetapp
	
	              push Netapp configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushnsr
	
	              push EMC Networker index to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushpatch
	
	              push patch/version list to collector
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushpkg
	
	              push package/version list to collector
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushstats
	
	              push performance metrics to collector. By default pushed  stats  interval
	              begins  yesterday  at the beginning of the allowed interval and ends now.
	              This interval can be changed using --begin/--end parameters. The location
	              where stats files are looked up can be changed using --stats-dir.
	
	              --begin=BEGIN
	                     a  begin date expressed as 'YYYY-MM-DD hh:mm'. used with the 'col‐
	                     lector ack action' and pushstats action
	
	              --end=END
	                     a end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collec‐
	                     tor ack action' and pushstats action
	
	              --stats-dir=STATS_DIR
	                     points  the directory where the metrics files are stored for push‐
	                     stats
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushsym
	
	              push symmetrix configuration to collector
	
	              --object=OBJECTS
	                     an object to limit a push* action to.  multiple  --object  <object
	                     id> parameters can be set on a single command line
	
	              --symcli-db-file=SYMCLI_DB_FILE
	                     [pushsym  option] use symcli offline mode with the specified file.
	                     aclx files are expected to be found  in  the  same  directory  and
	                     named either <symid>.aclx or <same_prefix_as_bin_file>.aclx
	
	              --color=COLOR
	                     colorize  output.  possible  values  are : auto=guess based on tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr pushvioserver
	
	              push IBM VIO server configuration to collector
	
	              --object=OBJECTS
	                     an  object  to  limit a push* action to. multiple --object <object
	                     id> parameters can be set on a single command line
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	       nodemgr sysreport
	
	              push system report to the collector for archiving and diff analysis
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	                     SERVICE ACTIONS
	
	       nodemgr discover
	
	              discover vservices accessible from this host, cloud nodes for example
	
	              --color=COLOR
	                     colorize output. possible values are :  auto=guess  based  on  tty
	                     presence, always|yes=always colorize, never|no=never colorize
	
	              --cron cron mode
	
	              --debug
	                     debug mode
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json or table.
	
	              -h, --help
	                     show this help message and exit
	
	OPTIONS
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2017-01-03                            NODEMGR(1)
