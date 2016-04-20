Knowledge base
==============

Freeze/thaw and disable/enable actions on encapsulated services
---------------------------------------------------------------

As of opensvc agent version 1.7-x,

* the freeze/thaw actions executed from the master of a service with encapsulated resources only affects this master part, leaving the slave service frozen state unchanged.
* The freeze/thaw actions executed from the slave only affects this slave part of the service, leaving the master service frozen state unchanged.
* the enable/disable actions executed from the master of a service with encapsulated resources affects both parts immediately.
* the enable/disable actions executed from the slave of a service with encapsulated resources affects the slave immediately, and the master upon the next scheduled "push" action (10 minutes max with the default push schedule)

Out of file descriptors on Solaris
----------------------------------

The number of file descriptors used by the agent augments with the number of services, notably during svcmon which spawns one subprocess per service.
The python interpreter in Solaris may be build in 32 bits, limiting the maximum number of file descriptors to 256, whatever to value set as a ulimit. The limit is reached with ~62 service per host.
To work around this issue, you can either switch to a 64 bits python build or setup a python wrapper::

	$ cat /opt/opensvc/bin/python.wrapper
	#!/bin/bash
	LD_PRELOAD_32=/usr/lib/extendedFILE.so.1 exec /usr/bin/python2.7 $*

	$ cd /opt/opensvc/bin && ln -sf python.wrapper python

Note since opensvc-1.7-10222, the agent postinstall detects the presence of a wrapper in /opt/opensvc/bin/python.wrapper and uses it as a python symlink.

Credits: Lucien Hercaud
