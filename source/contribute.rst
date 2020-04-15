.. index:: contrib, git, patch, translation

Contribute
**********

OpenSVC projects, including this documentation, are hosted on Github.

Install Git
===========

::

    sudo apt-get install git
    git config --global user.name "First Last Name"
    git config --global user.email "first.lastname@domain.com"

Clone a Project
===============

::

    git clone https://github.com/opensvc/docs.opensvc.com.git
    git clone https://github.com/opensvc/opensvc.git

Or fork on Github and clone from there.

Send Patches
============

Submit a merge request through Github for projects hosted there.

Contribute Documentations
=========================

Getting Started
---------------

Install the sphinx documentation generator and ansi2html software https://github.com/ralphbean/ansi2html

For example, on a debian-based system:

::

    sudo apt-get install python-sphinx python-sphinx-rtd-theme

Install ansi2html:

::

    sudo pip install ansi2html

Clone the documentation project:

::

    git clone https://github.com/opensvc/docs.opensvc.com.git

Step into the cloned project directory:

::

    cd docs.opensvc.com

Modify the documentation source files (.rst located in the ``sources`` directory), and then use the Makefile to build the html documentations:

::

    make clean ; make osvc

Once the build is done, all html files can be found in the ``docs.opensvc.com/build/html`` folder.

Command Line Output Coloring
----------------------------

When producing command line output, it is expected to follow the steps below to preserve colors, so as to provide a better experience for futures readers:

First generate raw html code from cli:

::

    $ om node print devs --color=yes | ansi2html -i

Edit the .rst document and copy/paste the previous output in a ``.. raw:: html`` block, enclosed between ``<pre class=output>`` and ``</pre>`` :

::

    .. raw:: html

        <pre class=output>
            <span style="font-weight: bold">centos71.opensvc.com                        </span>  <span style="font-weight: bold">Type  </span>  <span style="font-weight: bold">Size</span>  <span style="font-weight: bold">Pct of Parent</span>  
            `- <span style="color: #aa5500">vda                                      </span>  linear  15g   -              
               |- <span style="color: #aa5500">vda1                                  </span>  linear  500m  3%             
               `- <span style="color: #aa5500">vda2                                  </span>  linear  14g   96%            
                  |- <span style="color: #aa5500">centos_centos71-swap               </span>  linear  1g    10%            
                  `- <span style="color: #aa5500">centos_centos71-root               </span>  linear  13g   89%            
                     |- <span style="color: #aa5500">loop2                           </span>  linear  50m   0%             
                     |  |- <span style="color: #aa5500">testsvc1-lv1                 </span>  linear  20m   40%            
                     |  `- <span style="color: #aa5500">testsvc1-lv2                 </span>  linear  20m   40%            
                     |- <span style="color: #aa5500">loop1                           </span>  linear  100m  0%             
                     |  |- <span style="color: #aa5500">testsvc3-lv2                 </span>  linear  20m   20%            
                     |  |- <span style="color: #aa5500">testsvc3-lv1-real            </span>  linear  52m   52%            
                     |  |  |- <span style="color: #aa5500">testsvc3-lv1              </span>  linear  52m   100%           
                     |  |  `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1    </span>  linear  52m   100%           
                     |  `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1-cow   </span>  linear  8m    8%             
                     |     `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1    </span>  linear  52m   650%           
                     `- <span style="color: #aa5500">loop0                           </span>  linear  100m  0%             
                        |- <span style="color: #aa5500">testsvc2-lv1                 </span>  linear  52m   52%            
                        `- <span style="color: #aa5500">testsvc2-lv2                 </span>  linear  20m   20%            
        </pre>

After building html documentation, the result looks like:

.. raw:: html

	<pre class=output>
	<span style="font-weight: bold">centos71.opensvc.com                        </span>  <span style="font-weight: bold">Type  </span>  <span style="font-weight: bold">Size</span>  <span style="font-weight: bold">Pct of Parent</span>  
	`- <span style="color: #aa5500">vda                                      </span>  linear  15g   -              
	   |- <span style="color: #aa5500">vda1                                  </span>  linear  500m  3%             
	   `- <span style="color: #aa5500">vda2                                  </span>  linear  14g   96%            
	      |- <span style="color: #aa5500">centos_centos71-swap               </span>  linear  1g    10%            
	      `- <span style="color: #aa5500">centos_centos71-root               </span>  linear  13g   89%            
	         |- <span style="color: #aa5500">loop2                           </span>  linear  50m   0%             
	         |  |- <span style="color: #aa5500">testsvc1-lv1                 </span>  linear  20m   40%            
	         |  `- <span style="color: #aa5500">testsvc1-lv2                 </span>  linear  20m   40%            
	         |- <span style="color: #aa5500">loop1                           </span>  linear  100m  0%             
	         |  |- <span style="color: #aa5500">testsvc3-lv2                 </span>  linear  20m   20%            
	         |  |- <span style="color: #aa5500">testsvc3-lv1-real            </span>  linear  52m   52%            
	         |  |  |- <span style="color: #aa5500">testsvc3-lv1              </span>  linear  52m   100%           
	         |  |  `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1    </span>  linear  52m   100%           
	         |  `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1-cow   </span>  linear  8m    8%             
	         |     `- <span style="color: #aa5500">testsvc3-osvc_sync_lv1    </span>  linear  52m   650%           
	         `- <span style="color: #aa5500">loop0                           </span>  linear  100m  0%             
	            |- <span style="color: #aa5500">testsvc2-lv1                 </span>  linear  52m   52%            
	            `- <span style="color: #aa5500">testsvc2-lv2                 </span>  linear  20m   20%            
	</pre>


Decorating with sphinx roles
----------------------------

It is recommended to use the sphinx roles below to improve documentation rendering.

