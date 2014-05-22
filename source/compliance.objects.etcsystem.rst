etcsystem
*********

Description
============

* Checks and setup values in /etc/system respecting strict targets or thresholds.

+-----------------------+-----+
| check action          | yes |
+-----------------------+-----+
| fix action            | yes |
+-----------------------+-----+
| variable substitution |  no |
+-----------------------+-----+

Supported operating systems
===========================

* Solaris

Ouputs
======

Valid check::

        ssd:ssd_io_time=0x3C on target
        ssd:ssd_max_throttle=20 on target

Invalid check::

        ERR: ssd:ssd_io_time key is not set
        ERR: ssd:ssd_max_throttle key is not set

Fix::

        ssd:ssd_io_time key is not set
        add 'set ssd:ssd_io_time = 0x3C' to /etc/system
        ssd:ssd_max_throttle key is not set
        add 'set ssd:ssd_max_throttle = 20' to /etc/system
	
Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.etcsystem.display.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.etcsystem.edit.png

Definition
++++++++++

.. code-block:: yaml

        Desc: |
          A rule to set a list of Solaris kernel parameters to be set in /etc/system. Current values can be checked as strictly equal, or superior/inferior to their target value.
        Css: comp48
        
        Outputs:
          -
            Dest: compliance variable
            Type: json
            Format: list of dict
            Class: etcsystem
        
        Inputs:
          -
            Id: key
            Label: Key
            DisplayModeLabel: key
            LabelCss: action16
            Mandatory: Yes
            Type: string
            Help: The /etc/system parameter to check.
        
          -
            Id: value
            Label: Value
            DisplayModeLabel: value
            LabelCss: action16
            Mandatory: Yes
            Type: string or integer
            Help: The /etc/system parameter target value.
        
          -
            Id: op
            Label: Comparison operator
            DisplayModeLabel: op
            LabelCss: action16
            Mandatory: Yes
            Type: string
            Default: "="
            Candidates:
              - "="
              - ">"
              - ">="
              - "<"
              - "<="
            Help: The comparison operator to use to check the parameter current value.

Data format
===========

.. code-block:: json

        [
         {"value": "0x3C", "key": "ssd:ssd_io_time", "op": "="},
         {"value": 20, "key": "ssd:ssd_max_throttle", "op": "="}
        ]
