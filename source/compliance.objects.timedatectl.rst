timedatectl
----


Description
===========

    * Checks timedatectl settings
    * Module need to be called with the exposed target settings as variable (timedatectl.py OSVC_COMP_TIMEDATECTL_1 check)
    

Example rule
============

::

    {
        "timezone": "Europe/Paris",
        "ntpenabled": "no"
    }

Form definition
===============

::

    
    Desc: |
      A timedatectl rule, fed to the 'timedatectl' compliance object to setup rhel/centos7+ timezone/ntp.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: timedatectl
        Type: json
        Format: dict
    
    Inputs:
      -
        Id: timezone
        Label: Timezone
        DisplayModeLabel: timezone
        LabelCss: action16
        Mandatory: No
        Help: 'The timezone name, as listed by "timedatectl list-timezones" command. Example: Europe/Paris'
        Type: string
    
      -
        Id: ntpenabled
        Label: NTP Enabled
        DisplayModeLabel: ntpenabled
        LabelCss: time16
        Mandatory: No
        Default: "yes"
        Candidates:
          - "yes"
          - "no"
        Help: "Specify yes or no, to request enabling or disabling the chronyd time service, driven through timedatectl command."
        Type: string
    
