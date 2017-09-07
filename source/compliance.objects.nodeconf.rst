nodeconf
--------

Description
===========

    * Verify opensvc agent configuration parameter
    

Example rule
============

::

    [
        {
            "value": "ftp://ftp.opensvc.com/opensvc",
            "key": "node.repopkg",
            "op": "="
        },
        {
            "value": "ftp://ftp.opensvc.com/compliance",
            "key": "node.repocomp",
            "op": "="
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule to set a parameter in OpenSVC node.conf configuration file. Used by the 'nodeconf' compliance object.
    Css: comp48
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: nodeconf
    Inputs:
      -
        Id: key
        Label: Key
        DisplayModeLabel: key
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help: The OpenSVC node.conf parameter to check.
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
        Help: The comparison operator to use to check the parameter value.
      -
        Id: value
        Label: Value
        DisplayModeLabel: value
        LabelCss: action16
        Mandatory: Yes
        Type: string or integer
        Help: The OpenSVC node.conf parameter value to check.
    
