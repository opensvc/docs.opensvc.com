self.signed.cert
----------------

Description
===========

    * Check the existance of a key/crt pair
    * Create the key/crt pair
    

Example rule
============

::

    {
        "C": "FR",
        "CN": "%%ENV:SERVICES_SVCNAME%%",
        "crt": "/srv/%%ENV:SERVICES_SVCNAME%%/data/nginx/conf/ssl/server.crt",
        "L": "Paris",
        "O": "OpenSVC",
        "ST": "Ile de France",
        "alt_names": [
            {
                "dns": ""
            }
        ],
        "emailAddress": "support@opensvc.com",
        "key": "/srv/%%ENV:SERVICES_SVCNAME%%/data/nginx/conf/ssl/server.key",
        "OU": "Lab",
        "bits": 2048
    }

Form definition
===============

::

    
    Desc: |
      Describe a self-signed certificate
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: dict
        Class: authkey
    
    Inputs:
      -
        Id: CN
        Label: Common name
        DisplayModeLabel: cn
        LabelCss: loc
        Mandatory: Yes
        Type: string
      -
        Id: crt
        Label: Cert path
        DisplayModeLabel: crt
        LabelCss: key
        Mandatory: Yes
        Type: string
        Help: Where to install the generated certificate
      -
        Id: key
        Label: Key path
        DisplayModeLabel: key
        LabelCss: key
        Mandatory: Yes
        Type: string
        Help: Where to install the generated key
      -
        Id: bits
        Label: Bits
        DisplayModeLabel: bits
        LabelCss: key
        Mandatory: Yes
        Type: integer
        Default: 2048
        Help: Defines the key length in bits
      -
        Id: C
        Label: Country name
        DisplayModeLabel: country
        LabelCss: loc
        Mandatory: Yes
        Default: FR
        Type: string
      -
        Id: ST
        Label: State or Province
        DisplayModeLabel: state
        LabelCss: loc
        Mandatory: Yes
        Default: Ile de France
        Type: string
      -
        Id: L
        Label: Locality name
        DisplayModeLabel: locality
        LabelCss: loc
        Mandatory: Yes
        Default: Paris
        Type: string
      -
        Id: O
        Label: Organization name
        DisplayModeLabel: org
        LabelCss: loc
        Mandatory: Yes
        Default: OpenSVC
        Type: string
      -
        Id: OU
        Label: Organization unit
        DisplayModeLabel: org unit
        LabelCss: loc
        Mandatory: Yes
        Default: IT
        Type: string
      -
        Id: emailAddress
        Label: Email address
        DisplayModeLabel: email
        LabelCss: loc
        Mandatory: Yes
        Default: admin@opensvc.com
        Type: string
      -
        Id: alt_names
        Label: Alternate names
        DisplayModeLabel: alt names
        LabelCss: loc
        Type: form
        Form: self.signed.cert.alt_names
        Default: []
    
    
    Subform:
    
    Desc: |
      Subform for the self.signed.cert form.
    Css: comp48
    
    Outputs:
      -
        Type: json
        Format: list of dict
    
    Inputs:
      -
        Id: dns
        Label: DNS
        DisplayModeLabel: dns
        LabelCss: loc
        Type: string
        Help: An alternate service name
    
        
