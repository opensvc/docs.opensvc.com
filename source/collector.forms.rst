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

* GET, POST, DELETE, PUT request on the rest api

* store as a row in a collector database table

* store as a raw form data submission for use in form chains, in the workflow subsystem

* mail the submitted form


Forms are presented to users in a tree view to allow classification.

A user is presented only with the forms pusblished to its groups.


Form creation
=============

Form creation requires the FormManager privilege.

The dedicated view is :menuselection:`Admin --> Forms`.

A newly created form is owned by it's creator private group (user_n), and is not published to any group.

A form is defined by the following properties:

* **Form name**

  An internal name to identify the form.

* **Form folder**

  Where in the form tree to publish the form. This property can be left empty for forms used as non-initial workflow steps.

* **Form responsible**

  A list of groups of users allowed to edit the form.

* **Form publication**

  A list of groups of users allowed to see and use the form.

* **Form definition**

  A YAML description of the form.


Form YAML definition
====================

References
----------

A reference is a ``#<key>`` or ``#<key>.<key>`` word replaced by the value referenced.

References can be used in **Function**, **Args** and **Condition** input keywords. In those cases, ``<key>`` is the value of the **Key** input keyword, or the value of the **Id** input keyword if **Key** is not set, or the value of a key mapped through the **Keys** input keyword.

References can also be used in **Format**, **Value** and **Keys** input keywords. In those cases, ``<key>`` is the value of a key of a candidate dict. If candidates are in "dict of dict" format, the reference can be spelled as ``#<key>.<key>``.

Header
------

* **Label**

  The form label displayed in the forms tree view.

* **Desc**

  The form functional description displayed under the label in the forms tree view

* **Css**

  The name of the css class to use to decorate the **Label** and **Desc** in the form tree view. The pointed class usually set a 48x48 icon on the left side.

* **Async**

  A boolean value. If set to ``True``, the submit task is run in background. Set to ``True`` if you the task duration may exceed the wsgi gateway timeout.

* **Vertical**

  A boolean value. If set to ``True``, the form is rendered in a vertical layout, placing the labels above the input.

* **Width**

  The css width applied to the form inputs.

Outputs
-------

Keywords
++++++++

* **Id**

  A string identifying uniquely the output. This id is used to index the hash storing the rest calls resulting data. If no **Id** is set for a rest output, its resulting data is discarded.

* **Type**

  Candidates: ``json``

  The serialization format to use to represent the form submitted data.

* **Format**

  Candidates:

  * ``dict``

    A flat key-value representation. Adequate to store data submitted from single-instance multi-inputs forms.

  * ``list``

    A Flat list of values. Adequate to store data submitted from multi-instance single-input forms

  * ``list of dict``

    Adequate to store data submitted from multi-instance, multi-inputs forms

  * ``dict of dict``

    Adequate to store data submitted from multi-instance, multi-inputs forms, where the user benefits from a main index to address each data instance.

* **Key**

  If Format is set to ``dict of dict``, this property defines which input values to use as a key for the master dictionnary. **Key** can be ommitted with other **Formats** values.

* **Dest**

  Candidates:

  * **script**

    Execute a script pointed by **Path** with the submitted serialized data as argument.

  * **mail**

    Send a mail to the addresses defined by the **To** list-property, with the css-formatted submitted form.

  * **workflow**

    Save the submitted form data in the forms store. The saved object is linked to its head form and parent form in the workflow, and its parent form is updated to be linked to the newly saved object. These linking relations define form chains, also referred to as workflows.

  * **db**

    Save the submitted form data in a collector database table. In this mode, each input identifier must be a table column name.

  * **rest**

    Execute a rest call for each dict with the submitter's privileges. The call type is defined by the **Handler** output parameter (POST, DELETE or PUT). The rest path is defined by the **Function** output parameter (example: /nodes/#nodename/tags). The keys to include in the call data are specified by the **Keys** output parameter. If **Keys** is not set, all available keys are included. If **Mangle** is set to a js function, use the returned data instead of the form data.

