vuln
----

Description
===========

    * Raise an alert if an installed package version is in a version range
    * If the package is not installed, do not raise an alert
    

Example rule
============

::

    [
        {
            "pkgname": "kernel",
            "minver": "2.6.18-238.19.1.el5",
            "firstver": "2.6.18-238"
        },
        {
            "pkgname": "kernel-xen",
            "minver": "2.6.18-238.19.1.el5"
        }
    ]

Form definition
===============

::

    
    Desc: |
      A rule defining a list of vulnerable packages and their minimum release version fixing the vulnerability.
    
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: list of dict
        Class: vuln
    
    Inputs:
      -
        Id: pkgname
        Label: Package name
        DisplayModeLabel: pkgname
        LabelCss: pkg16
        Mandatory: Yes
        Type: string
        Help: The package name, as known to the target system's package manager.
      -
        Id: firstver
        Label: First vulnerable version
        DisplayModeLabel: firstver
        LabelCss: pkg16
        Mandatory: No
        Type: string
        Help: The first vulnerable package version. In the security context, the package version introducing the vulnerability.
      -
        Id: minver
        Label: Minimum version
        DisplayModeLabel: minver
        LabelCss: pkg16
        Mandatory: Yes
        Type: string
        Help: The package minimum version. In the security context, the package version fixing the vulnerability.
    
    
