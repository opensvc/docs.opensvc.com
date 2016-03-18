Common authentication and session configuration
===============================================

Session expiration
------------------

Sessions are stored in a redis cache.

The default expiration time is 36000000 seconds, ie more than one year.

To change to a different expiration time, in ``modules/config.py`` set::

	session_expire = <n>

Open registration
-----------------

User are allowed to register a local account by default.

To disable this policy, in ``modules/config.py`` set::

	allow_register = False

