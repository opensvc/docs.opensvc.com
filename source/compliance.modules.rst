Modules development
*******************

Basics
======

Langage
-------
A module can be implemented in any programing langage : shell scripts, python, perl, C, ...

Rules
-----

The rules are passed to the modules through environment variables. Advanced langages can use complex serialized variable values like JSON or XML.

Parameters
----------

A module must support only one mandatory argument. Its' values can be either

======================= ===============================================================
Argument                Description
======================= ===============================================================
:c-action:`check`       Verify the rules are applied on the node or service.
:c-action:`fixable`     Verify the module can apply the rules on the service or node.
:c-action:`fix`         Apply the rules on the node or service
======================= ===============================================================

Return code
-----------

A module must return one of those three possible values

======================= ===============================================================
Argument                Description
======================= ===============================================================
``0``                   Compliance checks or fixes passed.
``1``                   Compliance checks or fixes failed.
``2``                   Compliance checks or fixes are not applicable. For example
                        when no rules are made available to the module.
======================= ===============================================================

Location
--------

Modules are installed in ``<OSVCVAR>/compliance``.

File naming conventions
-----------------------

A module can be either a file or a directory tree. The top-level file or directory name must comply to the naming convention:

::

    [S][0-9]+[-]modname

If the module top-level object is a directory, the file tree under it must be either:

::

    [S][0-9]+[-]modname/main

or:

::

    [S][0-9]+[-]modname/scripts/main


Compliance Objects
==================

OpenSVC distributes a collection of compliance objects, implemented as executable python classes, to ease module development. They implement common checks and fixes. The skeletons presented below make use of these objects.

Objects take complex serialized rules as input, and the collector implements forms to easily create those rules.

The calling modules have to specify to the object 2 informations:

* The called action : :c-action:`fix`, :c-action:`fixable` or :c-action:`check`
* The variable name prefix the object must care about. The object will search the environment for variables matching this prefix.

Auto-modules
============

A module embedded in a moduleset, with no deployed script by that name, is an auto-module.

The agent loops over each variable provided with the moduleset. If the variable class matches a deployed compliance object, it executes this compliance object with the variable name as the scope argument.

Module skeleton
===============

Shell script
------------

.. code-block:: sh

	#!/bin/bash

	PATH_SCRIPT="$(cd $(/usr/bin/dirname $(type -p -- $0 || echo $0));pwd)"
	PATH_LIB=$PATH_SCRIPT/com.opensvc
	PREFIX=OSVC_COMP_FOO

	typeset -i r=0

	case $1 in
	check)
		$PATH_LIB/files.py ${PREFIX}_FILES check
		[ $? -eq 1 ] && r=1
		$PATH_LIB/packages.py ${PREFIX}_PKG check
		[ $? -eq 1 ] && r=1
		exit $r
		;;
	fix)
		$PATH_LIB/files.py ${PREFIX}_FILES check
		[ $? -eq 1 ] && exit 1
		$PATH_LIB/packages.py ${PREFIX}_PKG check
		[ $? -eq 1 ] && exit 1
		;;
	fixable)
		exit 2
		;;
	esac

Python script
-------------

.. code-block:: python

	#!/usr/bin/env python

	import os
	import sys

	sys.path.append(os.path.join(os.path.dirname(__file__), 'com.opensvc'))

	from comp import *

	import files
	import packages

	syntax = """syntax: %s check|fixable|fix"""%sys.argv[0]

	if len(sys.argv) != 2:
	    print >>sys.stderr, "wrong number of arguments"
	    print >>sys.stderr, syntax
	    sys.exit(RET_ERR)

	objs = []

	try:
	    o = packages.CompPackages(prefix='OSVC_COMP_BDC_DHCPD_PACKAGE')
	    objs.append(o)
	except NotApplicable:
	    pass

	try:
	    o = files.CompFiles(prefix='OSVC_COMP_BDC_DHCPD_FILE')
	    objs.append(o)
	except NotApplicable:
	    pass

	def check():
	    r = 0
	    for o in objs:
		r |= o.check()
	    return r

	def fixable():
	    return RET_NA

	def fix():
	    r = 0
	    for o in objs:
		r |= o.fix()
	    return r

	try:
	    if sys.argv[1] == 'check':
		RET = check()
	    elif sys.argv[1] == 'fix':
		RET = fix()
	    elif sys.argv[1] == 'fixable':
		RET = fixable()
	    else:
		print >>sys.stderr, "unsupported argument '%s'"%sys.argv[1]
		print >>sys.stderr, syntax
		RET = RET_ERR
	except NotApplicable:
	    sys.exit(RET_NA)
	except:
	    import traceback
	    traceback.print_exc()
	    sys.exit(RET_ERR)

	sys.exit(RET)

