svcconf
-------

Description
===========

    * Setup and verify parameters in a opensvc service configuration.
    
    

Example rule
============

::

    [
        {
            "key": "container#1.run_image",
            "value": "fd5373b3d938",
            "op": "="
        },
        {
            "key": "container#1.run_command",
            "value": "/bin/sh",
            "op": "="
        },
        {
            "key": "DEFAULT.docker_data_dir",
            "value": "/opt/%%ENV:SERVICES_SVCNAME%%",
            "op": "="
        },
        {
            "key": "container(type=docker).disable",
            "value": "no",
            "op": "="
        },
        {
            "key": "container(type=docker&&run_command=/bin/sh).newvar",
            "value": 123,
            "op": "="
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule to set a parameter in OpenSVC <service>.conf configuration file. Used by the 'svcconf' compliance object.
    Css: comp48
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: svcconf
    Inputs:
      -
        Id: key
        Label: Key
        DisplayModeLabel: key
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Help: The OpenSVC <service>.conf parameter to check.
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
        Help: The OpenSVC <service>.conf parameter value to check.
    
    
