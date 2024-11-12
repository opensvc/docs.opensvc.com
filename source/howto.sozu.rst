.. _howto.sozu:

Sozu HA
*******

Purpose
=======

`Sozu <https://www.sozu.io/>`_ is a http reverse proxy from `Clever Cloud <https://www.clever-cloud.com/>`_, used by Cloud providers and PaaS provider to drive their moving Web infrastructure.

This survival guide describes how to deploy and manage a highly available Sozu setup, using OpenSVC cluster.

Prerequisites
=============

Cluster
-------

* 2 linux nodes Ubuntu 22.04 LTS
* docker/podman
* inotify-tools

.. note:: 

        opensvc cluster installation is not covered in this howto



Installing
==========

Deploy the sozu config map
--------------------------

A config map is used to store sozu related files like configuration, admin script.
 
::

        om igw/cfg/sozu create
        om igw/cfg/sozu add --key config.toml --from https://raw.githubusercontent.com/opensvc/opensvc_templates/main/sozu/config.toml
        om igw/cfg/sozu add --key watch_directory.sh --from https://raw.githubusercontent.com/opensvc/opensvc_templates/main/sozu/watch_directory.sh
        om igw/cfg/sozu add --key state.json



Deploy the sozu secret map
--------------------------

A secret is used to host the ssl certificates served by the sozu deployment.

::

        om igw/sec/sozu create
        om igw/sec/sozu add --key cert.pem --from /path/to/cert.pem
        om igw/sec/sozu add --key key.pem --from /path/to/key.pem
        om igw/sec/sozu add --key chain.pem --from /path/to/chain.pem

.. note:: 

        Many certs can be added in this secret object. They will be available in the /certs folder inside the container


Deploy the sozu service
-----------------------

::

        om igw/svc/sozu deploy --config https://raw.githubusercontent.com/opensvc/opensvc_templates/main/sozu/sozu.conf




How it works
============

The sozu HA deployment is an active/active opensvc service. One sozu instance per cluster node.

The initial configuration is loaded from config map key "config.toml". The sozu configuration changes are stored in the state.json file on disk (automatic_state_save = true in config.toml file), which is copied back into the configmap object, and then replicated to other cluster nodes. Finally the remote sozu instances load the new state.json file to apply the changed configuration. This mecanism allow both instances to stay in sync.

.. warning::

        this ha setup is working but has not been tested on large scale deployments

Checking Status
===============

Cluster
-------

Cluster status can be checked with command ``om mon``

