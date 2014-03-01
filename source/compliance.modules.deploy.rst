.. _compliance.modules.deploy:

Modules deployment
******************

Introduction
============

The compliance modules must be installed on all nodes with modulesets attached. All modules can be safely installed : only the modules included in attached modulesets are used. The modules must be installed in ``/opt/opensvc/var/compliance/``.

Modules can be deployed using one of the following methods:

* Push mode : a trusted server is responsible of pushing the modules to the nodes. The difficult part is the target node listing. Such lists can be extracted from the collector database.

* Pull mode : each node is responsible from fetching the modules from a repository

This chapter describes the last method.

Initialize the repository
=========================

The compliance repository file tree must organized as::

	ROOT
	+- current -> compliance.tar.gz
	+- compliance.tar.gz

Set up the published version
============================

The OpenSVC agent downloads the file pointed by the link named ``current``.

After the mirror initialization, you have to update the current link according to your own policies.

Set up the agents
=================

The repository must be known to the agent. This set up is done with either the node.repo or the node.repocomp ``node.conf`` parameters.

**node.repo**

        This parameter allows to set up a URI pointing to a repository hosting both compliance gzipped tarballs in the compliance/ subdirectory and OpenSVC agent packages in the packages/ subdirectory.

**node.repocomp**

        This parameter allows to set up a URI pointing to a pure OpenSVC agent compliance repository. If specified node.repocomp overrides node.repo.

Example::

        nodemgr set --param node.repocomp --value http://my.repo.opensvc.corp:8080/compliance/

Updating the modules
====================

The update command is::

	nodemgr updatecomp

This command is operating system agnostic.