As an example for a service, use the syntax::

    :c-svc:`svc1`

which will be rendered as :c-svc:`svc1`

+---------------------------------------------------+-----------------------------------------------+
| Role Syntax                                       |   Rendering                                   |
+===================================================+===============================================+
| ``:c-action:`action```                            | :c-action:`action`                            |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-docker-repo:`repo```                         | :c-docker-repo:`repo`                         |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-docker-registry:`registry```                 | :c-docker-registry:`registry`                 |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-node:`node```                                | :c-node:`node`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-svc:`svc```                                  | :c-svc:`svc`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-res:`res```                                  | :c-res:`res`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-tag:`tag```                                  | :c-tag:`tag`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-svc-env:`svc-env```                          | :c-svc-env:`svc-env`                          |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-env:`env```                                  | :c-env:`env`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-pkg:`pkg```                                  | :c-pkg:`pkg`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-net:`net```                                  | :c-net:`net`                                  |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-check:`check```                              | :c-check:`check`                              |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-form:`form```                                | :c-form:`form`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-report:`report```                            | :c-report:`report`                            |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-metric:`metric```                            | :c-metric:`metric`                            |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-chart:`chart```                              | :c-chart:`chart`                              |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-group:`group```                              | :c-group:`group`                              |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-priv:`priv```                                | :c-priv:`priv`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-user:`user```                                | :c-user:`user`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-dns-domain:`domain.com```                    | :c-dns-domain:`domain.com`                    |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-dns-record:`example.com. IN A 12.13.14.15``` | :c-dns-record:`example.com. IN A 12.13.14.15` |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-fset:`fset```                                | :c-fset:`fset`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-disk:`disk```                                | :c-disk:`disk`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-array:`array```                              | :c-array:`array`                              |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-diskgroup:`diskgroup```                      | :c-diskgroup:`diskgroup`                      |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-rule:`rule```                                | :c-rule:`rule`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-rset:`ruleset```                             | :c-rset:`ruleset`                             |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-modset:`moduleset```                         | :c-modset:`moduleset`                         |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-mod:`module```                               | :c-mod:`module`                               |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-app:`application```                          | :c-app:`application`                          |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-close:`close```                              | :c-close:`close`                              |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-fullscreen:`fullscreen```                    | :c-fullscreen:`fullscreen`                    |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-shrink:`shrink```                            | :c-shrink:`shrink`                            |
+---------------------------------------------------+-----------------------------------------------+
| ``:c-link:`link```                                | :c-link:`link`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:kw:`keyword```                                 | :kw:`keyword`                                 |
+---------------------------------------------------+-----------------------------------------------+
| ``:cmd:`command```                                | :cmd:`command`                                |
+---------------------------------------------------+-----------------------------------------------+
| ``:opt:`opt```                                    | :opt:`opt`                                    |
+---------------------------------------------------+-----------------------------------------------+


.. seealso:: http://www.sphinx-doc.org/en/stable/contents.html
   `Sphinx Documentation <http://www.sphinx-doc.org/en/stable/contents.html>`_


Contribute Translations
=======================

Install the sphinx documentation generator.

For example, on a debian-based system:

::

    sudo apt-get install python-sphinx python-sphinx-rtd-theme

Clone the documentation project or your own Github project fork.

::

    git clone https://github.com/opensvc/docs.opensvc.com.git

Step into the cloned project directory:

::

    cd docs.opensvc.com

If starting a new translation, you have to add the new language support to the Makefile. Here are for example the definitions for the french translation you can clone:

::

	html_fr:
		$(SPHINXBUILD) -b html -Dlanguage=fr $(ALLSPHINXOPTS) $(BUILDDIR)/html/fr

	po_fr:
		@for pot in `echo $(POT_D)/*.pot` ; do \
		base_pot=`basename $$pot` ; \
		po=$(TRANS_D)/fr/`echo $$base_pot | sed "s/t$$//"` ; \
		echo "merge new strings in $$po" ; \
		touch $$po ; \
		msgmerge -s -U $$po $$pot ; \
		done

	mo_fr:
		@for po in `echo $(TRANS_D)/fr/*.po` ; do \
		base_po=`basename $$po` ; \
		mo=$(TRANS_D)/fr/LC_MESSAGES/`echo $$base_po | sed "s/po$$/mo/"` ; \
		echo "gen hash in $$mo" ; \
		msgfmt -c -v -o $$mo $$po ; \
		done

Then plug your new targets in the generic targets:

::

	po: po_fr <your po target>
	mo: mo_fr <your mo target>
	osvc: html html_fr <your translation target>

Create or refresh the translation files:

::

    make pot po_<your language code>

This last command refreshed the .pot (strings index) and created the .po (translation) files.
You can now add your translation in the .po files in ``source/translated/<your language code>/``. Here is an example of translated content:

::

	# 21aa40c7358948d9a69b6813104fd253
	# 27fda7e570224a56b6e2631b1c302fd7
	#: ../../contribute.rst:57 ../../contribute.rst:91
	msgid "Set up :cmd:`msmtp`::"
	msgstr "Configuration de :cmd:`msmtp` ::"

Don't forget to create the directory ``source/translated/<your language code>/LC_MESSAGES/``.
Finally, create the .mo (binary translation) and html files with:

::

    make mo_<your language code> html_<your language code>

Note you can see what string miss translating in the output of the mo target. For example:

::

    gen hash in source/translated/fr/LC_MESSAGES/agent.install.mo
    82 translated messages, 2 fuzzy translations, 8 untranslated messages.

Verify your translation pointing a web browser to your local directory. When satisfied, ``git add`` and ``git commit`` your touched files (don't track the .mo and html files), and submit your commits using the procedures described in the previous chapters.


