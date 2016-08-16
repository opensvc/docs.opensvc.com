symlink
----


Description
===========

    * Verify symlink's existance.
    * The collector provides the format with wildcards.
    * The module replace the wildcards with contextual values.
    * In the 'fix' the symlink is created (and intermediate dirs if required).
    * There is no check or fix for target's existance.
    * There is no check or fix for mode or ownership of either symlink or target.
    

Example rule
============

::

    {
        "target": "/tmp/bar",
        "symlink": "/tmp/foo"
    }

Form definition
===============

::

    
    Desc: |
      A symfile rule, fed to the 'symlink' compliance object to create a Unix symbolic link.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: symlink
        Type: json
        Format: dict
    
    Inputs:
      -
        Id: symlink
        Label: Symlink path
        DisplayModeLabel: symlink
        LabelCss: hd16
        Mandatory: Yes
        Help: The full path of the symbolic link to check or create.
        Type: string
    
      -
        Id: target
        Label: Target path
        DisplayModeLabel: target
        LabelCss: hd16
        Mandatory: Yes
        Help: The full path of the target file pointed by the symlink.
        Type: string
    
