Contribute
**********

OpenSVC projects are tracked with the git source tracker. The documentation is also managed as a git tracked project. A GitWeb interface is available at http://git.opensvc.com.

Install git
===========

::

    apt-get install git
    git config --global user.name "First Last Name"
    git config --global user.email "first.lastname@domain.com"

Clone the appropriate git repository
====================================

::

    git clone http://git.opensvc.com/docs.opensvc.com/.git
    git clone http://git.opensvc.com/opensvc/.git
    git clone http://git.opensvc.com/openha/.git
    git clone http://git.opensvc.com/dds/.git

Send patches
============

Configured local MTA, without git send-email
--------------------------------------------

Send patch with::

    git format-patch --to opensvc-devel@lists.opensvc.com -o /tmp origin | \
    while read f ;
        do cat $f|sendmail -t ;
    done

Configured local MTA, with git send-email
-----------------------------------------

Install :command:`git-send-email`::

    sudo apt-get install git-email

Send patches with::

    git send-email --to="opensvc-devel@lists.opensvc.com" origin

With msmtp, with git send-email
-------------------------------

Install :command:`git-send-email`, and :command:`msmtp` if you have to use Gmail SMTP (no local MTA configured)::

    sudo apt-get install git-email
    sudo apt-get install msmtp

Set up :command:`msmtp`::

    cat - <<EOF >$HOME/.msmtprc
    defaults
    tls on
    tls_trust_file /usr/share/ncat/ca-bundle.crt
    logfile ~/.msmtp.log
    # My email service
    account gmail
    host smtp.gmail.com
    port 587
    from some.user.name@gmail.com
    auth on
    user some.user.name@gmail.com
    password my-secret
    # Set a default account
    account default : gmail
    EOF

    chmod 600 $HOME/.msmtprc

Set up :command:`git-send-email` to use :command:`msmtp`::

    git config --global sendemail.smtpserver /usr/bin/msmtp
 
Send patches with::

    git send-email --to opensvc-devel@lists.opensvc.com origin

With msmtp, without git send-email
----------------------------------

Install :command:`msmtp` if you have to use Gmail SMTP (no local MTA configured)::

    sudo apt-get install msmtp

Set up :command:`msmtp`::

    cat - <<EOF >$HOME/.msmtprc
    defaults
    tls on
    tls_trust_file /usr/share/ncat/ca-bundle.crt
    logfile ~/.msmtp.log
    # My email service
    account gmail
    host smtp.gmail.com
    port 587
    from some.user.name@gmail.com
    auth on
    user some.user.name@gmail.com
    password my-secret
    # Set a default account
    account default : gmail
    EOF

    chmod 600 $HOME/.msmtprc

Send patches with::

    git format-patch --to opensvc-devel@lists.opensvc.com -o /tmp origin | \
    while read f ;
        do cat $f | msmtp -t ;
    done

Contribute translations
=======================

Install the sphinx documentation generator.

For example, on a debian-based system::

    sudo apt-get install python-sphinx

Clone the documentation project::

    git clone http://git.opensvc.com/docs.opensvc.com/.git

Step into the cloned project directory::

    cd docs.opensvc.com

If starting a new translation, you have to add the new language support to the Makefile. Here are for example the definitions for the french translation you can clone::

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

Then plug your new targets in the generic targets::

	po: po_fr <your po target>
	mo: mo_fr <your mo target>
	osvc: html html_fr <your translation target>

Create or refresh the translation files::

    make pot po_<your language code>

This last command refreshed the .pot (strings index) and created the .po (translation) files.
You can now add your translation in the .po files in ``source/translated/<your language code>/``. Here is an example of translated content::

	# 21aa40c7358948d9a69b6813104fd253
	# 27fda7e570224a56b6e2631b1c302fd7
	#: ../../contribute.rst:57 ../../contribute.rst:91
	msgid "Set up :command:`msmtp`::"
	msgstr "Configuration de :command:`msmtp` ::"

Don't forget to create the directory ``source/translated/<your language code>/LC_MESSAGES/``.
Finally, create the .mo (binary translation) and html files with::

    make mo_<your language code> html_<your language code>

Note you can see what string miss translating in the output of the mo target. For example::

    gen hash in source/translated/fr/LC_MESSAGES/agent.install.mo
    82 translated messages, 2 fuzzy translations, 8 untranslated messages.

Verify your translation pointing a web browser to your local directory. When satisfied, ``git add`` and ``git commit`` your touched files (don't track the .mo and html files), and submit your commits using the procedures described in the previous chapters.


