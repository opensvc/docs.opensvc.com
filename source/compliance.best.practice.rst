Best practice
*************

Present to modules only the rules they use
==========================================

So that the :cmd:`nodemgr compliance env --module <my module>` action displays useful information.
To do so,

*  make use of ruleset in moduleset encapsulation.
*  limit root-level public contextual rulesets to a minimum.

Minimize direct ruleset attachments
===================================

So that operators don"t have to handle ruleset attachments and only have to care about modulesets.
To do so, make use of ruleset in moduleset encapsulation.

Factorize rules
===============

A reference information should not be duplicated. You can setup a ruleset to store this reference and encapsulate it in other rulesets. Changing the reference information will be simpler and you will avoid the risk of not changing all duplicates.


