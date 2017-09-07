Agent Configuration Files
*************************

The agent uses two configuration files, deployed in ``<OSVCETC>``.

node.conf
=========

This configuration file contains:

* The collector authentication token
* The agent tasks schedules and options
* Asset information pushed to the collector
* The cluster and heartbeat configurations

This file can be left empty or non-existant if no collector communications are required and the default agent tasks schedules and options are adequate.

The agent ensures this file is not world-writable.

.. rst-class:: html-toggle

Template
--------

.. raw:: html

   <div class='highlight-none'><div class='highlight'><pre>

.. raw:: html
   :file: _static/node.conf

.. raw:: html

   </pre></div></div>

auth.conf
=========

This configuration file contains authentication options and tokens for tiers infrastructure components. This information is used by the inventoring and provisioning drivers.

The agent ensures this file is not world-writable nor world-writable.

.. rst-class:: html-toggle

Template
--------

.. raw:: html

   <div class='highlight-none'><div class='highlight'><pre>

.. raw:: html
   :file: _static/auth.conf

.. raw:: html

   </pre></div></div>

