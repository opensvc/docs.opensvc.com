.. _agent-scheduler:

Scheduler
*********

The OpenSVC agent embeds a scheduler. The node and each service has a private schedule.

Scheduler Behaviour
===================

The agent postinstall configures a system's scheduler job at a 1 minute period executing the :cmd:`nodemgr schedulers` command. This action runs the OpenSVC agent scheduler for the node and each service.

For each task, the scheduler determines if the current time meets the task's schedule definition constraints. If all constraints are met, the task action is run in a subprocess and the last run timestamp is updated.

The schedule definition constraints are expressed as allowed timeranges and minimum period. Example: In ``00:00-02:00@120``, the timerange is from midnight to 2am, the period is 120 minuntes. Multiple ``<timerange>@<period>`` can be defined with the syntax ``["00:00-02:00@120", "12:00-14:00@120"]``

If an allowed timerange is longer than the system's schedule period, multiple consecutive scheduler run will meet the schedule *timerange* constraint. If the *period* is also met (the task has not run in the last <period> minutes), the scheduler rolls a dice and decides if the task is run now, or delayed to a next scheduler run. The probability of deciding to run augments linearly with the current time position in the timerange. For example, with a ``00:00-02:00`` timerange, at midnight the probability is around 10%. At 01:50 the probabilty is 100%.

This behaviour spreads the tasks execution on all nodes over the whole timerange length. As most tasks, induce communications with the collector, the collector load is leveled. 

Any task (except sync tasks) execution in its subprocess is delayed by a random few seconds to level collector load spikes caused by time-synchronized nodes actions being validated at the same time. For example, on a 1000 agent population with pushasset schedule set to ``00:00-02:00@120``, ~90 agents will execute the action at 00:00. The random delay ensures the collector won't receive all 90 data payloads at the same second.

Display the Schedules
=====================

Node Schedule
+++++++++++++

