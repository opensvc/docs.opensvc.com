.. _agent.configure.client:

Cluster Client
**************

A client can communicate with a cluster via the secure socket, authenticated with a trusted x509 client certificate.

Any opensvc installation can operate as a client to a remote cluster. The opensvc daemon does not need to run on a pure client installation.

This chapter describes how to configure the OpenSVC agent to access remote clusters.

Prerequisites
=============

The PKI and user configuration steps described in :ref:`agent.configure.users` must be done, so the ``root`` and ``usr1`` users exist and have a certificate_chain and private key.

In the examples, the cluster is named ``clu1``. Replace as appropriate.

Install the client certificate full PEM
=======================================

On a cluster node, or from a already configured client with root privileges:

::

	(om system/usr/root decode --key private_key;
	 om system/usr/root decode --key certificate)

On the client, paste the previous command output in a ``~/.opensvc/clu1-root.full.pem`` file.

Install the cluster certificate authority certificate chain PEM
===============================================================

On a cluster node, or from a already configured client with root privileges:

::

	om system/sec/ca-clu1 decode --key certificate_chain

On the client, paste the previous command output in a ``~/.opensvc/clu1-ca.pem`` file.

Declare the client user
=======================

::

	om ctx user create --name root@clu1 --client-certificate ~/.opensvc/clu1-root.full.pem

Declare the cluster
===================

::

	om ctx cluster create --name clu1 --server=tls://vip.clu1.mycorp:1215 --certificate-authority=~/.opensvc/clu1-ca.pem

Declare the context
===================

::

	om ctx create --name root@clu1 --user root@clu1 --cluster clu1

Switch to this new context
==========================

::

	om ctx set root@clu1

Test
====

::

	om mon

.. seealso::

	| :ref:`agent.configure.users`
	| :ref:`agent.rbac`
