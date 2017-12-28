ansible_playbook
----------------

Description
===========

    * Fetch a playbook from a href if required
    * Run the playbook in check mode on check action
    * Run the playbook on fix action
    

Example rule
============

::

    {
        "path": "/some/path/to/file",
        "fmt": "---"
    }

Form definition
===============

::

    
    Desc: |
      Define or point to a ansible playbook.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: file
        Type: json
        Format: dict
    
    Inputs:
      -
        Id: ref
        Label: Content URL pointer
        DisplayModeLabel: ref
        LabelCss: loc
        Help: "Examples:
            /path/to/reference_file
            http://server/path/to/reference_file
            https://server/path/to/reference_file
            ftp://server/path/to/reference_file
            ftp://login:pass@server/path/to/reference_file"
        Type: string
      -
        Id: fmt
        Label: Content
        DisplayModeLabel: fmt
        LabelCss: hd16
        Css: pre
        Help: A reference content for the file. The text can embed substitution variables specified with %%ENV:VAR%%.
        Type: text
    