.. raw:: html

	<pre class='output'>
	$ sudo nodemgr print schedule
	<span style="font-weight: bold">Action                </span>  <span style="font-weight: bold">Last Run           </span>  <span style="font-weight: bold">Config Parameter         </span>  <span style="font-weight: bold">Schedule Definition                               </span>  
	|- <span style="color: #767676">auto_reboot        </span>  2017-09-30 16:59:19  reboot.schedule            16:00-17:00@1 sat:last,tue-mon:last * %2+1,feb-apr  
	|- <span style="color: #767676">auto_rotate_root_pw</span>  -                    rotate_root_pw.schedule    -                                                   
	|- <span style="color: #767676">checks             </span>  2017-10-01 17:43:29  checks.schedule            ["16:00-21:00@30 *:last", "! * wed", "*@1"]         
	|- <span style="color: #767676">collect_stats      </span>  2017-10-01 17:42:29  stats_collection.schedule  @10                                                 
	|- <span style="color: #767676">compliance_auto    </span>  2017-10-01 00:01:22  compliance.schedule        00:00-01:00@61                                      
	|- <span style="color: #767676">dequeue_actions    </span>  2017-01-30 10:02:01  dequeue_actions.schedule   -                                                   
	|- <span style="color: #767676">pushasset          </span>  2017-10-01 00:06:22  asset.schedule             00:00-06:00@361 mon-sun                             
	|- <span style="color: #767676">pushbrocade        </span>  -                    brocade.schedule           -                                                   
	|- <span style="color: #767676">pushcentera        </span>  -                    centera.schedule           -                                                   
	|- <span style="color: #767676">pushdcs            </span>  -                    dcs.schedule               -                                                   
	|- <span style="color: #767676">pushdisks          </span>  2017-10-01 00:03:22  disks.schedule             00:00-06:00@361 mon-sun                             
	|- <span style="color: #767676">pushemcvnx         </span>  -                    emcvnx.schedule            -                                                   
	|- <span style="color: #767676">pusheva            </span>  -                    eva.schedule               -                                                   
	|- <span style="color: #767676">pushfreenas        </span>  -                    freenas.schedule           -                                                   
	|- <span style="color: #767676">pushgcedisks       </span>  -                    gcedisks.schedule          -                                                   
	|- <span style="color: #767676">pushhds            </span>  -                    hds.schedule               -                                                   
	|- <span style="color: #767676">pushhp3par         </span>  -                    hp3par.schedule            -                                                   
	|- <span style="color: #767676">pushibmds          </span>  -                    ibmds.schedule             -                                                   
	|- <span style="color: #767676">pushibmsvc         </span>  -                    ibmsvc.schedule            -                                                   
	|- <span style="color: #767676">pushnecism         </span>  -                    necism.schedule            -                                                   
	|- <span style="color: #767676">pushnetapp         </span>  -                    netapp.schedule            -                                                   
	|- <span style="color: #767676">pushnsr            </span>  -                    nsr.schedule               -                                                   
	|- <span style="color: #767676">pushpatch          </span>  2017-10-01 00:16:01  patches.schedule           00:00-06:00@361 mon-sun                             
	|- <span style="color: #767676">pushpkg            </span>  2017-10-01 00:12:01  packages.schedule          00:00-06:00@361 mon-sun                             
	|- <span style="color: #767676">pushstats          </span>  2017-10-01 17:41:29  stats.schedule             ["00:00-23:59@10"]                                  
	|- <span style="color: #767676">pushsym            </span>  -                    sym.schedule               -                                                   
	|- <span style="color: #767676">pushvioserver      </span>  -                    vioserver.schedule         -                                                   
	|- <span style="color: #767676">pushxtremio        </span>  -                    xtremio.schedule           -                                                   
	`- <span style="color: #767676">sysreport          </span>  2017-10-01 00:25:02  sysreport.schedule         00:00-06:00@361 mon-sun                             
	</pre>

The scheduled tasks can be configured in ``<OSVCETC>/node.conf`` with a configlet like::

	[<section>]
	<parameter> = <definition>

The ``config parameter`` column in the :cmd:`nodemgr print schedule`  output is formatted as::

	<section>.<parameter>

And the current definition, explicit or implicit is visible in the ``schedule definition`` column. A dash character means never scheduled.

The :cmd:`nodemgr` command executed when the schedule constraints are met is displayed in the ``action`` column.

The supported schedules are:

* Node inventoring tasks : ``pushasset`` ``pushpatch`` ``pushpkg`` ``pushdisks``
* Node performance metrics inventoring : ``pushstats``
* Node performance metrics collection : ``collect_stats``
* Node file content tracking task : ``sysreport``
* Node configuration audit and/or remediation task : ``compliance_auto``
* Health checking task : ``checks``
* Scheduled node reboot task : ``auto_reboot``
* Scheduled root password rotation task : ``auto_rotate_root_pw``
* Execution of nodemgr actions queued by the collector : ``dequeue_actions``
* SAN switches inventoring tasks : ``pushbrocade``
* Storage arrays inventoring tasks : ``pushcentera`` ``pushdcs`` ``pushemcvnx`` ``pusheva`` ``pushfreenas`` ``pushhds`` ``pushhp3par`` ``pushibmds`` ``pushibmsvc`` ``pushnecism`` ``pushnetapp`` ``pushsym`` ``pushvioserver``
* Backup servers saves index inventoring tasks : ``pushnsr``


Service Schedule
++++++++++++++++

.. raw:: html

	<pre class='output'>
	$ sudo svcmgr -s testmd print schedule
	<span style="font-weight: bold">Action                </span>  <span style="font-weight: bold">Last Run           </span>  <span style="font-weight: bold">Config Parameter        </span>  <span style="font-weight: bold">Schedule Definition</span>  
	|- <span style="color: #767676">compliance_auto    </span>  2017-10-01 00:09:01  DEFAULT.comp_schedule     00:00-06:00@361      
	|- <span style="color: #767676">push_config        </span>  2017-10-01 00:01:02  DEFAULT.push_schedule     00:00-06:00@361      
	|- <span style="color: #767676">push_resinfo       </span>  2017-10-01 16:42:29  DEFAULT.resinfo_schedule  @60                  
	|- <span style="color: #767676">push_service_status</span>  2017-10-01 17:39:30  DEFAULT.status_schedule   @8                   
	|- <span style="color: #767676">resource_monitor   </span>  2017-10-01 17:38:02  DEFAULT.monitor_schedule  @2                   
	|- <span style="color: #767676">sync_all           </span>  2017-10-01 04:00:04  sync#1.schedule           04:00-06:00@121      
	`- <span style="color: #767676">sync_all           </span>  2017-10-01 04:00:04  sync#i0.schedule          04:00-06:00@121      
	</pre>

The scheduled tasks can be configured in ``<OSVCETC>/<svcname>.conf`` with a configlet like::

	[<section>]
	<parameter> = <definition>

The ``config parameter`` column in the :cmd:`svcmgr -s <svcname> print schedule`  output is formatted as::

	<section>.<parameter>

