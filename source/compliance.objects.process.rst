process
*******

Description
============

* Checks the presence (or absence) of a process and its ownership.
* Starts the process using the specified command. Used to start a daemon after package installation and rc setup.
* Stops the process if the expected state is "off"

+-----------------------+-----+
| check action          | yes |
+-----------------------+-----+
| fix action            | yes |
+-----------------------+-----+
| variable substitution | yes |
+-----------------------+-----+

Supported operating systems
===========================

* Unix

Ouputs
======

Valid check::

        process with command docker is started ... on target
        process with args /usr/bin/docker -d -p /var/run/docker.pid is started ... on target
        process with args /usr/bin/docker -d -p /var/run/docker.pid runs with user root ... on target

Invalid check::

        ERR: process with command docker is not started ... should be
        ERR: process with args /usr/bin/docker -d -p /var/run/docker.pid is not started ... should be

Fix::

        exec: /etc/init.d/docker start
        Starting Docker: docker.
	
Form
====

Display mode
++++++++++++

.. figure:: _static/compliance.objects.process.display.png

Edition mode
++++++++++++

.. figure:: _static/compliance.objects.process.edit.png

Definition
++++++++++

.. code-block:: yaml

        Desc: |
          A rule defining a process that should be running or not running on the target host, its owner's username and the command to launch it or to stop it.
        Css: comp48
        
        Outputs:
          -
            Dest: compliance variable
            Type: json
            Format: list of dict
            Class: process
        
        Inputs:
          -
            Id: comm
            Label: Command
            DisplayModeLabel: comm
            LabelCss: action16
            Mandatory: No
            Type: string
            Help: The Unix process command, as shown in the ps comm column.
        
          -
            Id: args
            Label: Arguments
            DisplayModeLabel: args
            LabelCss: action16
            Mandatory: No
            Type: string
            Help: The Unix process arguments, as shown in the ps args column.
        
          -
            Id: state
            Label: State
            DisplayModeLabel: state
            LabelCss: action16
            Type: string
            Mandatory: Yes
            Default: on
            Candidates:
              - "on"
              - "off"
            Help: The expected process state.
        
          -
            Id: uid
            Label: Owner user id
            DisplayModeLabel: uid
            LabelCss: guy16
            Type: integer
            Help: The Unix user id owning the process.
        
          -
            Id: user
            Label: Owner user name
            DisplayModeLabel: user
            LabelCss: guy16
            Type: string
            Help: The Unix user name owning the process.
        
          -
            Id: start
            Label: Start command
            DisplayModeLabel: start
            LabelCss: action16
            Type: string
            Help: The command to start or stop the process, including the executable arguments. The executable must be defined with full path.

Data format
===========

.. code-block:: json

        [
         {"comm": "foo", "user": "foou", "state": "on","start": "/etc/init.d/foo start"},
         {"start": "/etc/init.d/docker start", "state": "on", "args": "/usr/bin/docker -d -p /var/run/docker.pid", "comm": "docker", "user": "root"},
         {"comm": "bar", "args": "/usr/bin", "uid": "2345", "state": "off", "start": "/etc/init.d/bar stop"},
        ]