* **NextAssignee**

  If **Dest** is set to workflow, this property defines the group or user, as known to the OpenSVC Collector user and group management tables, to assign to next workflow step to.

* **Mangle**

  This keyword is considered if the **Dest** is set to **rest**. The value is a javascript function definition used to mangle the form data before submitting the rest request. This function takes the form data as first argument and the previously done rest calls resulting data hash as the second argument (see **Id**). The mangler returns a data structure compatible with the rest handler pointed by **Function**.

  .. warning:: Due to yaml syntax limitation, the '<' character is not allowed in the mangle function. Hopefully, in most cases a negated test can workaround this issue.

  Example: Output definition to prepare a pullable service configuration::

    Outputs:
      -
        Id: create_service
        Type: json
        Format: dict
        Dest: rest
        Function: /services
        Handler: POST
        Mangle: |
          function(data, results) {
            var template = `
          [DEFAULT]
          app = $(data.app)
          nodes = $(data.nodes)

          [fs#1]
          type = btrfs
          dev = LABEL=$(data.svcname).fs.1
          mnt = /$(data.svcname)
          `
            ret = {
              "svc_name": data.svcname,
              "svc_envfile": template
            }
          }

* **NextForms**

  If **Dest** is set to ``workflow``, this property defines a list of possible next forms to route the workflow to. Those candidates are proposed to the next assignee in a menu.

* **Table**

  If **Dest** is set to ``db``, this property defines the collector database table to store the form, as a new line, into.

* **WaitResult**

  Wait for ``WaitResult`` seconds for a non empty resultset as the result of this output. Useful for example to wait for an enqueued action to finish to use its stdout in the following outputs.

* **SkipOnErrors**

  A boolean value. Default is False. If set to ``True``, the output is skipped if a previous output returned an error.

* **LogRequestData**

  A boolean value. Default is True. In a ``rest`` output destination, the request data is logged for use by follow-on outputs, for audit and for workflow steps representation. Some forms containing sensitive data like password may prefer to disable this logging. To do so the ``LogRequestData`` can be set to ``False``.

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

* **Id**

  The form-wide unique identifier of this input. Other inputs can refer to this identifier when defining constraints or triggers as ``#this_id``.

* **Key**

  If multiple inputs provide the same dictionary key, the **Key** parameter can be set to define its value as the dictionary key in addition to the **Id** key. Thus a script consuming the output can use the predictible **Key** key, whereas the collector still has the **Id** key available to redisplay the submitted form. An empty **Key** value insures the input value is not included in the submitted data.

* **Keys**

  If the input has candidates in the "list of dict" format, either staticly defined or fetched from the Rest API, this parameter allows to map selected candidate keys to result dict keys. A typical use case is to embed in the result dict both node_id and nodename fetched from the Rest API. References substitution values are looked up in the result dict, so keys defined with the **Keys** keyword can be referenced too, like **Id** or **Key**. Example mapping::

    Keys:
      - node_id = #svcmon.node_id
      - nodename = #nodes.nodename

* **Constraint**

  A constraint is an input value validator. As long as the constraint is not satisfied the form can not be submitted. The constraint syntax is an expression like ``<operator> <value>``, where ``operator`` can be either ``==``, ``>`` or ``match``. The ``value`` after a ``match`` operator is interpreted as a regular expression. The value after a ``>`` operator must be numeric.

* **Label**

  The label displayed next to the input in form edition mode.

* **DisplayModeLabel**

  The label displayed next to the input in form display mode.

* **DisplayInDigest**

  If set to Yes, the input value is displayed in digest display mode. This mode is used to present nodes or services customizations. Default is No.

* **LabelCss**

  The name of the css class to use to decorate the **Label** and **DisplayModeLabel** in the form edition and display modes. The pointed class usually set a 16x16 icon on the left side.

* **Help**

  A help message displayed as a html title. It appears on hover over the question mark besides the input element. If not specified, the icon is not displayed.

* **Candidates**

  A list of candidate values used as OPTION html elements of the input SELECT html element.

