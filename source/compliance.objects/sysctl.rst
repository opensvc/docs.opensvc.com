sysctl
------

Description
===========

    * Verify a linux kernel parameter value is on target
    * Live parameter value (sysctl executable)
    * Persistent parameter value (/etc/sysctl.conf)
    

Example rule
============

::

    {
        "index": 1,
        "value": 256,
        "key": "vm.lowmem_reserve_ratio",
        "op": ">"
    }

Form definition
===============

::

    
    Desc: |
      A rule to set a list of Linux kernel parameters to be set in /etc/sysctl.conf. Current values can be checked as strictly equal, or superior/inferior to their target value. Each field in a vectored value can be tuned independantly using the index key.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: sysctl
    
    Inputs:
      -
        Id: key
        Label: Key
        DisplayModeLabel: key
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help: The /etc/sysctl.conf parameter to check.
    
      -
        Id: index
        Label: Index
        DisplayModeLabel: idx
        LabelCss: action16
        Mandatory: Yes
        Default: 0
        Type: integer
        Help: The /etc/sysctl.conf parameter to check.
    
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
    
      -
        Id: value
        Label: Value
        DisplayModeLabel: value
        LabelCss: action16
        Mandatory: Yes
        Type: string or integer
        Help: The /etc/sysctl.conf parameter target value.
    