And the current definition, explicit or implicit is visible in the ``schedule definition`` column. A dash character means never scheduled.

The :cmd:`svcmgr -s <svcname>` command executed when the schedule constraints are met is displayed in the ``action`` column.

The supported schedules are:

* Service configuration audit and/or remediation task : ``compliance_auto``
* Service configuration inventoring task : ``push_env``
* Service status inventoring task : ``push_service_status``
* Service sync resources actions : ``sync_all``


Schedule Definition
===================

The complete and up-to-date schedule syntax reference is available in ``<OSVCDOC>/node.conf`` template file.

::

	[!] <timeranges> [<days> [<weeks> [<months>]]]
	
	!
	  desc: exclusion pattern. ommiting the ! implies an inclusion
	              pattern
	
	<timeranges> := <timerange>[,<timerange>]
	  <timerange> := <begin>:<end>@<interval>
	    <begin> <end> := <hour>:<minute>
	    <interval>
	      type: integer
	      unit: minutes
	
	<days> := <day>[-<day>][,<day>[-<day>]]
	  <day> := <day_of_week>[:<day_of_month>]
	    <day_of_week>
	       * iso week day format
	         type: integer between 0 and 6
	       * literal format
	         type: string in ("mon", "tue", "wed", "thu", "fri", "sat",
	               "sun", "monday", "tuesday", "wednesday", "thursday",
	               "friday", "saturday", "sunday")
	    <day_of_month> := <literal> | +<nth> | -<nth> | <nth>
	       <nth>
	         type: integer
	       <literal>
	         type: string in ("first", "1st", "second", "2nd", "third",
	               "3rd", "fourth", "4th", "fifth", "5th", "last")
	
	<weeks> := <week>[-<week>][,<week>[-<week>]]
	  <week>
	    type: integer between 1 and 53
	
	<months> := <monthrange>[,<monthrange>]
	  <monthrange> := <month>[-<month>] | <month_filter>
	    <month>
	      * numeric month format
	        type: integer between 1 and 12
	      * literal format
	        type: string in ("jan", "feb", "mar", "apr", "may", "jun",
	              "jul", "aug", "sep", "oct", "nov", "dec", "january",
	              "february", "march", "april", "may", "june", "july",
	              "august", "september", "october", "november",
	              "december")
	    <month_filter> := %<modulo>[+<shift>]
	      <modulo>
	        type: integer
	      <shift>
	        type: integer

Schedule Testing
================

Executing the scheduler code file triggers a test routine.

::

	$ python <OSVCLIB>/rcScheduler.py
	passed : test '2015-02-27 10:00' in schedule ''       expected False => result False (no schedule)
	passed : test '2015-02-27 10:00' in schedule '@0'     expected False => result False (interval set to 0)
	passed : test '2015-02-27 10:00' in schedule '*@0'    expected False => result False (interval set to 0)
	passed : test '2015-02-27 10:00' in schedule '*'      expected True => result True 
	passed : test '2015-02-27 10:00' in schedule '*@61'   expected True => result True 
	...

You can add your own test in the ``tests`` structure at the end of this file.

::

	tests = [
	  ("", "2015-02-27 10:00", False),
	  ("@0", "2015-02-27 10:00", False),
	  ("*@0", "2015-02-27 10:00", False),
	  ("*", "2015-02-27 10:00", True),
          ...
        ]

List entries fields:

* ``0``: A schedule definition to test
* ``1``: The simulated current time
* ``2``: The expected result

Examples
========

* Never schedule

  Either `` ``, or ``@0``

* Always schedule

  ``*``

* Schedule every 60 minutes

  ``@59``

* Schedule at first occasion after 9am

  ``09:00``

* Schedule every hour between midnight and 6am

  ``00:00-06:00@59``

* Schedule once between midnight and 2am

  ``00:00-02:00@120``

* Schedule once between midnight and 2am every last day of month

  ``00:00-02:00@120 *:last`` or ``00:00-02:00@120 *:-1``

* Schedule once between midnight and 2am every last friday of month

  ``00:00-02:00@120 fri:last`` or ``00:00-02:00@120 fri:-1``

* Schedule once between midnight and 2am every week day

  ``00:00-02:00@120 mon-fri``

* Schedule once between midnight and 2am every week day from january to february

  ``00:00-02:00@120 mon-fri * jan-feb``

* Schedule once between midnight and 2am every odd day (1, 3, 5)

  ``00:00-02:00@120 *:%2+1``

* Schedule once between midnight and 2am every monday of even weeks

  ``00:00-02:00@120 mon %2``

