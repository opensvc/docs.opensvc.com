Searching the collector
=======================

The top-right input is a search tool.

This input can be focused using the ``s`` shortcut key.

Only the first 10 matches are returned for each object type, with a count of the total number of matches.

Search Syntax
-------------

The multiple character wildcard is ``%``.

The single character wildcard is ``_``.

The search pattern is implicitely encased in ``%``.

Object Type Filtering 
---------------------

If the searched word start with ``<object type>:``, and the object type is supported, only candidates of the specified object type are displayed.

Example: The ``svc:erp`` search pattern only displays services matching ``%erp%``.

Supported object types::

	app:		application codes
	disk:		disks
	docker:		docker registries or images
	chart:		report charts
	form:		form
	fset:		filtersets
	group:		groups
	ip:		ip addresses
	metric:		report metrics
	modset:		compliance modulesets
	node:		nodes
	prov:		provisioning templates
	report:		reports
	rset:		compliance rulesets
	safe:		files in the safe store
	svc:		services
	user:		users
	var:		compliance variable
	vm:		virtual machine and container hostnames

Navigating the resultset
------------------------

After the candidates are displayed, the ``<tab>`` key moves focus to the first candidate.

The arrow keys move the focus between candidates.

The ``<enter>`` key opens the candidate details tabs, if available.

The ``<esc>`` key closes the resultset panel.

Drill down from the search resultset
------------------------------------

Clicking a candidate opens the object details tabs in a layered panel. From there, clicking on a tag-like object opens its details tabs. The two opened tabs are shown in a barel allowing nagivation between recently opened details tabs.

When the drill down session is over, the ``<esc>`` closes the layered panel, returning the search resultset visibility.


