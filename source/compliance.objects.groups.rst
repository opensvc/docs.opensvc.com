groups
----


Description
===========

    * Verify a local system group configuration
    * A minus (-) prefix to the group name indicates the user should not exist
    
    

Example rule
============

::

    {
        "tibco1": {
            "gid": 1001,
            "members": "tibco1"
        },
        "tibco": {
            "gid": 1000,
            "members": "tibco,tibco1"
        }
    }

Form definition
===============

::

    
    Desc: |
      A rule defining a list of Unix groups and their properties. Used by the groups and group_membership compliance objects.
    Css: comp48
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: dict of dict
        Key: group
        EmbedKey: No
        Class: group
    Inputs:
      -
        Id: group
        Label: Group name
        DisplayModeLabel: group
        LabelCss: guys16
        Mandatory: Yes
        Type: string
        Help: The Unix group name.
      -
        Id: gid
        Label: Group id
        DisplayModeLabel: gid
        LabelCss: guys16
        Type: string or integer
        Help: The Unix gid of this group.
      -
        Id: members
        Label: Group members
        DisplayModeLabel: members
        LabelCss: guy16
        Type: list of string
        Help: A comma-separed list of Unix user names members of this group.
    
