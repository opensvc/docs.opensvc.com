fileinc
-------

Description
===========

    * Verify file content.
    * The collector provides the format with wildcards.
    * The module replace the wildcards with contextual values.
    * The fmt must match the check pattern
    
    Wildcards:
    %%ENV:VARNAME%%		Any environment variable value
    %%HOSTNAME%%		Hostname
    %%SHORT_HOSTNAME%%	Short hostname
    
    

Example rule
============

::

    {
        "path": "/tmp/foo",
        "fmt": "full added content with %%HOSTNAME%%@corp.com: some pattern into the file.",
        "check": ".*some pattern.*"
    }

Form definition
===============

::

    
    Desc: |
      A fileinc rule, fed to the 'fileinc' compliance object to verify a line matching the 'check' regular expression is present in the specified file.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: fileinc
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
        Id: fmt
        Label: Format
        DisplayModeLabel: fmt
        LabelCss: action16
        Help: The line installed if the check pattern is not found in the file.
        Type: string
      -
        Id: ref
        Label: URL to format
        DisplayModeLabel: ref
        LabelCss: loc
        Help: An URL pointing to a file containing the line installed if the check pattern is not found in the file.
        Type: string
    
    
