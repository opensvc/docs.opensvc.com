Compliance objects library
**************************

authkeys
========

.. function:: description:

   Install, remove ssh public keys from authorized_key files

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "action": "add",                # optional, values: add or del, defaults to "add"
      "authfile": "authorized_keys",  # optional, values: authorized_keys or authorized_keys2, defaults to "authorized_keys2"
      "user": "foo",                  # mandatory
      "key": "XXXX..."                # mandatory
     }

.. function:: supported operating systems:

   Unix

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

files
=====

.. function:: description:

   Checks the content and installs reference files. Also checks and setup files' ownership and permissions. The reference content can include substitution variables, so that the content is contextually generated for the node or the service. If the path ends with a ``/``, a directory is created and the reference content is ignored.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "path": "/some/path/to/file",
      "fmt": "root@corp.com         %%HOSTNAME%%@corp.com",
      "uid": 500,
      "gid": 500,
     }

.. function:: supported operating systems:

   Unix

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

groups_membership
=================

.. function:: description:

   Checks a user has correct secondary group definitions. Must be used in modules after the ``groups`` object so that the group already exists on a fix run of this object. This object can share the same rules with the ``groups`` object.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "tibco": {"members": "tibco,tibadm"},
      "tibco1": {"members": "tibco"}
     }

.. function:: supported operating systems:

   Unix

groups
======

.. function:: description:

   Checks a group exists and has correct gid. This object can share the same rules with the ``groups_membership`` object.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "tibco": {"gid": 1000},
      "tibco1": {"gid": 1001}
     }

.. function:: supported operating systems:

   Unix

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

users
=====

.. function:: description:

   Checks users have correctly setup /etc/passwd entries. Create users. To use in module after the ``groups`` object to be sure the primary groups exists before creating users.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     {
      "tibco": {"shell": "/bin/ksh", "gecos": "a gecos"},
      "tibco1": {"shell": "/bin/tcsh", "uid": 1001, "gid": 2, "homedir": "/home/tib", "shell": "/bin/false"}
     }

.. function:: supported operating systems:

   Unix

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


