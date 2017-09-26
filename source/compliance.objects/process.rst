process
-------

Description
===========

    * Checks if a process is present, specifying its comm, and optionnaly its owner's uid and/or username.
    

Example rule
============

::

    [
        {
            "state": "on",
            "comm": "foo",
            "uid": 2345,
            "user": "foou"
        },
        {
            "state": "off",
            "comm": "bar",
            "uid": 2345
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule defining a process that should be running or not running on the target host, its owner's username and the command to launch it or to stop it.
    Css: comp48
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: process
    Inputs:
      -
        Id: comm
        Label: Command
        DisplayModeLabel: comm
        LabelCss: action16
        Mandatory: No
        Type: string
        Help: The Unix process command, as shown in the ps comm column.
      -
        Id: args
        Label: Arguments
        DisplayModeLabel: args
        LabelCss: action16
        Mandatory: No
        Type: string
        Help: The Unix process arguments, as shown in the ps args column.
      -
        Id: state
        Label: State
        DisplayModeLabel: state
        LabelCss: action16
        Type: string
        Mandatory: Yes
        Default: on
        Candidates:
          - "on"
          - "off"
        Help: The expected process state.
      -
        Id: uid
        Label: Owner user id
        DisplayModeLabel: uid
        LabelCss: guy16
        Type: integer
        Help: The Unix user id owning the process.
      -
        Id: user
        Label: Owner user name
        DisplayModeLabel: user
        LabelCss: guy16
        Type: string
        Help: The Unix user name owning the process.
      -
        Id: start
        Label: Start command
        DisplayModeLabel: start
        LabelCss: action16
        Type: string
        Help: The command to start or stop the process, including the executable arguments. The executable must be defined with full path.
    
