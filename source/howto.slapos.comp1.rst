.. _howto.slapos.comp1:

SlapOS Comp1 HA
***************

Purpose
=======

`Nexedi SlapOS <https://slapos.nexedi.com/>`_ is a distributed, service oriented, operating system. It is composed of 2 kinds of components, master and slave nodes. SlapOS can afford the loss of master node for a few hours, but the loss of a slave worker node involves a service outage.

This survival guide describes how to deploy and manage a highly available SlapOS slave node, using OpenSVC cluster and `Linbit DRBD <https://linbit.com/drbd/>`_ data replication.

The software stack installation is automated using an Ansible playbook, which configures OpenSVC cluster, deploy Re6st component (ipv6 mesh network, needed by SlapOS), and then deploy SlapOS.

The SlapOS comp1 component is embedded in an OpenSVC service, allowing SlapOS administrator to move the service from one cluster node to another, or also to survive to a server issue (crash, poweroff, ...)

Prerequisites
=============

Cluster
-------

* 2 nodes Ubuntu 22.04 LTS
* hard disk drive sized for operating system usage + SlapOS needs
* Re6st token (https://handbook.rapid.space/rapidspace-HowTo.Request.A.Freefib.Token)
* SlapOS token (https://slapos.nexedi.com/slapos-Tutorial.Install.Slapos.Node.Comp.123)

.. note::

        for a better understanding, the example logs hereafter will show cluster nodes with hostname **demo1** and **demo2**


Ansible control node
--------------------

* Any os supporting ansible
* Ansible >= 2.13

.. note::

        for a better understanding, the example logs hereafter will show an ansible control node with hostname **ansible**

Installing
==========

Download example playbook
-------------------------

**On ansible control node**::

        user@ansible $ wget https://raw.githubusercontent.com/opensvc/ansible-collection-osvc/master/examples/slapos/playbook-slap-comp-1.yml

.. warning:: 

           change the playbook tunables to suits your needs (tokens, hostname, size, ...). Check the ansible role documentation.


Install Ansible prerequisites
-----------------------------

The collection `opensvc.app <https://galaxy.ansible.com/ui/namespaces/opensvc/>`_ has to be installed on the control node.

**On ansible control node**::

        user@ansible $ sudo ansible-galaxy collection install opensvc.app
        Process install dependency map
        Starting collection install process
        Installing 'opensvc.app:1.0.0' to '/root/.ansible/collections/ansible_collections/opensvc/app'
        Installing 'ansible.posix:1.5.4' to '/root/.ansible/collections/ansible_collections/ansible/posix'
        Installing 'opensvc.cluster:1.2.1' to '/root/.ansible/collections/ansible_collections/opensvc/cluster'

.. note:: 

        you may check the `Ansible collection installation documentation <https://docs.ansible.com/ansible/latest/collections_guide/collections_installing.html>`_ and/or `OpenSVC side container alternative <https://github.com/opensvc/ansible-collection-osvc#option-3--testingcontributing-to-the-collection>`_

Prepare your ansible inventory file to match the target cluster nodes (see example below)
-----------------------------------------------------------------------------------------

**On ansible control node**:: 

        [clusternodes]
        demo1.acme.com ansible_host="5.200.201.202" ansible_ssh_private_key_file="ssh.private.key" ansible_user=ubuntu ansible_become=true
        demo2.acme.com ansible_host="5.200.201.203" ansible_ssh_private_key_file="ssh.private.key" ansible_user=ubuntu ansible_become=true

Running playbook
================

**On ansible control node**::

        user@ansible $ sudo ansible-playbook -i inventory playbook-slap-comp-1.yml

The control node execute the main playbook, which deals with the following high level tasks

* assemble the 2 nodes into an OpenSVC cluster
* configure DRBD on both nodes
* create the OpenSVC service for SlapOS comp1 feature
* execute re6st playbook on first node
* moves the OpenSVC service on second node
* execute re6st playbook on second node
* move back the service on first node
* execute SlapOS playbook on first node
* moves the OpenSVC service on second node
* execute SlapOS playbook on second node
* move back the service on first node

.. note:: 

        a tarball containing playbook execution logs can be downloaded `here <https://www.opensvc.com/init/static/ansible.slapos.comp1.logs.tar.bz2>`_

At the end of playbook execution, you should have an operational service:

Checking Status
===============

Cluster
-------

Cluster status can be checked with command ``om mon``

.. raw:: html

    <pre class=output>
    Threads                                 <span style="font-weight:bold;">demo1</span>        <span style="font-weight:bold;">demo2</span>      
    <span style="font-weight:bold;">daemon</span>           <span style="color:green;">running</span>             |                         
    <span style="font-weight:bold;">hb#1.rx</span>          <span style="color:green;">running</span>  [::]:10000 | <span style="color:#757575;">/</span>            <span style="color:green;">O</span>          
    <span style="font-weight:bold;">hb#1.tx</span>          <span style="color:green;">running</span>             | <span style="color:#757575;">/</span>            <span style="color:green;">O</span>          
    <span style="font-weight:bold;">listener</span>         <span style="color:green;">running</span>       :1214
    <span style="font-weight:bold;">monitor</span>          <span style="color:green;">running</span>            
    <span style="font-weight:bold;">scheduler</span>        <span style="color:green;">running</span>            

    Nodes                                   <span style="font-weight:bold;">demo1</span>        <span style="font-weight:bold;">demo2</span>      
    <span style="font-weight:bold;"> score</span>                                | 69           70         
    <span style="font-weight:bold;">  load 15m</span>                            | 0.0          0.0        
    <span style="font-weight:bold;">  mem</span>                                 | 15/98%:3.82g 9/98%:3.82g
    <span style="font-weight:bold;">  swap</span>                                | <span style="color:#757575;">-</span>            <span style="color:#757575;">-</span>          
    <span style="font-weight:bold;"> state</span>                                |                         

    */svc/*                                 <span style="font-weight:bold;">demo1</span>        <span style="font-weight:bold;">demo2</span>      
    <span style="font-weight:bold;">slapos/svc/comp1</span> <span style="color:green;">up</span>      ha    1/1   | <span style="color:green;">O</span><span style="color:#757575;">^</span>           <span style="color:#757575;">S</span>          

    </pre>

Service
-------

Service status can be checked with command ``om slapos/svc/comp1 print status``

.. raw:: html

    <pre class=output>
    <span style="font-weight:bold;">slapos/svc/comp1            </span>          <span style="color:green;">up        </span>                                                                                
    `- instances                 
    |- <span style="font-weight:bold;">demo2                 </span>          <span style="color:green;">stdby up  </span> <span style="color:#757575;">idle</span>                                                         
    `- <span style="font-weight:bold;">demo1                 </span>          <span style="color:green;">up        </span> <span style="color:#757575;">idle</span>, <span style="color:#757575;">started</span>                              
        |- volume#0            ........ <span style="color:green;">up        </span> comp1-cfg                                                                      
        |- disk#0              ......S. <span style="color:green;">stdby up  </span> loop /opt/comp1.slapos.svc.hyperopenx.img                                      
        |- disk#1              ......S. <span style="color:green;">stdby up  </span> vg comp1.slapos.svc.hyperopenx                                                 
        |- disk#2              ......S. <span style="color:green;">stdby up  </span> lv comp1.slapos.svc.hyperopenx/comp1                                           
        |- disk#3              ......S. <span style="color:green;">stdby up  </span> drbd comp1.slapos.svc.hyperopenx                                               
        |                                          info: Primary                                                                  
        |- fs#0                ........ <span style="color:green;">up        </span> ext4 /dev/drbd0@/srv/comp1.slapos.svc.hyperopenx                               
        |- fs#flag             ........ <span style="color:green;">up        </span> fs.flag                                                                        
        |- fs:binds            
        |  |- fs#1             ........ <span style="color:green;">up        </span> bind /srv/comp1.slapos.svc.hyperopenx/re6st/etc/re6stnet@/etc/re6stnet         
        |  |- fs#2             ........ <span style="color:green;">up        </span> bind /srv/comp1.slapos.svc.hyperopenx/re6st/var/log/re6stnet@/var/log/re6stnet 
        |  |- fs#3             ........ <span style="color:green;">up        </span> bind /srv/comp1.slapos.svc.hyperopenx/re6st/var/lib/re6stnet@/var/lib/re6stnet 
        |  |- fs#4             ........ <span style="color:green;">up        </span> bind /srv/comp1.slapos.svc.hyperopenx/slapos/srv/slapgrid@/srv/slapgrid        
        |  `- fs#5             ........ <span style="color:green;">up        </span> bind /srv/comp1.slapos.svc.hyperopenx/slapos/etc/opt@/etc/opt                  
        |- app:re6st           
        |  `- app#0            ...../.. <span style="color:green;">up        </span> forking: re6st                                                                 
        |- app:slapos          
        |  `- app#1            ...../.. <span style="color:green;">up        </span> forking: slapos                                                                
        |- sync#i0             ...O./.. <span style="color:green;">up        </span> rsync svc config to nodes                                                      
        `- task:admin                              //                                                                             
            |- task#addpart     ...O./.. <span style="color:green;">up        </span> task.host                                                                      
            |- task#chkaddip    ...O./.. <span style="color:green;">up        </span> task.host                                                                      
            |- task#collect     ...O./.. <span style="color:green;">up        </span> task.host                                                                      
            |- task#delpart     ...O./.. <span style="color:green;">up        </span> task.host                                                                      
            `- task#software    ...O./.. <span style="color:green;">up        </span> task.host                                                                      
    </pre>

.. note:: 
     
        add option ``-r`` to force immediate ressource status evaluation (``om slapos/svc/comp1 print status -r``)

Tasks
-----

SlapOS component need cron jobs to be executed. They have been integrated into OpenSVC tasks.
Tasks schedule can be displayed with ``om slapos/svc/comp1 print schedule``

.. raw:: html

    <pre class=output>
    <span style="font-weight:bold;">Action            </span>  <span style="font-weight:bold;">Last Run           </span>  <span style="font-weight:bold;">Next Run           </span>  <span style="font-weight:bold;">Config Parameter        </span>  <span style="font-weight:bold;">Schedule Definition</span>  
    |- <span style="color:#757575;">compliance_auto</span>  -                    2023-11-10 03:48:52  DEFAULT.comp_schedule     ~00:00-06:00         
    |- <span style="color:#757575;">push_resinfo   </span>  -                    2023-11-09 14:34:16  DEFAULT.resinfo_schedule  @60                  
    |- <span style="color:#757575;">status         </span>  2023-11-09 14:25:36  2023-11-09 14:35:36  DEFAULT.status_schedule   @10                  
    |- <span style="color:#757575;">run            </span>  2023-11-09 14:34:10  2023-11-09 14:35:10  task#addpart.schedule     @1m                  
    |- <span style="color:#757575;">run            </span>  2023-11-09 14:28:10  2023-11-09 15:28:10  task#chkaddip.schedule    @60m                 
    |- <span style="color:#757575;">run            </span>  2023-11-09 14:34:10  2023-11-09 14:35:10  task#collect.schedule     @1m                  
    |- <span style="color:#757575;">run            </span>  2023-11-09 14:28:10  2023-11-09 15:28:10  task#delpart.schedule     @60m                 
    |- <span style="color:#757575;">run            </span>  2023-11-09 14:34:10  2023-11-09 14:35:10  task#software.schedule    @1m                  
    `- <span style="color:#757575;">sync_all       </span>  2023-11-09 14:05:58  2023-11-09 15:05:58  sync#i0.schedule          @60                  
    </pre>


Management commands
===================

Starting service
----------------

``om slapos/svc/comp1 start``

Relocating service
------------------

``om slapos/svc/comp1 switch``

Stopping service
----------------

``om slapos/svc/comp1 stop``

Fetching service config
-----------------------

``om slapos/svc/comp1 print config``

Editing service config
----------------------

``om slapos/svc/comp1 edit config``

Notes
-----

- This deployment is still work in progress and need to be reworked

  - add more storage options
  - check ipv6 routes prerequisite for slapos installer
  - container implementation (lxc ? docker?)
  - configure api for external management
  - add more heartbeats
  - ...