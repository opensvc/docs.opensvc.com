xinetd
------

Description
===========

    * Setup and verify a xinetd service configuration
    

Example rule
============

::

    {
        "gssftp": {
            "server_args": "-l -a -u 022",
            "disable": "no"
        }
    }

Form definition
===============

::

    
    Desc: |
      A rule defining how a xinetd service should be configured
    
    Inputs:
      -
        Id: xinetdsvc
        Label: Service Name
        DisplayModeLabel: service
        LabelCss: action16
        Mandatory: Yes
        Help: The xinetd service name, ie the service file name in /etc/xinetd.d/
        Type: string
      -
        Id: disable
        Label: Disable 
        DisplayModeLabel: Disable
        LabelCss: action16
        Help: Defines if the xinetd service target state is enabled or disabled
        Type: string
        Default: yes
        Candidates:
          - "yes"
          - "no"
      -
        Id: server_args
        Label: Server Args
        DisplayModeLabel: args
        LabelCss: action16
        Help: Command line parameter to pass to the service's server executable
        Type: string
    
