package
----


Description
===========

    * Verify a list of packages is installed or removed
    * A '-' prefix before the package name means the package should be removed
    * No prefix before the package name means the package should be installed
    * The package version is not checked
    

Example rule
============

::

    [
        "bzip2",
        "-zip",
        "zip"
    ]

Form definition
===============

::

    
    Desc: |
      A rule defining a set of packages, fed to the 'packages' compliance object for it to check each package installed or not-installed status.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Class: package
        Type: json
        Format: list
    
    Inputs:
      -
        Id: pkgname
        Label: Package name
        DisplayModeLabel: ""
        LabelCss: pkg16
        Mandatory: Yes
        Help: Use '-' as a prefix to set 'not installed' as the target state. Use '*' as a wildcard for package name expansion for operating systems able to list packages available for installation.
        Type: string
    
