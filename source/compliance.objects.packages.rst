packages
********

Description
============

* Checks packages installation
* Installs packages using the systems' package manager (yum, apt-get, zypper)
* On Linux, the architecture can be specified as the package name suffix (ex: .i386).
* If not specified the native operating system is selected. A wildcard suffix can be used to force selection of all available architectures.

+-----------------------+-----+
| check action          | yes |
+-----------------------+-----+
| fix action            | yes |
+-----------------------+-----+
| variable substitution | yes |
+-----------------------+-----+

Supported operating systems
===========================

* Unix

Ouputs
======

Valid check::

        package scsitools is installed
        package sg3-utils is installed
        package lxc-docker is installed

Invalid check::

	ERR: package scsitools is not installed

Fix::

        Reading package lists... Done
        Building dependency tree
        Reading state information... Done
        The following NEW packages will be installed:
          scsitools
        0 upgraded, 1 newly installed, 0 to remove and 16 not upgraded.
        Need to get 0 B/137 kB of archives.
        After this operation, 324 kB of additional disk space will be used.
        Selecting previously unselected package scsitools.
        (Reading database ... 59574 files and directories currently installed.)
        Unpacking scsitools (from .../scsitools_0.12-2.1_amd64.deb) ...
        Processing triggers for man-db ...
        Setting up scsitools (0.12-2.1) ...
	
Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.package.display.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.package.edit.png

Definition
++++++++++

.. code-block:: yaml

        Desc: |
          A rule defining a set of packages, fed to the 'packages' compliance object for it to check each package installed or not-installed status.
        Css: comp48
        
        Outputs:
          -
            Dest: compliance variable
            Class: package
            Type: json
            Format: list
        
        Inputs:
          -
            Id: pkgname
            Label: Package name
            DisplayModeLabel: ""
            LabelCss: pkg16
            Mandatory: Yes
            Help: Use '-' as a prefix to set 'not installed' as the target state. Use '*' as a wildcard for package name expansion for operating systems able to list packages available for installation.
            Type: string

Data format
===========

.. code-block:: json

        [
         "scsitools",
         "sg3-utils",
         "lxc-docker"
        ]
