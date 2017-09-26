fileinccom
----------

Description
===========

    Verify file content.
    Alert if a pattern is present but never fix.
    The variable format is json-serialized.
    

Example rule
============

::

    {
        "path": "/some/path/to/file",
        "com": "comment to correct manualy",
        "check": "some pattern into the file"
    }

Form definition
===============

::

    
    Desc: |
      A fileinccom rule, fed to the 'fileinc' compliance object to verify a line matching the 'check' regular expression is present in the specified file.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: fileinccom
        Type: json
        Format: dict
    
    Inputs:
      -
        Id: path
        Label: Path
        DisplayModeLabel: path
        LabelCss: hd16
        Mandatory: Yes
        Help: File path to search the matching line into.
        Type: string
    
      -
        Id: check
        Label: Check regexp
        DisplayModeLabel: check
        LabelCss: action16
        Mandatory: Yes
        Help: A regular expression. Matching the regular expression is sufficent to grant compliancy.
        Type: string
    
      -
        Id: com
        Label: Comment
        DisplayModeLabel: com
        LabelCss: action16
        Help: Give indications to fix manualy.
        Type: string
    
