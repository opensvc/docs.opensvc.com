.. _agent.configure.users:

Cluster Users
*************

A cluster can be accessed remotely via any daemon secure socket. The cluster access can be abstracted via:

* A floating IP address, usually handled by a system/svc/vip failover service
* A Round Robin DNS record grouping all or a subset of the cluster nodes
* A Round Robin DNS record grouping a set of cluster floating IP addresses

Accessing a cluster via the secure socket requires:

* the client to present a trusted x509 certificate.
* the user object to exist on the cluster

The cluster can generate the certificates, or an external PKI can be trusted by the cluster.

Requirements
============

Set an appropriate cluster name in cluster.conf, then

::

	export CLUSTERNAME=$(om cluster get --kw cluster.name)

.. note:: Changing the cluster name once the cluster is setup and used is hard.

Configure for external PKI
==========================

Store the Certificate Authority certificate chain in a secret.

::

	om system/sec/ca-external create
	om system/sec/ca-external add --key certificate_chain --from ~/ca_crt_chain.pem

Create the Certificate for the TLS listener as a secret.

::

	om system/sec/cert-$CLUSTERNAME create
	om system/sec/cert-$CLUSTERNAME gen cert

Make the external CA sign this certificate and load the resulting certificate key.

::

	om system/sec/cert-$CLUSTERNAME create --kw cn=vip.$CLUSTERNAME.mycorp
	om system/sec/cert-clu decode --key certificate_signing_request >~/$CLUSTERNAME.csr

	#### signing procedure ####

	om system/sec/cert-clu add --key certificate --from ~/$CLUSTERNAME_crt.pem
	om system/sec/cert-clu add --key certificate_chain --from ~/$CLUSTERNAME_crt_chain.pem


Declare this Certificate Authority for the TLS listener.

::

	om cluster set --kw cluster.ca=system/sec/ca-external

If available, declare the Certificate Revokation List location, so the listener can refuse revoked certificates before their expiration.

::

	om cluster set --kw cluster.crl=http://crl.mycorp

Configure for internal PKI
==========================

Create the CA certificate.

::

	om system/sec/ca-$CLUSTERNAME create
	om system/sec/ca-$CLUSTERNAME set \
	    --kw o=mycorp \
	    --kw c=fr \
	    --kw email=admin@mycorp
	om system/sec/ca-<clustername> gen cert

Create the Certificate for the TLS listener as a secret.

::

	om system/sec/cert-$CLUSTERNAME create \
	    --kw ca=system/sec/ca-$CLUSTERNAME \
	    --kw cn=vip.$CLUSTERNAME.mycorp
	om system/sec/cert-$CLUSTERNAME gen cert

Create Users
============

::

	om system/usr/root create
	om system/usr/usr1 create

If the ``system/sec/ca-$CLUSTERNAME`` exists, the created users will automatically get populated with ``certificate_chain``, ``certificate`` and ``private_key`` keys.
The client certificate data can be extracted with:

::

	om system/usr/usr1 decode --key certificate_chain
	om system/usr/usr1 decode --key certificate
	om system/usr/usr1 decode --key private_key


Grant privileges
================

::

	om system/usr/root set --kw grant+=root
	om system/usr/usr1 set --kw grant+=squatter
	om system/usr/usr1 set --kw grant+=admin:ns1
	om system/usr/usr1 set --kw 'grant+=guest:*'

.. seealso::
	| :ref:`agent.configure.client`
	| :ref:`agent.rbac`

