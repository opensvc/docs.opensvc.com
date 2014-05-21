sysctl
======

.. function:: description:

   Checks and sets values in /etc/sysctl.conf according the specific targets or thresholds.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"key": "kernel.ctrl-alt-del", "value": ["=", "0"]},
      {"key": "kernel.printk", "value": [[">=", "0"], [">=", "1"], [">=", "2"], [">=", "3"]]},
     ]

.. function:: supported operating systems:

   Linux


