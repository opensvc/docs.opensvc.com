.. _agent.upgrade:
.. index:: upgrade, repository, mirror

Agent Upgrade
*************

OpenSVC provides packages for all supported operating systems at https://repo.opensvc.com. Agents can be upgraded using one of the following methods, ordered by scalability:

* Download the required opensvc package to your hosts and use operating system specific local package management commands.
* Feed the opensvc packages into your existing per operating system package depots and use operating system specific network-aware package management commands.
* Mirror https://repo.opensvc.com on a corporate server and set up the opensvc agent to use this mirror as a package source.

In the first part, this chapter describes the last method. The second part provides all information the user need to know before starting an upgrade campain.

OS Package upgrade
##################

Initialize a Mirror
===================

A mirror can be set up using:

::

	wget -m -A '*.deb' -A '*.rpm' -A '*.exe' -A '*.pkg' -A '*.tbz' -A '*.depot' https://repo.opensvc.com

The resulting file tree must organized as:

::

	repo.opensvc.com/
	|- deb/
	|- depot/
	|- exe/
	|- sunos-pkg/
	|- rpms/
	|  |- current -> 1.9/current
	|  `- 1.9
	|     |- current -> opensvc-1.9-50.rpm
	|     |- opensvc-1.9-48.rpm
	|     |- opensvc-1.9-49.rpm
	|     `- opensvc-1.9-50.rpm
	`- tbz/

Set Up Published Versions
=========================

The OpenSVC agent downloads the file pointed by the link named ``current`` under the package category supported by the operating system running the agent. For example a Solaris host executing ``nodemgr updatepkg`` would try to download ``sunos-pkg/current``.

After the mirror initialization, you have to update the current links according to your own policies. Beware, the mirroring step may have installed current links pointing to the lastest available agent packages.

Set Up Agents
=============

The repository must be known to the agent. This set up is done with either the node.repo or the node.repopkg ``node.conf`` parameters.

``node.repo``

	This parameter allows to set up a URI pointing to a repository hosting both compliance gzipped tarballs in the compliance/ subdirectory and OpenSVC agent packages in the packages/ subdirectory.

``node.repopkg``

	This parameter allows to set up a URI pointing to a pure OpenSVC agent packages repository. If specified node.repopkg overrides node.repo.

Example:

::

	nodemgr set --param node.repopkg --value http://my.repo.opensvc.corp:8080/packages/

Upgrade Agents
==============

The upgrade command is:

::

	nodemgr updatepkg

This command is operating system agnostic.

Upgrade Information & Prerequisites
###################################

The upgrade path can involve some steps before or after migration, depending on the service configuration.

NEW ``DEFAULT.orchestrate`` parameter
=====================================

Among all changes in the 1.9 version, one of the most important is that services are now orchestrated **by default**, as soon as a cluster is formed (2 nodes and upper), and the service nodes list is made of at least 2 nodes.

It means the following:

* Any 1.8 service that operate **without** hearbeat resource (manual failover from one node to another) would behave like a HA service as soon as the agent stack is upgraded to 1.9

* In order to avoid a different behaviour after agent migration, it is mandatory to deploy new parameter ``DEFAULT.orchestrate=false`` before starting migration.

Examples :

+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|  Service Type |    V1.8                |   V1.9               |   Comments                                                                              |
+===============+========================+======================+=========================================================================================+
|               | | [DEFAULT]            | | [DEFAULT]          | | we have to disable orchestration because no hb resource in 1.8                        |
| | failover    | | nodes=n1 n2          | | nodes=n2 n1        | | we also have to order nodes accurately to allow service default startup on n2         |
| |   no hb     | | autostart_node=n2    | | orchestrate=false  |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]            | | [DEFAULT]          | | as openha is leading the primary node (n2), no autostart_node is present in 1.8       |
| | failover    | | nodes=n1 n2          | | nodes=n2 n1        | | we just have to order nodes accurately to allow service default startup on n2         |
| | with hb     | |                      | |                    |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+
|               | | [DEFAULT]            | | [DEFAULT]          | | we have to disable orchestration to have a kind of static service                     |
| |  flex       | | nodes=n1 n2 n3       | | nodes=n2 n3 n1     | | we also have to order nodes accurately to allow service default startup on n2 and n3  |
|               | | autostart_node=n2 n3 | | flex_min_nodes=2   | | flex_min_nodes ensure that 2 service instances are spawned at service startup         |
|               |                        | | orchestrate=false  |                                                                                         |
+---------------+------------------------+----------------------+-----------------------------------------------------------------------------------------+


