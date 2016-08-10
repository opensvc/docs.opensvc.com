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
	
	       --service=PARM_SVCS
	              comma-separated list of service to display status of
	
	       --refresh
	              do not use resource status cache
	
	       --updatedb
	              update resource status in central database
	
	       --verbose
	              display per-resource status for each selected service
	
	       --maxdelaydb=DELAY
	              introduce a random delay before pushing to database to level the load  on
	              the collector
	
	       --debug
	              debug mode
	
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2016-08-09                             SVCMON(1)
