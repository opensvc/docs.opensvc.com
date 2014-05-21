Compliance objects library
**************************

Individual objects
==================

.. toctree::
   :maxdepth: 1

   compliance.objects.authkeys
   compliance.objects.bios
   compliance.objects.etcsystem
   compliance.objects.files
   compliance.objects.groups
   compliance.objects.groups_membership
   compliance.objects.nodeconf
   compliance.objects.packages
   compliance.objects.process
   compliance.objects.users
   compliance.objects.vuln

Combining objects in modules
============================

.. toctree::
   :maxdepth: 1

   compliance.objects.combo.account

cron
====

firmware
========

fs
==

.. function:: description:

   Checks the presence, mount point, and ownership of filesystems. Provision filesystems according to an ordered list of candidate volume groups. The path and vgnames can include substitution variables so that their actual value can be adjusted. This object is commonly used to provision services filesystems, making use of the ``OSVC_COMP_SERVICES_SVC_NAME`` automatic rule. See the example data format below.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [{
      "dev": "lv_tools",
      "size": "1024M",
      "mnt": "/%%ENV:SERVICES_SVC_NAME%%/tools",
      "vg": ["%%ENV:SERVICES_SVC_NAME%%", "vg01", "vg00"]
     }]

.. function:: supported operating systems:

   Linux, HP-UX

rc
==

.. function:: description:

   Checks and sets the runlevel of startup scripts.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"service": "foo", "level": "2345", "state": "on"},
      {"service": "foo", "level": "016", "state": "off"},
      {"service": "bar", "state": "on"},
     ]


.. function:: supported operating systems:

   Linux

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

xinetd
======

.. function:: description:

   Checks the configuration of a xinetd service. Sets up service xinetd configuration.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "gssftp": {"disable": "no", "server_args": "-l -a -u 022"}
     }

.. function:: supported operating systems:

   Linux