.. raw:: html

        <pre class=output>
        Threads                                      <span style="font-weight:bold;">demo1</span>       <span style="font-weight:bold;">demo2</span>      
        <span style="font-weight:bold;">daemon</span>         <span style="color:green;">running</span>                    | <span style="color:green;">O</span>                      
        <span style="font-weight:bold;">collector</span>      <span style="color:green;">running</span>                    | <span style="color:green;">O</span>                      
        <span style="font-weight:bold;">dns</span>            <span style="color:green;">running</span>                   
        <span style="font-weight:bold;">hb#1.rx</span>        <span style="color:green;">running</span>         [::]:10000 | <span style="color:#757575;">/</span>           <span style="color:green;">O</span>          
        <span style="font-weight:bold;">hb#1.tx</span>        <span style="color:green;">running</span>                    | <span style="color:#757575;">/</span>           <span style="color:green;">O</span>          
        <span style="font-weight:bold;">hb#2.rx</span>        <span style="color:green;">running</span> relay2.opensvc.com | <span style="color:#757575;">/</span>           <span style="color:green;">O</span>          
        <span style="font-weight:bold;">hb#2.tx</span>        <span style="color:green;">running</span>                    | <span style="color:#757575;">/</span>           <span style="color:green;">O</span>          
        <span style="font-weight:bold;">listener</span>       <span style="color:green;">running</span>              :1214
        <span style="font-weight:bold;">monitor</span>        <span style="color:green;">running</span>                   
        <span style="font-weight:bold;">scheduler</span>      <span style="color:green;">running</span>                   

        Nodes                                        <span style="font-weight:bold;">demo1</span>       <span style="font-weight:bold;">demo2</span>      
        <span style="font-weight:bold;"> score</span>                                     | 70          70         
        <span style="font-weight:bold;">  load 15m</span>                                 | 0.0         0.0        
        <span style="font-weight:bold;">  mem</span>                                      | 9/98%:3.82g 9/98%:3.82g
        <span style="font-weight:bold;">  swap</span>                                     | <span style="color:#757575;">-</span>           <span style="color:#757575;">-</span>          
        <span style="font-weight:bold;"> state</span>                                     |                        

        */svc/*                                      <span style="font-weight:bold;">demo1</span>       <span style="font-weight:bold;">demo2</span>      
        <span style="font-weight:bold;">igw/svc/sozu</span>   <span style="color:green;">up</span>             ha    2/2   | <span style="color:green;">O</span><span style="color:#757575;">^</span>          <span style="color:green;">O</span><span style="color:#757575;">^</span>         
        <span style="font-weight:bold;">system/svc/vip</span> <span style="color:green;">up</span>             ha    1/1   | <span style="color:green;">O</span><span style="color:#757575;">^</span>          <span style="color:#757575;">X</span>          

        </pre>

Service
-------

Service status can be checked with command ``om igw/svc/sozu print status``

.. raw:: html

    <pre class=output>
        <span style="font-weight:bold;">igw/svc/sozu     </span>          <span style="color:green;">up        </span>                                                                  
        `- instances            
        |- <span style="font-weight:bold;">demo2         </span>          <span style="color:green;">up        </span> <span style="color:#757575;">idle</span>, <span style="color:#757575;">started</span>                
        `- <span style="font-weight:bold;">demo1         </span>          <span style="color:green;">up        </span> <span style="color:#757575;">idle</span>, <span style="color:#757575;">started</span>                
        |- volume#cfg     ........ <span style="color:green;">up        </span> sozu-cfg                                                         
        |- volume#scripts ........ <span style="color:green;">up        </span> sozu-scripts                                                     
        |- fs#flag        ........ <span style="color:green;">up        </span> fs.flag                                                          
        |- container#0    ...../.. <span style="color:green;">up        </span> docker ghcr.io/opensvc/pause                                              
        |- container#1    ...../.3 <span style="color:green;">up        </span> docker clevercloud/sozu:d7b23c9fe877394cc3f2130d2fe5e76274dbf6c0 
        |- app#watch      ...../.. <span style="color:green;">up        </span> forking: watch_directory.sh                                      
        |- sync#i0        ..DO./.. <span style="color:#757575;">n/a       </span> rsync svc config to nodes                                        
        `- task#stateload ...O./.. <span style="color:#757575;">n/a       </span> docker clevercloud/sozu:d7b23c9fe877394cc3f2130d2fe5e76274dbf6c0 
    </pre>

.. note:: 
     
        add option ``-r`` to force immediate ressource status evaluation (``om igw/svc/sozu print status -r``)

Management commands
===================

Starting service
----------------

``om igw/svc/sozu start``

Stopping service (all instances)
--------------------------------

``om igw/svc/sozu stop``

Stopping service (1 instance)
--------------------------------

``om igw/svc/sozu stop --local``

Fetching service config
-----------------------

``om igw/svc/sozu print config``

Editing service config
----------------------

``om igw/svc/sozu edit config``

Listing config map keys
-----------------------

``om igw/cfg/sozu keys``

Editing config map key
----------------------

``om igw/cfg/sozu edit --key config.toml``

Example
=======

In the logs below, we can see that a config change on first node is replicated to the other sozu instance in a few seconds.

On node **demo1** ::

        root@demo1:~# om igw/cfg/sozu decode --key state.json | wc -l
        0
        
        root@demo1:~# om igw/svc/sozu enter --rid container#1
        OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/bash": stat /bin/bash: no such file or directory: unknown
        / # sozu -c /etc/sozu/config.toml cluster list
        2024-07-01T14:07:24.203948Z 1719842844203948235 24 CTL INFO	Ran the query successfully
        Success: Ran the query successfully
        ┌────────────┬─────────────────────┬─────────────────────┬─────────────────────┬────────────────┐
        │ cluster id │ worker 0            │ worker 1            │ worker main         │ desynchronized │
        ├────────────┼─────────────────────┼─────────────────────┼─────────────────────┼────────────────┤
        │ MyCluster  │ 7980951202874738186 │ 7980951202874738186 │ 7980951202874738186 │                │
        ├────────────┼─────────────────────┼─────────────────────┼─────────────────────┼────────────────┤
        │ TcpTest    │ 4135859621253794451 │ 4135859621253794451 │ 4135859621253794451 │                │
        └────────────┴─────────────────────┴─────────────────────┴─────────────────────┴────────────────┘
        
        / # sozu -c /etc/sozu/config.toml cluster add --id NEW_CLUSTER --load-balancing-policy round_robin
        2024-07-01T14:07:55.387784Z 1719842875387784851 25 CTL INFO	Successfully executed the request on all workers
        Success: Successfully executed the request on all workers
        No content
        
        / # sozu -c /etc/sozu/config.toml cluster list
        2024-07-01T14:07:59.218130Z 1719842879218130199 26 CTL INFO	Ran the query successfully
        Success: Ran the query successfully
        ┌─────────────┬──────────────────────┬──────────────────────┬──────────────────────┬────────────────┐
        │ cluster id  │ worker 0             │ worker 1             │ worker main          │ desynchronized │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ NEW_CLUSTER │ 17225215009394938232 │ 17225215009394938232 │ 17225215009394938232 │                │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ MyCluster   │ 7980951202874738186  │ 7980951202874738186  │ 7980951202874738186  │                │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ TcpTest     │ 4135859621253794451  │ 4135859621253794451  │ 4135859621253794451  │                │
        └─────────────┴──────────────────────┴──────────────────────┴──────────────────────┴────────────────┘
        / # exit
        
        root@demo1:~# om igw/cfg/sozu decode --key state.json | wc -l
        16
        root@demo1:~# 


On node **demo2** ::

        root@demo2:~# om igw/svc/sozu enter --rid container#1
        OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/bash": stat /bin/bash: no such file or directory: unknown
        / # 
        / # sozu -c /etc/sozu/config.toml cluster list
        2024-07-01T14:08:09.812256Z 1719842889812256391 24 CTL INFO	Ran the query successfully
        Success: Ran the query successfully
        ┌─────────────┬──────────────────────┬──────────────────────┬──────────────────────┬────────────────┐
        │ cluster id  │ worker 0             │ worker 1             │ worker main          │ desynchronized │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ NEW_CLUSTER │ 17225215009394938232 │ 17225215009394938232 │ 17225215009394938232 │                │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ TcpTest     │ 4135859621253794451  │ 4135859621253794451  │ 4135859621253794451  │                │
        ├─────────────┼──────────────────────┼──────────────────────┼──────────────────────┼────────────────┤
        │ MyCluster   │ 7980951202874738186  │ 7980951202874738186  │ 7980951202874738186  │                │
        └─────────────┴──────────────────────┴──────────────────────┴──────────────────────┴────────────────┘
        / # 

