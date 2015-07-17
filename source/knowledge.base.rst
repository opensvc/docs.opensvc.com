Knowledge base
==============

Freeze/thaw and disable/enable actions on encapsulated services
---------------------------------------------------------------

As of opensvc agent version 1.7-x,

* the freeze/thaw actions executed from the master of a service with encapsulated resources only affects this master part, leaving the slave service frozen state unchanged.
* The freeze/thaw actions executed from the slave only affects this slave part of the service, leaving the master service frozen state unchanged.
* the enable/disable actions executed from the master of a service with encapsulated resources affects both parts immediately.
* the enable/disable actions executed from the slave of a service with encapsulated resources affects the slave immediately, and the master upon the next scheduled "push" action (10 minutes max with the default push schedule)


