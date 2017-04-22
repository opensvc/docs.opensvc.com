svcmon manpage
**************

::

	SVCMON(1)                       General Commands Manual                       SVCMON(1)
	
	NAME
	       svcmon - OpenSVC agent's services instances status requesting command.
	
	SYNOPSIS
	       svcmon [ OPTIONS ]
	
	DESCRIPTION
	       In  the OpenSVC infrastructure, the node is an operating system instance with an
	       OpenSVC agent installed. The node may host OpenSVC services instances. The  svc‐
	       mon  program prints the digested instances status of the services running on the
	       local node.
	
	OPTIONS
	       --version
	              show program's version number and exit
	
	       -h, --help
	              show this help message and exit
	
	       -s PARM_SVCS, --service=PARM_SVCS
	              comma-separated list of service to display status of
	
	       --refresh
	              do not use resource status cache
	
	       --updatedb
	              update resource status in central database
	
	       -v, --verbose
	              display resource groups status for each selected service
	
	       --maxdelaydb=DELAY
	              introduce a random delay before pushing to database to level the load  on
	              the collector
	
	       --debug
	              debug mode
	
	       -c, --cluster
	              fetch and display cluster-wide service status from the collector.
	
	       --color=COLOR
	              colorize  output. possible values are : auto=guess based on tty presence,
	              always|yes=always colorize, never|no=never colorize
	
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2017-04-22                             SVCMON(1)
