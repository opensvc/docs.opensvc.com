authkey
----


Description
===========

    * Installs or removes ssh public keys from authorized_key files
    * Looks up the authorized_key and authorized_key2 file location in the running sshd daemon configuration.
    * Add user to sshd_config AllowUser and AllowGroup if used
    * Reload sshd if sshd_config has been changed
    

Example rule
============

::

    {
        "action": "add",
        "authfile": "authorized_keys",
        "user": "testuser",
        "key": "ssh-dss AAAAB3NzaC1kc3MAAACBAPiO1jlT+5yrdPLfQ7sYF52NkfCEzT0AUUNIl+14Sbkubqe+TcU7U3taUtiDJ5YOGOzIVFIDGGtwD0AqNHQbvsiS1ywtC5BJ9362FlrpVH4o1nVZPvMxRzz5hgh3HjxqIWqwZDx29qO8Rg1/g1Gm3QYCxqPFn2a5f2AUiYqc1wtxAAAAFQC49iboZGNqssicwUrX6TUrT9H0HQAAAIBo5dNRmTF+Vd/+PI0JUOIzPJiHNKK9rnySlaxSDml9hH2LuDSjYz7BWuNP8UnPOa2pcFA4meDp5u8d5dGOWxkuYO0bLnXwDZuHtDW/ySytjwEaBLPxoqRBAyfyQNlusGsuiqDYRA7j7bS0RxINBxvDw79KdyQhuOn8/lKVG+sjrQAAAIEAoShly/JlGLQxQzPyWADV5RFlaRSPaPvFzcYT3hS+glkVd6yrCbzc30Yc8Ndu4cflQiXSZzRoUMgsy5PzuiH1M8JjwHTGNl8r9OfJpnN/OaAhMpIyA06y1ZZD9iEME3UmthFQoZnfRuE3yxi7bqyXJU4rOq04iyCTpU1UKInPdXQ= testuser"
    }

Form definition
===============

::

    
    Desc: |
      Describe a list of ssh public keys to authorize login as the specified Unix user.
    Css: comp48
    
    Outputs:
      -
        Dest: compliance variable
        Type: json
        Format: dict
        Class: authkey
    
    Inputs:
      -
        Id: action
        Label: Action
        DisplayModeLabel: action
        LabelCss: action16
        Mandatory: Yes
        Type: string
        Candidates:
          - add
          - del
        Help: Defines wether the public key must be installed or uninstalled.
    
      -
        Id: user
        Label: User
        DisplayModeLabel: user
        LabelCss: guy16
        Mandatory: Yes
        Type: string
        Help: Defines the Unix user name who will accept those ssh public keys.
    
      -
        Id: key
        Label: Public key
        DisplayModeLabel: key
        LabelCss: guy16
        Mandatory: Yes
        Type: text
        DisplayModeTrim: 60
        Help: The ssh public key as seen in authorized_keys files.
    
      -
        Id: authfile
        Label: Authorized keys file name
        DisplayModeLabel: authfile
        LabelCss: hd16
        Mandatory: Yes
        Candidates:
          - authorized_keys
          - authorized_keys2
        Default: authorized_keys2
        Type: string
        Help: The authorized_keys file to write the keys into.
    