* **StrictCandidates**

  If set to ``yes``, add a constraint violation if the free text autocomplete value is not found in the candidates list.

* **Form**

  In conjonction with the ``form`` input type, this parameter points the encapsulated form by **name**.

* **Type**

  Default: ``string``

  Candidates:

  * ``string``

    The submitted data for this input is stored in the object as a unicode string. The html element used for this type is INPUT or SELECT if **Candidates** is set.

  * ``password``

    Like ``string`` but the user input is obfuscated.

  * ``text``

    The submitted data for this input is stored in the object as a unicode string. The html element used for this type is TEXTAREA.

  * ``integer``

    The submitted data for this input is stored in the object as an integer. The html element used for this type is INPUT or SELECT if **Candidates** is set.

  * ``size``

    The submitted data for this input is stored in the object as an integer number of bytes, obtained by converting the submitted string formatted as {number}[ ]{0,1}{unit} where unit is one of (case insensitive):

    * ``k`` or ``kb``: kilobytes
    * ``m`` or ``mb``: megabytes
    * ``g`` or ``gb``: gigabytes
    * ``t`` or ``tb``: terabytes
    * ``p`` or ``pb``: petabytes
    * ``ki`` or ``kib``: kibibytes
    * ``mi`` or ``mib``: mebibytes
    * ``gi`` or ``gib``: gibibytes
    * ``ti`` or ``tib``: tebibytes
    * ``pi`` or ``pib``: pebibytes

    The html element used for this type is INPUT or SELECT if **Candidates** is set.

  * ``date``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a date picker.

  * ``time``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a time picker.

  * ``datetime``

    The submitted data is for this input is a string. The html element used for this type is INPUT with a date and time picker.

  * ``checklist``

    The submitted data for this input is a list whose elements are the values of the checked items at submition. Proposed items can be defined through **Candidates** or through **Function** and **Args**. **ReadOnly**, **Mandatory** and **Constraints** are ignored.

  Unknown values will default to the ``string`` type.

  * ``form``

    The input value is the dataset produced by another form, pointed by the **Form** input keyword.


* **Unit**

  Target unit used to convert size and integer Type input values. For example a "10m" value in an input with Unit "k" will result in a "10240" value in the resulting data.

* **ReadOnly**

  Default: ``No``

  Candidates:

  * ``Yes``

    The html element for this input will be flagged as readonly, so that the content can not be changed by the user. The element will appear greyed-out in the form and the input won't get the focus. This property is often added to inputs with a trigger attached, that fetches using ajax a value depending on other input values.

  * ``No``

    The html element is not flagged readonly, which is the default behaviour.

* **Mandatory**

  Default: ``No``

  Candidates:

  * ``Yes``

    The form highlights those fields if they are left empty, to mark the fact that a value is mandatory for the form submission to succeed.

  * ``No``

* **DisableAutoDefault**

  For inputs with candidates and no default value specified, disable the picking of the first candidate as the default value.

* **Default**

  A value used to pre-fill the input element or choose a select option on form load. The default value accept some predefined keywords:

  * ``__user_name__``

    The submitter first name and last name.

  * ``__user_email__``

    The submitter email address.

  * ``__user_phone_work__``

    The submitter work phone number.

  * ``__user_primary_group__``

    The submitter primary group, as known to the OpenSVC collector authentication tables.

* **Condition**

  An expression evaluated by the form javascript to trigger the input visibility. If a condiftion is set, the input is hidden upon form load, and is displayed when the condition is met.

  The expression is expressed in the form ``#some_input_id == some_value``.

  * The supported operators are ``IN``, ``NOT IN``, ``<``, ``>``, ``==`` and ``!=``.

  * The supported values are either a free from string cast into the reference input type, or ``empty``. List values for the ``IN`` operator are comma-separated.

* **Hidden**

  Default: ``No``

  Candidates:

  * ``Yes``

    The input is not displayed.

  * ``No``

