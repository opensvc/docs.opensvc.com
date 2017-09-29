keyval
------

Description
===========

    * Setup and verify keys in "key value" formatted configuration file.
    * Example files: sshd_config, ssh_config, ntp.conf, ...
    

Example rule
============

::

    {
        "keys": [
            {
                "value": "",
                "key": "PermitRootLogin",
                "op": "reset"
            },
            {
                "value": "yes",
                "key": "PermitRootLogin",
                "op": "="
            }
        ],
        "path": "/etc/ssh/sshd_config"
    }

Form definition
===============

::

    
    Desc: |
      A rule to set a list of parameters in simple keyword/value configuration file format. Current values can be checked as set or unset, strictly equal, or superior/inferior to their target value. By default, this object appends keyword/values not found, potentially creating duplicates. The 'reset' operator can be used to avoid such duplicates.
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
          - "IN"
        Help: The comparison operator to use to check the parameter current value. The 'reset' operator can be used to avoid duplicate occurence of the same keyword (prepend a key reset before the key sets). The IN operator verifies the current value is one of the target list member. On fix, if the check is in error, it sets the first target list member. A "IN" operator value must be a JSON formatted list.
      -
        Id: value
        Label: Value
        DisplayModeLabel: value
        LabelCss: action16
        Mandatory: Yes
        Type: string or integer
        Help: The configuration file parameter target value.
    
