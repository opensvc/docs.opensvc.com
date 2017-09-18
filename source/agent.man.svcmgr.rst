svcmgr manpage
--------------

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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	                     a  duration  expression  like  '10m'. used with the 'collector ack
	                     unavailability' action
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector alerts
	
	              display service alerts
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector asset
	
	              display asset information known to the collector
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector checks
	
	              display service checks
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector create tag
	
	              create a new tag
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector disks
	
	              display service disks
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector list tags
	
	              list all available tags. use --like to filter the output.
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --like=LIKE
	                     a  sql  like  filtering expression. leading and trailing wildcards
	                     are automatically set.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector log
	
	              log a message in the collector's service log
	
	              --message=MESSAGE
	                     the message to send to the collector for logging
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector networks
	
	              display network information known to the collector for each service ip
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector show tags
	
	              list all service tags
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector tag
	
	              set a service tag (pointed by --tag)
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr collector untag
	
	              unset a service tag (pointed by --tag)
	
	              --tag=TAG
	                     a  tag  specifier  used  by 'collector create tag', 'collector add
	                     tag', 'collector del tag'
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance attach moduleset
	
	              attach moduleset specified by --moduleset to this service
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance attach ruleset
	
	              attach ruleset specified by --ruleset to this service
	
	              --ruleset=RULESET
	                     compliance,  set ruleset list. The 'all' value can be used in con‐
	                     jonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance detach
	
	              detach ruleset specified  by  --ruleset  and/or  moduleset  specified  by
	              --moduleset from this service
	
	              --moduleset=MODULESET
	                     compliance,  set  moduleset  list.  The 'all' value can be used in
	                     conjonction with detach.
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance detach moduleset
	
	              detach moduleset specified by --moduleset from this service
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance detach ruleset
	
	              detach ruleset specified by --ruleset from this service
	
	              --ruleset=RULESET
	                     compliance, set ruleset list. The 'all' value can be used in  con‐
	                     jonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance env
	
	              show the compliance modules environment variables.
	
	              --module=MODULE
	                     compliance, set module list
	
	              --moduleset=MODULESET
	                     compliance, set moduleset list. The 'all' value  can  be  used  in
	                     conjonction with detach.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance list moduleset
	
	              list available compliance modulesets. --moduleset f% limit the  scope  to
	              modulesets matching the f% pattern.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance list ruleset
	
	              list available compliance rulesets. --ruleset f% limit the scope to rule‐
	              sets matching the f% pattern.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance show moduleset
	
	              show compliance rules applying to this service
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance show ruleset
	
	              show compliance rules applying to this node
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr compliance show status
	
	              show compliance modules status
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	                     SERVICE ACTIONS
	
	       svcmgr boot
	
	              start  a  service  if executed on the primary node (or one of the primary
	              nodes in case of a flex service), startstandby if not
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr clear
	
	              clear the monitor status of the service on the node pointed by --node. If
	              --node is not specified, the local node is targeted.
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr dns update
	
	              update the collector dns records for the service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr freeze
	
	              set up a flag to block actions on this service
	
	              --time=TIME
	                     A  duration  expression  like '1m5s'. The maximum wait time for an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr frozen
	
	              report on the current blocking of actions on this service
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr giveback
	
	              stop the service on its current node and start on the node chosen by  the
	              placement policy.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              --time=TIME
	                     A  duration  expression  like '1m5s'. The maximum wait time for an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr logs
	
	              display the service logs in the pager
	
	              --backlog=BACKLOG
	                     A size expression telling the logs action to fetch at most as much
	                     data from the log file tail. Default is 10k.
	
	              --follow
	                     with logs action, follow the logs as they come.
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
	              --no-pager
	                     do not display the command result in a pager.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr ls
	
	              display the installed service list
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr migrate
	
	              live  migrate  the  service  to  the remote node. --to <node> specify the
	              remote node to migrate the service to.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              --time=TIME
	                     A duration expression like '1m5s'. The maximum wait  time  for  an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              --to=PARM_DESTINATION_NODE
	                     remote node to start or migrate the service to
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr pg freeze
	
	              freeze the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr pg kill
	
	              kill the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr pg thaw
	
	              thaw the tasks of a process group
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr postsync
	
	              make use of files received from master nodes in var
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr presync
	
	              update var files associated to resources
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print base devs
	
	              print the list of base devices the service or the specified resources are
	              layered on.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print config mtime
	
	              display service configuration file modification time
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print devs
	
	              aggregate the information of print base, sub and exposed devices
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print exposed devs
	
	              print the list of devices the service or the specified resources expose.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print resource status
	
	              display a specific service resource status, pointed by --rid
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --refresh
	                     drop  last  resource  status cache and re-evaluate before printing
	                     with the 'print [json] status' commands
	
	              --rid=PARM_RID
	                     comma-separated list of resource to limit action to
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print schedule
	
	              print the service tasks schedule
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              --verbose
	                     add more information to  some  print  commands:  +next  in  'print
	                     schedule'
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print status
	
	              display service resource status
	
	              --format=FORMAT
	                     specify a data formatter for output of the print*  and  collector*
	                     commands. possible values are json, csv or table.
	
	              --hide-disabled
	                     tell   print|json  status  action  to  not  include  the  disabled
	                     resources in the output, irrespective of the show_disabled service
	                     configuration setting.
	
	              --refresh
	                     drop  last  resource  status cache and re-evaluate before printing
	                     with the 'print [json] status' commands
	
	              --show-disabled
	                     tell print|json status action to include the disabled resources in
	                     the  output,  irrespective of the show_disabled service configura‐
	                     tion setting.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print sub devs
	
	              print the list of devices the service or the specified resources are lay‐
	              ered on.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr provision
	
	              provision and start the service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr prstart
	
	              reserve scsi disks held by this service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr prstatus
	
	              report status of reservations on scsi disks held by this service
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr prstop
	
	              release scsi disks held by this service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr pull
	
	              pull a service configuration from the collector
	
	              --provision
	                     with   the  install  or  create  actions,  provision  the  service
	                     resources after config file creation. defaults to False.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr push
	
	              push service configuration to the collector
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr push resinfo
	
	              push service resources and application launchers info key/value pairs the
	              collector
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr push service status
	
	              push service and its resources status to database
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr resource monitor
	
	              refresh only monitored resource status. This action is scheduleable, usu‐
	              ally every minute.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr restart
	
	              combo action, chaining stop-start
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr resync
	
	              combo action, chaining stop-sync_resync-start
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr run
	
	              run  all  tasks,  or tasks specified by --rid --tags and --subset, disre‐
	              garding their schedule
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr scheduler
	
	              run the service task scheduler
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr shutdown
	
	              stop a service, disabling the background database logging
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr start
	
	              start all service resources
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              --time=TIME
	                     A  duration  expression  like '1m5s'. The maximum wait time for an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startapp
	
	              execute service application startup script
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startcontainer
	
	              start the container resource
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startdisk
	
	              combo  action,  activating  standby  disks, taking reservations, starting
	              loopback devices and volume groups
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startfs
	
	              prepare  devices,  logical  volumes, mount service filesystems, bootstrap
	              containers
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startip
	
	              configure service ip addresses
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startshare
	
	              start network shares
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr startstandby
	
	              start service resources flagged always on
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr status
	
	              return service overall status code
	
	              --refresh
	                     drop last resource status cache and  re-evaluate  before  printing
	                     with the 'print [json] status' commands
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stonith
	
	              command provided to the heartbeat daemon to fence peer node  in  case  of
	              split brain
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stop
	
	              stop all service resources not flagged always on. With --force, stop  all
	              service resources, even those flagged always on.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              --time=TIME
	                     A  duration  expression  like '1m5s'. The maximum wait time for an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopapp
	
	              execute service application stop script
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopcontainer
	
	              stop the container resource
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopdisk
	
	              combo action, stopping volume groups and loopback devices, droping reser‐
	              vations, disabling standby disks
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopfs
	
	              shutdown  container,  umount service filesystems, deactivate logical vol‐
	              umes
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopip
	
	              unconfigure service ip addresses
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr stopshare
	
	              stop network shares
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr switch
	
	              stop  the  service  on  the local node and start on the remote node. --to
	              <node> specify the remote node to switch the service to.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              --time=TIME
	                     A duration expression like '1m5s'. The maximum wait  time  for  an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              --to=PARM_DESTINATION_NODE
	                     remote node to start or migrate the service to
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync all
	
	              combo action, chaining sync_nodes-sync_drp-sync_update.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync break
	
	              split a storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync drp
	
	              send to drp nodes the service config files and additional files described
	              in the config file.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync establish
	
	              establish a EMC SRDF storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync full
	
	              trigger a full copy of the volume to its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync nodes
	
	              send to  peer  nodes  the  service  config  files  and  additional  files
	              described in the config file.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync quiesce
	
	              trigger a storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync restore
	
	              trigger  a  restore of the sync resources data to their target path (DAN‐
	              GEROUS: make sure you understand before running this action).
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync resume
	
	              re-establish a broken storage hardware-assisted synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync resync
	
	              like sync_update, but not triggered by the scheduler  (thus  adapted  for
	              clone/snap operations)
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync revert
	
	              revert to the pre-failover data (looses current data)
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync split
	
	              split a EMC SRDF storage hardware-assisted disk synchronization
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync update
	
	              trigger a one-time resync of the volume to its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr sync verify
	
	              trigger a one-time checksum-based verify of the volume and its target
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr takeover
	
	              stop the service on its current node and start on the local node.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              --time=TIME
	                     A duration expression like '1m5s'. The maximum wait  time  for  an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr thaw
	
	              remove the flag to unblock actions on this service
	
	              --time=TIME
	                     A duration expression like '1m5s'. The maximum wait  time  for  an
	                     async action to finish. Default is 300 seconds.
	
	              --wait Wait for asynchronous action termination
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr toc
	
	              Trigger the service pre_monitor_action script and monitor_action  method.
	              Beware, this might crash or reboot the node.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr unprovision
	
	              stop and unprovision the service. beware: data will be lost upon  fs  and
	              disk unprovisioning.
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
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
	
	              --local
	                     execute the service action via the daemon, on  the  local  service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option  to  set  to  limit  the action scope to the master service
	                     resources
	
	              --node=NODE
	                     the node to send a request to. if not specified the local node  is
	                     targeted.
	
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
	
	              -i, --interactive
	                     prompt user for a choice instead of going for defaults or failing
	
	              --provision
	                     with   the  install  or  create  actions,  provision  the  service
	                     resources after config file creation. defaults to False.
	
	              --resource=RESOURCE
	                     a resource definition in json dictionary format fed to  create  or
	                     update
	
	              --template=PARM_TEMPLATE
	                     the  configuration file template name or id, served by the collec‐
	                     tor, to use when creating or installing a service
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr delete
	
	              delete  the  service instance on the local node if no --rid is specified,
	              or delete the resources pointed  by  --rid  in  services  passed  through
	              --service
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              --unprovision
	                     with  the  delete action, unprovision the service resources before
	                     config files file deletion. defaults to False.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr edit config
	
	              edit service configuration
	
	              --discard
	                     Discard  the  stashed erroneous configuration file in a 'edit con‐
	                     fig' command
	
	              --recover
	                     Recover the stashed erroneous configuration file in a  'edit  con‐
	                     fig' command
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr get
	
	              get the raw or dereferenced value of a service configuration parameter
	
	              --eval If set with the 'get' action, the  printed  value  of  --param  is
	                     scoped and dereferenced.
	
	              --param=PARAM
	                     point  a  service  configuration parameter for the 'get' and 'set'
	                     actions
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr print config
	
	              display service current configuration
	
	              --format=FORMAT
	                     specify  a  data formatter for output of the print* and collector*
	                     commands. possible values are json, csv or table.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr set
	
	              set a service configuration parameter
	
	              --kw=KW
	                     combined   with   the   set   action,  an  expression  like  <key‐
	                     word>[@<scope>][[<index>]]<op><value>,  where  <op>  can  be  '=',
	                     '+=',  '-='. Multiple --kw can be set to apply multiple configura‐
	                     tion change in a file with a single write.
	
	              --add=ADD
	                     a list member to add from the value pointed by --param  in  a  set
	                     action. If --index is set, add the new element at that position in
	                     the list
	
	              --index=INDEX
	                     the position in the list pointed by --param where to add  the  new
	                     element on a set action
	
	              --param=PARAM
	                     point  a  service  configuration parameter for the 'get' and 'set'
	                     actions
	
	              --remove=REMOVE
	                     a list member to drop from the value pointed by --param in  a  set
	                     action
	
	              --value=VALUE
	                     set  a service configuration parameter value for the 'set --param'
	                     action
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr unset
	
	              unset a node configuration parameter pointed by --param
	
	              --param=PARAM
	                     point  a  service  configuration parameter for the 'get' and 'set'
	                     actions
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr update
	
	              update definitions in an existing service configuration file
	
	              --dry-run
	                     Show the action execution plan
	
	              -f, --force
	                     force action, ignore sanity check warnings
	
	              --local
	                     execute  the  service  action via the daemon, on the local service
	                     instances only, ignoring cluster-wide considerations.
	
	              --master
	                     option to set to limit the action  scope  to  the  master  service
	                     resources
	
	              --node=NODE
	                     the  node to send a request to. if not specified the local node is
	                     targeted.
	
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
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute an action on all cluster nodes, aggregate  the  json  out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export the uppercased variable in the  os  environment.  with  the
	                     create  action  only,  set  a env section parameter in the service
	                     configuration file. multiple --env <key>=<val> can  be  specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A  duration  expression  like  '5s'. The maximum wait time for the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	       svcmgr validate config
	
	              check the sections and parameters are valid.
	
	              -s PARM_SVCS, --service=PARM_SVCS
	                     A service selector expression [!]<expr>[<sep>[!]<expr>].  Where
	                      '!' is the expression negation operator
	                      <sep> can be
	                       ',' OR expressions
	                       '+' AND expressions
	                      <expr> can be
	                        a glob on service names
	                        <param><op><value>
	                         Where
	                          <param> can be
	                            <rid>:
	                            <group>:
	                            <rid>.<key>
	                            <group>.<key>
	                          <op> can be
	                            <  >  <=  >=  =
	                            ~ with regexp value Examples:
	                      '*dns,ha*+app.timeout>1'
	                      'ip:+task:'
	                      '!*excluded' Note:
	                      '!' usage mandates single quoting the expression to prevent shell
	                     history expansion
	
	              --status=PARM_STATUS
	                     operate only on service in the specified status (up/down/warn)
	
	              -c, --cluster
	                     Execute  an  action  on all cluster nodes, aggregate the json out‐
	                     puts.
	
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
	
	              --env=ENV
	                     export  the  uppercased  variable  in the os environment. with the
	                     create action only, set a env section  parameter  in  the  service
	                     configuration  file.  multiple --env <key>=<val> can be specified.
	                     For all other actions.
	
	              -p, --parallel
	                     start actions on specified services in parallel
	
	              --waitlock=PARM_WAITLOCK
	                     A duration expression like '5s'. The maximum  wait  time  for  the
	                     action lock acquire.
	
	              -h, --help
	                     show this help message and exit
	
	OPTIONS
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2017-09-12                             SVCMGR(1)
