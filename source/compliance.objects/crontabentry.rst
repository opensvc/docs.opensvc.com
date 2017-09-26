crontabentry
------------

Description
===========

    * Verify crontab content. Fix if appropriate.
    * The collector provides the format with wildcards.
    * The module replace the wildcards with contextual values.
    

Example rule
============

::

    {
        "entry": "3,13,23,33,43,53 * * * *  /path/to/mycron >/dev/null 2>&1",
        "user": "opensvc",
        "check": "/path/to/mycron"
    }

Form definition
===============

::

    
    Desc: |
      A cron rule, defining a Unix crontab entry, fed to the 'cron' compliance object.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: cron
        DisplayClass: raw
        Template: "%%ACTION%%:%%USER%%:%%SCHEDULE%%:%%COMMAND%%:%%FILE%%"
    
    Inputs:
      -
        Id: ACTION
        Label: Action
        LabelCss: action16
        Mandatory: Yes
        Candidates:
           - add
           - del
        Help: Define if the crontab entry must be installed or not installed.
        Type: string
    
      -
        Id: USER
        Label: User name
        LabelCss: guy16
        Mandatory: Yes
        Help: Which Unix user should this entry be installed or uninstalled for.
        Type: string
    
      -
        Id: SCHEDULE
        Label: Schedule
        LabelCss: time16
        Mandatory: Yes
        Help: "The Unix cron format schedule : minute hour day_of_month month day_of_week."
        Type: string
    
      -
        Id: COMMAND
        Label: Command
        LabelCss: action16
        Mandatory: Yes
        Help: The command to schedule.
        Type: string
    
      -
        Id: FILE
        Label: Cron file name
        LabelCss: action16
        Help: Some Unix systems support split-file crontabs. For those, you can specify here the filename you want to entry to be added to. For systems without split-file crontabs, the crontab file is based on the user name specified above.
        Type: string
    
