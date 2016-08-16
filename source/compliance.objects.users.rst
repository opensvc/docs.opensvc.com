users
----


Description
===========

    * Verify a local system user configuration
    * A minus (-) prefix to the user name indicates the user should not exist
    
    Environment variable modifying the object behaviour:
    * OSVC_COMP_USERS_INITIAL_PASSWD=true|false
    

Example rule
============

::

    {
        "tibco1": {
            "shell": "/bin/tcsh",
            "gecos": "another gecos"
        },
        "tibco": {
            "shell": "/bin/ksh",
            "gecos": "agecos"
        }
    }

Form definition
===============

::

    
    Desc: |
      A rule defining a list of Unix users and their properties. Used by the users and group_membership compliance objects.
    Css: comp48
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: dict of dict
        Key: user
        EmbedKey: No
        Class: user
    Inputs:
      -
        Id: user
        Label: User name
        DisplayModeLabel: user
        LabelCss: guy16
        Mandatory: Yes
        Type: string
        Help: The Unix user name.
      -
        Id: uid
        Label: User id
        DisplayModeLabel: uid
        LabelCss: guy16
        Mandatory: Yes
        Type: string or integer
        Help: The Unix uid of this user.
      -
        Id: gid
        Label: Group id
        DisplayModeLabel: gid
        LabelCss: guys16
        Mandatory: Yes
        Type: string or integer
        Help: The Unix principal gid of this user.
      -
        Id: shell
        Label: Login shell
        DisplayModeLabel: shell
        LabelCss: action16
        Type: string
        Help: The Unix login shell for this user.
      -
        Id: home
        Label: Home directory
        DisplayModeLabel: home
        LabelCss: action16
        Type: string
        Help: The Unix home directory full path for this user.
      -
        Id: password
        Label: Password hash
        DisplayModeLabel: pwd
        LabelCss: action16
        Type: string
        Help: The password hash for this user. It is recommanded to set it to '!!' or to set initial password to change upon first login. Leave empty to not check nor set the password.
      -
        Id: gecos
        Label: Gecos
        DisplayModeLabel: gecos
        LabelCss: action16
        Type: string
        Help: A one-line comment field describing the user.
      -
        Id: check_home
        Label: Enforce homedir ownership
        DisplayModeLabel: home ownership
        LabelCss: action16
        Type: string
        Default: yes
        Candidates:
          - "yes"
          - "no"
        Help: Toggles the user home directory ownership checking.
    
