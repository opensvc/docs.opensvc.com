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
        $ om pridns print devs
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

        $ om pridns print exposed devs
	<span style="font-weight: bold">pridns                     </span>  
	`- <span style="color: #aa5500">disk#0 (disk.loop)      </span>  
	   `- <span style="color: #767676">exposed              </span>  
	      `- /dev/loop0          

        $ om pridns print sub devs
	<span style="font-weight: bold">pridns             </span>  
	|- <span style="color: #aa5500">fs#1 (fs)       </span>  
	|  `- <span style="color: #767676">sub          </span>  
	|     `- /dev/loop0  
	`- <span style="color: #aa5500">fs#2 (fs)       </span>  
	   `- <span style="color: #767676">sub          </span>  
	      `- /dev/loop0  

        $ om pridns print base devs
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


