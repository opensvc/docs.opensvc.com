.. _agent-items:

Installed Items
***************

Directories
===========

The agent file organization follows the Filesystem Hierarchy Standard guidelines on Unix. On Windows the package installs all files under ``%%ProgramFiles%%\opensvc\`` (This directory is referred to as ``<OSVCROOT>`` in this documentation).

The package installs the following directory tree:

================================== ============================ ==================
Git Workspace or Windows Package   Unix Packages                Reference in docs
================================== ============================ ==================
``<OSVCROOT>/``                                                 ``<OSVCROOT>``
``<OSVCROOT>/etc``                 ``/etc/opensvc``             ``<OSVCETC>``
``<OSVCROOT>/tmp``                 ``/var/tmp/opensvc``         ``<OSVCTMP>``
``<OSVCROOT>/bin``                 ``/usr/share/opensvc/bin``   ``<OSVCBIN>``
``<OSVCROOT>/var``                 ``/var/lib/opensvc``         ``<OSVCVAR>``
``<OSVCROOT>/usr/share/doc``       ``/usr/share/doc/opensvc``   ``<OSVCDOC>``
``<OSVCROOT>/lib``                 ``/usr/share/opensvc/lib``   ``<OSVCLIB>``
``<OSVCROOT>/log``                 ``/var/log/opensvc``         ``<OSVCLOG>``
================================== ============================ ==================

Items Role
==========

=================== ===========================================================
Path                Description
=================== ===========================================================
``<OSVCETC>``       Hosts service, node and cluster configurations

``<OSVCTMP>``       Temporary, discardable files

``<OSVCBIN>``       Executables like svcmon, svcmgr

``<OSVCBIN>/pkg``   Executables to create package and optional, site-specific,
                    release scripts (none shipped in the opensvc-provided
                    packages)

``<OSVCVAR>/lock``  Where executables create the lock-files used to ensure two
                    actions can not run simultaneously on the same service.

``<OSVCDOC>``       Embedded documentation. Most importantly the service
                    resources and node configuration reference files,
                    documenting all possible parameters.

``<OSVCLIB>``       Python source code for the core and resource drivers.

``<OSVCLOG>``       Per-service, local, size-rotated, delay-rotated log files.
                    All logs are also multiplexed to stdout and to the 
                    collector via xmlrpc, and optionally multiplexed to syslog.
=================== ===========================================================

Configuration Files
===================

The agent uses two configuration files, deployed in ``<OSVCETC>``.

<PATHETC>/node.conf
-------------------

This configuration file contains:

* The collector authentication token
* The agent tasks schedules and options
* Asset information pushed to the collector
* The cluster and heartbeat configurations

This file can be left empty or non-existant if no collector communications are required and the default agent tasks schedules and options are adequate.

The agent ensures this file is not world-writable.

.. rst-class:: lvl1

Template
++++++++

.. raw:: html

   <div class='highlight-none'><div class='highlight'><pre>

.. raw:: html
   :file: _static/node.conf

.. raw:: html

   </pre></div></div>


