rc
==

.. function:: description:

   Checks and sets the runlevel of startup scripts.

.. function:: actions:

   ::

     check, fix

.. function:: data format:

   ::

     [
      {"service": "foo", "level": "2345", "state": "on"},
      {"service": "foo", "level": "016", "state": "off"},
      {"service": "bar", "state": "on"},
     ]


.. function:: supported operating systems:

   Linux


