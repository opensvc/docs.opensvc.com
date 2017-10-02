.. _agent.service.resources:

Service Resources
=================

All service resources share common properties and behaviours.

Action Requirements
*******************

to be completed

Tagging
*******

A resource can be tagged using the keyword ``tags``. The value is a whitespace-separated list of tags. Tag names can be user-defined or hardcoded in the agent.

Custom Tags
+++++++++++

Custom tags ease service management on complex configurations, as they can be used in services and resources selector expressions.

Examples:

============= =============
Resource      Tags
============= =============
app#db        database base
app#tomcat1   appsrv base
app#tomcat2   appsrv
app#tomcat3   appsrv
app#nginx1    websrv base
app#nginx2    websrv
============= =============

::

        # stop resources tagged 'websrv'
        $ sudo svcmgr -s <svcname> --tag websrv stop

        # stop resources tagged 'websrv' or 'appsrv'
        $ sudo svcmgr -s <svcname> --tag websrv,appsrv stop

        # stop resources tagged 'websrv' and 'base'
        $ sudo svcmgr -s <svcname> --tag websrv+base stop


Special Tags
++++++++++++

Some tag names are reserved and have a particular meaning.

noaction
--------

This tag keep the agent from executing state-changing actions on the resource.

The agent is still running the resource status evaluations.

For example, the resource mapping the ip address activated at vm boot by the operating system must be tagged ``noaction``.

encap
-----

This tag assigns the resource to the encapsulated/slave service. The agent on the master-part of the service does not handle such a resource.

:cmd:`svcmgr print status` highlights such resources with the ``E`` flag.

.. raw:: html

	<pre class=output>
        $ sudo svcmgr -s testzone print status
	<span style="font-weight: bold">testzone                    </span>       <span style="color: #00aa00">up        </span>                              
	`- <span style="font-weight: bold">sol3.opensvc.com         </span>       <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #0000aa">frozen</span>,          
	   |                                          <span style="color: #767676"></span><span style="color: #767676">idle</span>,      
	   |                                          <span style="color: #767676"></span><span style="color: #767676">started</span>    
	   |- disk#0                 ..../ <span style="color: #767676">n/a       </span> testzone.raw0                
	   |- disk#1                 ..../ <span style="color: #00aa00">up        </span> testzone.raw1                
	   |- fs#0                   ..... <span style="color: #767676">n/a       </span> dir /tmp/share               
	   |- share#1                ..../ <span style="color: #00aa00">up        </span> nfs:/tmp/share               
	   `- container#0            ..../ <span style="color: #00aa00">up        </span> testzone                     
	      |- ip#1                ...E/ <span style="color: #aa0000">down      </span> 128.0.1.2@lo0/testzone1      
	      `- app:a1                               //                           
		 |- app#0            ...E/ <span style="color: #767676">n/a       </span> true                         
		 |                                    info: not evaluated          
		 |                                    (instance not up)            
		 `- app#1            ...E/ <span style="color: #767676">n/a       </span> true                         
						      info: not evaluated          
						      (instance not up)            
	</pre>


.. seealso:: :ref:`agent.service.encapsulation`

nostatus
--------

This tag prevents the resource status evaluation. The resource status is set to ``n/a``.

dedicated
---------

This tag is by the ip.docker driver only. If set, the physical network interface card is moved to the container network namespace. This NIC is thus reserved, and should not be used by other resources and services.


Scoping
+++++++

