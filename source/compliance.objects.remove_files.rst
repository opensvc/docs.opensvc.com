remove_files
----


Description
===========

    * Verify files and file trees are uninstalled
    

Example rule
============

::

    [
        "/tmp/foo",
        "/bar/to/delete"
    ]

Form definition
===============

::

    
    Desc: |
      A rule defining a set of files to remove, fed to the 'remove_files' compliance object.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: remove_files
        Type: json
        Format: list
    
    Inputs:
      -
        Id: path
        Label: File path
        DisplayModeLabel: ""
        LabelCss: edit16
        Mandatory: Yes
        Help: You must set paths in fully qualified form.
        Type: string
    
