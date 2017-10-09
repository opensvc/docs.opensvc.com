Architecture
************

The Scheduler Entry-Point
=========================

The OpenSVC daemon runs the node scheduler every minute, which in turn runs each service schedulers in separate threads.

Each task of the node scheduler can be executed directly through the nodemgr command, and each task of the service scheduler can be executed directly through the svcmgr command.

Most tasks produce data sent to the collector for site-level aggregation.

Node Scheduler Tasks
++++++++++++++++++++

The node scheduler tasks schedules are defined in ``<OSVCETC>/node.conf``. Each task has its own section supporting the :kw:`schedule` parameter. The section name is visible in :cmd:`sudo nodemgr print schedule` output in the ``config parameter`` column.

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

Service Scheduler Tasks
+++++++++++++++++++++++

A service scheduler tasks schedules are defined in ``<OSVCETC>/<svcname>.env``. The section and parameter names are visible in :cmd:`sudo svcmgr -s <svcname> print schedule` output in the ``config parameter`` column.

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

Here, the ``push_appinfo`` and ``syncall`` tasks are mapped over respectivelly app and sync resources. Hence their number vary depending on the service configuration.

The Listener Entry-Point
========================

The listener port is defined in ``<OSVCETC>/node.conf`` through the :kw:`node.listener` parameter. When the daemon listener receives an empty packet, it executes the :cmd:`nodemgr dequeue actions` command in a new thread. This command fetches from the collector the list of actions to execute, executes them, and send results to the collector. This behaviour is referred as the ``pull`` mode.

Alternaltively, the node can be configured to allow direct actions from the collector through :cmd:`ssh` and :cmd:`sudo`. This is the ``push`` mode.