Like any other resource parameter, tags can be scoped.

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[ip#1]</span>
	<span style="color: #767676">type </span>= crossbow
	<span style="color: #767676">ipname </span>= 128.0.1.2
	<span style="color: #767676">ipdev </span>= lo0
	<span style="color: #767676">ipdevext </span>= <span style="color: #00aa00">{svcname}</span>1
	<span style="color: #767676">netmask </span>= 32
	<span style="color: #767676">tags </span>= encap
	<span style="color: #767676">tags</span><span style="color: #aa0000">@sol1.opensvc.com </span>= encap noaction
	</pre>

.. seealso:: :ref:`agent-service-scoping`

Subsets
*******

to be completed

Disabled
********

A resource can be marked as disabled using the ``disable`` keyword.

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[container#1]</span>
	<span style="color: #767676">type </span>= docker
	<span style="color: #767676">run_image </span>= ubuntu:14.04
	<span style="color: #767676">run_command </span>= /bin/bash
	<span style="color: #767676">run_args </span>= -i -t
	<span style="color: #767676">disable </span>= true
	</pre>

This will make the agent ignore any action upon this resource.

:cmd:`svcmgr print status` will highlights disabled resources with the ``D`` flag.

.. raw:: html

	<pre class='output'>
        $ sudo svcmgr -s app1.dev print status --refresh
	<span style="font-weight: bold">app1.dev              </span>       <span style="color: #00aa00">up        </span>                                                    
	`- <span style="font-weight: bold">deb1.opensvc.com   </span>       <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span>  
	   |- ip#0             ..... <span style="color: #00aa00">up        </span> 192.168.1.1@lo                                     
	   `- container#1      .D... <span style="color: #767676">n/a       </span> docker container app1.dev.container.1@ubuntu:14.04 
	</pre>

Optional
********

A resource can be marked as optional using the ``optional`` keyword.

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[app#0]</span>
	<span style="color: #767676">script </span>= /bin/true
	<span style="color: #767676">info </span>= true
	<span style="color: #767676">stop </span>= true
	<span style="color: #767676">start </span>= true
	<span style="color: #767676">optional </span>= true
	</pre>

This parameter allow defining non critical resources in the service.

Service actions won't stop on error reported by optional resources.

:cmd:`svcmgr print status` will highlights optional resources with the ``O`` flag.

.. raw:: html

	<pre class='output'>
        $ sudo svcmgr -s redis.acme.com print status
	<span style="font-weight: bold">mysvc1.opensvc.com         </span>       <span style="color: #00aa00">up        </span>                                                   
	`- <span style="font-weight: bold">deb1.opensvc.com        </span>       <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span> 
	   |- ip#1                  ..... <span style="color: #00aa00">up        </span> 128.0.1.124@lo                                    
	   |- disk#1                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk1.dd                                
	   |- disk#2                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk2.dd                                
	   |- disk#3                ..... <span style="color: #00aa00">stdby up  </span> vg vgtest                                         
	   |- fs#1                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest1@/opt/avn/lvtest1         
	   |- fs#2                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest2@/opt/avn/lvtest2         
	   |- fs#3                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/disk/by-label/testfs@/opt/avn/lvtest3   
	   |- share#0               ..../ <span style="color: #00aa00">up        </span> nfs:/opt/avn/lvtest3                              
	   |- app#0                 ..O./ <span style="color: #767676">n/a       </span> true                                              
	   |                                         info: check is not set                            
	   `- sync#i0               ..O./ <span style="color: #00aa00">up        </span> rsync svc config to drpnodes, nodes               

	</pre>


Monitoring
**********

A resource can be marked as monitored using the ``monitor`` keyword.

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[disk#3]</span>
	<span style="color: #767676">type </span>= vg
	<span style="color: #767676">name </span>= vgtest
	<span style="color: #767676">always_on </span>= nodes
	<span style="color: #767676">monitor </span>= true
	</pre>

It means that this resource is **critical** for the service availability.

If the resource goes down, then the agent triggers the ``monitor_action``, which may cause a crash or reboot of the node, or stop of the service, to force a failover.

:cmd:`svcmgr print status` will highlights monitored resources with the ``M`` flag.

.. raw:: html

	<pre class='output'>
        $ sudo svcmgr -s redis.acme.com print status
	<span style="font-weight: bold">mysvc1.opensvc.com         </span>       <span style="color: #00aa00">up        </span>                                                   
	`- <span style="font-weight: bold">deb1.opensvc.com        </span>       <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span> 
	   |- ip#1                  ..... <span style="color: #00aa00">up        </span> 128.0.1.124@lo                                    
	   |- disk#1                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk1.dd                                
	   |- disk#2                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk2.dd                                
	   |- disk#3                M.... <span style="color: #00aa00">stdby up  </span> vg vgtest                                         
	   |- fs#1                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest1@/opt/avn/lvtest1         
	   |- fs#2                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest2@/opt/avn/lvtest2         
	   |- fs#3                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/disk/by-label/testfs@/opt/avn/lvtest3   
	   |- share#0               ..../ <span style="color: #00aa00">up        </span> nfs:/opt/avn/lvtest3                              
	   |- app#0                 ..O./ <span style="color: #767676">n/a       </span> true                                              
	   |                                         info: check is not set                            
	   `- sync#i0               ..O./ <span style="color: #00aa00">up        </span> rsync svc config to drpnodes, nodes               
	</pre>

.. note::

    * High Availability topic is described in :ref:`howto.ha`
    * ``restart`` parameter can be combined with ``monitor`` setting, as explained below


Automatic Restart
*****************

The ``restart`` parameter can be set to make the agent daemon monitor restart the resource if it fails:

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[app#0]</span>
	<span style="color: #767676">script </span>= /bin/true
	<span style="color: #767676">info </span>= true
	<span style="color: #767676">stop </span>= true
	<span style="color: #767676">start </span>= true
	<span style="color: #767676">optional </span>= true
	<span style="color: #767676">restart </span>= 2
	</pre>

The ``restart`` value is the number of times the daemon will attempt to restart the resource before giving up.

If combined with ``monitor``, the agent will try to restart the failed resource before triggering the ``monitor_action``

Standby resources
*****************

Some resources must remain up, even when the service instance is stopped.

For example, in a 2-nodes failover service with a fs resource and a sync.rsync resource replicating the fs, the fs resource must be up on the passive node receive the rsync'ed data. If not, the data gets written to the underlying filesystem.

The ``always_on`` keyword can be set in these cases:

.. raw:: html

	<pre class='output'>
	<span style="color: #aa5500">[disk#3]</span>
	<span style="color: #767676">type </span>= vg
	<span style="color: #767676">name </span>= vgtest
	<span style="color: #767676">always_on </span>= nodes
	<span style="color: #767676">monitor </span>= true
	</pre>

Possible values are 'nodes', 'drpnodes' or 'nodes drpnodes', or a list of nodes.

Resources tagged with ``always_on`` keyword are started on service ``boot`` and ``start`` actions, and stopped only on service ``shutdown`` action.

``svcgr print status`` will display the ``stdby up`` status for up always_on resources, and ``stdby down`` status for down always_on resources.

.. raw:: html

	<pre class='output'>
        # Primary Node
        $ sudo svcmgr -s mysvc.acme.com print status
	<span style="font-weight: bold">mysvc1.opensvc.com         </span>       <span style="color: #00aa00">up        </span>                                                   
	`- <span style="font-weight: bold">deb1.opensvc.com        </span>       <span style="color: #00aa00">up        </span> <span style="color: #767676"></span><span style="color: #767676">idle</span>, <span style="color: #767676">started</span> 
	   |- ip#1                  ..... <span style="color: #00aa00">up        </span> 128.0.1.124@lo                                    
	   |- disk#1                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk1.dd                                
	   |- disk#2                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk2.dd                                
	   |- disk#3                M.... <span style="color: #00aa00">stdby up  </span> vg vgtest                                         
	   |- fs#1                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest1@/opt/avn/lvtest1         
	   |- fs#2                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/vgtest/lvtest2@/opt/avn/lvtest2         
	   |- fs#3                  ..... <span style="color: #00aa00">up        </span> ext4 /dev/disk/by-label/testfs@/opt/avn/lvtest3   
	   |- share#0               ..../ <span style="color: #00aa00">up        </span> nfs:/opt/avn/lvtest3                              
	   |- app#0                 ..O./ <span style="color: #767676">n/a       </span> true                                              
	   |                                         info: check is not set                            
	   `- sync#i0               ..O./ <span style="color: #00aa00">up        </span> rsync svc config to drpnodes, nodes               


        # Secondary Node
	<span style="font-weight: bold">mysvc1.opensvc.com         </span>                                                                  
	`- <span style="font-weight: bold">deb2.opensvc.com        </span>       <span style="color: #aa5500">warn      </span> <span style="color: #767676"></span><span style="color: #aa5500">warn</span></span>       
	   |- ip#1                  ..... <span style="color: #aa0000">down      </span> 128.0.1.124@lo                                  
	   |- disk#1                ..... <span style="color: #00aa00">stdby up  </span> loop /opt/disk1.dd                              
	   |- disk#2                ..... <span style="color: #aa0000">stdby down</span> loop /opt/disk2.dd                              
	   |- disk#3                M.... <span style="color: #00aa00">stdby up  </span> vg vgtest                                       
	   |- fs#1                  ..... <span style="color: #aa0000">down      </span> ext4 /dev/vgtest/lvtest1@/opt/avn/lvtest1       
	   |- fs#2                  ..... <span style="color: #aa0000">down      </span> ext4 /dev/vgtest/lvtest2@/opt/avn/lvtest2       
	   |- fs#3                  ..... <span style="color: #aa0000">down      </span> ext4 /dev/disk/by-label/testfs@/opt/avn/lvtest3 
	   |- share#0               ..../ <span style="color: #aa0000">down      </span> nfs:/opt/avn/lvtest3                            
	   |- app#0                 ..O.. <span style="color: #767676">n/a       </span> true                                            
	   |                                         info: not evaluated (instance not up)           
	   `- sync#i0               ..O./ <span style="color: #00aa00">up        </span> rsync svc config to drpnodes, nodes             
	</pre>


.. warning:: Don't set shared disk always on. This would cause data corruption.


Resource Devices
****************

The agent reports to the collector the base disks list and and size. For each disk, it also reports the size used by each service.

.. raw:: html

	<pre class='output'>
        $ sudo nodemgr pushdisks
	<span style="font-weight: bold">aubergine                </span>  <span style="font-weight: bold">Size.Used</span>  <span style="font-weight: bold">Vendor</span>  <span style="font-weight: bold">Model                     </span>  
	`- <span style="color: #aa5500">disks                 </span>  
	   |- <span style="color: #767676">002538b471bb6f3c   </span>  953g               SAMSUNG MZSLW1T0HMLH-000L1  
	   |  |- <span style="color: #767676">testdrbd        </span>  3g         
	   |  |- <span style="color: #767676">testmd          </span>  991m       
	   |  |- <span style="color: #767676">pridns          </span>  6g         
	   |  |- <span style="color: #767676">testmd2         </span>  143m       
	   |  `- <span style="color: #767676">aubergine       </span>  943g       
	   |- <span style="color: #767676">aubergine.md125    </span>  0                                              
	   |- <span style="color: #767676">aubergine.md127    </span>  0                                              
	   `- <span style="color: #767676">aubergine.md126    </span>  0                                              
	</pre>

This feature depends on a device tree build by the agent.

This tree can be display bottom-up:

.. raw:: html

	<pre class='output'>
	<span style="font-weight: bold">aubergine                          </span>  <span style="font-weight: bold">Type  </span>  <span style="font-weight: bold">Size</span>  <span style="font-weight: bold">Pct of Parent</span>  
	|- <span style="color: #aa5500">loop1                           </span>  linear  0     -              
	|- <span style="color: #aa5500">md127                           </span>  linear  0     -              
	|- <span style="color: #aa5500">md125                           </span>  linear  0     -              
	|- <span style="color: #aa5500">loop6                           </span>  linear  0     -              
	|- <span style="color: #aa5500">loop4                           </span>  linear  0     -              
	|- <span style="color: #aa5500">loop2                           </span>  linear  0     -              
	|- <span style="color: #aa5500">md126                           </span>  linear  0     -              
	|- <span style="color: #aa5500">loop7                           </span>  linear  0     -              
	|- <span style="color: #aa5500">nvme0n1                         </span>  linear  953g  -              
	|  |- <span style="color: #aa5500">nvme0n1p1                    </span>  linear  512m  0%             
	|  `- <span style="color: #aa5500">nvme0n1p2                    </span>  linear  953g  99%            
	|     |- <span style="color: #aa5500">ubuntu--vg-swap_1         </span>  linear  15g   1%             
	|     `- <span style="color: #aa5500">ubuntu--vg-root           </span>  linear  915g  96%            
	|        |- <span style="color: #aa5500">loop13                 </span>  linear  10m   0%             
	|        |- <span style="color: #aa5500">loop12                 </span>  linear  50m   0%             
	|        |- <span style="color: #aa5500">loop11                 </span>  linear  50m   0%             
	|        |  `- <span style="color: #aa5500">md122               </span>  raid1   49m   98%            
	|        |     `- <span style="color: #aa5500">md123            </span>  raid0   97m   197%           
	|        |- <span style="color: #aa5500">loop10                 </span>  linear  50m   0%             
	|        |  `- <span style="color: #aa5500">md122               </span>  raid1   49m   98%            
	|        |     `- <span style="color: #aa5500">md123            </span>  raid0   97m   197%           
	|        |- <span style="color: #aa5500">loop14                 </span>  linear  143m  0%             
	|        |- <span style="color: #aa5500">loop9                  </span>  linear  50m   0%             
	|        |  `- <span style="color: #aa5500">md124               </span>  raid1   49m   98%            
	|        |     `- <span style="color: #aa5500">md123            </span>  raid0   97m   197%           
	|        |- <span style="color: #aa5500">loop8                  </span>  linear  50m   0%             
	|        |  `- <span style="color: #aa5500">md124               </span>  raid1   49m   98%            
	|        |     `- <span style="color: #aa5500">md123            </span>  raid0   97m   197%           
	|        `- <span style="color: #aa5500">loop0                  </span>  linear  3g    0%             
	|           `- <span style="color: #aa5500">drbd1               </span>          0     0%             
	|- <span style="color: #aa5500">loop5                           </span>  linear  0     -              
	`- <span style="color: #aa5500">loop3                           </span>  linear  0     -              
	</pre>

Or top-bottom:

.. raw:: html

	<pre class='output'>
        $ sudo nodemgr print devs --reverse
	<span style="font-weight: bold">aubergine                          </span>  <span style="font-weight: bold">Type  </span>  <span style="font-weight: bold">Parent Use</span>  <span style="font-weight: bold">Size</span>  <span style="font-weight: bold">Ratio</span>  
	|- <span style="color: #aa5500">drbd1                           </span>          -           0     -      
	|  `- <span style="color: #aa5500">loop0                        </span>  linear  0           3g    -      
	|     `- <span style="color: #aa5500">ubuntu--vg-root           </span>  linear  3g          915g  0%     
	|        `- <span style="color: #aa5500">nvme0n1p2              </span>  linear  915g        953g  96%    
	|           `- <span style="color: #aa5500">nvme0n1             </span>  linear  953g        953g  99%    
	|- <span style="color: #aa5500">md123                           </span>  raid0   -           97m   -      
	|  |- <span style="color: #aa5500">md124                        </span>  raid1   48m         49m   97%    
	|  |  |- <span style="color: #aa5500">loop8                     </span>  linear  49m         50m   98%    
	|  |  |  `- <span style="color: #aa5500">ubuntu--vg-root        </span>  linear  50m         915g  0%     
	|  |  |     `- <span style="color: #aa5500">nvme0n1p2           </span>  linear  915g        953g  96%    
	|  |  |        `- <span style="color: #aa5500">nvme0n1          </span>  linear  953g        953g  99%    
	|  |  `- <span style="color: #aa5500">loop9                     </span>  linear  49m         50m   98%    
	|  |     `- <span style="color: #aa5500">ubuntu--vg-root        </span>  linear  50m         915g  0%     
	|  |        `- <span style="color: #aa5500">nvme0n1p2           </span>  linear  915g        953g  96%    
	|  |           `- <span style="color: #aa5500">nvme0n1          </span>  linear  953g        953g  99%    
	|  `- <span style="color: #aa5500">md122                        </span>  raid1   48m         49m   97%    
	|     |- <span style="color: #aa5500">loop11                    </span>  linear  49m         50m   98%    
	|     |  `- <span style="color: #aa5500">ubuntu--vg-root        </span>  linear  50m         915g  0%     
	|     |     `- <span style="color: #aa5500">nvme0n1p2           </span>  linear  915g        953g  96%    
	|     |        `- <span style="color: #aa5500">nvme0n1          </span>  linear  953g        953g  99%    
	|     `- <span style="color: #aa5500">loop10                    </span>  linear  49m         50m   98%    
	|        `- <span style="color: #aa5500">ubuntu--vg-root        </span>  linear  50m         915g  0%     
	|           `- <span style="color: #aa5500">nvme0n1p2           </span>  linear  915g        953g  96%    
	|              `- <span style="color: #aa5500">nvme0n1          </span>  linear  953g        953g  99%    
	|- <span style="color: #aa5500">md127                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">md126                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">md125                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">ubuntu--vg-swap_1               </span>  linear  -           15g   -      
	|  `- <span style="color: #aa5500">nvme0n1p2                    </span>  linear  15g         953g  1%     
	|     `- <span style="color: #aa5500">nvme0n1                   </span>  linear  953g        953g  99%    
	|- <span style="color: #aa5500">nvme0n1p1                       </span>  linear  -           512m  -      
	|  `- <span style="color: #aa5500">nvme0n1                      </span>  linear  512m        953g  0%     
	|- <span style="color: #aa5500">loop3                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop2                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop1                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop7                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop6                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop5                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop4                           </span>  linear  -           0     -      
	|- <span style="color: #aa5500">loop13                          </span>  linear  -           10m   -      
	|  `- <span style="color: #aa5500">ubuntu--vg-root              </span>  linear  10m         915g  0%     
	|     `- <span style="color: #aa5500">nvme0n1p2                 </span>  linear  915g        953g  96%    
	|        `- <span style="color: #aa5500">nvme0n1                </span>  linear  953g        953g  99%    
	|- <span style="color: #aa5500">loop12                          </span>  linear  -           50m   -      
	|  `- <span style="color: #aa5500">ubuntu--vg-root              </span>  linear  50m         915g  0%     
	|     `- <span style="color: #aa5500">nvme0n1p2                 </span>  linear  915g        953g  96%    
	|        `- <span style="color: #aa5500">nvme0n1                </span>  linear  953g        953g  99%    
	`- <span style="color: #aa5500">loop14                          </span>  linear  -           143m  -      
	   `- <span style="color: #aa5500">ubuntu--vg-root              </span>  linear  143m        915g  0%     
	      `- <span style="color: #aa5500">nvme0n1p2                 </span>  linear  915g        953g  96%    
		 `- <span style="color: #aa5500">nvme0n1                </span>  linear  953g        953g  99%    
	</pre>


The ``--verbose`` flag adds the known device paths information:

.. raw:: html

	<pre class='output'>
        $ sudo nodemgr print devs --reverse --verbose
	<span style="font-weight: bold">aubergine                                       </span>  <span style="font-weight: bold">Type  </span>  <span style="font-weight: bold">Parent Use</span>  <span style="font-weight: bold">Size</span>  <span style="font-weight: bold">Ratio</span>  
	|- <span style="color: #aa5500">drbd1                                        </span>          -           0     -                                      
	|  `- <span style="color: #aa5500">loop0                                     </span>  linear  0           3g    -      /dev/disk/by-label/pridns.fs.1  
	|     |                                                                            /dev/disk/by-uuid/27489964-94c  
	|     |                                                                            6-4803-a389-c91463da8d3f        
	|     |                                                                            /dev/loop0                      
	|     `- <span style="color: #aa5500">ubuntu--vg-root                        </span>  linear  3g          915g  0%     /dev/disk/by-id/dm-name-ubuntu  
	|        |                                                                         --vg-root                       
	|        |                                                                         /dev/disk/by-id/dm-uuid-LVM-vz  
	|        |                                                                         I1exojgdAZhf3X1Vz8A0C1Ne2EN2sr  
	|        |                                                                         zZlazB8vy5ey8yftklunzMMMUxJwwC  
	|        |                                                                         ej                              
	|        |                                                                         /dev/disk/by-                   
	|        |                                                                         uuid/3653539e-3299-448e-b80d-   
	|        |                                                                         576fb6b71b84                    
	|        |                                                                         /dev/mapper/ubuntu--vg-root     
	|        |                                                                         /dev/ubuntu-vg/root             
	|        |                                                                         /dev/dm-0                       
	|        `- <span style="color: #aa5500">nvme0n1p2                           </span>  linear  915g        953g  96%    /dev/disk/by-id/lvm-pv-uuid-    
	|           |                                                                      VilFt5-Ne8T-eVxf-QKnX-n0Zc-     
	|           |                                                                      LIK2-7ct9Kr                     
	|           |                                                                      /dev/disk/by-id/nvme-           
	|           |                                                                      SAMSUNG_MZSLW1T0HMLH-           
	|           |                                                                      000L1_S308NX0J403249-part2      
	|           |                                                                      /dev/disk/by-id/nvme-eui        
	|           |                                                                      .002538b471bb6f3c-part2         
	|           |                                                                      /dev/disk/by-partuuid/c6c21095  
	|           |                                                                      -4a8e-4461-af40-12e78fd758d6    
	|           |                                                                      /dev/disk/by-path/pci-0000:05:  
	|           |                                                                      00.0-nvme-1-part2               
	|           |                                                                      /dev/nvme0n1p2                  
	|           `- <span style="color: #aa5500">nvme0n1                          </span>  linear  953g        953g  99%    /dev/disk/by-id/nvme-           
	...
	</pre>


Each resource driver can implement a method to claim devices as "exposed" and "sub" (exposed layered over). The device tree is walked to determine the "base" devices:

.. raw:: html

	<pre class='output'>
        $ sudo svcmgr -s pridns print devs
	<span style="font-weight: bold">pridns                     </span>  
	|- <span style="color: #aa5500">disk#0 (disk.loop)      </span>  
	|  |- <span style="color: #767676">base                 </span>  
	|  |  `- /dev/nvme0n1        
	|  `- <span style="color: #767676">exposed              </span>  
	|     `- /dev/loop0          
	|- <span style="color: #aa5500">fs#1 (fs)               </span>  
	|  |- <span style="color: #767676">base                 </span>  
	|  |  `- /dev/nvme0n1        
	|  `- <span style="color: #767676">sub                  </span>  
	|     `- /dev/loop0          
	`- <span style="color: #aa5500">fs#2 (fs)               </span>  
	   |- <span style="color: #767676">base                 </span>  
	   |  `- /dev/nvme0n1        
	   `- <span style="color: #767676">sub                  </span>  
	      `- /dev/loop0          

        $ sudo svcmgr -s pridns print exposed devs
	<span style="font-weight: bold">pridns                     </span>  
	`- <span style="color: #aa5500">disk#0 (disk.loop)      </span>  
	   `- <span style="color: #767676">exposed              </span>  
	      `- /dev/loop0          

        $ sudo svcmgr -s pridns print sub devs
	<span style="font-weight: bold">pridns             </span>  
	|- <span style="color: #aa5500">fs#1 (fs)       </span>  
	|  `- <span style="color: #767676">sub          </span>  
	|     `- /dev/loop0  
	`- <span style="color: #aa5500">fs#2 (fs)       </span>  
	   `- <span style="color: #767676">sub          </span>  
	      `- /dev/loop0  

        $ sudo svcmgr -s pridns print base devs
	<span style="font-weight: bold">pridns                     </span>  
	|- <span style="color: #aa5500">disk#0 (disk.loop)      </span>  
	|  `- <span style="color: #767676">base                 </span>  
	|     `- /dev/nvme0n1        
	|- <span style="color: #aa5500">fs#1 (fs)               </span>  
	|  `- <span style="color: #767676">base                 </span>  
	|     `- /dev/nvme0n1        
	`- <span style="color: #aa5500">fs#2 (fs)               </span>  
	   `- <span style="color: #767676">base                 </span>  
	      `- /dev/nvme0n1        
	</pre>


Triggers
********

to be completed
