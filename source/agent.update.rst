.. _agent.update:

OpenSVC agent updates
*********************

Introduction
============

OpenSVC provides packages for all supported operating systems at http://repo.opensvc.com. Agents can be updated using one of the following methods, ordered by scalability:

* Download the required opensvc package to your hosts and use operating system specific local package management commands.
* Feed the opensvc packages into your existing per operating system package depots and use operating system specific network-aware package management commands.
* Mirror http://repo.opensvc.com on a corporate server and set up the opensvc agent to use this mirror as a package source.

This chapter describes the last method.

Initialize the mirror
=====================

A mirror can be set up using::

	wget -m -A '*.deb' -A '*.rpm' -A '*.msi' -A '*.pkg' -A '*.tbz' -A '*.depot' http://repo.opensvc.com

The resulting file tree must organized as::

	repo.opensvc.com/
	+- deb/
	+- depot/
	+- pkg/
	+- rpms/
	 +- current -> opensvc-1.4-49.rpm
	 +- opensvc-1.4-48.rpm
	 +- opensvc-1.4-49.rpm
	 +- opensvc-1.4-50.rpm
	+- tbz/

Set up the published versions
=============================

The OpenSVC agent downloads the file pointed by the link named ``current`` under the package category supported by the operating system running the agent. For example a Solaris host executing 'nodemgr updatepkg' would try to download pkg/current.

After the mirror initialization, you have to update the current links according to your own policies. Beware, the mirroring step may have installed current links pointing to the lastest available agent packages.

Set up the agents
=================

The repository must be known to the agent. This set up is done with either the node.repo or the node.repopkg ``node.conf`` parameters.

**node.repo**

	This parameter allows to set up a URI pointing to a repository hosting both compliance gzipped tarballs in the compliance/ subdirectory and OpenSVC agent packages in the packages/ subdirectory.

**node.repopkg**

	This parameter allows to set up a URI pointing to a pure OpenSVC agent packages repository. If specified node.repopkg overrides node.repo.

Example::

	nodemgr set --value node.repopkg --value http://my.repo.opensvc.corp:8080/packages/

Updating the agent
==================

The update command is::

	nodemgr updatepkg

This command is operating system agnostic.
