keyval
----


Description
===========

    * Setup and verify keys in "key value" formatted configuration file.
    * Example files: sshd_config, ssh_config, ntp.conf, ...
    

Example rule
============

::

    [
        {
            "value": "yes",
            "key": "PermitRootLogin",
            "op": "="
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule to set a list of parameters in simple keyword/value configuration file format. Current values can be checked as set or unset, strictly equal, or superior/inferior to their target value.
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: keyval
    Inputs:
      -
        Id: key
        Label: Key
        DisplayModeTrim: 64
        DisplayModeLabel: key
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help:
      -
        Id: op
        Label: Comparison operator
        DisplayModeLabel: op
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Default: "="
        Candidates:
          - reset
          - unset
          - "="
          - ">"
          - ">="
          - "<"
          - "<="
        Help: The comparison operator to use to check the parameter current value.
      -
        Id: value
        Label: Value
        DisplayModeLabel: value
        LabelCss: action16
        Mandatory: Yes
        Type: string or integer
        Help: The configuration file parameter target value.
    
