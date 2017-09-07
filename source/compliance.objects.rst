Compliance objects library
**************************

Individual objects
==================

The following objects are shipped with the OpenSVC agent, in ``var/compliance/com.opensvc/``.

We recommend to track your own set of objects in your modules project, for example in a ``com.mycorp/`` folder, so that upgrading the agent can not cause regressions in the compliance framework.

You can create your own objects and associated forms, and you are welcome to contribute them upstream to enrich this library.

.. toctree::
   :maxdepth: 1

   compliance.objects.ansible_playbook
   compliance.objects.authkey
   compliance.objects.bios
   compliance.objects.cron
   compliance.objects.crontabentry
   compliance.objects.etcsystem
   compliance.objects.fileinc
   compliance.objects.fileinccom
   compliance.objects.fileprop
   compliance.objects.firmware
   compliance.objects.file
   compliance.objects.fs
   compliance.objects.group
   compliance.objects.group_membership
   compliance.objects.hosts
   compliance.objects.ini
   compliance.objects.keyval
   compliance.objects.linux.mpath
   compliance.objects.nodeconf
   compliance.objects.package
   compliance.objects.process
   compliance.objects.rc
   compliance.objects.remove_files
   compliance.objects.smfcfgs
   compliance.objects.sudoers
   compliance.objects.svcconf
   compliance.objects.self.signed.cert
   compliance.objects.symlink
   compliance.objects.sysctl
   compliance.objects.timectl
   compliance.objects.timedatectl
   compliance.objects.user
   compliance.objects.vuln
   compliance.objects.xinetd
   compliance.objects.zfs
   compliance.objects.zpool
   compliance.objects.zprop

Combining objects in modules
============================

The following examples illustrate how combining the compliance objects described in the previous chapter can solve complex needs.

.. toctree::
   :maxdepth: 1

   compliance.objects.combo.account

Variable substitution
=====================

Variable substitution is a convience feature of most compliance objects, allowing to define a rule once and contextualize only a part of its content.

For example, if you need to distribute a startup launcher script to a mixed SuSE and Red Hat server set, you can define two file-class rules like this::

	{
	  "path": "/etc/init.d/mylauncher",
	  "perm"! "755",
	  "user": "root",
	  "group": "root",
	  "content": "some very long content"
	}

And::

	{
	  "path": "/sbin/init.d/mylauncher",
	  "perm"! "755",
	  "user": "root",
	  "group": "root",
	  "content": "some very long content"
	}

Here, the two rules are nearly identical. Only the ``init.d`` path changes. When you need to change another key value, you have to edit all those nearly identical rules, which is an error-prone process.
In this case, it is pertinent to define this rule only once, using variable substitution for the ``init.d`` path::

	{
	  "path": "%%ENV:INIT_D%%",
	  "perm"! "755",
	  "user": "root",
	  "group": "root",
	  "content": "some very long content"
	}

For the substitution to work, you have to define contextually the ``INIT_D`` values to ``/sbin/init.d`` or ``/etc/init.d``. This can be naturally designed as raw-class rules in per-operating system contextual rulesets, or even hard-coded in the module code before calling the ``files`` object.

The former method is preferred, as the ``INIT_D`` definitions can beneficit other modules.

A lot of minor differences between operating systems are candidate to be abstracted that way. To name a few :

* the root account primary group : root on most unices, sys on HP-UX
* the preferred shell is often bash on Linux, and ksh on other unices
* the preferred filesystem to format with is surely a per operating system, and often a per release, preference


   authkeys
   bios
   cron
   crontabentry
   etcsystem
   fileinc
   fileinccom
   fileprop
   files
   firmware
   fs
   groups
   groups_membership
   hosts
   ini
   keyval
   linux.mpath
   nodeconf
   packages
   process
   rc
   remove_files
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timectl
   timedatectl
   users
   vuln
   xinetd
   zfs
   zpool
   zprop
   authkeys
   bios
   cron
   crontabentry
   etcsystem
   fileinc
   fileinccom
   fileprop
   files
   firmware
   fs
   groups
   groups_membership
   hosts
   ini
   keyval
   linux.mpath
   nodeconf
   packages
   process
   rc
   remove_files
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timectl
   timedatectl
   users
   vuln
   xinetd
   zfs
   zpool
   zprop
   authkeys
   bios
   cron
   crontabentry
   etcsystem
   fileinc
   fileinccom
   fileprop
   files
   firmware
   fs
   groups
   groups_membership
   hosts
   ini
   keyval
   linux.mpath
   nodeconf
   packages
   process
   rc
   remove_files
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timectl
   timedatectl
   users
   vuln
   xinetd
   zfs
   zpool
   zprop
   ansible_playbook
   authkey
   bios
   cron
   crontabentry
   etcsystem
   file
   fileinc
   fileinccom
   fileprop
   firmware
   fs
   group
   group_membership
   hosts
   ini
   keyval
   linux.mpath
   nodeconf
   package
   process
   rc
   remove_files
   self.signed.cert
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timectl
   timedatectl
   user
   vuln
   xinetd
   zfs
   zpool
   zprop
   ansible_playbook
   authkey
   bios
   cron
   etcsystem
   file
   fileinc
   fileprop
   firmware
   fs
   group
   group_membership
   keyval
   linux.mpath
   nodeconf
   package
   process
   rc
   remove_files
   self.signed.cert
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timedatectl
   user
   vuln
   xinetd
   zfs
   zpool
   zprop
   ansible_playbook
   authkey
   bios
   cron
   etcsystem
   file
   fileinc
   fileprop
   firmware
   fs
   group
   group_membership
   keyval
   linux.mpath
   nodeconf
   package
   process
   rc
   remove_files
   self.signed.cert
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timedatectl
   user
   vuln
   xinetd
   zfs
   zpool
   zprop
   ansible_playbook
   authkey
   bios
   cron
   etcsystem
   file
   fileinc
   fileprop
   firmware
   fs
   group
   group_membership
   keyval
   linux.mpath
   nodeconf
   package
   process
   rc
   remove_files
   self.signed.cert
   smfcfgs
   sudoers
   svcconf
   symlink
   sysctl
   timedatectl
   user
   vuln
   xinetd
   zfs
   zpool
   zprop
