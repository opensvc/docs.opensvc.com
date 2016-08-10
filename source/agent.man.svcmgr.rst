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
	                          acknowledge an action error on the service. an
	                          acknowlegment can be completed by --author (defaults to
	                          root@nodename) and --comment
	
	         svcmgr collector ack unavailability
	                          acknowledge an unavailability period. the period is
	                          specified by --begin/--end or --begin/--duration. omitting
	                          --begin defaults to now. an acknowlegment can be completed
	                          by --author (defaults to root@nodename), --account (default
	                          to 1) and --comment
	
	         svcmgr collector alerts
	                          display service alerts
	
	         svcmgr collector asset
	                          display asset information known to the collector
	
	         svcmgr collector checks
	                          display service checks
	
	         svcmgr collector create tag
	                          create a new tag
	
	         svcmgr collector disks
	                          display service disks
	
	         svcmgr collector events
	                          display service events during the period specified by
	                          --begin/--end. --end defaults to now. --begin defaults to 7
	                          days ago
	
	         svcmgr collector json alerts
	                          same as "collector alerts", output in JSON
	
	         svcmgr collector json asset
	                          display asset information known to the collector, output in
	                          JSON
	
	         svcmgr collector json checks
	                          same as "collector checks", output in JSON
	
	         svcmgr collector json disks
	                          same as "collector disks", output in JSON
	
	         svcmgr collector json events
	                          same as "collector events", output in JSON
	
	         svcmgr collector json list actions
	                          same as "collector list actions", output in JSON
	
	         svcmgr collector json list unavailability ack
	                          same as "collector list unavailability ack", output in JSON
	
	         svcmgr collector json networks
	                          display network information known to the collector for each
	                          service ip, output in JSON
	
	         svcmgr collector json show actions
	                          same as "collector show actions", output in JSON
	
	         svcmgr collector json status
	                          same as "collector status", output in JSON
	
	         svcmgr collector list actions
	                          list actions on the service, whatever the node, during the
	                          period specified by --begin/--end. --end defaults to now.
	                          --begin defaults to 7 days ago
	
	         svcmgr collector list tags
	                          list all available tags. use --like to filter the output.
	
	         svcmgr collector list unavailability ack
	                          list acknowledged periods for the service. the periods can
	                          be filtered by --begin/--end. omitting --end defaults to
	                          now. the wildcartd for --comment and --author is %
	
	         svcmgr collector networks
	                          display network information known to the collector for each
	                          service ip
	
	         svcmgr collector show actions
	                          show actions detailled log. a single action is specified by
	                          --id. a range is specified by --begin/--end dates. --end
	                          defaults to now. --begin defaults to 7 days ago
	
	         svcmgr collector show tags
	                          list all service tags
	
	         svcmgr collector status
	                          display service status on all nodes, according to the
	                          collector.
	
	         svcmgr collector tag
	                          set a service tag (pointed by --tag)
	
	         svcmgr collector untag
	                          unset a service tag (pointed by --tag)
	
	       COMPLIANCE
	
	         svcmgr compliance attach
	                          attach ruleset specified by --ruleset and/or moduleset
	                          specified by --moduleset to this service
	
	         svcmgr compliance attach moduleset
	                          attach moduleset specified by --moduleset to this service
	
	         svcmgr compliance attach ruleset
	                          attach ruleset specified by --ruleset to this service
	
	         svcmgr compliance check
	                          run compliance checks. --ruleset <md5> instruct the
	                          collector to provide an historical ruleset.
	
	         svcmgr compliance detach
	                          detach ruleset specified by --ruleset and/or moduleset
	                          specified by --moduleset from this service
	
	         svcmgr compliance detach moduleset
	                          detach moduleset specified by --moduleset from this service
	
	         svcmgr compliance detach ruleset
	                          detach ruleset specified by --ruleset from this service
	
	         svcmgr compliance env
	                          show the compliance modules environment variables.
	
	         svcmgr compliance fix
	                          run compliance fixes. --ruleset <md5> instruct the
	                          collector to provide an historical ruleset.
	
	         svcmgr compliance fixable
	                          verify compliance fixes prerequisites. --ruleset <md5>
	                          instruct the collector to provide an historical ruleset.
	
	         svcmgr compliance list moduleset
	                          list available compliance modulesets. --moduleset f% limit
	                          the scope to modulesets matching the f% pattern.
	
	         svcmgr compliance list ruleset
	                          list available compliance rulesets. --ruleset f% limit the
	                          scope to rulesets matching the f% pattern.
	
	         svcmgr compliance show moduleset
	                          show compliance rules applying to this service
	
	         svcmgr compliance show ruleset
	                          show compliance rules applying to this node
	
	         svcmgr compliance show status
	                          show compliance modules status
	
	       SERVICE ACTIONS
	
	         svcmgr boot      start a service if executed on the primary node (or one of
	                          the primary nodes in case of a flex service), startstandby
	                          if not
	
	         svcmgr disable   disable resources passed through --rid in services passed
	                          through --service. Specifying no resource disables the
	                          whole service.
	
	         svcmgr docker    wrap the docker client command, setting automatically the
	                          socket parameter to join the service-private docker daemon.
	                          The %images% and %instances% words in the wrapped command
	                          are replaced by, respectively, the set of docker instance
	                          names and images for container resources passing the
	                          --tags, --rid and --subsets filters. This is useful to
	                          remove all instances of a service or all instances of
	                          resources with a tag like "frontend". Note the opensvc
	                          filters must be positioned before the docker command in the
	                          arguments list.
	
	         svcmgr enable    enable resources passed through --rid in services passed
	                          through --service. Specifying no resource enables the whole
	                          service.
	
	         svcmgr freeze    set up a flag to block actions on this service
	
	         svcmgr frozen    report on the current blocking of actions on this service
	
	         svcmgr json devlist
	                          provide the service device list in json format, for use by
	                          tier tools
	
	         svcmgr json disklist
	                          provide the service disk list in json format, for use by
	                          tier tools
	
	         svcmgr json status
	                          provide the resource and aggregated status in json format,
	                          for use by tier tools
	
	         svcmgr migrate   live migrate the service to the remote node. --to <node>
	                          specify the remote node to migrate the service to.
	
	         svcmgr pg freeze
	                          freeze the tasks of a process group
	
	         svcmgr pg kill   kill the tasks of a process group
	
	         svcmgr pg thaw   thaw the tasks of a process group
	
	         svcmgr postsync
	                          make use of files received from master nodes in var
	
	         svcmgr presync   update var files associated to resources
	
	         svcmgr print devlist
	                          print service device list
	
	         svcmgr print disklist
	                          print service disk list
	
	         svcmgr print env mtime
	                          display service env file modification time
	
	         svcmgr print resource status
	                          display a specific service resource status, pointed by
	                          --rid
	
	         svcmgr print schedule
	                          print the service tasks schedule
	
	         svcmgr print status
	                          display service resource status
	
	         svcmgr provision
	                          provision and start the service
	
	         svcmgr prstart   reserve scsi disks held by this service
	
	         svcmgr prstatus
	                          report status of reservations on scsi disks held by this
	                          service
	
	         svcmgr prstop    release scsi disks held by this service
	
	         svcmgr pull      pull a service configuration from the collector
	
	         svcmgr push      push service configuration to the collector
	
	         svcmgr push appinfo
	                          push service application launchers appinfo key/value pairs
	                          to database
	
	         svcmgr push service status
	                          push service and its resources status to database
	
	         svcmgr resource monitor
	                          detect monitored resource failures and trigger
	                          monitor_action
	
	         svcmgr restart   combo action, chaining stop-start
	
	         svcmgr resync    combo action, chaining stop-sync_resync-start
	
	         svcmgr scheduler
	                          run the service task scheduler
	
	         svcmgr shutdown
	                          stop a service, disabling the background database logging
	
	         svcmgr start     start all service resources
	
	         svcmgr startapp
	                          execute service application startup script
	
	         svcmgr startcontainer
	                          start the container resource
	
	         svcmgr startdisk
	                          combo action, activating standby disks, taking
	                          reservations, starting loopback devices and volume groups
	
	         svcmgr startfs   prepare devices, logical volumes, mount service
	                          filesystems, bootstrap containers
	
	         svcmgr startip   configure service ip addresses
	
	         svcmgr startloop
	                          attach loop resources of this service
	
	         svcmgr startpool
	                          activate zpool resources of this service
	
	         svcmgr startshare
	                          start network shares
	
	         svcmgr startstandby
	                          start service resources flagged always on
	
	         svcmgr startvg   activate/import volume group resources of this service
	
	         svcmgr status    return service overall status code
	
	         svcmgr stonith   command provided to the heartbeat daemon to fence peer node
	                          in case of split brain
	
	         svcmgr stop      stop all service resources not flagged always on. With
	                          --force, stop all service resources, even those flagged
	                          always on.
	
	         svcmgr stopapp   execute service application stop script
	
	         svcmgr stopcontainer
	                          stop the container resource
	
	         svcmgr stopdisk
	                          combo action, stopping volume groups and loopback devices,
	                          droping reservations, disabling standby disks
	
	         svcmgr stopfs    shutdown container, umount service filesystems, deactivate
	                          logical volumes
	
	         svcmgr stopip    unconfigure service ip addresses
	
	         svcmgr stoploop
	                          detach loop resources of this service
	
	         svcmgr stoppool
	                          deactivate zpool resources of this service
	
	         svcmgr stopshare
	                          stop network shares
	
	         svcmgr stopvg    deactivate/deport volume group resources of this service
	
	         svcmgr switch    stop the service on the local node and start on the remote
	                          node. --to <node> specify the remote node to switch the
	                          service to.
	
	         svcmgr sync all
	                          combo action, chaining sync_nodes-sync_drp-sync_update.
	
	         svcmgr sync break
	                          split a storage hardware-assisted disk synchronization
	
	         svcmgr sync drp
	                          send to drp nodes the service config files and additional
	                          files described in the config file.
	
	         svcmgr sync establish
	                          establish a EMC SRDF storage hardware-assisted disk
	                          synchronization
	
	         svcmgr sync full
	                          trigger a full copy of the volume to its target
	
	         svcmgr sync nodes
	                          send to peer nodes the service config files and additional
	                          files described in the config file.
	
	         svcmgr sync quiesce
	                          trigger a storage hardware-assisted disk synchronization
	
	         svcmgr sync restore
	                          trigger a restore of the sync resources data to their
	                          target path (DANGEROUS: make sure you understand before
	                          running this action).
	
	         svcmgr sync resume
	                          re-establish a broken storage hardware-assisted
	                          synchronization
	
	         svcmgr sync resync
	                          like sync_update, but not triggered by the scheduler (thus
	                          adapted for clone/snap operations)
	
	         svcmgr sync revert
	                          revert to the pre-failover data (looses current data)
	
	         svcmgr sync split
	                          split a EMC SRDF storage hardware-assisted disk
	                          synchronization
	
	         svcmgr sync update
	                          trigger a one-time resync of the volume to its target
	
	         svcmgr sync verify
	                          trigger a one-time checksum-based verify of the volume and
	                          its target
	
	         svcmgr thaw      remove the flag to unblock actions on this service
	
	       SERVICE CONFIGURATION
	
	         svcmgr create    create a new service configuration file. --interactive
	                          triggers the interactive mode
	
	         svcmgr delete    delete the service instance on the local node if no --rid
	                          is specified, or delete the resources pointed by --rid in
	                          services passed through --service
	
	         svcmgr edit config
	                          edit service configuration
	
	         svcmgr get       get the value of the node configuration parameter pointed
	                          by --param
	
	         svcmgr install   install a service using the configuration file pointed by
	                          --envfile. used by master services when pushing the envfile
	                          to their slave.
	
	         svcmgr json config
	                          provide the service configuration in json format, for use
	                          by tier tools
	
	         svcmgr print config
	                          display service current configuration
	
	         svcmgr set       set a service configuration parameter (pointed by --param)
	                          value (pointed by --value)
	
	         svcmgr unset     unset a node configuration parameter pointed by --param
	
	         svcmgr update    update definitions in an existing service configuration
	                          file
	
	         svcmgr validate config
	                          check the sections and parameters are valid.
	
	OPTIONS
	       --version
	              show program's version number and exit
	
	       -h, --help
	              show this help message and exit
	
	       --debug
	              debug mode
	
	       --recover
	              Recover the stashed erroneous configuration file in a 'edit config'  com‐
	              mand
	
	       --discard
	              Discard  the stashed erroneous configuration file in a 'edit config' com‐
	              mand
	
	       --dry-run
	              Show the action execution plan
	
	       --disable-rollback
	              Exit without resource activation rollback on start action error
	
	       -p, --parallel
	              start actions on specified services in parallel
	
	       --ignore-affinity
	              ignore service anti-affinity with other services check
	
	       --remote
	              flag action as triggered by a remote  node.  used  to  avoid  recursively
	              triggering actions amongst nodes
	
	       -f, --force
	              force action, ignore sanity check warnings
	
	       --cron used  by cron'ed action to tell the collector to treat the log entries as
	              such
	
	       --slaves
	              option to set to limit the action scope to all slave service resources
	
	       --slave=SLAVE
	              option to set to limit the action scope to the service resources  in  the
	              specified, comma-sperated, slaves
	
	       --master
	              option to set to limit the action scope to the master service resources
	
	       -c, --cluster
	              option to set when excuting from a clusterware to disable safety net
	
	       -i, --interactive
	              prompt user for a choice instead of going for defaults or failing
	
	       --rid=PARM_RID
	              comma-separated list of resource to limit action to
	
	       --subsets=PARM_SUBSETS
	              comma-separated list of resource subsets to limit action to
	
	       --tags=PARM_TAGS
	              comma-separated list of resource tags to limit action to. The + separator
	              can be used to impose multiple tag  conditions.  Example:  tag1+tag2,tag3
	              limits the action to resources with both tag1 and tag2, or tag3.
	
	       --resource=RESOURCE
	              a resource definition in json dictionary format fed to create or update
	
	       --provision
	              provision  the  service  in  addition  to  env file creation. defaults to
	              False.
	
	       --waitlock=PARM_WAITLOCK
	              comma-separated list of resource tags to limit action to
	
	       --to=PARM_DESTINATION_NODE
	              remote node to start or migrate the service to
	
	       --show-disabled
	              tell print|json status action to include the disabled  resources  in  the
	              output, irrespective of the show_disabled service configuration setting.
	
	       --hide-disabled
	              tell  print|json  status  action to not include the disabled resources in
	              the output, irrespective of the show_disabled service configuration  set‐
	              ting.
	
	       --attach
	              attach  the  modulesets  specified  during a compliance check/fix/fixable
	              command
	
	       --module=MODULE
	              compliance, set module list
	
	       --moduleset=MODULESET
	              compliance, set moduleset list. The 'all' value can be used  in  conjonc‐
	              tion with detach.
	
	       --ruleset=RULESET
	              compliance,  set ruleset list. The 'all' value can be used in conjonction
	              with detach.
	
	       --ruleset-date=RULESET_DATE
	              compliance, use rulesets valid on specified date
	
	       --param=PARAM
	              point a service configuration parameter for the 'get' and 'set' actions
	
	       --value=VALUE
	              set a service configuration parameter value for the 'set --param' action
	
	       --duration=DURATION
	              a duration expressed in minutes. used with the  'collector  ack  unavail‐
	              ability' action
	
	       --account
	              decides  that  the unavailabity period should be deduced from the service
	              availability anyway. used with the 'collector ack unavailability' action
	
	       --begin=BEGIN
	              a begin date expressed as 'YYYY-MM-DD hh:mm'. used  with  the  'collector
	              ack unavailability' action
	
	       --end=END
	              a  end date expressed as 'YYYY-MM-DD hh:mm'. used with the 'collector ack
	              unavailability' action
	
	       --comment=COMMENT
	              a comment to log when used with the 'collector ack unavailability' action
	
	       --author=AUTHOR
	              the acker name to log when used with the 'collector  ack  unavailability'
	              action
	
	       --id=ID
	              specify an id to act on
	
	       --table
	              use  table  representation of collector data instead of the default item‐
	              ized list of objects and properties
	
	       --refresh
	              drop last resource status cache and re-evaluate before printing with  the
	              'print [json] status' commands
	
	       --tag=TAG
	              a  tag  specifier  used  by  'collector create tag', 'collector add tag',
	              'collector del tag'
	
	       --like=LIKE
	              a sql like filtering expression. leading and trailing wildcards are auto‐
	              matically set.
	
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2016-08-09                             SVCMGR(1)
