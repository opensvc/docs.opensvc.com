svcmon manpage
--------------

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
	
	       --color=COLOR
	              colorize output. possible values are : auto=guess based on tty  presence,
	              always|yes=always colorize, never|no=never colorize
	
	SEE ALSO
	       nodemgr(1) svcmgr(1) svcmon(1)
	
	AUTHORS
	       OpenSVC is developped and maintained by the OpenSVC company.
	
	                                       2017-09-12                             SVCMON(1)
