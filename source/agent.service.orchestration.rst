Service Orchestration
=====================

Placement Policies
------------------

When a service instance needs starting, the opensvc daemons of the nodes listed in the service ``DEFAULT.nodes`` each run the placement policy algorithm specified by ``DEFAULT.placement``.

This algorithm decides if the local node is the best candidate node, and if so, the daemon transition the service in ready state. When a service has spent 16 seconds in the ready state and no other node has not opt-in to start an instance, the service transitions to the starting state.

Nodes not reachable or with constraints evaluating as False are discarded from the placement policies candidate nodes.

nodes order
+++++++++++

The first node in the nodes list gets the highest placement priority.

load avg
++++++++

The node with the lowest load average gets the highest placement priority.

State transitions
-----------------

::

        F: Frozen
        L: Placement Policy Leader
        C: Constraints Violation

====================== ====================== ====================== ======================
Initial States                                Next States
--------------------------------------------- --------------------------------------------- 
Node A                 Node B                 Node A                 Node B                 
====================== ====================== ====================== ======================
down idle L            down idle              down **ready** L       down idle
down idle L            down idle C            down **ready** L       down idle C
down idle LC           down idle              down idle LC           down **ready**
====================== ====================== ====================== ======================

Affinity
--------


