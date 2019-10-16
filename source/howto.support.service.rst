.. _howto.support.service:

Support Service Procedures
**************************

Introduction
============

OpenSVC provides commercial support on its product catalog. Active support contracts owners are able to open service requests. Contact sales@opensvc.com for quotation.

This section describe the guidelines to be assisted by our support team.

Support Ticket Opening
======================

To open a service request, you can use one of the four following methods :

Slack
-----

OpenSVC slack channels are available at https://opensvc.slack.com

Please request your access (support@opensvc.com) if no invitation has been received in your mailbox.


Web Portal
----------

Support website is available at https://www.opensvc.com

First of all, you have to register for an account on the web portal :

* open a browser to https://www.opensvc.com
* click on ``Sign In`` link
* click on ``Register`` link
* fill in requested informations, and submit
* contact support@opensvc.com to link your new account to your company support contract

Once your account is active and linked to a support contract, you are now able to open a service request :

* open a browser to https://www.opensvc.com
* login with your email address & password
* click on ``Support`` icon, and then ``Create Ticket``
* fill in the requested information, and click on ``Submit``
* you can then either modify/show the ticket, to complete with problem description, error messages, context, and information you want to provide

Email
-----

Send us your request to support@opensvc.com


Phone 
-----

Premium support enabled accounts are presented a ``Call Me Back`` button in the web portal support section.

* open a browser to https://www.opensvc.com
* login with your email address & password
* click on ``Support`` icon, and then red ``Call Me Back`` button
* fill in the form with your international phone number, and submit
* wait for a support representative to call you back

.. warning:: please consider using the callback service for urgent purposes requiring immediate answers

Support Data Collection
=======================

To ease resolution, you will be asked to provide informations, config and log files related to the encountered issue 

* issue description

  * what is the ticket purpose ? (unexpected behaviour, error message, technical question, ...)
  * what is the context ? (any known cause or event related)
  * when did the problem start ?
  * what is the impact on service ?

* node & cluster configuration

  * ``/etc/opensvc/node.conf``
  * ``/etc/opensvc/cluster.conf``

* node agent log ``/var/log/opensvc/node.log``
* objects log 

  * ``/var/log/opensvc/<service>.log``
  * or
  * ``/var/log/opensvc/namespaces/<namespace>/<kind>/<service>.log``

All informations can be sent through email at ``support@opensvc.com`` or uploaded using our :ref:`howto.support.file.exchange`

.. note:: 
        see :ref:`agent.apps.naming` for object paths description

Support Open Hours
==================

Depending on your support subscription, you can call use according to the table below :

===================== ========================================
Support Service Level Open Hours                                                                            
===================== ========================================
Standard              Monday to Friday 9am to 6pm (Paris time)
Premium               24x7
===================== ========================================

.. _howto.support.file.exchange:

Support File Exchange
=====================

In case you need to share files with support team, you can use either email attachment or secure file exchange web portal

* open a browser to https://sfx.opensvc.com
* at the top right there is a ``Login`` field and button, fill in with ``support``, and click the ``Login`` button
* attach as many files as needed, and submit for upload
* once done, inform support team that your upload is finished

.. note::

    If allowed by network security policy, you can use the ``om <svcname> support`` or ``svcmgr -s <svcname> support`` command to automatically

    - build a tar.gz with all <svcname> needed logs
    - upload it to https://sfx.opensvc.com

.. note::
    
    You can also directly upload any file with ``curl`` command. In the example below, we use an internal web proxy named ``my.preferred.proxy``, and the file to be sent is named ``FILE_TO_UPLOAD.TAR.GZ``

``# export https_proxy=http://my.preferred.proxy:8080/``
``# curl -k -F 'file=@FILE_TO_UPLOAD.TAR.GZ;type=application/octet-stream' https://user:support@sfx.opensvc.com/+upload -X POST``

Premium Support Instructions
============================

Nodes under Premium support contract must be tagged into the associated collector to ensure proper node identification and accurate billing

========== ==================================================
Tag Action Command
========== ==================================================
Set        ``om node collector tag --tag PREMIUM_SUPPORT``
Unset      ``om node collector untag --tag PREMIUM_SUPPORT``
Check      ``om node collector show tags``
========== ==================================================

.. note::
    
    Services running on a Premium supported node are implicitly included in the Premium support scope and billing.

Please get in touch with us for any question you may have.
