nodeconf
********

Description
============

* Checks the configuration of the opensvc node.conf parameters

+-----------------------+-----+
| check action          | yes |
+-----------------------+-----+
| fix action            | yes |
+-----------------------+-----+
| variable substitution |  no |
+-----------------------+-----+

Supported operating systems
===========================

* Unix

Ouputs
======

Examples below expect string "OpenSVC" as value of team_responsible of node section

Valid check::

	node.team_responsible=OpenSVC on target

Invalid check::

	node.team_responsible=Wrong_Value, target: OpenSVC

Another invalid check::

	node.repopkg key is not set

Fix::

	/opt/opensvc/bin/nodemgr set --param node.team_responsible --value OpenSVC
	
Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.nodeconf.display.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.nodeconf.edit.png

Definition
++++++++++

.. code-block:: yaml

	Desc: |
	  A rule defining a list of node.conf parameters and their expected values.

	Outputs:
	  -
	    Dest: compliance variable
	    Class: nodeconf
	    Type: json
	    Format: dict

	Inputs:
	  -
	    Id: key
	    Label: Key
	    DisplayModeLabel: key
	    LabelCss: action16
	    Mandatory: Yes
	    Help: Key value to be checked. 
	    Type: string

	  -
	    Id: op
	    Label: Comparison operator
	    DisplayModeLabel: operator
	    LabelCss: action16
	    Help: "= > >= < <="
	    Type: operator

	  -
	    Id: value
	    Label: Value
	    DisplayModeLabel: fmt
	    LabelCss: action16
	    Help: Expected value
	    Type: string or url or integer


Data format
===========

.. code-block:: json

        [
         {"value": "OpenSVC", "key": "node.team_responsible", "op": "="}, 
         {"value": "http://repo.opensvc.com/", "key": "node.repopkg", "op": "="}, 
         {"value": "https://collector.opensvc.com/feed/default/call/xmlrpc", "key": "node.dbopensvc", "op": "="}, 
         {"value": "https://collector.opensvc.com/init/compliance/call/xmlrpc", "key": "node.dbcompliance", "op": "="}
        ]
