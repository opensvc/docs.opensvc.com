files
*****

Description
============

* Checks the content and installs reference files
* Checks and setup file's ownership and permissions
* The reference content can include substitution variables, so that the content is contextually generated for the node or the service
* If the path ends with a ``/``, a directory is created and the reference content is ignored.

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

	/etc/sudoers.d/testusr is ok

Invalid check::

	ERR: /etc/sudoers.d/testusr does not exist

Another invalid check::

	ERR: diff /etc/sudoers.d/testusr -
	ERR: 2d1
	ERR: < testusr	ALL=(ALL:ALL) /bin/su -

Fix::

	/etc/sudoers.d/testusr rewritten
	/etc/sudoers.d/testusr mode set to 600
	
Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.files.2.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.files.1.png

Definition
++++++++++

.. code-block:: yaml

	Desc: |
	  A file rule, fed to the 'files' compliance object to create a directory or a file and set its ownership and permissions. For files, a reference content can be specified or pointed through an URL.

	Outputs:
	  -
	    Dest: compliance variable
	    Class: file
	    Type: json
	    Format: dict

	Inputs:
	  -
	    Id: path
	    Label: Path
	    DisplayModeLabel: path
	    LabelCss: action16
	    Mandatory: Yes
	    Help: File path to install the reference content to. A path ending with '/' is treated as a directory and as such, its content need not be specified.
	    Type: string

	  -
	    Id: mode
	    Label: Permissions
	    DisplayModeLabel: perm
	    LabelCss: action16
	    Help: "In octal form. Example: 644"
	    Type: integer

	  -
	    Id: uid
	    Label: Owner
	    DisplayModeLabel: uid
	    LabelCss: guy16
	    Help: Either a user ID or a user name
	    Type: string or integer

	  -
	    Id: gid
	    Label: Owner group
	    DisplayModeLabel: gid
	    LabelCss: guy16
	    Help: Either a group ID or a group name
	    Type: string or integer

	  -
	    Id: ref
	    Label: Content URL pointer
	    DisplayModeLabel: ref
	    LabelCss: loc
	    Help: "Examples:
		http://server/path/to/reference_file
		https://server/path/to/reference_file
		ftp://server/path/to/reference_file
		ftp://login:pass@server/path/to/reference_file"
	    Type: string

	  -
	    Id: fmt
	    Label: Content
	    DisplayModeLabel: fmt
	    LabelCss: hd16
	    Css: pre
	    Help: A reference content for the file. The text can embed substitution variables specified with %%ENV:VAR%%.
	    Type: text

Data format
===========

.. code-block:: json

	{
	 "path": "/etc/sudoers.d/testusr",
	 "fmt": "testusr\\tALL=(ALL:ALL) /bin/su - testusr2",
	 "gid": "root",
	 "mode": 600,
	 "uid": "root"
	}

