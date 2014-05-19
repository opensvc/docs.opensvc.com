Compliance objects library
**************************

Individual objects
==================

.. toctree::
   :maxdepth: 1

   compliance.objects.authkeys
   compliance.objects.files
   compliance.objects.groups
   compliance.objects.groups_membership
   compliance.objects.nodeconf
   compliance.objects.package
   compliance.objects.users

Combining objects in modules
============================

.. toctree::
   :maxdepth: 1

   compliance.objects.combo.account

bios
====

.. function:: description:

   Checks an exact BIOS version, as returned by dmidecode or sysfs

.. function:: actions:

   ::

     check

.. function:: data format:

   ::

    "XXXX"

.. function:: supported operating systems:

   Linux

cron
====

etcsystem
=========

.. function:: description:

   Checks and setup values in /etc/system respecting strict targets or thresholds.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"key": "fcp:fcp_offline_delay", "op": ">=", "value": 21},
      {"key": "ssd:ssd_io_time", "op": "=", "value": "0x3C"}
     ]

.. function:: supported operating systems:

   Solaris

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

packages
========

.. function:: description:

   Checks packages installation. Installs packages. On Linux, the architecture can be specified as the package name suffix (ex: .i386). If not specified the native operating system is selected. A wildcard suffix can be used to force selection of all available architectures.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      "gcc.*",
      "compat-libstdc*.i386",
      "rpm-build",
     ]

.. function:: supported operating systems:

   Linux

process
=======

.. function:: description:

   Checks the presence of a process and its ownership. Starts the process using the specified command. Used to start a daemon after package installation and rc setup.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"command": "foo", "user": "foou", "comm": "/etc/init.d/foo start"},
      {"command": "bar", "uid": "2345"},
     ]


.. function:: supported operating systems:

   Unix

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

vuln
====

.. function:: description:

   Checks a package is installed with a minimum release or not installed at all. Unices need to pass the URI of their package depot as last argument of this object.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"pkgname": "kernel", "minver": "2.6.18-238.19.1.el5"},
      {"pkgname": "kernel-xen", "minver": "2.6.18-238.19.1.el5"}
     ]

.. function:: supported operating systems:

   Unix

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


