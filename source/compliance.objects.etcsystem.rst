etcsystem
---------

Description
===========

    Checks and setup values in /etc/system respecting strict targets or thresholds.

Example rule
============

::

    [
        {
            "value": 21,
            "key": "fcp:fcp_offline_delay",
            "op": ">="
        },
        {
            "value": "0x3C",
            "key": "ssd:ssd_io_time",
            "op": "="
        }
    ]

Form definition
===============

::

    
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
    
