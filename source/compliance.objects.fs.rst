fs
==

.. function:: description:

   Checks the presence, mount point, and ownership of filesystems. Provision filesystems according to an ordered list of candidate volume groups. The path and vgnames can include substitution variables so that their actual value can be adjusted. This object is commonly used to provision services filesystems, making use of the ``OSVC_COMP_SERVICES_SVC_NAME`` automatic rule. See the example data format below.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [{
      "dev": "lv_tools",
      "size": "1024M",
      "mnt": "/%%ENV:SERVICES_SVC_NAME%%/tools",
      "vg": ["%%ENV:SERVICES_SVC_NAME%%", "vg01", "vg00"]
     }]

.. function:: supported operating systems:

   Linux, HP-UX


