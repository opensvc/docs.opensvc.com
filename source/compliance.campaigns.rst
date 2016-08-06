Remediation campaigns
=====================

This page describes how the collector helps in planing and executing a remediation campaign on a module's rules.

As an example, we will consider an IT merger situation. At day 0, most infrastructure services are provided twice (dns, masters, ...). The Linux package repository services are merged first into a single common service.

A common practice would be to develop a script to execute in a ssh loop to reconfigure the servers. The drawbacks of this method are:

* The code will be complex, as it needs to implement different identification methods of vendor, major version, minor version and architecture for Red Hat, Debian, SuSE, Ubuntu, Oracle Linux, CentOS, etc ...
* The code must handle logging to help determine afterwards if the configuration has succeeded or failed
* Code complexity augments the risk of producing bugs
* The ssh loop logs will be hard to audit for errors, even with logs
* A precise server list to feed to the ssh loop will be hard to produce : servers with the target configuration might be included, servers might be omitted
* The ssh loop will likeky serialize the reconfiguration actions, meaning the global reconfiguration can take a long time 
* Once the servers on the list are reconfigured, you have no way to measure the drift back to old the configuration : restores, human habits, obscure configuration script not updated, ... all contribute to this drift back effect

This page presents the steps to a successful remediation campaign using the OpenSVC compliance framework in this scenario.

Ruleset design
++++++++++++++

All the servers are known to the collector, so the rulesets can be contextualized as::

  +- it.sys.linux.repo (contextual ruleset, shown to all linux servers)
     |
     +- it.sys.linux.repo.apt (contextual ruleset, matching Debian and Ubuntu servers)
     |  |
     |  `- REPO_FILE_1 (file-class rule installing /etc/apt/sources.list/it.list with a content using variable substitution for OS_ARCH, OS_RELEASE, OS_UPDATE to format the repo url)
     |
     +- it.sys.linux.repo.zypper (contextual ruleset, matching SuSE servers)
     |  |
     |  `- REPO_FILE_1 (file-class rule installing /etc/zypper.d/it.repo with a content using variable substitution for OS_ARCH, OS_RELEASE, OS_UPDATE to format the repo url)
     |
     `- it.sys.linux.repo.yum (contextual ruleset, matching Red Hat, Oracle Linux and CentOS servers)
        |
        `- REPO_FILE_1 (file-class rule installing /etc/yum.repos.dl/it.repo with a content using variable substitution for OS_ARCH, OS_RELEASE, OS_UPDATE to format the repo url)

Module development
++++++++++++++++++

We will name the module ``it.sys.linux.repo``.

With the above ruleset design, the module is executed with ``OSVC_COMP_REPO_FILE_1`` set in its environment to a contextualized value.

The code is thus limited to executing the ``files`` compliance object with ``OSVC_COMP_REPO_FILE_`` as the prefix parameter.

The ruleset can get more complicated, adding repository geo-affinity and setting additional repositories for VMware virtual machines for example, but the module code will stay that simple, unchanged.

Module deployment
+++++++++++++++++

The new module must be tested in a development box, commited in a tracker for auditability, and deployed in the module repository known to the OpenSVC agents through the ``node.repocomp`` ``node.conf`` parameter.

At this point the module is still not scheduled for periodic check runs by the agent, as it is not part of a moduleset.

Test on a representative server set
+++++++++++++++++++++++++++++++++++

On a set of servers exercising all possible ruleset contextualizations, test the module using the commands::

  # sudo nodemgr updatecomp

  # sudo nodemgr compliance fix --module it.sys.linux.repo

Check the logs in the ``Compliance > Logs`` view or in the output of the fix command, verify that the package manager behaves as expected.

Periodic check Activation
+++++++++++++++++++++++++

We will consider all Linux servers have a default base moduleset attached, named ``it.sys.linux``. This moduleset contains all the base system configuration modules :  nameservers, timeservers, mailservers, printservers, internationalization settings, admin accounts, ...

Add the ``it.sys.linux.repo`` module to the ``it.sys.linux`` moduleset to activate the periodic checks. The default check period is once per week, on sundays. You can set the periodicity to once per day for more a responsive compliance system.

Remediation campaign
++++++++++++++++++++

One period later, the collector has received all the check results of the ``it.sys.linux.repo`` module for all the Linux servers.

You can use this dataset in the ``Compliance > Status`` collector view to :

* display only the results for the ``it.sys.linux.repo`` module
* filter-out the servers with an already compliant check result
* filter-out production servers
* select the first 20 servers
* trigger the fix action

The collector will spawn threads to execute the actions in parallel and thus minize the overall execution time.

Optionally, the action queue can be accessed by clicking on the gear icon next to the top-right seach box. In this tabular view you can see :

* which actions are in queued/running/done state 
* the command execution stdout and stderr

Back to the ``Compliance > Status`` view, once the actions are all done, you can confirm that all the ``it.sys.linux.repo`` module check status are now compliant.

At this point if everything went as expected, you can unroll your campaign by selecting more servers and removing the scope-limiting column filters set previously.

The campaign can span multiple days, week or months. The collector will always keep track of the servers still misconfigured. Moreover, if fixed servers drift back to a non-compliant state they will return naturally in the campaign server list.

