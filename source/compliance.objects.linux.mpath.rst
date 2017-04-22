linux.mpath
----


Description
===========

    * Setup and verify the Linux native multipath configuration
    

Example rule
============

::

    [
        {
            "value": 20,
            "key": "defaults.polling_interval",
            "op": ">="
        },
        {
            "value": "alua",
            "key": "device.{HP}.{HSV210.*}.prio",
            "op": "="
        },
        {
            "value": 600600000001,
            "key": "blacklist.wwid",
            "op": "="
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule to set a list of Linux multipath.conf parameters. Current values can be checked as strictly equal, or superior/inferior to their target value.
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: linux_mpath
    Inputs:
      -
        Id: key
        Label: Key
        DisplayModeTrim: 64
        DisplayModeLabel: key
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help: >
         The multipath.conf parameter to check.
         ex: defaults.polling_interval or
             device.device.{HP}.{HSV210.*} or
             multipaths.multipath.6006000000000000 or
             blacklist.wwid or
             blacklist.device.{HP}.{HSV210.*}
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
        Help: The multipath.conf parameter target value.
    
