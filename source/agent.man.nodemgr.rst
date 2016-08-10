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
	                          acknowledge an action error on the node. an acknowlegment
	                          can be completed by --author (defaults to root@nodename)
	                          and --comment
	
	         nodemgr collector alerts
	                          display node alerts
	
	         nodemgr collector asset
	                          display asset information known to the collector
	
	         nodemgr collector checks
	                          display node checks
	
	         nodemgr collector create tag
	                          create a new tag
	
	         nodemgr collector disks
	                          display node disks
	
	         nodemgr collector events
	                          display node events during the period specified by
	                          --begin/--end. --end defaults to now. --begin defaults to 7
	                          days ago
	
	         nodemgr collector json alerts
	                          same as "collector alerts", output in JSON
	
	         nodemgr collector json asset
	                          display asset information known to the collector, output in
	                          JSON
	
	         nodemgr collector json checks
	                          same as "collector checks", output in JSON
	
	         nodemgr collector json disks
	                          same as "collector disks", output in JSON
	
	         nodemgr collector json events
	                          same as "collector events", output in JSON
	
	         nodemgr collector json list actions
	                          same as "collector list actions", output in JSON
	
	         nodemgr collector json list filtersets
	                          same as "collector list filtersets", output in JSON
	
	         nodemgr collector json list nodes
	                          same as "collector list nodes", output in JSON
	
	         nodemgr collector json list services
	                          same as "collector list services", output in JSON
	
	         nodemgr collector json list unavailability ack
	                          same as "collector list unavailability ack", output in JSON
	
	         nodemgr collector json networks
	                          display network information known to the collector for each
	                          node ip, output in JSON
	
	         nodemgr collector json show actions
	                          same as "collector show actions", output in JSON
	
	         nodemgr collector json status
	                          same as "collector status", output in JSON
	
	         nodemgr collector list actions
	                          list actions on the node, whatever the service, during the
	                          period specified by --begin/--end. --end defaults to now.
	                          --begin defaults to 7 days ago
	
	         nodemgr collector list filtersets
	                          show the list of filtersets available on the collector. if
	                          specified, --filterset <pattern> limits the resulset to
	                          filtersets matching <pattern>
	
	         nodemgr collector list nodes
	                          show the list of nodes matching the filterset pointed by
	                          --filterset
	
	         nodemgr collector list services
	                          show the list of services matching the filterset pointed by
	                          --filterset
	
	         nodemgr collector list tags
	                          list all available tags. use --like to filter the output.
	
	         nodemgr collector networks
	                          display network information known to the collector for each
	                          node ip
	
	         nodemgr collector show actions
	                          show actions detailled log. a single action is specified by
	                          --id. a range is specified by --begin/--end dates. --end
	                          defaults to now. --begin defaults to 7 days ago
	
	         nodemgr collector show tags
	                          list all node tags
	
	         nodemgr collector status
	                          display node services status according to the collector
	
	         nodemgr collector tag
	                          set a node tag (pointed by --tag)
	
	         nodemgr collector untag
	                          unset a node tag (pointed by --tag)
	
	       COMPLIANCE
	
	         nodemgr compliance attach
	                          attach ruleset specified by --ruleset and/or moduleset
	                          specified by --moduleset for this node
	
	         nodemgr compliance attach moduleset
	                          attach moduleset specified by --moduleset for this node
	
	         nodemgr compliance attach ruleset
	                          attach ruleset specified by --ruleset for this node
	
	         nodemgr compliance auto
	                          run compliance checks or fix, according to the autofix
	                          property of each module. --ruleset <md5> instruct the
	                          collector to provide an historical ruleset.
	
	         nodemgr compliance check
	                          run compliance checks. --ruleset <md5> instruct the
	                          collector to provide an historical ruleset.
	
	         nodemgr compliance detach
	                          detach ruleset specified by --ruleset and/or moduleset
	                          specified by --moduleset for this node
	
	         nodemgr compliance detach moduleset
	                          detach moduleset specified by --moduleset for this node
	
	         nodemgr compliance detach ruleset
	                          detach ruleset specified by --ruleset for this node
	
	         nodemgr compliance env
	                          show the compliance modules environment variables.
	
	         nodemgr compliance fix
	                          run compliance fixes. --ruleset <md5> instruct the
	                          collector to provide an historical ruleset.
	
	         nodemgr compliance fixable
	                          verify compliance fixes prerequisites. --ruleset <md5>
	                          instruct the collector to provide an historical ruleset.
	
	         nodemgr compliance list module
	                          list compliance modules available on this node
	
	         nodemgr compliance list moduleset
	                          list available compliance modulesets. --moduleset f% limit
	                          the scope to modulesets matching the f% pattern.
	
	         nodemgr compliance list ruleset
	                          list available compliance rulesets. --ruleset f% limit the
	                          scope to rulesets matching the f% pattern.
	
	         nodemgr compliance show moduleset
	                          show compliance rules applying to this node
	
	         nodemgr compliance show ruleset
	                          show compliance rules applying to this node
	
	         nodemgr compliance show status
	                          show compliance modules status
	
	       MISC
	
	         nodemgr prkey    show persistent reservation key of this node
	
	       NODE ACTIONS
	
	         nodemgr collect stats
	                          write in local files metrics not found in the standard
	                          metrics collector. these files will be fed to the collector
	                          by the 'pushstat' action.
	
	         nodemgr dequeue actions
	                          dequeue and execute actions from the collector's action
	                          queue for this node and its services.
	
	         nodemgr print schedule
	                          print the node tasks schedule
	
	         nodemgr provision
	                          provision the resources described in --resource arguments
	
	         nodemgr reboot   reboot the node
	
	         nodemgr rotate root pw
	                          set a new root password and store it in the collector
	
	         nodemgr scanscsi
	                          scan the scsi hosts in search of new disks
	
	         nodemgr schedule reboot
	                          mark the node for reboot at the next allowed period. the
	                          allowed period is defined by a "reboot" section in
	                          node.conf. the created flag file is
	                          /opt/opensvc/var/REBOOT_FLAG
	
	         nodemgr schedule reboot status
	                          tell if the node is scheduled for reboot
	
	         nodemgr scheduler
	                          run the node task scheduler
	
	         nodemgr schedulers
	                          execute a run of the node and services schedulers. this
	                          action is installed in the system scheduler
	
	         nodemgr shutdown
	                          shutdown the node to powered off state
	
	         nodemgr unschedule reboot
	                          unmark the node for reboot at the next allowed period. the
	                          removed flag file is /opt/opensvc/var/REBOOT_FLAG
	
	         nodemgr updatecomp
	                          upgrade the opensvc compliance modules. the modules must be
	                          available as a tarball behind the node.repo/compliance url.
	
	         nodemgr updatepkg
	                          upgrade the opensvc agent version. the packages must be
	                          available behind the node.repo/packages url.
	
	         nodemgr wol      forge and send udp wake on lan packet to mac address
	                          specified by --mac and --broadcast arguments
	
	       NODE CONFIGURATION EDITION
	
	         nodemgr edit authconfig
	                          open the auth.conf configuration file with the preferred
	                          editor
	
	         nodemgr edit config
	                          open the node.conf configuration file with the preferred
	                          editor
	
	         nodemgr get      get the value of the node configuration parameter pointed
	                          by --param
	
	         nodemgr register
	                          obtain a registration number from the collector, used to
	                          authenticate the node
	
	         nodemgr set      set a node configuration parameter (pointed by --param)
	                          value (pointed by --value)
	
	         nodemgr unset    unset a node configuration parameter (pointed by --param)
	
	       PUSH DATA TO THE COLLECTOR
	
	         nodemgr checks   run node sanity checks, push results to collector
	
	         nodemgr pushasset
	                          push asset information to collector
	
	         nodemgr pushbrocade
	                          push Brocade switch configuration to collector
	
	         nodemgr pushcentera
	                          push EMC Centera configuration to collector
	
	         nodemgr pushdcs
	                          push Datacore configuration to collector
	
	         nodemgr pushdisks
	                          push disks usage information to collector
	
	         nodemgr pushemcvnx
	                          push EMC CX/VNX configuration to collector
	
	         nodemgr pusheva
	                          push HP EVA configuration to collector
	
	         nodemgr pushfreenas
	                          push FreeNAS configuration to collector
	
	         nodemgr pushgcedisks
	                          push Google Compute Engine disks configuration to collector
	
	         nodemgr pushhds
	                          push HDS configuration to collector
	
	         nodemgr pushhp3par
	                          push HP 3par configuration to collector
	
	         nodemgr pushibmds
	                          push IBM DS configuration to collector
	
	         nodemgr pushibmsvc
	                          push IBM SVC configuration to collector
	
	         nodemgr pushnecism
	                          push NEC ISM configuration to collector
	
	         nodemgr pushnetapp
	                          push Netapp configuration to collector
	
	         nodemgr pushnsr
	                          push EMC Networker index to collector
	
	         nodemgr pushpatch
	                          push patch/version list to collector
	
	         nodemgr pushpkg
	                          push package/version list to collector
	
	         nodemgr pushstats
	                          push performance metrics to collector. By default pushed
	                          stats interval begins yesterday at the beginning of the
	                          allowed interval and ends now. This interval can be changed
	                          using --begin/--end parameters. The location where stats
	                          files are looked up can be changed using --stats-dir.
	
	         nodemgr pushsym
	                          push symmetrix configuration to collector
	
	         nodemgr pushvioserver
	                          push IBM VIO server configuration to collector
	
	         nodemgr sysreport
	                          push system report to the collector for archiving and diff
	                          analysis
	
	       SERVICE ACTIONS
	
	         nodemgr discover
	                          discover vservices accessible from this host, cloud nodes
	                          for example
	
	OPTIONS
	       --version
	              show program's version number and exit
	
	       -h, --help
	              show this help message and exit
	
	       --debug
	              debug mode
	
	       --stats-dir=STATS_DIR
	              points the directory where the metrics files are stored for pushstats
	
	       --module=MODULE
	              compliance, set module list
	
	       --moduleset=MODULESET
	              compliance, set moduleset list. The 'all' value can be used  in  conjonc‐
	              tion with detach.
	
	       --ruleset=RULESET
	              compliance,  set ruleset list. The 'all' value can be used in conjonction
	              with detach.
	
	       --filterset=FILTERSET
	              set a filterset to limit collector extractions
	
	       --ruleset-date=RULESET_DATE
	              compliance, use rulesets valid on specified date
	
	       --attach
	              attach the modulesets specified  during  a  compliance  check/fix/fixable
	              command
	
	       --cron cron mode
	
	       --force
	              force action
	
	       --symcli-db-file=SYMCLI_DB_FILE
	              [pushsym  option]  use  symcli offline mode with the specified file. aclx
	              files are expected to be found in the same  directory  and  named  either
	              <symid>.aclx or <same_prefix_as_bin_file>.aclx
	
	       --param=PARAM
	              point a node configuration parameter for the 'get' and 'set' actions
	
	       --value=VALUE
	              set a node configuration parameter value for the 'set --param' action
	
	       --duration=DURATION
	              a  duration  expressed  in  minutes. used with the 'collector ack action'
	              action
	
	       --begin=BEGIN
	              a begin date expressed as 'YYYY-MM-DD hh:mm'. used  with  the  'collector
	              ack action' and pushstats action
	
	       --end=END
	              a  end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack
	              action' and pushstats action
	
	       --comment=COMMENT
	              a comment to log when used with the 'collector ack action' action
	
	       --author=AUTHOR
	              the acker name to log when used with the 'collector ack action' action
	
	       --id=ID
	              specify an id to act on
	
	       --resource=RESOURCE
	              a resource definition in json dictionary  format  fed  to  the  provision
	              action
	
	       --object=OBJECTS
	              an  object  to  limit  a  push*  action to. multiple --object <object id>
	              parameters can be set on a single command line
	
	       --mac=MAC
	              list of mac addresses, comma separated, used by the 'wol' action
	
	       --tag=TAG
	              a tag specifier used by 'collector  create  tag',  'collector  add  tag',
	              'collector del tag'
	
	       --like=LIKE
	              a sql like filtering expression. leading and trailing wildcards are auto‐
	              matically set.
	
	       --broadcast=BROADCAST
	              list of broadcast addresses, comma separated, used by the 'wol' action
	
	       --sync use synchronous collector rpc if available. to use  with  pushasset  when
	              chaining a compliance run, to make sure the node ruleset is up-to-date.
	
	       --table
	              used  table representation of collector data instead of the default item‐
	              ized list of objects and properties
	
	       --user=USER
	              authenticate with the collector  using  the  specified  user  credentials
	              instead  of the node credentials. Required for the 'register' action when
	              the collector is configured to refuse anonymous register.
	
	       --app=APP
	              Optional with the register command, register the node  in  the  specified
	              app.  If  not  specified, the node is registered in the first registering
	              user's app found.
	
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2016-08-09                            NODEMGR(1)
