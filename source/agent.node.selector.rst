Node Selector
*************

Abstracting nodes through labels is a core enabler for severless.

The node selector also eases the management of geo-cluster and heterogeneous clusters, allowing nodes selection expressions based on arbitrary labels, like ``region=eu-west-1`` and ``arch=arm``.

Labels are <key>=<value> pairs in the node configuration file::

	$ om node get --kw labels.zone
	sofa

Labels are embedded in the cluster data::

	$ om daemon status --format flat_json | grep labels
	.monitor.nodes.nuc-cva.labels.region = eu1
	.monitor.nodes.nuc-cva.labels.zone = tv
	.monitor.nodes.aubergine.labels.region = eu1
	.monitor.nodes.aubergine.labels.zone = sofa

Node Selector Expressions
=========================

fnmatch
-------

::

	$ om node ls --node aub*
	aubergine

Label Existance
---------------

::

	$ om node ls --node zone:
	aubergine
	nuc-cva

Exact Label
-----------

::

	$ om node ls --node zone=sofa
	aubergine

Negation
--------

::

	$ om node ls --node '!zone=sofa'
	nuc-cva

Or-ed selectors
---------------

::

	$ om node ls --node zone=sofa,zone=tv
	aubergine
	nuc-cva

And-ed selectors
----------------

::

	$ om node ls --node zone=sofa+region=eu1
	aubergine

wildcard
--------

::

	$ om node ls --node '*'
	aubergine
	nuc-cva

Node Selector in Service Configurations
=======================================

Labels can be used in service configurations :kw:`nodes` keyword::

	$ om test/registry get --kw nodes
	region=eu1

::

	$ om daemon status --format flat_json | grep "'test/registry'" | grep scope
	.monitor.nodes.nuc-cva.services.config.'test/registry'.scope[0] = aubergine
	.monitor.nodes.nuc-cva.services.config.'test/registry'.scope[1] = nuc-cva
	.monitor.nodes.aubergine.services.config.'test/registry'.scope[0] = aubergine
	.monitor.nodes.aubergine.services.config.'test/registry'.scope[1] = nuc-cva

::

	$ om test/registry set --kw nodes=zone=sofa

::

	$ om daemon status --format flat_json | grep "'test/registry'" | grep scope
	.monitor.nodes.aubergine.services.config.'test/registry'.scope[0] = aubergine

