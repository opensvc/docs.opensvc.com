Designer
========

The designer is a tool optimized for ruleset and moduleset creation and edition, and for complex encapsulated rulesets visualization.

Layout
++++++

Left panel
^^^^^^^^^^

.. figure:: _static/compliance.designer.left.png

The left panel presents a tree of all compliance objects, grouped by categories : filters, filtersets, modulesets and rulesets.

Right panel
^^^^^^^^^^^

.. figure:: _static/compliance.designer.right.png

The right panel shows the properties of the object selected in the tree.

* author
* publishing flag of a ruleset
* contextual or explicit type of a ruleset
* users of a ruleset or moduleset
	* matching nodes and services
	* explicitely attached nodes and services
* rules in a rulesets
* modules in a modulesets

Foldable extra tree
^^^^^^^^^^^^^^^^^^^

.. figure:: _static/compliance.designer.extratree.png

The separator line between the left and right panels is clickable. When clicked, a second tree is shown. The content of both trees is the same, but each tree having its own scrollbar, you can focus on a different data cursor in each tree to facilitate drag-and-drop actions between objects far appart in the tree structure.

Search box
^^^^^^^^^^

.. figure:: _static/compliance.designer.search.png

A search box is displayed in the top-left corner. The search string is applied on the ``<return>`` keyup event. The search string syntax is the same used for column filtering in all collector data views. See `this page <collector.introduction.html#column-filters-bar>`_ for the syntax reference.

Only the filtersets, modulesets and top-level rulesets are filtered with the search string. A top-level ruleset not matching the search string will not be displayed, even if it contains matching child rulesets.

Usage
+++++

Screencast to come.

Noteworthy implementation choices
+++++++++++++++++++++++++++++++++

To help present a readable tree, the following implementation choices were made:

* Explicit and contextual rulesets have different icons
* Not published rulesets have a lighter icon
* All rulesets are created at the top of the rulesets tree branch
* Not published rulesets disappear from the top of the rulesets tree branch as soon as they are encapsulated. They are now visible only as child of their parent rulesets.


