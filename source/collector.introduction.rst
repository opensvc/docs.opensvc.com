.. index:: introduction

Introduction
************

The collector centralizes the agents data and extends the agent feature set with monitoring, mass-actions, forms, configuration management, provisioning, reporting and accounting.

.. index:: licensing

Licensing
=========

The collector is commercially licensed web application available either in SaaS mode or in client-hosted mode. Contact sales@opensvc.com for licensing information.

.. index:: register

Internet collector account configuration
========================================

Account registration the SaaS collector at https://collector.opensvc.com is open to all.

A newly created account has no privilege to see other users services. You have to ask admin@opensvc.com to add filters to your account so you can see your data. Filtering is based on domainnames patterns. You can declare as many domains as you need. The email address you setup during registration is important : it is used by the collector alarming subsystem as a mail sink for services you are responsible of.

.. index:: conventions, colors, icons

Conventions
===========

Objects
-------

Object types are icon and color coded using the following convention.

| :c-app:`Application Code`
| :c-node:`Node`
| :c-svc:`Service`
| :c-res:`Resource`
| :c-action:`Action`
| :c-tag:`Tag`
| :c-docker-repo:`Docker Repository`
| :c-docker-registry:`Docker Registry`
| :c-pkg:`Package`
| :c-net:`Network`
| :c-net:`Network Segment`
| :c-check:`Check`
| :c-form:`Form`
| :c-form:`Workflow`
| :c-report:`Report`
| :c-metric:`Metric`
| :c-chart:`Chart`
| :c-group:`Organization Group`
| :c-priv:`Privilege Group`
| :c-user:`User`
| :c-dns-domain:`DNS Domain`
| :c-dns-record:`DNS Record`
| :c-fset:`Filterset`
| :c-disk:`Disk`
| :c-array:`Storage Array`
| :c-diskgroup:`Disk Group`
| :c-rset:`Compliance Ruleset`
| :c-modset:`Compliance Moduleset`
| :c-rule:`Compliance Rule`
|

Popups and panels
-----------------

By convention, every popups, side panels, header panels and table extralines can be closed with the ``<ESC>`` keypress.

The collector maintains a stack of those elements. When one is opened, it gets pushed to the stack. And the ``<ESC>`` keypress pops from the stack, closing the last opened element.

Widgets generic tools
---------------------

Most javascript widgets (tab collections, tabs, ...) embed generic tools displayed top-up on mouse-over.

=========================== =============================================================================================
Tool                        Description
=========================== =============================================================================================
:c-link:`Link`              Display in the flash header panel an url to load this widget directly and in full page layout
:c-fullscreen:`Fullscreen`  Grow the widget to fill the full space after the header (the layout), replacing the current
                            content.  The tool is replaced by the shrinker tool.
:c-shrink:`Shrink`          Shrink, after a fullscreen tool use. Return the widget to its original parent.  Restore the
                            previous layout content. The tool is replaced by the fullscreen tool.
:c-close:`Close`            Close the widget.
=========================== =============================================================================================
