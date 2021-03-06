File Safe
=========

Goals and implementation
************************

The collector file safe is a S3-like file storage with the following features:

* upload and download over https
* user or node authentication
* fine-grained ACLs
* immutable files
* file integrity check upon download request
* unique file version id
* binary and text file types

Safe content search
*******************

Using the collector web interface
+++++++++++++++++++++++++++++++++

The safe can be searched either using the safe view column filters, or using the header's search tool.
Using the latter method, the "safe:<pattern>" syntax can be used to search the safe only.

Using om node collector cli
+++++++++++++++++++++++++++

::

	$ om node collector cli -- get /safe --props uuid,name,uploaded_date --filter name~%resolv% --filter "uploaded_date>2015-10-15"
	 uuid                                                   uploaded_date       name
	|safe.uuid.9a575b137e43ddde.7265736f6c762e636f6e66.conf|2015-10-15 10:04:33|/etc/resolv.conf ref5|
	|safe.uuid.98310537fa921428.7265736f6c762e636f6e66.conf|2015-10-15 10:12:19|/etc/resolv.conf ref5|
	|safe.uuid.8d9012b0056bd4ce.7265736f6c762e636f6e66.conf|2015-10-15 10:12:47|/etc/resolv.conf ref5|
	|safe.uuid.bb6041401edc4e51.7265736f6c762e636f6e66.conf|2015-10-15 10:13:40|/etc/resolv.conf ref5|
	|safe.uuid.a494ab792666883c.7265736f6c762e636f6e66.conf|2015-10-15 10:14:23|/etc/resolv.conf ref5|
	|safe.uuid.9a993b63a0dfec88.7265736f6c762e636f6e66.conf|2015-10-15 10:15:40|/etc/resolv.conf ref5|
	|safe.uuid.a552480bb99faf09.7265736f6c762e636f6e66.conf|2015-10-15 10:18:45|/etc/resolv.conf ref5|
	|safe.uuid.800c5b83f25d089a.7265736f6c762e636f6e66.conf|2015-10-15 10:21:54|/etc/resolv.conf ref5|
	|safe.uuid.a6b87a493d780133.7265736f6c762e636f6e66.conf|2015-10-15 10:22:29|/etc/resolv.conf ref5|
	|safe.uuid.9fe62906afaf8498.7265736f6c762e636f6e66.conf|2015-10-15 10:28:21|/etc/resolv.conf ref5|
	|safe.uuid.94ac04753bbe7b58.7265736f6c762e636f6e66.conf|2015-10-15 10:31:15|/etc/resolv.conf ref5|
	|safe.uuid.b8fff57ea749eef2.7265736f6c762e636f6e66.conf|2015-10-15 10:31:43|/etc/resolv.conf ref5|
	|safe.uuid.b8b684977f854261.7265736f6c762e636f6e66.conf|2015-10-15 10:32:41|/etc/resolv.conf ref5|
	|safe.uuid.af67647d9c857fa4.7265736f6c762e636f6e66.conf|2015-10-15 10:35:00|/etc/resolv.conf ref5|
	|safe.uuid.9c87f0be85771222.7265736f6c762e636f6e66.conf|2015-10-15 10:35:16|/etc/resolv.conf ref5|
	|safe.uuid.aaeb1e59c21d4da8.7265736f6c762e636f6e66.conf|2015-10-15 10:41:50|/etc/resolv.conf ref5|
	|safe.uuid.9e0382beb8ea43b3.7265736f6c762e636f6e66.conf|2015-10-15 10:51:49|/etc/resolv.conf ref5|

Using om node collector search
++++++++++++++++++++++++++++++

::

	$ om node collector search --like safe:resolv
	safe_files (10/167)
	 safe.uuid.800c5b83f25d089a.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.8d9012b0056bd4ce.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.94ac04753bbe7b58.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.98310537fa921428.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.9a575b137e43ddde.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.9a993b63a0dfec88.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.9c87f0be85771222.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.9e0382beb8ea43b3.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.9fe62906afaf8498.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5
	 safe.uuid.a494ab792666883c.7265736f6c762e636f6e66.conf: /etc/resolv.conf ref5

Creating a safe file using the collector web interface
******************************************************

A "add safe file" tool is accessible directly from the navigation menu.

A file created using this tool has no initial content. An upload should follow.

Upload/Download using the collector web interface
*************************************************

Upload and download buttons are located in the safe file properties tab.

Upload/Download using nodemgr
*****************************

The safe cli command Syntax
+++++++++++++++++++++++++++

::

	$ om node collector cli -- safe --help
	Usage: nodemgr.py [options]

	Upload, download and manage files in the collector safe. The safe is a file
	sharing facility with access control rules for nodes and users making it
	suitable to serve compliance reference files.

	Options:
	  -h, --help   show this help message and exit
	  --ls         List the accessible files in the safe.
	  --upload     Upload the file pointed by --file to the safe. Optionally give
		       a name using --name.
	  --download   Download from the safe the file pointed by --file to the file
		       path or directory pointed by --to.
	  --file=FILE  The safe file uuid to download, or the local file to upload.
	  --to=TO      The local file path or directory name to download.
	  --name=NAME  The user-friendly name to attach to the upload.

Example upload
++++++++++++++

Create a new file

::

	$ om node collector cli -- safe --upload --file /etc/resolv.conf --name resolv.conf

Upload a new version of an existing file

::

	$ om node collector cli -- safe --upload --file /etc/resolv.conf --name resolv.conf --id 59

Oneliner to store a secret in the safe

::

	$ echo -n s3cr3t | om node collector cli -- safe --upload --name mysecret --file /dev/stdin
	{
	    "data": {
		"id": 56,
		"md5": "cc414bfc9c00475b59c87595299ff31d",
		"name": "mysecret",
		"size": 5,
		"uploaded_date": "2018-03-25 22:49:05",
		"uploaded_from": "10.0.3.1",
		"uploader": 1,
		"uuid": "safe.uuid.aaab49ba4f926d2a.706970653a5b3135343430323733335d.txt"
	    }
	}

Example download
++++++++++++++++

By content uuid

::

	$ om node collector cli -- safe --download --file safe.uuid.a44b45aa173dfe3c.7265736f6c762e636f6e66.conf --to /tmp/foo                      
	.
	downloaded

	$ cat /tmp/foo
	nameserver 8.8.8.8

By id (last content version)

::

	$ om node collector cli -- safe --download --file 59 --to /tmp/foo                      
	.
	downloaded

	$ cat /tmp/foo
	nameserver 8.8.8.8

Safe support in compliance
**************************

The ``files`` compliance object is able to fetch file content from the safe. To that end, just use the ``safe://<file id>`` format in the files rule ``ref`` key. The ``path`` key specifies where the file should be installed.

Safe support in service configurations
**************************************

The ``{safe://<id>}`` and ``{safe://<uuid>}`` service configuration references are automatically resolved if the service app code responsibles are allowed to read the corresponding secrets.

Those secrets are obfuscated in the service action logs.

