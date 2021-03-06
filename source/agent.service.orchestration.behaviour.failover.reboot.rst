Node Reboot
-----------

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A. Agent restart before :kw:`hb#*.timeout` + :kw:`ready_period`.                                           |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     |                                                         |
|                        | starts after reboot.                                    |                                                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A. Agent restart after :kw:`hb#*.timeout` + :kw:`ready_period`.                                            |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced.             | Service starts after :kw:`hb#*.timeout` +               |
|                        |                                                         | :kw:`ready_period`                                      |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-green:`up`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A.                                                                                                         |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up` :c-blue:`frozen`                          | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     | Service starts after longest :kw:`hb#*.timeout` +       |
|                        | won't start after reboot.                               | :kw:`ready_period`                                      |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-green:`up`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A.                                                                                                         |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up` :c-blue:`frozen`                          | :c-red:`down` :c-blue:`frozen`                          |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     |                                                         |
|                        | won't start after reboot.                               |                                                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A.                                                                                                         |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running` :c-blue:`frozen`              | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     | Service starts after longest :kw:`hb#*.timeout` +       |
|                        | won't start after reboot.                               | :kw:`ready_period`                                      |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-green:`up`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A. Agent restart before :kw:`hb#*.timeout` + :kw:`ready_period`.                                           |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running` :c-blue:`frozen`              | daemon :c-green:`running` :c-blue:`frozen`              |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     |                                                         |
|                        | won't start after reboot.                               |                                                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A and B. Both agent restart interval < :kw:`rejoin_grace_period` + :kw:`ready_period`                      |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     |                                                         |
|                        | starts as soon as B is reachable.                       |                                                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A and B. A restarts :kw:`rejoin_grace_period` + :kw:`ready_period` later than B.                           |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced.             | Service starts :kw:`rejoin_grace_period` +              |
|                        |                                                         | :kw:`ready_period` after reboot                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-red:`down`                                           | :c-green:`up`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+

+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Event                  | Reboot A and B. B restarts :kw:`rejoin_grace_period` + :kw:`ready_period` later than A.                           |
+========================+=========================================================+=========================================================+
| Node                   | **A**                                                   | **B**                                                   |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Node State     | daemon :c-green:`running`                               | daemon :c-green:`running`                               |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Initial Service State  | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| Response               | Service shutdown. No maintenance announced. Service     |                                                         |
|                        | starts :kw:`rejoin_grace_period` +                      |                                                         |
|                        | :kw:`ready_period` after reboot.                        |                                                         |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+
| End Service State      | :c-green:`up`                                           | :c-red:`down`                                           |
+------------------------+---------------------------------------------------------+---------------------------------------------------------+


