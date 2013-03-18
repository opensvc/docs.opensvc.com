Forms
*****

Introduction
============

The collector embeds a form editor. The defined forms are used in two different subsystems.

* The compliance subsytem

  A form can be defined to ease the creation of a json-structure variable value. OpenSVC ships such forms for all compliance objects available through OpenSVC. More can be defined by the users themselves.

* The workflow subsystem

  In this subsytem, a form is a step in the workflow.


A form is basically a collection of inputs and outputs. Possible outputs include:

* script execution, using the inputs data as a JSON-formatted argument.

* store as a compliance rule in a ruleset

* store as a row in a collector database table

* store as a raw form data submission for use in form chains, in the workflow subsystem

* mail the submitted form


Forms are presented to users in a tree view to allow classification.

A user is presented only with the forms pusblished to its groups.


Form creation
=============

Form creation requires the FormManager privilege.

The dedicated view is `Admin --> Forms`.

A newly created form is owned by it's creator private group (user_n), and is not published to any group.

A form is defined by the following properties:

* :keyword:`Form name`

  An internal name to identify the form.

* :keyword:`Form folder`

  Where in the form tree to publish the form. This property can be left empty for forms used as non-initial workflow steps.

* :keyword:`Form responsible`

  A list of groups of users allowed to edit the form.

* :keyword:`Form publication`

  A list of groups of users allowed to see and use the form.

* :keyword:`Form definition`

  A YAML description of the form.


Form YAML definition
====================

Header
------

* :keyword:`Label`

  The form label displayed in the forms tree view.

* :keyword:`Desc`

  The form functional description displayed under the label in the forms tree view

* :keyword:`Css`

  The name of the css class to use to decorate the :keyword:`Label` and :keyword:`Desc` in the form tree view. The pointed class usually set a 48x48 icon on the left side.

Outputs
-------

Keywords
++++++++

* :keyword:`Type`

  Candidates: ``json``

  The serialization format to use to represent the form submitted data.

* :keyword:`Format`

  Candidates:

  * ``dict``

    A flat key-value representation. Adequate to store data submitted from single-instance multi-inputs forms.

  * ``list``

    A Flat list of values. Adequate to store data submitted from multi-instance single-input forms

  * ``list of dict``

    Adequate to store data submitted from multi-instance, multi-inputs forms

  * ``dict of dict``

    Adequate to store data submitted from multi-instance, multi-inputs forms, where the user benefits from a main index to address each data instance.

* :keyword:`Key`

  If Format is set to ``dict of dict``, this property defines which input values to use as a key for the master dictionnary. :keyword:`Key` can be ommitted with other :keyword:`Formats` values.

* :keyword:`Dest`

  Candidates:

  * :keyword:`script`

    Execute a script pointed by :keyword:`Path` with the submitted serialized data as argument.

  * :keyword:`mail`

    Send a mail to the addresses defined by the :keyword:`To` list-property, with the css-formatted submitted form.

  * :keyword:`workflow`

    Save the submitted form data in the forms store. The saved object is linked to its head form and parent form in the workflow, and its parent form is updated to be linked to the newly saved object. These linking relations define form chains, also referred to as workflows.

  * :keyword:`db`

    Save the submitted form data in a collector database table. In this mode, each input identifier must be a table column name.

* :keyword:`NextAssignee`

  If :keyword:`Dest` is set to workflow, this property defines the group or user, as known to the OpenSVC Collector user and group management tables, to assign to next workflow step to.

* :keyword:`NextForms`

  If :keyword:`Dest` is set to ``workflow``, this property defines a list of possible next forms to route the workflow to. Those candidates are proposed to the next assignee in a menu.

* :keyword:`Table`

  If :keyword:`Dest` is set to ``db``, this property defines the collector database table to store the form, as a new line, into.

Examples
++++++++

A script execution output::

  Outputs:
    -
      Type: json
      Format: list of dict
      Dest: script
      Path: /tmp/foo.py


A mail output, sending a the submitted form to a specified destination, and to the submitter::

  Outputs:
    -
      Type: json
      Format: list of dict
      Dest: mail
      To:
        - admin@opensvc.com
        - __user_email__


A workflow head form output, sending the submitted form to the next assignee with a link to the next forms menu::

  Outputs:
    -
      Type: json
      Format: list of dict
      Dest: workflow
      Mail: Yes
      NextAssignee: OpenSVC
      NextForms:
        - done
        - reject
        - ask_info



Inputs
------

Keywords
++++++++

* :keyword:`Id`

  The form-wide unique identifier of this input. Other inputs can refer to this identifier when defining constraints or triggers as ``#this_id``.

* :keyword:`Label`
  The label displayed next to the input in form edition mode.

* :keyword:`DisplayModeLabel`
  The label displayed next to the input in form display mode.

