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

    cat - <<EOF >$HOME/msmtprc
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

Set up :command:`git-send-email` to use :command:`msmtp`::

    git config --global sendemail.smtpserver /usr/bin/msmtp
 
Send patches with::

    git send-email --to opensvc-devel@lists.opensvc.com origin

With msmtp, without git send-email
----------------------------------

Install :command:`msmtp` if you have to use Gmail SMTP (no local MTA configured)::

    sudo apt-get install msmtp

Set up :command:`msmtp`::

    cat - <<EOF >$HOME/msmtprc
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

Send patches with::

    git format-patch --to opensvc-devel@lists.opensvc.com -o /tmp origin | \
    while read f ;
        do cat $f | msmtp -t ;
    done
