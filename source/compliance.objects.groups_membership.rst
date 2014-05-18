groups_membership
*****************

Description
============

* Checks a user has correct secondary group definitions
* Must be used in modules after the ``groups`` and ``users`` objects so that the group and member users already exist on a fix run of this object
* This object shares the same rules with the ``groups`` object

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

	group testgrp members: testusr2

Invalid check::

	ERR: group testgrp does not exist

Another invalid check::

	ERR: group testgrp members:  | target: testusr2

Fix::

	usermod -G testgrp testusr2

Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.groups.2.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.groups.1.png

Definition
++++++++++

.. code-block:: yaml

	Desc: |
	  A rule defining a list of Unix groups and their properties. Used by the groups and group_membership compliance objects.

	Outputs:
	  -
	    Dest: compliance variable
	    Type: json
	    Format: dict of dict
	    Key: group
	    EmbedKey: No
	    Class: group

	Inputs:
	  -
	    Id: group
	    Label: Group name
	    DisplayModeLabel: group
	    LabelCss: guys16
	    Mandatory: Yes
	    Type: string
	    Help: The Unix group name.

	  -
	    Id: gid
	    Label: Group id
	    DisplayModeLabel: gid
	    LabelCss: guys16
	    Mandatory: Yes
	    Type: string or integer
	    Help: The Unix gid of this group.

	  -
	    Id: members
	    Label: Group members
	    DisplayModeLabel: members
	    LabelCss: guy16
	    Type: list of string
	    Help: A whitespace-separed list of Unix user names members of this group.

Data format
===========

.. code-block:: json

	{
	 "testgrp2": {
	  "gid": 1008
	 },
	 "testgrp": {
	  "gid": 1007,
	  "members": ["testusr2"]
	 }
	}