* :keyword:`LabelCss`
  The name of the css class to use to decorate the :keyword:`Label` and :keyword:`DisplayModeLabel` in the form edition and display modes. The pointed class usually set a 16x16 icon on the left side.

* :keyword:`Help`
  A help message displayed as a html title. It appears on hover over the question mark besides the input element.

* :keyword:`Candidates`
  A list of candidate values used as OPTION html elements of the input SELECT html element.

* :keyword:`Type`

  Default: ``string``

  Candidates:

  * ``string``

    The submitted data for this input is stored in the object as a unicode string. The html element used for this type is INPUT or SELECT if :keyword:`Candidates` is set.

  * ``text``

    The submitted data for this input is stored in the object as a unicode string. The html element used for this type is TEXTAREA.

  * ``integer``

    The submitted data for this input is stored in the object as an integer. The html element used for this type is INPUT or SELECT if :keyword:`Candidates` is set.

  * ``size``

    The submitted data for this input is stored in the object as an integer number of bytes, obtained by converting the submitted string formatted as {number}[ ]{0,1}{unit} where unit is one of:

    * ``k`` or ``K``: kilobytes
    * ``m`` or ``M``: megabytes
    * ``g`` or ``G``: gigabytes
    * ``t`` or ``T``: terabytes
    * ``p`` or ``P``: petabytes

    The html element used for this type is INPUT or SELECT if :keyword:`Candidates` is set.

  * ``date``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a date picker.

  * ``time``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a time picker.

  * ``datetime``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a date and time picker.


  Unknown values will default to the ``string`` type.

* :keyword:`ReadOnly`

  Default: ``No``

  Candidates:

  * ``Yes``

    The html element for this input will be flagged as readonly, so that the content can not be changed by the user. The element will appear greyed-out in the form and the input won't get the focus. This property is often added to inputs with a trigger attached, that fetches using ajax a value depending on other input values.

  * ``No``

    The html element is not flagged readonly, which is the default behaviour.

* :keyword:`Mandatory`

  Default: ``No``

  Candidates:

  * ``Yes``

    The form highlights those fields if they are left empty, to mark the fact that a value is mandatory for the form submission to succeed.

  * ``No``

* :keyword:`Default`

  A value used to pre-fill the input element or choose a select option on form load. The default value accept some predefined keywords:

  * ``__user_name__``

    The submitter first name and last name.

  * ``__user_email__``

    The submitter email address.

  * ``__user_phone_work__``

    The submitter work phone number.

  * ``__user_primary_group__``

    The submitter primary group, as known to the OpenSVC collector authentication tables.

* :keyword:`Condition`

  An expression evaluated by the form javascript to trigger the input visibility. If a condiftion is set, the input is hidden upon form load, and is displayed when the condition is met.

  The expression is expressed in the form ``#some_input_id == some_value``.

  * The supported operators are ``==`` and ``!=``.

  * The supported values are either a free from string cast into the reference input type, or ``empty``.

* :keyword:`Hidden`

  Default: ``No``

  Candidates:

  * ``Yes``

    The input is not displayed.

  * ``No``

* :keyword:`Function`

  A function exported by the OpenSVC collector as a JSON-RPC, called to determine the input value. This keyword can be coupled to the :keyword:`Args` keyword to select which form inputs provide the JSON-RPC arguments.

  Available functions:

  * ``json_node_loc_city``

  * ``json_node_environnement``

  * ``json_node_os_concat``

  * ``json_node_portnames``

  * ``json_service_loc_city``

  * ``json_service_nodes``

  * ``json_service_portnames``

* :keyword:`Args`

  A list of form input identifiers, specified as ``#some_input_id``, whose value to pass as argument to the JSON-RPC pointed by :keyword:`Function`. The order of the list elements is the order of the arguments to submit to the :keyword:`Function`.

Examples
++++++++

A simple string input::

  Inputs:
    -
      Id: alias
      Label: Alias
      DisplayModeLabel: alias
      LabelCss: hw16
      Type: string


The same input, display only if the nodename input is not empty::

  Inputs:
    -
      Id: alias
      Label: Alias
      DisplayModeLabel: alias
      LabelCss: hw16
      Type: string
      Condition: "#nodename != empty"

A select input, whose options are statically defined::

  Inputs:
    -
      Id: alias
      Label: Alias
      DisplayModeLabel: alias
      LabelCss: hw16
      Type: string
      Candidates:
        - alias1
        - alias2

A select input, whose options are fetched from the OpenSVC collector data, depending on the service name input content::

  Inputs:
    -
      Id: site
      Label: Site
      DisplayModeLabel: site
      LabelCss: loc16
      Type: string
      Candidates:
      Function: json_service_loc_city
      Args:
        - "svcname = #svcname"