* **Format**

  The definition used to format a SELECT input options label from the dictionaries of a Rest API resultset. The dictionaries keys are referenced through the dash prefix.

  .. warning:: If the value starts with a # you have to double quote the string so that the YAML parser doesn't interpret it as a comment

  Example:

  * The ``#mac (#intf)`` format would render a label like ``01:02:03:04:05:06 (eth0)`` from a ``{"mac": "01:02:03:04:05:06", "intf": "eth0"}`` dictionary.

* **Value**

  The definition used to format a SELECT input options value from the dictionaries of a Rest API resultset. The dictionaries keys are referenced through the dash prefix.

  .. warning:: If the value starts with a # you have to double quote the string so that the YAML parser doesn't interpret it as a comment

  Example:

  * The ``#mac`` value would set a value of ``01:02:03:04:05:06`` from a ``{"mac": "01:02:03:04:05:06", "intf": "eth0"}`` dictionary.

* **Function**

  The function parameter can be used to feed dynamic content in the form input. The collector supports two fetching methods: internal functions exposed as jsonrpc (deprecate), and the Rest API.

  * jsonrpc

    A function exported by the OpenSVC collector as a JSON-RPC, called to determine the input value. This keyword can be coupled to the **Args** keyword to select which form inputs provide the JSON-RPC arguments.

    Available functions:

    * ``json_node_loc_city``

    * ``json_node_environnement``

    * ``json_node_os_concat``

    * ``json_node_portnames``

    * ``json_service_loc_city``

    * ``json_service_nodes``

    * ``json_service_portnames``

  * Rest API

    The URL path parented to ``/init/rest/api``. For example, ``Function: /nodes`` fetchs nodes properties.

    References can be used the the path. For example, ``Function: /nodes/#nodename/disks`` fetchs disks properties of the node pointed by the input with ``Id: nodename``.

    The ``#user_id`` special virtual reference is available to format Function like ``/users/#user_id/nodes``, which limits the returned nodes to those owned by the logged-in user.

* **Args**

  As for **Function**, this parameter supports the jsonrpc and Rest API methods. The method influence the **Args** parameter syntax as follows.

  * jsonrpc

    A list of form input identifiers, specified as ``#some_input_id``, whose value to pass as argument to the JSON-RPC pointed by **Function**. The order of the list elements is the order of the arguments to submit to the **Function**.

  * Rest API

    A list of ``<param> = <value>`` arguments passed to the Rest API handler pointed by **Function**. Please refer to the API documentation to find which parameters are supported by each handler.

    Of note,

    * ``limit = 0`` is most important to fetch all candidates, and not be limited to the default 20 first entries.
     
    * ``meta = 0`` can also be used to spare some bytes on the wire, as the resultset metadata are not used by the form inputs.
     
    * The ``query`` smart query parameter (pydal syntax), or the ``filters`` parameter (OpenSVC filter syntax) can be used to filter the entries on pertinent criteria. The ``filters`` parameter can be set multiple times, to add cumulative filters.

  References can be used in **Args**. For example, ``query = "loc_city = #loc_city"`` can filter the node list returned by the ``/nodes`` handler using the city selected in the input with ``Id: loc_city`` or the input setting the ``loc_city`` key through its ``Keys`` list. ``"filters = loc_city #loc_city"`` has the same effect.


* **DisplayModeTrim**

  The maximum length of the input value representation string in display mode. If the actual value is longer than **DisplayModeTrim**, only the first **DisplayModeTrim** // 3 and the last **DisplayModeTrim** // 3 * 2 characters will be displayed. This parameter is usually set on inputs with very long values, like public keys for example.

* **CheckOnLoad**

  With the checklist type, setting CheckOnLoad to "all" tells the renderer to check all checkboxes on load.

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

A checklist of a node visible target ports::

  Inputs:
    -
    Id: targets
    Label: Targets
    DisplayModeLabel: targets
    LabelCss: db16
    Type: checklist
    Format: "#tgt_id"
    Value: "#tgt_id"
    CheckOnLoad: all
    Function: /nodes/#node_id/targets
    Args:
       - props = stor_zone.tgt_id



