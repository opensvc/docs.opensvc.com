groups_membership
----


Description
===========

    * Verify a local system group configuration
    * A minus (-) prefix to the group name indicates the user should not exist
    
    

Example rule
============

::

    {
        "tibco1": {
            "gid": 1001,
            "members": [
                "tibco1"
            ]
        },
        "tibco": {
            "gid": 1000,
            "members": [
                "tibco",
                "tibco1"
            ]
        }
    }

Form definition
===============

::

    
    Uses the groups form
    
