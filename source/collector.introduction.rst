.. |nbsp| unicode:: 0xA0 
   :trim:

.. raw:: html

	<style>
		.c-action:before {color: seagreen; content: '\f013'; font-family: FontAwesome}
		.c-action {color: transparent}
		.c-docker-repo:before {color: #27b8e8; content: '\f04d'; font-family: FontAwesome}
		.c-docker-repo {color: transparent}
		.c-docker-registry:before {color: #27b8e8; content: '\f009'; font-family: FontAwesome}
		.c-docker-registry {color: transparent}
		.c-node:before {color: cornflowerblue; content: '\f233'; font-family: FontAwesome}
		.c-node {color: transparent}
		.c-svc:before {color: seagreen; content: '\f111'; font-family: FontAwesome}
		.c-svc {color: transparent}
		.c-tag:before {color: darkcyan; content: '\f02b'; font-family: FontAwesome}
		.c-tag {color: transparent}
		.c-pkg:before {color: #cc9966; content: '\f1b3'; font-family: FontAwesome}
		.c-pkg {color: transparent}
		.c-net:before {color: cadetblue; content: '\f0ec'; font-family: FontAwesome}
		.c-net {color: transparent}
		.c-check:before {color: green; content: '\f00c'; font-family: FontAwesome}
		.c-check {color: transparent}
		.c-form:before {color: palevioletred; content: '\f12e'; font-family: FontAwesome}
		.c-form {color: transparent}
		.c-report:before {color: sandybrown; content: '\f200'; font-family: FontAwesome}
		.c-report {color: transparent}
		.c-metric:before {color: sandybrown; content: '\f121'; font-family: FontAwesome}
		.c-metric {color: transparent}
		.c-chart:before {color: sandybrown; content: '\f201'; font-family: FontAwesome}
		.c-chart {color: transparent}
		.c-group:before {color: salmon; content: '\f0c0'; font-family: FontAwesome}
		.c-group {color: transparent}
		.c-priv:before {color: goldenrod; content: '\f0c0'; font-family: FontAwesome}
		.c-priv {color: transparent}
		.c-user:before {color: #FAA272; content: '\f007'; font-family: FontAwesome}
		.c-user {color: transparent}
		.c-dns-domain:before {color: turquoise; content: '\f0e1'; font-family: FontAwesome}
		.c-dns-domain {color: transparent}
		.c-dns-record:before {color: turquoise; content: '\f0e1'; font-family: FontAwesome}
		.c-dns-record {color: transparent}
		.c-fset:before {color: slategray; content: '\f0b0'; font-family: FontAwesome}
		.c-fset {color: transparent}
		.c-disk:before {color: #949413; content: '\f1c0'; font-family: FontAwesome}
		.c-disk {color: transparent}
		.c-array:before {color: #949413; content: '\f00a'; font-family: FontAwesome}
		.c-array {color: transparent}
		.c-diskgroup:before {color: #949413; content: '\f009'; font-family: FontAwesome}
		.c-diskgroup {color: transparent}
		.c-rule:before {color: #ee5464; content: '\f140'; font-family: FontAwesome}
		.c-rule {color: transparent}
		.c-rset:before {color: #ee5464; content: '\f1b2'; font-family: FontAwesome}
		.c-rset {color: transparent}
		.c-modset:before {color: #ee5464; content: '\f085'; font-family: FontAwesome}
		.c-modset {color: transparent}
		.c-app:before {color: deeppink; content: '\f069'; font-family: FontAwesome}
		.c-app {color: transparent}
	</style>

.. role:: c-action
.. role:: c-docker-repo
.. role:: c-docker-registry
.. role:: c-node
.. role:: c-svc
.. role:: c-tag
.. role:: c-pkg
.. role:: c-net
.. role:: c-check
.. role:: c-form
.. role:: c-report
.. role:: c-metric
.. role:: c-chart
.. role:: c-group
.. role:: c-priv
.. role:: c-user
.. role:: c-dns-domain
.. role:: c-dns-record
.. role:: c-fset
.. role:: c-disk
.. role:: c-array
.. role:: c-diskgroup
.. role:: c-rule
.. role:: c-rset
.. role:: c-modset
.. role:: c-app

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

Object types are icon and color coded using the following convention.

================== ===================
Object type        Color Icon
================== ===================
application code   :c-app:`...`
node               :c-node:`...`
service            :c-svc:`...`
action             :c-action:`...`
tag                :c-tag:`...`
docker repository  :c-docker-repo:`...`
docker registry    :c-docker-registry:`...`
package            :c-pkg:`...`
network            :c-net:`...`
network segment    :c-net:`...`
checks             :c-check:`...`
form               :c-form:`...`
workflow           :c-form:`...`
report             :c-report:`...`
metric             :c-metric:`...`
chart              :c-chart:`...`
organization group :c-group:`...`
privilege group    :c-priv:`...`
user               :c-user:`...`
dns domain         :c-dns-domain:`...`
dns record         :c-dns-record:`...`
filterset          :c-fset:`...`
disk               :c-disk:`...`
array              :c-array:`...`
diskgroup          :c-diskgroup:`...`
ruleset            :c-rset:`...`
moduleset          :c-modset:`...`
rule               :c-rule:`...`
================== ===================


