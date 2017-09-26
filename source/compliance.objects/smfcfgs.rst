smfcfgs
-------

Description
===========

    Define a list of FMRI with properties to check / set on the target system. Properties can contain substitution variables. List values can be ordered or not. The fix action can be inhibited.

Example rule
============

::

    [
        {
            "fmri": "svc:/network/ntp",
            "type": "boolean",
            "create": 1,
            "value": "true",
            "prop": "config/slew_always",
            "reload": 0,
            "sleep": 0,
            "inorder": 0
        },
        {
            "fmri": "svc:/network/dns/client",
            "type": "net_address",
            "create": 1,
            "value": "172.30.65.165 172.30.65.164",
            "prop": "config/nameserver",
            "reload": 0,
            "sleep": 6,
            "inorder": 0
        },
        {
            "fmri": "svc:/network/dns/client",
            "type": "astring",
            "create": 1,
            "value": "cpdev.local cpprod.root.local cpgrp.root.local",
            "prop": "config/search",
            "reload": 0,
            "sleep": 9,
            "inorder": 1
        }
    ]

Form definition
===============

::

    
    Desc: |
      Define a list of FMRI with properties to check / set on the target system. Properties can contain substitution variables.
    Css: action48
     
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: smfcfgs
     
    Inputs:
      -
        Id: fmri
        Label: FMRI
        DisplayModeLabel: fmri
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help: "The name of the FMRI."
     
      -
        Id: prop
        Label: Prop
        DisplayModeLabel: prop
        LabelCss: comp16
        Type: string
        Help: "The FMRI property name."
     
      -
        Id: type
        Label: Type
        DisplayModeLabel: type
        LabelCss: hd16
        Type: string
        Help: "The property type."
     
      -
        Id: value
        Label: Value
        DisplayModeLabel: value
        LabelCss: hd16
        Type: string
        Help: "The target value of the property."
     
      -
        Id: inorder
        Label: InOrder
        DisplayModeLabel: inorder
        LabelCss: right16
        Type: integer
        Default: 0
        Help: "If set to 1 and value is a list, report an error if the current list members are not in the same order than the target list members."
     
      -
        Id: create
        Label: Create
        DisplayModeLabel: create
        LabelCss: check16
        Type: integer
        Default: 0
        Help: "If set to 0, the fix action does not create the missing SMF configuration, the check action reports an error in any case."
     
      -
        Id: reload
        Label: Reload
        DisplayModeLabel: reload
        LabelCss: check16
        Type: integer
        Default: 1
        Help: "Reload if modified."
     
      -
        Id: sleep
        Label: Sleep
        DisplayModeLabel: sleep
        LabelCss: time16
        Type: integer
        Default: 0
        Help: "Sleep for <n> seconds after each 'svcadm refresh' command."
        
    
