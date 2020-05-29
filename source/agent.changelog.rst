Changelog
=========


| `2.1dev-560-g836bf2f2c <https://github.com/opensvc/opensvc/commit/836bf2f2c19870df0d57df74ff83e6bb2f811fac>`_ Merge pull request #145 from cgalibern/prepare-b2.1
| `2.1dev-559-g5a9e142bc <https://github.com/opensvc/opensvc/commit/5a9e142bcc4df6cdee93a48fbf11110ff5b9342d>`_ Prepare b2.1 merge to master
| `2.1dev-558-gb96d79008 <https://github.com/opensvc/opensvc/commit/b96d79008403e5b298d978cff00e6844a9ef1da1>`_ [drivers.resource.ip.host] Fix regression in netmask value for Solaris
| `2.1dev-557-ga7bcb70d1 <https://github.com/opensvc/opensvc/commit/a7bcb70d18daea3a372ba7147cfbd8dd0f451165>`_ Don't purge the status.json on action
| `2.1dev-556-ge0611e670 <https://github.com/opensvc/opensvc/commit/e0611e670610c2c4aa68102a90939dea73de85d9>`_ Do not overwrite objects status.json
| `2.1dev-555-gbef0875d7 <https://github.com/opensvc/opensvc/commit/bef0875d7922fecd73bb4d10a9996e267f51454a>`_ Service unprovisioning is now propagated to slaves
| `2.1dev-554-g2189935ba <https://github.com/opensvc/opensvc/commit/2189935ba686e4c75365255d1bcfc3403e676e67>`_ Fix a py3-ism with BrokenPipeError in the dns thread codepath
| `2.1dev-553-g5ad6903f4 <https://github.com/opensvc/opensvc/commit/5ad6903f40dffde0d2bb4696f434a273e719d357>`_ Support feeding ini-format config to "om <path> create"
| `2.1dev-552-g6b0810224 <https://github.com/opensvc/opensvc/commit/6b0810224769220b07a4300e17b21eeaa9afe7c1>`_ Fix the object create from json file/uri/template
| `2.1dev-551-g5edc5f439 <https://github.com/opensvc/opensvc/commit/5edc5f439fd29dfda65f8d29163a590a77a98e90>`_ Don't log a dns thr stack if a client dies while we send a response
| `2.1dev-550-g3157f7bb0 <https://github.com/opensvc/opensvc/commit/3157f7bb0ab18386a9fe3868404ed5503536f00f>`_ Fix the socket timeout in sync remote object actions
| `2.1dev-549-gdcc3ef838 <https://github.com/opensvc/opensvc/commit/dcc3ef838bf1b9dad683fbbaa7d16b5dc3c80f83>`_ Restore backward compat for non binary secrets
| `2.1dev-548-gb3f941c79 <https://github.com/opensvc/opensvc/commit/b3f941c79934671d8264501f196dcf5597145765>`_ [test] Ensure it is possible to create a cfg or secret without initial value
| `2.1dev-547-g9b817e449 <https://github.com/opensvc/opensvc/commit/9b817e449da5e9c4aff5f06531ad9fd7059cbdd3>`_ [test] Just update test name
| `2.1dev-546-gfadf11543 <https://github.com/opensvc/opensvc/commit/fadf11543817b46ce65a070e2e37dfe89906049b>`_ Fix an error with sec key loaded from file with json content
| `2.1dev-545-ga42ac125b <https://github.com/opensvc/opensvc/commit/a42ac125b8396e35978fb591bf24cce228ffd9d9>`_ [drivers.resource.ip.host] Fix netmask value for Solaris
| `2.1dev-544-g2884eede0 <https://github.com/opensvc/opensvc/commit/2884eede01d2af61540d560963af3b31155d0394>`_ Support the --time option with 'om node drain --wait'
| `2.1dev-543-g9e243abe3 <https://github.com/opensvc/opensvc/commit/9e243abe3938e457dda43c667f800940d841e7ea>`_ Add the "om node drain" command and orchestration
| `2.1dev-542-gb7b4a6647 <https://github.com/opensvc/opensvc/commit/b7b4a6647f49d826f5a24fdf6f39f8c6412df48b>`_ Fix monitor thread instance_provisioned()
| `2.1dev-541-g3773f415f <https://github.com/opensvc/opensvc/commit/3773f415f3d14e0fa64a98706bcee6baee5b752c>`_ Fix the placed@ clearing after a switch
| `2.1dev-540-gd34657ab1 <https://github.com/opensvc/opensvc/commit/d34657ab145bd6d6983a617a88c98a0c8d031ad7>`_ Fix unprovision orchestration on partly provisioned instances (2)
| `2.1dev-539-g60451df2f <https://github.com/opensvc/opensvc/commit/60451df2fc891cd5177b871c7be480a903057ebd>`_ Fix unprovision orchestration on partly provisioned instances
| `2.1dev-538-g779ef057f <https://github.com/opensvc/opensvc/commit/779ef057f39ed6992bb830800dad194c102a079e>`_ Fix ignored tasks "on_error" trigger
| `2.1dev-537-g3b493931a <https://github.com/opensvc/opensvc/commit/3b493931a8a2cbb32d2f4d2a696e62a4a8f287ac>`_ Refactor smon_g_expect_from_status() for readability and perf
| `2.1dev-536-g20ca5b7ad <https://github.com/opensvc/opensvc/commit/20ca5b7ad2c3adb864d4f39b8c7acf6f547c099b>`_ Fix daemon stuck in "init" when a configuration file is present for a foreign obj
| `2.1dev-535-gb7d9368fc <https://github.com/opensvc/opensvc/commit/b7d9368fcc0586822cafa47c72c95a2733d1167c>`_ Fix a use before set error in placement_candidates()
| `2.1dev-534-g24bd2ea1a <https://github.com/opensvc/opensvc/commit/24bd2ea1a4332d3875c05756d34c905a1d8cdc5a>`_ Fix objects instances in n/a availstatus lingering global_expect
| `2.1dev-533-gcb35addad <https://github.com/opensvc/opensvc/commit/cb35addad3fd953707ece1a3dc7971a625341315>`_ Fix app#0.script=foo trying to replace foo by a volume mount path
| `2.1dev-532-gb6fa69f32 <https://github.com/opensvc/opensvc/commit/b6fa69f32f99ae0bda12917722857e86a47d6ae0>`_ Update diag message when 'print config --eval' fails because of config errors
| `2.1dev-531-ge8c45c445 <https://github.com/opensvc/opensvc/commit/e8c45c445e18b8102fd4c3c919f36394f5c36a2c>`_ Add log to help identify what blocks the node in "init"
| `2.1dev-530-gc43f1a086 <https://github.com/opensvc/opensvc/commit/c43f1a0866d14909cd3a1a2f223677d2f660799d>`_ [drivers.container.zone] Fix missed encap ip resources during provisioning
| `2.1dev-529-gdd3ff8f30 <https://github.com/opensvc/opensvc/commit/dd3ff8f304edf2a4cadace34dfca7b7e596668c7>`_ [driver.container.zone] Provision Solaris 11 create profile with multiple interfaces
| `2.1dev-528-gd5cd543f9 <https://github.com/opensvc/opensvc/commit/d5cd543f9ce0abaf456b28cd2dfa46344e9292bc>`_ [driver.container.zone] Fix zone detection failure when running without correct path
| `2.1dev-527-ga76880897 <https://github.com/opensvc/opensvc/commit/a76880897e022ee84475c61038cc24160a0bfa5b>`_ [driver.container.zone] Create solaris 10 zone origin with sys-unconfig
| `2.1dev-526-g6b5b6f9c2 <https://github.com/opensvc/opensvc/commit/6b5b6f9c2942b6ca8bdfe0c73c557bf5db3ba54c>`_ [driver.container.zone] Implement unprovision to delete zone
| `2.1dev-525-g480b25ab8 <https://github.com/opensvc/opensvc/commit/480b25ab8b493a52e37f9fec549601094e6277ef>`_ [test.py27] Fix raw daemon message assert
| `2.1dev-524-gde1f33b7b <https://github.com/opensvc/opensvc/commit/de1f33b7b2f5aaa6cf856f48b7acac75478eacb0>`_ Service provisioning is now propagated to slaves
| `2.1dev-523-g16e221e03 <https://github.com/opensvc/opensvc/commit/16e221e031d44561c4126e374fdd82b93206b7b6>`_ [drivers.container.zone] Update zone configuration with encaps ip resources
| `2.1dev-522-gbe9f30ac8 <https://github.com/opensvc/opensvc/commit/be9f30ac8c87b8408a8f2dc7e5fa09db04189802>`_ [drivers.container.zone] Ensure can_rollback = True after zone install, clone and attach
| `2.1dev-521-gd51d1190f <https://github.com/opensvc/opensvc/commit/d51d1190f0019c417949a50da641bdd209927ed9>`_ [drivers.container.zone] Origin factory respect ai_manifest kw
| `2.1dev-520-g092737c37 <https://github.com/opensvc/opensvc/commit/092737c37c8473dcb75d75695e3f70f54efd8621>`_ [drivers.container.zone] Refacto provisioner
| `2.1dev-519-g9f1d80c11 <https://github.com/opensvc/opensvc/commit/9f1d80c11684a12b71e00b02deee8f4db9bff15a>`_ [drivers.container.zone] Implement provision zone without container_origin or snapof
| `2.1dev-518-gfe234f394 <https://github.com/opensvc/opensvc/commit/fe234f394ec12e8284771d24070f2056a70f2dca>`_ [drivers.container.zone] Test can create profile without ip
| `2.1dev-517-gc397eb0f0 <https://github.com/opensvc/opensvc/commit/c397eb0f0d9e156c27f1a7fd117256f5ed6e4238>`_ [drivers.container.zone] Add ai_manifest kw to provide automated installer manifest used to create container_origin zone
| `2.1dev-516-gccfa3f26a <https://github.com/opensvc/opensvc/commit/ccfa3f26a2d3e492e69f1622c4c4dbfbd8792a94>`_ [tests-ci] Remove verbose test on travis & gitlab-ci
| `2.1dev-515-g018dbb50f <https://github.com/opensvc/opensvc/commit/018dbb50fc99c4d48194a9eff2f58a0b2e6bd4e0>`_ [drivers.container.zone] Fix test for python2.7
| `2.1dev-514-g936be1880 <https://github.com/opensvc/opensvc/commit/936be18809163bb5c1c2c5f3dcc8fa2526e7c054>`_ [drivers.container.zone] Only allow provisioning when container_origin (sol10 and sol11) or snapof on solaris 10
| `2.1dev-513-ge25f5b8e1 <https://github.com/opensvc/opensvc/commit/e25f5b8e1cbc82912b4c3ae32f7f840e4863e0c0>`_ [drivers.container.zone] Small refacto to prepare simplify logic
| `2.1dev-512-g516600990 <https://github.com/opensvc/opensvc/commit/516600990dce44bd8fa6ea851f2b7cfe95bad021>`_ [drivers.container.zone] Add capabilities container.zone.brand-solaris and container.zone.brand-native
| `2.1dev-511-gebfc829c7 <https://github.com/opensvc/opensvc/commit/ebfc829c7f68ff07e39b6b3a9770501e97e7844f>`_ [drivers.container.zone] Re-use native container object
| `2.1dev-510-g59bb6d9c0 <https://github.com/opensvc/opensvc/commit/59bb6d9c06c754e1bf32e00b6d929a02a1d2ac14>`_ [drivers.container.zone] Provision use default unconfig profile to create template zone (Solaris 11)
| `2.1dev-509-ge2e8436de <https://github.com/opensvc/opensvc/commit/e2e8436de2a82b25f213466e4f74ede21df96b37>`_ [drivers.container.zone] During provision on Solaris 11, update zonecfg with 'anet' instead 'net'
| `2.1dev-508-g607790710 <https://github.com/opensvc/opensvc/commit/60779071094a37c84884cbc9c4ab1f41cd22c4bd>`_ [drivers.container.zone] Add sc_profile keywork for Solaris 11x containers
| `2.1dev-507-g72e6920ba <https://github.com/opensvc/opensvc/commit/72e6920ba7b024fd9f7e08df39f98db34348e825>`_ [drivers.container.zone] Provision replacement of obsoleted js2ai for Solaris
| `2.1dev-506-ga7e08993a <https://github.com/opensvc/opensvc/commit/a7e08993a3d4664be6c48cda3916ee66edc79d4d>`_ [drivers.container.zone] refacto update_solaris_11_ip_tags
| `2.1dev-505-gd86f4ef0a <https://github.com/opensvc/opensvc/commit/d86f4ef0a9b52df6d5e157eca2e6f84926a59bba>`_ [drivers.container.zone] fix provisioning error during update ip tags on Solaris 11
| `2.1dev-504-g0f43252f8 <https://github.com/opensvc/opensvc/commit/0f43252f8cae84943db0b480ef379398de4b689f>`_ [drivers.container.zone] Fix create_zone2clone failure when no kw_zonepath
| `2.1dev-503-g42de4a73e <https://github.com/opensvc/opensvc/commit/42de4a73e9ad2cdf3ad65e36caa52aab61499f8d>`_ [drivers.container.zone] Fix zone configure using wrong source template
| `2.1dev-502-gdc3d6d019 <https://github.com/opensvc/opensvc/commit/dc3d6d01959b0774f1879469929f62375bc19be5>`_ [drivers.container.zone] Fix provisioning zone2clone (configured instead of installed)
| `2.1dev-501-gf09459123 <https://github.com/opensvc/opensvc/commit/f094591234046f6e470f194b97c8a4d561e75201>`_ [drivers.container.zone] Fix create_zone2clone infinite wait on zone reboot
| `2.1dev-500-g5b52500cd <https://github.com/opensvc/opensvc/commit/5b52500cdc2bbc88d91523477d8044691fdb21a9>`_ [drivers.container.zone] Fix zone_configure invalid zonepath (during zone2clone creation)
| `2.1dev-499-g47f6d8ce3 <https://github.com/opensvc/opensvc/commit/47f6d8ce38df8f58af9040270fb4d1af93e25999>`_ [drivers.container.zone] Fix zone2clone creation stack
| `2.1dev-498-ga644dcd9e <https://github.com/opensvc/opensvc/commit/a644dcd9ebbcb011521a2897d68beb09f8ef0df8>`_ [drivers.container.zone] Fix AttributeError zone.state when zone doesn't exist
| `2.1dev-497-g9726bd58c <https://github.com/opensvc/opensvc/commit/9726bd58c879b040eee4a33202575166b464dcdd>`_ [drivers.container.zone] Let Solaris decide value for zonepath when zonepath is None
| `2.1dev-496-gfeff5c1b1 <https://github.com/opensvc/opensvc/commit/feff5c1b1fe4b6bf56a6e70c7a2d0606e73eacbe>`_ [drivers.container.zone] Fix Solaris 10 container_origin zonepath when origin needs creation
| `2.1dev-495-g1f67c67bb <https://github.com/opensvc/opensvc/commit/1f67c67bb32b446a9a3a4e1e2bee602c168923ce>`_ [drivers.container.zone] Fix get zonepath value errors (when zone2clone is not yet created)
| `2.1dev-494-g122a09fb3 <https://github.com/opensvc/opensvc/commit/122a09fb36b5a5b27aae6c0606d9f0293512fc9c>`_ [drivers.container.zone] Ensure provision has no effect when zone is already installed
| `2.1dev-493-g5b31649b7 <https://github.com/opensvc/opensvc/commit/5b31649b718a35572057303a3fa78a6bfc2784ee>`_ Log the object path in "skip service status refresh on foreign service"
| `2.1dev-492-g57e89abad <https://github.com/opensvc/opensvc/commit/57e89abad6efa379eb5fc1620d65082bfe1f2c1e>`_ [Travis] Increase extra time for travis job
| `2.1dev-491-gdae463ccb <https://github.com/opensvc/opensvc/commit/dae463ccb7f13175600e862b2b71b7f3e6e7c943>`_ Don't overwrite configuration files, create a tempfile and atomically rename
| `2.1dev-490-g68e5a9c13 <https://github.com/opensvc/opensvc/commit/68e5a9c135eda3ee806b41f70a84d7038904007c>`_ Fix the cmlock() call arguments in Volume::create_volume()
| `2.1dev-489-gfba6d2c3c <https://github.com/opensvc/opensvc/commit/fba6d2c3c1290538fc39fd1a25bf3329bb902ef5>`_ Add a node-wide lock to prevent // exec of Volume::create_volume()
| `2.1dev-488-ga1f01090e <https://github.com/opensvc/opensvc/commit/a1f01090ea5f0d11fb236f0b01c65a18f65bbb5d>`_ Don't stack on empty condition in the GET /wait handler
| `2.1dev-487-g9c962a7d5 <https://github.com/opensvc/opensvc/commit/9c962a7d5359cc1f9c670dad1e010a4c85e8ece6>`_ Fix a potential stack on Volume::chown() when mount_point is None
| `2.1dev-486-g4b877e48f <https://github.com/opensvc/opensvc/commit/4b877e48f0ddf573e436bbd65091808bbbf478b9>`_ Set a longer timeout for the cni global lock acquire on ip.cni start
| `2.1dev-485-g533f452e4 <https://github.com/opensvc/opensvc/commit/533f452e4c37a18e1634c94a737c8afa186fc56c>`_ Add a status.json purge on daemon init, before running the boot action
| `2.1dev-484-g4be11e299 <https://github.com/opensvc/opensvc/commit/4be11e29970151f68d4f066866f5449d4e8f8a2f>`_ Don't ask the daemon to resolve the boot action object selector
| `2.1dev-483-g22dc79b01 <https://github.com/opensvc/opensvc/commit/22dc79b01442116ac03fc2683afce895d75b403e>`_ Add a global lock to serialize CNI start actions
| `2.1dev-482-gb0ec25423 <https://github.com/opensvc/opensvc/commit/b0ec25423166d91ae70d7d3ea61413123c8ffdb4>`_ No longer preserve the peer state during its init phase
| `2.1dev-481-g2d20390ad <https://github.com/opensvc/opensvc/commit/2d20390ade0de7b0b510afdca85c7b90d561ce92>`_ Add errno.EGAIN to the retryable socket errors
| `2.1dev-480-g879148043 <https://github.com/opensvc/opensvc/commit/8791480436da82980c0939d4bde31264f04eabc2>`_ Tame a pylint false-positive error on py2
| `2.1dev-479-g977365409 <https://github.com/opensvc/opensvc/commit/977365409acb28643b4b3025dc32ca889fa1a08d>`_ Do a daemon threads stack print on SIGUSR1
| `2.1dev-478-gf3c167722 <https://github.com/opensvc/opensvc/commit/f3c167722cb6a77d68bc8cf116e2f9235195a228>`_ Add the missing --parallel flag to the usr/sec/cfg/ccfg "status --refresh" on boot
| `2.1dev-477-g6ba774429 <https://github.com/opensvc/opensvc/commit/6ba774429a92cc5c10e3d7c16c134c32cd3822f2>`_ Add /usr/lib/cni to the candidate path for CNI binaries
| `2.1dev-476-g58e21acd0 <https://github.com/opensvc/opensvc/commit/58e21acd0161e29161ea08bee338c0142ed14469>`_ Fix the daemon stuck in "init" status on boot
| `2.1dev-475-gcdeccabc5 <https://github.com/opensvc/opensvc/commit/cdeccabc5e696aef81a8bad5783bd0948e009470>`_ Fix a monitor thread stack during cluster.conf bootstrap
| `2.1dev-474-g3db0d1e19 <https://github.com/opensvc/opensvc/commit/3db0d1e19d0261ee63acc53adf90ae10f8ffc405>`_ Display initial service status eval progress in "om mon"
| `2.1dev-473-gc954b8356 <https://github.com/opensvc/opensvc/commit/c954b835696c80b2d940986ed9d983cc463aaaec>`_ Fix a compact mon renderer stack
| `2.1dev-472-g0f2c01ce4 <https://github.com/opensvc/opensvc/commit/0f2c01ce468a68868c985a137e7213f6032e1f19>`_ Fix undue tasks "task is a already running" errors
| `2.1dev-471-g2d7fa8941 <https://github.com/opensvc/opensvc/commit/2d7fa8941ae297822bed2cc5bac553cad9f96434>`_ Fix a stack in the compact mon renderer
| `2.1dev-470-g5a0baeb03 <https://github.com/opensvc/opensvc/commit/5a0baeb038e0092cdb49ade3d8e0f59dcc2e34ec>`_ Add a timeout to BaseSvc::wake_monitor() daemon post
| `2.1dev-469-gebbcec2d6 <https://github.com/opensvc/opensvc/commit/ebbcec2d6e4f1f6521ebc808abfc5a86c35b30b0>`_ Fix the fs.flag resources never writing their provisioned var dataset
| `2.1dev-468-gedc76560a <https://github.com/opensvc/opensvc/commit/edc76560a18619721ba24f4297b137b0c46b0d6e>`_ Don't stack on unsupported --server option value
| `2.1dev-467-gb7d4ee2a3 <https://github.com/opensvc/opensvc/commit/b7d4ee2a365019a0d8e5523bce8ac072777fd299>`_ Tune the lock.json.status timeout and delay to fix a QA error
| `2.1dev-466-gea36645ea <https://github.com/opensvc/opensvc/commit/ea36645ea2fd3a835fc90498037d10bf26dde174>`_ Don't disable the provisioned flag management in fs.flag
| `2.1dev-465-g40b2e19ba <https://github.com/opensvc/opensvc/commit/40b2e19ba30333fbb52f526c2fb83d53d5087775>`_ Add a --format=compact|matrix option to "om mon"
| `2.1dev-464-g8311ddc8a <https://github.com/opensvc/opensvc/commit/8311ddc8a7568f43de3c912975809c0e9a9a411a>`_ Move the "om mon" path selector trimming to format_path_selector()
| `2.1dev-463-ga57964fb8 <https://github.com/opensvc/opensvc/commit/a57964fb8e4e0670f5861302def5d981c36bac93>`_ Fix the information displayed by "om mon" when no node columns
| `2.1dev-462-gfd61b6e51 <https://github.com/opensvc/opensvc/commit/fd61b6e51ba6b6ab6c41b86481fa2723d51c9971>`_ Add the app.retcodes keyword
| `2.1dev-461-g24439f9ca <https://github.com/opensvc/opensvc/commit/24439f9ca0efd05f4b67f8a132365f6b1bc3ebef>`_ Install keys after a cfg/sec configuration commit
| `2.1dev-460-ga30324d2f <https://github.com/opensvc/opensvc/commit/a30324d2f21898eb132778ee1aed3349c46c85a5>`_ Add docstring to Svc::replace_volname()
| `2.1dev-459-g81c0718e9 <https://github.com/opensvc/opensvc/commit/81c0718e9f9d2b96fed3b25d29967c3fb912b621>`_ Support volume path translation in app resource keywords
| `2.1dev-458-g34b6d5bf7 <https://github.com/opensvc/opensvc/commit/34b6d5bf7276f31832d8d9d04a9ded0e27054e2e>`_ Fix the argv and origin logging of actions
| `2.1dev-457-g6b470f48a <https://github.com/opensvc/opensvc/commit/6b470f48ac6f7a84512e174931b740889997d888>`_ Add the "om array ls" and "om array show" commands
| `2.1dev-456-g4622ee761 <https://github.com/opensvc/opensvc/commit/4622ee761be5611582dfe31fce6abdceafd87189>`_ Fix pylint errors
| `2.1dev-455-g705f1c354 <https://github.com/opensvc/opensvc/commit/705f1c35441b7f7e9b5113bfbdd6ef9813e83371>`_ Move the manual obj orchestration methods in their own mixin class
| `2.1dev-454-gdae1a349f <https://github.com/opensvc/opensvc/commit/dae1a349f31c326f60658e63141389e7ad8a35fa>`_ Fix the "om node updatepkg" from module name import
| `2.1dev-453-gea25cfda0 <https://github.com/opensvc/opensvc/commit/ea25cfda03c5f59c80775cf91f9cc95c8c8de379>`_ Fix edit key py2/py3 utf-8 content compat
| `2.1dev-452-g817754066 <https://github.com/opensvc/opensvc/commit/817754066b8539650418ce8e5be3ce20980be850>`_ Support creating an empty key if --value/--from is not set with "add" action
| `2.1dev-451-g6f6b0a25b <https://github.com/opensvc/opensvc/commit/6f6b0a25bf40bfaf50675d1dd42e472fa1962028>`_ Don't validate global resource keyword value from encap
| `2.1dev-450-ga2ec6e812 <https://github.com/opensvc/opensvc/commit/a2ec6e812f846394ef1e8249a31a21b356d68983>`_ Return an empty list from zpool_devs() instead of raising
| `2.1dev-449-g584febae8 <https://github.com/opensvc/opensvc/commit/584febae88c28974a7cf1ef42f3c5c6dc8b6d902>`_ Report "zpool name undefined" in status and action logs
| `2.1dev-448-gb3c80b81c <https://github.com/opensvc/opensvc/commit/b3c80b81c448487645ee288dea0efd0552555718>`_ Ignore encap stop errors on freezestop monitor action
| `2.1dev-447-g0bbd5e76b <https://github.com/opensvc/opensvc/commit/0bbd5e76b66e47cc93c8bd653428f1d58ab36c97>`_ Fix wrong exception name in the drbd driver
| `2.1dev-446-g9b1ccaa55 <https://github.com/opensvc/opensvc/commit/9b1ccaa55af44da2c9b0787b844cab88f3827d13>`_ Fix a scheduler thread stack
| `2.1dev-445-g325ac2658 <https://github.com/opensvc/opensvc/commit/325ac2658884a47258df28a3bc42ecaadd89bfec>`_ Fix colorization of scoped keyword in "print config" output
| `2.1dev-444-gbfe3e071f <https://github.com/opensvc/opensvc/commit/bfe3e071f201fbbbb4e602e097b7fb5576472d7f>`_ Fix a drbd provisioning error on slave
| `2.1dev-443-g470ebd8c2 <https://github.com/opensvc/opensvc/commit/470ebd8c2098b175e9b6ac2aa22657d1ab051762>`_ Add a drbdadm_down_force() method to the drbd driver
| `2.1dev-442-ge9ec6e2e9 <https://github.com/opensvc/opensvc/commit/e9ec6e2e9b9c92533c0e4d82e8869542094aef8b>`_ Don't log empty lines from call_log()
| `2.1dev-441-gf41947f95 <https://github.com/opensvc/opensvc/commit/f41947f9550afd97902fab6a7c635c5ba831e8f2>`_ Add a call_log() function to utilities.proc
| `2.1dev-440-g1c81f68ea <https://github.com/opensvc/opensvc/commit/1c81f68ea873bf23b80abcf05abbbc8ab64b57aa>`_ Fix a missing import in the drbd driver
| `2.1dev-439-g8b4e72e0b <https://github.com/opensvc/opensvc/commit/8b4e72e0b721bf169b63a8dd7f7e791f2d358ce1>`_ Implement a retry loop for drbdadm state changing actions
| `2.1dev-438-gc2ed9894e <https://github.com/opensvc/opensvc/commit/c2ed9894ebbc1ee79e04ed995bea1cbe48e0fddf>`_ Fix drbd resource status reported down when a peer is inconsistent
| `2.1dev-437-gdd4224b73 <https://github.com/opensvc/opensvc/commit/dd4224b7391487c8d8644a4725a4edb16e996e83>`_ Add missing drbd resource to the templates of the drbd pool driver
| `2.1dev-436-g2f2d695c6 <https://github.com/opensvc/opensvc/commit/2f2d695c6cbf038ef6e93ca75e7ac80a960528dd>`_ Add the standby keywords to the volume templates of the drbd pools
| `2.1dev-435-g2f043f667 <https://github.com/opensvc/opensvc/commit/2f043f667850ff9500f3c2d9c4f16b46dac818de>`_ Handle "resource not defined (on this host)" drbd errors
| `2.1dev-434-g31a8a0cb2 <https://github.com/opensvc/opensvc/commit/31a8a0cb28992ab600bbf83f0da41713f4c4b547>`_ Fix a join(<not list>) situation in the drbd pool driver
| `2.1dev-433-g20b9d0c2e <https://github.com/opensvc/opensvc/commit/20b9d0c2e31e38280345843d67678d0cccc0c86c>`_ Add a drbd pool
| `2.1dev-432-g051656395 <https://github.com/opensvc/opensvc/commit/051656395e6774432f3181749e56cce9f27029e3>`_ Support drbd9 multi-slave in the resource status warnings
| `2.1dev-431-g7c1a705d4 <https://github.com/opensvc/opensvc/commit/7c1a705d482c0a617094f00da07b64bdbbef3e86>`_ Support connection mesh in the drbd driver
| `2.1dev-430-g69a31655c <https://github.com/opensvc/opensvc/commit/69a31655c8514694f2e630215068a2bf0fee7384>`_ Add the provisioning code to the drbd driver
| `2.1dev-429-g35ea7f1aa <https://github.com/opensvc/opensvc/commit/35ea7f1aaeb76442390ed28ffd6e962954f2f0bb>`_ Catch resource exceptions in Svc::devs()
| `2.1dev-428-g00fead973 <https://github.com/opensvc/opensvc/commit/00fead973f940f65f8c9f9b120d58cf6b41779d7>`_ Allow drivers to register their own api handlers
| `2.1dev-427-g431002752 <https://github.com/opensvc/opensvc/commit/431002752d4338393ffc36bc048fde25a498f52b>`_ Fix raw_daemon_request stack when timeout param is None
| `2.1dev-426-g3a2f9f609 <https://github.com/opensvc/opensvc/commit/3a2f9f6091597e5da5f57cfb6822d3f865dee417>`_ Fix task.podman wrong implementation of start/stop
| `2.1dev-425-g572ac01bf <https://github.com/opensvc/opensvc/commit/572ac01bf325f67898fc98e4128b6cf44b16b151>`_ Better documentation of the cluster.name keyword
| `2.1dev-424-gedb1b00f0 <https://github.com/opensvc/opensvc/commit/edb1b00f0f471e5d8b7bc73d37334eb12c87bd9b>`_ Don't stack on replace_volname() if Vol::device or Vol::mount_mount is None
| `2.1dev-423-g5dcf58846 <https://github.com/opensvc/opensvc/commit/5dcf588461ca281af90e9f7c47cd6d123d218830>`_ Add python version to the versions logged at daemon startup
| `2.1dev-422-g0f963a938 <https://github.com/opensvc/opensvc/commit/0f963a938c03c1d96320ba03958f0597cda6cd39>`_ Honor OSVC_CACHE_UUID environment variable to format to cache dir path
| `2.1dev-421-gfdaca259e <https://github.com/opensvc/opensvc/commit/fdaca259e9b22007c313691cfc930f068e0b0f95>`_ Add print_exc() in the push_resinfo() error path
| `2.1dev-420-g133c45989 <https://github.com/opensvc/opensvc/commit/133c45989d8756a47e6d8766245f5f751d1de1aa>`_ Support options.rid as a list in all Svc class codepaths
| `2.1dev-419-gf55836e87 <https://github.com/opensvc/opensvc/commit/f55836e871fd3c63dd28cc352781a6405af10e4c>`_ More elegant handling of OSVC_PARENT_SESSION_UUID in Env class
| `2.1dev-418-g0aaf3e8b4 <https://github.com/opensvc/opensvc/commit/0aaf3e8b42d1fe44c5631f9b7dfcd6b9254d0c06>`_ Fix a stack on "om node logs" when a peer goes down
| `2.1dev-417-g6d081d02a <https://github.com/opensvc/opensvc/commit/6d081d02a2e61ec099095fdec2502b815adf1825>`_ [test] python3.5 replace assert_called_once() by assert call_count == 1
| `2.1dev-416-g958cb8468 <https://github.com/opensvc/opensvc/commit/958cb8468c7a38c02618f97a08adacf652ed4e3d>`_ [pkg-SunOS] Ensure run opensvc with python3 if available on system
| `2.1dev-415-g6d922d1cb <https://github.com/opensvc/opensvc/commit/6d922d1cb89a2950f76801291210451623e256fa>`_ [drivers.resource.ip] Ensure start respect wait_dns duration
| `2.1dev-414-gaff7cb60f <https://github.com/opensvc/opensvc/commit/aff7cb60fa3e98012425275622a07071e14e84e4>`_ [test] Ensure no negative timeout sent during wait_dns_records (noop)
| `2.1dev-413-g42862c9d1 <https://github.com/opensvc/opensvc/commit/42862c9d11d47073dbf3dc13e051f6b39957a7e7>`_ [travis] Add 'next' to branches
| `2.1dev-412-g594f68c9e <https://github.com/opensvc/opensvc/commit/594f68c9e9e17f4e217beaf9a424b311908b73ab>`_ [test] cleanup unused injection
| `2.1dev-411-gf28ebfb28 <https://github.com/opensvc/opensvc/commit/f28ebfb2817d67a2e85a9b8ad3a0e34f400e73bd>`_ [driver.resource.ip] Fix wait_dns_records: cluster sync timeout
| `2.1dev-410-g68dae1170 <https://github.com/opensvc/opensvc/commit/68dae1170e2f26f41db753f163c3d54fa2b5bda7>`_ [driver.resource.ip] Fix daemon_get wrong timeout param during wait_dns_records
| `2.1dev-409-gae7a2a9be <https://github.com/opensvc/opensvc/commit/ae7a2a9bef6e6d64cca589ea3c478f4bac7a71df>`_ [test] Assert arp_announce is called after when ip is created
| `2.1dev-408-gfbf3bb221 <https://github.com/opensvc/opensvc/commit/fbf3bb2216831249a8331437ab723724019690e0>`_ [drivers.resource.ip] Fix lock failure when waitlock is None
| `2.1dev-407-g832609e74 <https://github.com/opensvc/opensvc/commit/832609e749888e042ee24c63d7cab441e5a44bca>`_ [test] Add tests on ip host start
| `2.1dev-406-g53dbbe5cf <https://github.com/opensvc/opensvc/commit/53dbbe5cf645aa10daee84d54ddb4c2df8adcac4>`_ [test] Add small integration tests on service with ip
| `2.1dev-405-ge74c014b5 <https://github.com/opensvc/opensvc/commit/e74c014b5ab53b85fd42f916da5c8d09c0374ac3>`_ [drivers.resource.ip] Replace utilities.ifconfig.Ifconfig by Ip.get_ifconfig
| `2.1dev-404-g717488de4 <https://github.com/opensvc/opensvc/commit/717488de48673a99fe87988ed5206ff24c8ef662>`_ Resolve the "info" attribute conflict in fs drivers
| `2.1dev-403-gdf8444bd5 <https://github.com/opensvc/opensvc/commit/df8444bd5d265ee2b098814f4126384680cde4b7>`_ [node] Set daemon_get timeout=5 for daemon_stats & daemon_backlogs
| `2.1dev-402-ga037aee20 <https://github.com/opensvc/opensvc/commit/a037aee2072af66f5abf3da18a446bfa7e34e57f>`_ [comm] Update function raw_daemon_request with a default timeout=None (=> blocking mode)
| `2.1dev-401-gfcd259fa4 <https://github.com/opensvc/opensvc/commit/fcd259fa42e0ae1d705138f72e8e1c8e91852daf>`_ Don't use timeout=0 as a default for h2_daemon_request()
| `2.1dev-400-g31cb3f5bd <https://github.com/opensvc/opensvc/commit/31cb3f5bd9245398ccf9f73d6c4828466c39ac62>`_ Fix h2 daemon requests on uxsock hanging when the daemon is not started
| `2.1dev-399-g3c86966aa <https://github.com/opensvc/opensvc/commit/3c86966aa413b83220953e1d033ce3771f955988>`_ Don't allocate a threading.RLock from the gen_iv prototype
| `2.1dev-398-g981c3cb8e <https://github.com/opensvc/opensvc/commit/981c3cb8ebeaa36f9222106afb367768732e54a8>`_ Allow "edit" and "edit --key" on usr objects
| `2.1dev-397-g2d7b32791 <https://github.com/opensvc/opensvc/commit/2d7b327912e03be7fca436d4b7ca385e04ced8e3>`_ [test] Update Solaris provision scenario (not standby)
| `2.1dev-396-ga15d9c1e8 <https://github.com/opensvc/opensvc/commit/a15d9c1e873cdb2d74986a423c2fadf12b5f5172>`_ Add a configure() call in Scheduler::print_config_data()
| `2.1dev-395-g356e32b00 <https://github.com/opensvc/opensvc/commit/356e32b002937d72b7c5bcf8652d805e64081e78>`_ Ignore the default_keyword Keyword property for "head" and "head>leaf" keywords
| `2.1dev-394-g9e60a3e36 <https://github.com/opensvc/opensvc/commit/9e60a3e36cc389ea24baf9980d0b65cc324e38fa>`_ [test] Update has_cluster_config fixture
| `2.1dev-393-g67dadf698 <https://github.com/opensvc/opensvc/commit/67dadf6988271d7c6c4c436dc055d0dad4bce3c8>`_ [test] Fix tests on secrets (has_cluster_config)
| `2.1dev-392-g5f037621c <https://github.com/opensvc/opensvc/commit/5f037621c21555163dfc057966519aa3422acad5>`_ Fix the daemon.monitor scaling codepath
| `2.1dev-391-g204ecc2c2 <https://github.com/opensvc/opensvc/commit/204ecc2c2bdcd3c5eff809c7ef233cc641522df4>`_ Fix a daemon.scheduler stack on configure_scheduler()
| `2.1dev-390-g0f04d64b8 <https://github.com/opensvc/opensvc/commit/0f04d64b8ec5f1db4ec90991a75310711bee1823>`_ Don't raise InitError from share.nfs linux driver __init__
| `2.1dev-389-gea9885964 <https://github.com/opensvc/opensvc/commit/ea9885964accb771a18121c4b00b4c7261716b39>`_ Fix a deprecation warning in foreign/jsonpath_ng/ext/string.py
| `2.1dev-388-g24045f120 <https://github.com/opensvc/opensvc/commit/24045f12076fd52fd4c2474d2cf3e4179c6e5a04>`_ Fix a missing import in the ip.amazon driver_capabilities() function
| `2.1dev-387-g6ef6db71c <https://github.com/opensvc/opensvc/commit/6ef6db71cc6a4f58a4fb09dc17d756eaa4132609>`_ Fix accidental change of method call in the daemon monitor
| `2.1dev-386-g4326f3746 <https://github.com/opensvc/opensvc/commit/4326f3746374f29b26f44ea5811a50cba56d46a9>`_ [test-provision-md] Reduce size of service name to support md device < 32 chars (again)
| `2.1dev-385-g2b8969749 <https://github.com/opensvc/opensvc/commit/2b8969749b5cb4f207b0b8dc26913c2f71692df4>`_ [test-provision-md] Reduce size of service name to support md device < 32 chars
| `2.1dev-384-g82ef4989b <https://github.com/opensvc/opensvc/commit/82ef4989b67499b41f757a9b85fb8cd32f6f0fee>`_ [test] Add temp mock nfs share capability during TestDriverShareNfsInstances
| `2.1dev-383-gad2450ec2 <https://github.com/opensvc/opensvc/commit/ad2450ec2c038d3d5525c294d74562863a5f5c03>`_ [test] Fix typo in btrfssnap driver name
| `2.1dev-382-gaec9126ff <https://github.com/opensvc/opensvc/commit/aec9126ffe59b5c867da08cdf30dee00f2d4754a>`_ Small refactoring of globing section in naming (prevent osvc_path_tests_fixture)
| `2.1dev-381-g158573457 <https://github.com/opensvc/opensvc/commit/1585734577a0e175e996c1daaee094858878afc2>`_ [test] Prevent bypass --debug, it will help diag tests
| `2.1dev-380-g1361cc6b0 <https://github.com/opensvc/opensvc/commit/1361cc6b01799dfb11ff262855a013afcff2f124>`_ Split ExtConfig::dump_config_data()
| `2.1dev-379-ge4079ed63 <https://github.com/opensvc/opensvc/commit/e4079ed63ffce9b7e8c9a887181fd706a5fdbf13>`_ [driver.md] Fix possible conflict during provisioning when a svcname is found in other svcnames
| `2.1dev-378-g455f574ae <https://github.com/opensvc/opensvc/commit/455f574ae57c7dd65cda9f1396a98d263241165c>`_ [drivers.md] Inform status_log about too long md name (32 chars)
| `2.1dev-377-g7703cb00e <https://github.com/opensvc/opensvc/commit/7703cb00e3bb9b38d58acf3cd047bd75b1c3de61>`_ [drivers.md] Failfast provisioning when md name is too long (32 chars)
| `2.1dev-376-g08a40a483 <https://github.com/opensvc/opensvc/commit/08a40a48325c3a292764ae8ec596db921a1ffc63>`_ Honor BaseSvc::volatile=True in Extconfig::dump_config_data()
| `2.1dev-375-g747e3bbe4 <https://github.com/opensvc/opensvc/commit/747e3bbe4f8410c4479fdb32d5dabb06e26a2ea1>`_ Allow the keywords to define a custom DEFAULT fallback keyword
| `2.1dev-374-g86ccbdacd <https://github.com/opensvc/opensvc/commit/86ccbdacd04e1e4d0e390b75ae51e0263e9bb7c0>`_ Ensure environment is cleared when entering lxc container
| `2.1dev-373-g5935945fc <https://github.com/opensvc/opensvc/commit/5935945fc1ae05781a80792b1c8487d5b3c9bad9>`_ Fix the sync#.schedule to DEFAULT.sync_schedule fallback
| `2.1dev-372-g5d342fffb <https://github.com/opensvc/opensvc/commit/5d342fffb91f62936bb69a571e829f18ce51a08c>`_ Implement most driver_capabilities()
| `2.1dev-371-g26f8931f1 <https://github.com/opensvc/opensvc/commit/26f8931f194adec7613de7afb367e929473876a1>`_ Report an error when posting an invalid global_expect on /node_monitor
| `2.1dev-370-gdb2254d8c <https://github.com/opensvc/opensvc/commit/db2254d8cccf48e5405d817f88d63b0ca4e79090>`_ Formatting with --filter enhancements
| `2.1dev-369-g4181306a5 <https://github.com/opensvc/opensvc/commit/4181306a5a4ce7e175ed47218d6a2383a2f4bf7b>`_ Fix the undue "daemon down" in print status render
| `2.1dev-368-g220b2eb81 <https://github.com/opensvc/opensvc/commit/220b2eb81bbd136ddb7054da195e3d5d3beda6fb>`_ Remove most re.compile() from module globals
| `2.1dev-367-gcb3a7b23b <https://github.com/opensvc/opensvc/commit/cb3a7b23b897e010752a43e8883dfd9f57749d78>`_ More micro-optimizations in the keywords and extconfig codepaths
| `2.1dev-366-g9e69e423d <https://github.com/opensvc/opensvc/commit/9e69e423d66ff42f89e065440e991f9fc97f900c>`_ Prevent hang during daemon stop operation (when daemon thread are in blocking state)
| `2.1dev-365-g9a80abbc2 <https://github.com/opensvc/opensvc/commit/9a80abbc2a409774ddbe730ba19c7d2958df4964>`_ Store section keywords in a hash to speed-up the lookups
| `2.1dev-364-gf02b5fe36 <https://github.com/opensvc/opensvc/commit/f02b5fe369cf10bd228414e1d2945b129c8596f8>`_ Fix a wrong import in the disk.scsireserv linux module
| `2.1dev-363-g0a8680575 <https://github.com/opensvc/opensvc/commit/0a868057596caa14ffd4f744c16e64b28ad3649b>`_ Add a core.capabilities module
| `2.1dev-362-ga003af89e <https://github.com/opensvc/opensvc/commit/a003af89ebc7ddcbb203dc2d6acf3e1122878969>`_ Fix a use before set error in the status.json codepath
| `2.1dev-361-gde0f79abf <https://github.com/opensvc/opensvc/commit/de0f79abf3e3d33b4d9af4f78c5e9e22c29c2038>`_ Honor the version.py relocation in agent_version()
| `2.1dev-360-g78c5f39f3 <https://github.com/opensvc/opensvc/commit/78c5f39f39204b206b4099fcbf0c10d778fe357b>`_ Always report disk.lv exposed dev as it is predictable
| `2.1dev-359-g7b24f68cc <https://github.com/opensvc/opensvc/commit/7b24f68cc08e0cf0fb3353fd13fababeb2d0ca5f>`_ Skip status.json load if from_resource_status_cache or refresh is set
| `2.1dev-358-gb87a59913 <https://github.com/opensvc/opensvc/commit/b87a599137de4e8ffff313b54068f04e681992eb>`_ Add a verify_dev() implementation to linux disk.raw
| `2.1dev-357-g52ac1836f <https://github.com/opensvc/opensvc/commit/52ac1836f72d2439e320d0cfd0c068eb98993ba3>`_ Fix the zone tagging of the fs resources
| `2.1dev-356-g0fa86446d <https://github.com/opensvc/opensvc/commit/0fa86446d66845cc3c28fe7fb7a245186ad0a2a4>`_ Defer the slow zonepath lookup in a mount_point lazy
| `2.1dev-355-g0aa99f4dd <https://github.com/opensvc/opensvc/commit/0aa99f4dd6c076c6f4b5af5cdbab205b7d6d11ad>`_ Avoid execv() a lvs command on dereferencing a kw using a lv {exposed_devs}
| `2.1dev-354-g0ba03b89d <https://github.com/opensvc/opensvc/commit/0ba03b89d6b1aee027596c75ef4d6dc5789054c4>`_ Fix a use before set instroduced by the last patch
| `2.1dev-353-g615d12b6b <https://github.com/opensvc/opensvc/commit/615d12b6b5d65e31f482d4a24ba8de5be09ac5f0>`_ Fix the monitor orchestrating instances frozen by merge_frozen()
| `2.1dev-352-g5225e200c <https://github.com/opensvc/opensvc/commit/5225e200cd53fa87ae318363d51388972311900c>`_ Fix the check_stat() overrides for fs.none and fs.tmpfs
| `2.1dev-351-g31985cf69 <https://github.com/opensvc/opensvc/commit/31985cf697843448f032f6170bafcbe82c87752b>`_ Replace the @cache by a @lazy caching strategy for "zpool status <pool>"
| `2.1dev-350-gf56cc0337 <https://github.com/opensvc/opensvc/commit/f56cc0337786074dcb1dbb33ad2f28e55c2da5be>`_ Avoid acquire the status action lock when we don't intent to use it
| `2.1dev-349-gf2989aaa0 <https://github.com/opensvc/opensvc/commit/f2989aaa0ebb608eb9f15fadac93166e4a5c00d9>`_ Skip the check_stat on fs.tmpfs and fs.none
| `2.1dev-348-gb935711df <https://github.com/opensvc/opensvc/commit/b935711dfae74d7513e32c497022fa28257fe830>`_ Optimize the disk.md driver execv
| `2.1dev-347-ge5d4b2ec9 <https://github.com/opensvc/opensvc/commit/e5d4b2ec92d1f27eeaa15089a030bbcf3426e7e6>`_ Report n/a for disk.raw devices with no evaluated devs
| `2.1dev-346-gce01bc8f9 <https://github.com/opensvc/opensvc/commit/ce01bc8f966eac24e1615dcb1d4202fffb942dcb>`_ Remove an unused import from disk.zvol
| `2.1dev-345-g089d00d33 <https://github.com/opensvc/opensvc/commit/089d00d33020dc846ceb4cc83190a9c932f49979>`_ Use justcall from utilities.proc in disk.scsireserv
| `2.1dev-344-g81f20330f <https://github.com/opensvc/opensvc/commit/81f20330fc3893a03d8fa209465bd0cb0dff2404>`_ Add a utilities.subsystems.lvm.linux module
| `2.1dev-343-g288c209c2 <https://github.com/opensvc/opensvc/commit/288c209c2990180d88130160c9d35ddda75a0115>`_ Add a utilities.timeout module to help identify slow codepaths
| `2.1dev-342-g159f8afb0 <https://github.com/opensvc/opensvc/commit/159f8afb0862548a16a09dbd4c91ee2b620196a1>`_ Fix AttributeError during service action when pg driver is not implemented
| `2.1dev-341-gcdd38b24c <https://github.com/opensvc/opensvc/commit/cdd38b24ce122d17255bf082a235bd235600cbec>`_ save_exc() log message to say stack is saved in log file
| `2.1dev-340-g9412f02ef <https://github.com/opensvc/opensvc/commit/9412f02efd30ce0954e49325c6dac75ded524db3>`_ Split zone_list() out of the Node class, into utilities.dns
| `2.1dev-339-g1def048f5 <https://github.com/opensvc/opensvc/commit/1def048f5708eb08a3f470e3ed691b22c70f5c30>`_ Move the utilities.arp module import to the method using it
| `2.1dev-338-gf81aede78 <https://github.com/opensvc/opensvc/commit/f81aede78d5a0c623ddee3bba95781713f896c82>`_ [test] Add SunOS provision tests pytest -m sunos
| `2.1dev-337-gc599ff1fd <https://github.com/opensvc/opensvc/commit/c599ff1fdc121fd3be6bff749ee46d85810c0257>`_ Add the check_ping() timeout value to the ip start logs
| `2.1dev-336-g783e6a521 <https://github.com/opensvc/opensvc/commit/783e6a52140e14c2af5ba5cf2f5027ece668967e>`_ Move the core.collector.rpc module import to the Node codepath using it
| `2.1dev-335-g625379671 <https://github.com/opensvc/opensvc/commit/625379671d2cfc384989bd3901cca150ae31bfc9>`_ Speedup the os-declined module import time
| `2.1dev-334-g7c6ddaf60 <https://github.com/opensvc/opensvc/commit/7c6ddaf6097f5a0a5a03c8750c3c7905518d451f>`_ Faster utilities.render.color import
| `2.1dev-333-g5199e39d5 <https://github.com/opensvc/opensvc/commit/5199e39d50da1b265dc5aae3ee3589a20b963d74>`_ [test] Add more provision tests and improve scenario to add start and avail status check
| `2.1dev-332-g298ed54c2 <https://github.com/opensvc/opensvc/commit/298ed54c2af6fe7cf3c68e928758fbf5c0615382>`_ Fix encap_cmd() command formatter
| `2.1dev-331-g96d26bd64 <https://github.com/opensvc/opensvc/commit/96d26bd642f22af357e3a496800dca3db457f7e7>`_ Implement the "enter" action for container.lxc
| `2.1dev-330-gb452b8471 <https://github.com/opensvc/opensvc/commit/b452b84715f3121c833659561ceda0e6899b1388>`_ Ignore missing mandatory provisioning keyword when not provisioning
| `2.1dev-329-gfe1fb384b <https://github.com/opensvc/opensvc/commit/fe1fb384ba415174ef8c9cc4a37fe04bb76606e0>`_ Fix the disable keyword protoname
| `2.1dev-328-g578f7984f <https://github.com/opensvc/opensvc/commit/578f7984f582bfca0605b083cc604b93211db6e2>`_ Re-add accidentaly remove fs.btrfs driver
| `2.1dev-327-g27401ceac <https://github.com/opensvc/opensvc/commit/27401ceacf99b16eb6e84ca7fec2e7c9a2245599>`_ Fix handling of exposed_devs references in the disk.raw devs keyword
| `2.1dev-326-g85192ab37 <https://github.com/opensvc/opensvc/commit/85192ab370f0ac5d17d780ff45da8c58063ab56c>`_ Fix a used before set in the disk.disk unprovisioner
| `2.1dev-325-g6fef29676 <https://github.com/opensvc/opensvc/commit/6fef296763796c18bab23238e11cf0cebd1f22d4>`_ Shortcut pwd and grp lookup if user or group is None
| `2.1dev-324-g6ad828ae4 <https://github.com/opensvc/opensvc/commit/6ad828ae49663a9b81231c6a164e74f1a872e8cc>`_ Add user/group/perm/dirperm keywords to the volume resource driver
| `2.1dev-323-g5d800359f <https://github.com/opensvc/opensvc/commit/5d800359f3b1ea4fdecb13fcb990a4b438049047>`_ Add --confirm to the run action
| `2.1dev-322-gdb6da838b <https://github.com/opensvc/opensvc/commit/db6da838b42c9ba0256cd5cebd9d0c0a8b7a5d8a>`_ Set pr status to n/a instead of undef when the resource handles no disks
| `2.1dev-321-g65a09c303 <https://github.com/opensvc/opensvc/commit/65a09c303289d9e62e3289e051de882d191ae584>`_ Fix an infinite recursion in container.lxc label formatting
| `2.1dev-320-gc63c8ec15 <https://github.com/opensvc/opensvc/commit/c63c8ec157fb66cd3a53157d8f889e50b48dc992>`_ Missing translation from container.docker 'command' kw to 'run_command' kwarg
| `2.1dev-319-g19061304a <https://github.com/opensvc/opensvc/commit/19061304adf47ad0692a15a2f8ed8c16e6351224>`_ Fix the disk.lv provisioner
| `2.1dev-318-ga266ff8ff <https://github.com/opensvc/opensvc/commit/a266ff8ffac1ac43a5c26f002a570c19358c0382>`_ Fix the raw driver kwargs double definition
| `2.1dev-317-g131944e6f <https://github.com/opensvc/opensvc/commit/131944e6ff1236ab163a0342daa09ff77eb1be67>`_ Fix the fs provisionner
| `2.1dev-316-gd644930ec <https://github.com/opensvc/opensvc/commit/d644930ec6649d5309b495cb98f01c70a0a515e9>`_ Fix the fs provisioner
| `2.1dev-315-g851e4fe35 <https://github.com/opensvc/opensvc/commit/851e4fe35029f4c25973cb485e7a96f0dbb4ef14>`_ Fix the pool type kwarg handling in volume resource
| `2.1dev-314-g0d91a55d6 <https://github.com/opensvc/opensvc/commit/0d91a55d6df3cd526216c706d06bdede167a8aa3>`_ [test] Fix legacy tests on driver import
| `2.1dev-313-gd489e67ec <https://github.com/opensvc/opensvc/commit/d489e67ec9838ed12de7ff1df1b14401bd5bda9f>`_ Document the '|=' operator in the 'set --kw' action
| `2.1dev-312-ga2b3f4b16 <https://github.com/opensvc/opensvc/commit/a2b3f4b16acf5e461bcdc7109d78473fba5004d8>`_ Rename the NfsShare classes to ShareNfs to honor the enforced norm
| `2.1dev-311-g1571c257f <https://github.com/opensvc/opensvc/commit/1571c257f61b401585ee2e5e8d38fc6f4d338b35>`_ Fix the sync.zfssnap driver load pytest assert on 'type'
| `2.1dev-310-g0d6a50098 <https://github.com/opensvc/opensvc/commit/0d6a500984c0f3928922abe11fac5e3cc8fc8605>`_ Fix volume provisioning using the wrong pool type
| `2.1dev-309-g2a36d653a <https://github.com/opensvc/opensvc/commit/2a36d653a31e74acee94fa3a481b1ad8eccaac65>`_ Fix fs driver init errors
| `2.1dev-308-g96d24ba11 <https://github.com/opensvc/opensvc/commit/96d24ba1192109dfa809003221fecb1c3c2d7b42>`_ Fix the wrong disk.advfs driver manifest
| `2.1dev-307-g39a11db42 <https://github.com/opensvc/opensvc/commit/39a11db42f8553a1a031d45e978212ce757275ea>`_ Fix the ip driver test scenario
| `2.1dev-306-g6b983830e <https://github.com/opensvc/opensvc/commit/6b983830e26b44023143353c015f6c60e66b0cf0>`_ Move driver_class() from core.object.builder to utilities.drivers
| `2.1dev-305-g13eaaf063 <https://github.com/opensvc/opensvc/commit/13eaaf0631ec2cd851679f4c361971438fc1b79f>`_ Fix a use before set in disk.vdisk
| `2.1dev-304-g554996b36 <https://github.com/opensvc/opensvc/commit/554996b36c7fa80290484f3fb70bef4993324eae>`_ [tests] Fix create_driver_resource() formatting of driver_import() args
| `2.1dev-303-g31696eb0c <https://github.com/opensvc/opensvc/commit/31696eb0c57ddbc0cfe05a55f7b6f5c9095dcebc>`_ Don't raise from sync.evasnap init method
| `2.1dev-302-g6c774d1cd <https://github.com/opensvc/opensvc/commit/6c774d1cd5fece65545e0829e2f19c15f2c8dd89>`_ Remove the sync.dds dsts attribute hidden by a lazy
| `2.1dev-301-gefb329b41 <https://github.com/opensvc/opensvc/commit/efb329b41792091e6abb8cf5981e571af62cf4df>`_ Remove the sync.hp3par rcg_names attribute hidden by a lazy
| `2.1dev-300-g6540b84d1 <https://github.com/opensvc/opensvc/commit/6540b84d17196cd8e7e6379bf6f38de65499d593>`_ Add DRIVER_ attributes to disk.scsireserv drivers
| `2.1dev-299-g4ce1a7dea <https://github.com/opensvc/opensvc/commit/4ce1a7dea0cc059143533b0aa80fe1b09aa793c5>`_ Remove a test scenario confusing drivers.resource.disk.scsireserv.sg for a driver
| `2.1dev-298-gdcae3bcb5 <https://github.com/opensvc/opensvc/commit/dcae3bcb50c43cf643c1f13cdd821884a36013bd>`_ Object selector enhancements and fix
| `2.1dev-297-gb4ac95e99 <https://github.com/opensvc/opensvc/commit/b4ac95e995522efc367d64bb8cec49a3a755f806>`_ Fix the bin/pkg/make_man command
| `2.1dev-296-gf378b78ec <https://github.com/opensvc/opensvc/commit/f378b78ec43f632b989e9f7b61a7e8417ee752f2>`_ Add the GET /object_status handler
| `2.1dev-295-g3276a5a3a <https://github.com/opensvc/opensvc/commit/3276a5a3afd82214ca564f26096d83e37ff97c45>`_ Fix the missing zone keyword from fs resources
| `2.1dev-294-gb93b14f25 <https://github.com/opensvc/opensvc/commit/b93b14f252e33a17f51802d563260f33b9eb956d>`_ Remove adder functions from drivers
| `2.1dev-293-g8b7d6afc3 <https://github.com/opensvc/opensvc/commit/8b7d6afc335cfb286dcdc5400bfa066ea1a8c216>`_ Fix py2 stack in the logs handlers
| `2.1dev-292-g66946d84d <https://github.com/opensvc/opensvc/commit/66946d84d7f00ced4574eaa107605b6680dc6f0f>`_ Remove useless file
| `2.1dev-291-g5caebe5ae <https://github.com/opensvc/opensvc/commit/5caebe5aec5b9250f176151e316049765ae7ef7d>`_ Remove the undue resource allocation test on "sync"
| `2.1dev-290-gba2476814 <https://github.com/opensvc/opensvc/commit/ba2476814b05b93cf487fd5b7dff44de963c4f02>`_ Add a adder() method to disk.disk
| `2.1dev-289-g7a254fdf9 <https://github.com/opensvc/opensvc/commit/7a254fdf9b563369dde02fcc98d8352c9927a878>`_ Add missing imports from disk.hpvm
| `2.1dev-288-gb5966443b <https://github.com/opensvc/opensvc/commit/b5966443b897a4dc82ece85d20427fda66911b2a>`_ Add a adder() and KEYS to disk.hpvm
| `2.1dev-287-gb0caa6d62 <https://github.com/opensvc/opensvc/commit/b0caa6d62bddff17619044b89936587e96436a99>`_ Fix the listener handlers registration from forked daemon
| `2.1dev-286-g706800334 <https://github.com/opensvc/opensvc/commit/706800334ae2b796a37f04cf7b553900c0ae3c4e>`_ Insert absolute paths in sys.path
| `2.1dev-285-g1c3d9f007 <https://github.com/opensvc/opensvc/commit/1c3d9f0073700142b27515fdbd5733788dde122a>`_ Revert "Fix a py2 stack on daemon start"
| `2.1dev-284-g6d771cebd <https://github.com/opensvc/opensvc/commit/6d771cebde593d4204d44aa129b5e10ca461ae87>`_ Fix a py2 stack on daemon start
| `2.1dev-283-gfbe16dd39 <https://github.com/opensvc/opensvc/commit/fbe16dd3972e1053c307b8fb7c22332168863f61>`_ Fix py2 compat of the mimport() prototype
| `2.1dev-282-g8875998df <https://github.com/opensvc/opensvc/commit/8875998dfaa971134ce472fb63c0b2bd3475e2c0>`_ Auto unprovision loop over shm on stop
| `2.1dev-281-g96dda5fbc <https://github.com/opensvc/opensvc/commit/96dda5fbc7f569cd12c0d4eb4f940013a4f90aeb>`_ If a disk.loop resource file is hosted on a volatile fs, auto provision on start
| `2.1dev-280-gc11896dca <https://github.com/opensvc/opensvc/commit/c11896dca62d08d1b69cb822b1f3d47b9158f268>`_ Don't leave docker/podman task container on command failures
| `2.1dev-279-g8b1e6e48b <https://github.com/opensvc/opensvc/commit/8b1e6e48b04e83cbf1ef735df63b66429526ce50>`_ Lookup drivers in a fallback package "site-opensvc" if not found in "drivers"
| `2.1dev-278-gca43be498 <https://github.com/opensvc/opensvc/commit/ca43be49892aba214766f8e83c19354d212d8f16>`_ Add a __main__ entrypoint to opensvc.daemon
| `2.1dev-277-ga15e79d26 <https://github.com/opensvc/opensvc/commit/a15e79d26003ab1e631ecd9f213e51f6b579b5c9>`_ Update os init scripts to use om instead of nodemgr
| `2.1dev-276-g2c92312f1 <https://github.com/opensvc/opensvc/commit/2c92312f1168100120a81670b97efc64a604a647>`_ [systemd] Update opensvc-services unit
| `2.1dev-275-gd126014c1 <https://github.com/opensvc/opensvc/commit/d126014c1b4544c7f6bbdaa25a8f56fbc23e84b9>`_ Add backward compat for "nodemgr daemon|net|pool|dns ..." commands
| `2.1dev-274-g676e3bc01 <https://github.com/opensvc/opensvc/commit/676e3bc014ce3e0d47dbf5a442df2a73a76403c1>`_ [systemd] Update Exec with new command name
| `2.1dev-273-ge4236a3a3 <https://github.com/opensvc/opensvc/commit/e4236a3a3c849ec9801a4b7773fd251b7d1bec5d>`_ Ignore pylint import errors on six.moves
| `2.1dev-272-g177b4b93d <https://github.com/opensvc/opensvc/commit/177b4b93d87959de469691761ab81a9a4d136fb9>`_ Fix a wrong variable name in utilities.devices.linux
| `2.1dev-271-g3bce20f2b <https://github.com/opensvc/opensvc/commit/3bce20f2b97714c42f7cc2eda98124597240b1ed>`_ Fix detached action for "om <kind> -s <selector> <action>"
| `2.1dev-270-gd1175c6db <https://github.com/opensvc/opensvc/commit/d1175c6dbf12486e39cb0400f4ecfdebeffe7bb1>`_ [test] Update Gitlab-ci pylint command (already fixed in Travis)
| `2.1dev-269-g46bb91900 <https://github.com/opensvc/opensvc/commit/46bb9190038454ec3710afe9dc401533f82a0e62>`_ [PEP8] Fix mutable argument
| `2.1dev-268-g8f703b239 <https://github.com/opensvc/opensvc/commit/8f703b239d84ec92a17674066ba688ae6e10bc97>`_ Fix the POST /object_action handler
| `2.1dev-267-ge841379e4 <https://github.com/opensvc/opensvc/commit/e841379e47b97263ffbf05499b141cbe3fdc629c>`_ [PEP8] Fix invalid escape sequence
| `2.1dev-266-g9f0521d90 <https://github.com/opensvc/opensvc/commit/9f0521d908c76e3a29fae7f5ecc7a3e02aee1000>`_ Move six to foreign.six
| `2.1dev-265-gb58d62711 <https://github.com/opensvc/opensvc/commit/b58d6271196f732ce343731eb047542dad6e9bf7>`_ [test] Fix bad test filenames for daemon and network
| `2.1dev-264-g207fadbac <https://github.com/opensvc/opensvc/commit/207fadbacf031b0094608021ca13abbd838fa02a>`_ Move arp.py to utilities.arp
| `2.1dev-263-gb02b19d91 <https://github.com/opensvc/opensvc/commit/b02b19d91550d19f3db1b18589dc273afa13d665>`_ [test] Move daemon test to tests/command/daemon
| `2.1dev-262-g35cc3dfaf <https://github.com/opensvc/opensvc/commit/35cc3dfaf5ed9ec827340110d36ff9267b96ffd8>`_ Display all command actions when no candidate matching action prefix is found
| `2.1dev-261-gb512ec83b <https://github.com/opensvc/opensvc/commit/b512ec83bda3b71190de5e3b5cc1e61c8bda2979>`_ [test] Separate command tests to reflect reality
| `2.1dev-260-gb4e002781 <https://github.com/opensvc/opensvc/commit/b4e002781e6ae4036d9be5b50d98496e73425b0a>`_ Use Env.om instead of 'Env.python_cmd + ["-m"] + Env.package'
| `2.1dev-259-g260454030 <https://github.com/opensvc/opensvc/commit/2604540302e254e0c4e4ba0cf6cb143b75ff1928>`_ Add api/webapp fw rule for Windows
| `2.1dev-258-gdcb670896 <https://github.com/opensvc/opensvc/commit/dcb670896cb2f5f495fbf90225d5889fed97493a>`_ Fix "om : ls" returning all services instead of none
| `2.1dev-257-gcac8740a8 <https://github.com/opensvc/opensvc/commit/cac8740a86a267cba6cd9e656eeb83f75e898cca>`_ [test] Add test provision real actions for QA Linux with pytest
| `2.1dev-256-g977e138bc <https://github.com/opensvc/opensvc/commit/977e138bc51c8f5731746c1efed8980a7400a294>`_ Rename commands/<foo>mgr to commands/<foo>
| `2.1dev-255-g56bbdbdbf <https://github.com/opensvc/opensvc/commit/56bbdbdbf10f92ffd51cd2004038a2b912ebe03c>`_ Update the lib path in all cmd commands, add om.cmd
| `2.1dev-254-gb6f45ab61 <https://github.com/opensvc/opensvc/commit/b6f45ab61d00a607c257b62e3926b35f317bbc91>`_ Support the new file layout in Windows packaging tools
| `2.1dev-253-g4b5f94527 <https://github.com/opensvc/opensvc/commit/4b5f9452726e395f0e827a1c36ceb3b1d7b12c86>`_ Support the new file layout in bin/pkg/make_sunos_ips
| `2.1dev-252-gb1fcde7da <https://github.com/opensvc/opensvc/commit/b1fcde7daf28640619ddf4611cc755da17bd115a>`_ Support the new file layout in bin/pkg/make_man_rst
| `2.1dev-251-gfe8be9f1f <https://github.com/opensvc/opensvc/commit/fe8be9f1f338ffe6cdc00563cecd3a9bdeddf97d>`_ Support the new file layout in bin/pkg/make_rst
| `2.1dev-250-g353f51e9d <https://github.com/opensvc/opensvc/commit/353f51e9d7ba4752aec311c2990ed6167f712e53>`_ Fix path to OSF1 opensvc os launcher
| `2.1dev-249-g4423e075d <https://github.com/opensvc/opensvc/commit/4423e075dab67ba44f35ae13198101a69e55b3f8>`_ Fix the mgr->om symlinks
| `2.1dev-248-ge3797e939 <https://github.com/opensvc/opensvc/commit/e3797e939d5588bc7b4bc9a3945a476946b33d30>`_ Support the new file layout in bin/pkg/make_ebuild
| `2.1dev-247-gb50344e5b <https://github.com/opensvc/opensvc/commit/b50344e5b69720118e458ed3a44f2f05a5216b78>`_ Update legal informations in bin/pkg/make_depot
| `2.1dev-246-g28a9bfb91 <https://github.com/opensvc/opensvc/commit/28a9bfb91c81027b27e4c209f3be42540daaa346>`_ Switch to "om <kind>" for optparser help messages
| `2.1dev-245-g2335df1fc <https://github.com/opensvc/opensvc/commit/2335df1fc40daeba59d4e971b8f390834c27bd8c>`_ Fix "om sec ls" like commands
| `2.1dev-244-g0f8262c33 <https://github.com/opensvc/opensvc/commit/0f8262c33138747420573439aceefad41c60c707>`_ Fix "om net ..." commands
| `2.1dev-243-gc1f9be284 <https://github.com/opensvc/opensvc/commit/c1f9be284548cec401c8aed13b4f47e9dbacde5a>`_ Merge bin/opensvc into bin/om and remove bin/opensvc
| `2.1dev-242-g18e0061c2 <https://github.com/opensvc/opensvc/commit/18e0061c2acb8a85d8c0c29b43e692a454d1ffba>`_ Git-ignore opensvc/version.py
| `2.1dev-241-g2c9416f6b <https://github.com/opensvc/opensvc/commit/2c9416f6b9c226403c39cb0f0e7b191bb2504246>`_ [test] Add test provision real actions for QA Linux with pytest
| `2.1dev-240-g6f50cab68 <https://github.com/opensvc/opensvc/commit/6f50cab6861745a665bd783160625a20f1cd6bdf>`_ Fix utilities.version (try importlib first)
| `2.1dev-239-g51f55b6ac <https://github.com/opensvc/opensvc/commit/51f55b6ac554d92ac6d0825a95896c242a8de317>`_ Support the new file layout in bin/postinstall
| `2.1dev-238-g7346dd2dc <https://github.com/opensvc/opensvc/commit/7346dd2dc5d0d1246afbd533abb5d540bc54d864>`_ Remove python unit tests from os packages
| `2.1dev-237-gf37d35e09 <https://github.com/opensvc/opensvc/commit/f37d35e09ee6c74262cada1a5a4be57faf0e451f>`_ Beautify the commands short help message emitted from utilities.optparser
| `2.1dev-236-g2aa6038e1 <https://github.com/opensvc/opensvc/commit/2aa6038e1423b30d75bbc8be5c38da41b4df60c8>`_ Remove unused "prog" variable from opensvc.commands.nodemgr
| `2.1dev-235-gdc95e634d <https://github.com/opensvc/opensvc/commit/dc95e634ddefbe034b2112aebaee044c618f8fe4>`_ Fix bin/svcmon symlink routing via bin/opensvc
| `2.1dev-234-g3bbd30950 <https://github.com/opensvc/opensvc/commit/3bbd30950700f3bbaae08b68d94e0ef414caa1b0>`_ Support the new file layout in bin/pkg/make_rpm
| `2.1dev-233-g94d986da8 <https://github.com/opensvc/opensvc/commit/94d986da8b6d7116bf2b1a45d50a30273aa87f46>`_ Support the new file layout in bin/pkg/make.lib
| `2.1dev-232-ge9fa18ccc <https://github.com/opensvc/opensvc/commit/e9fa18cccab1be3b7b7e8058358b850d8ed5fd08>`_ Support the new file layout in bin/pkg/make_rst_examples
| `2.1dev-231-g9fbd731af <https://github.com/opensvc/opensvc/commit/9fbd731aff1a78421bcb25893db18c8d0883d940>`_ Don't use conf_get/oget in lv provisioner
| `2.1dev-230-gf5e6e81e9 <https://github.com/opensvc/opensvc/commit/f5e6e81e9c80e620f361ade2f9a1ced629c4bcfb>`_ Reformat code on utilities.stats.collector (continue)
| `2.1dev-229-g11e0a6fe4 <https://github.com/opensvc/opensvc/commit/11e0a6fe4455c13e69d66f77d0b66b3e2756eb95>`_ Reformat code on utilities.stats.collector
| `2.1dev-228-g32fc9edd6 <https://github.com/opensvc/opensvc/commit/32fc9edd6269013ba0bef39587c1b5983e00a84b>`_ Optimize imports on utilities.stats.collector
| `2.1dev-227-g9f15b8ad7 <https://github.com/opensvc/opensvc/commit/9f15b8ad7185d22cc830bff8233635c333bfec15>`_ Move rcStatsCollect to utilities.stats.collector/
| `2.1dev-226-gcee79df44 <https://github.com/opensvc/opensvc/commit/cee79df44bc3e8d3ffebb3eb41eff514b4a1bd8f>`_ Fix the BaseStatsProviderUx __init__ super() call args
| `2.1dev-225-gde43f8f2b <https://github.com/opensvc/opensvc/commit/de43f8f2ba4838f9b28d71abfd4425f0ed495646>`_ Simplify the scaling slice create using a Svc() object instead of exec commands
| `2.1dev-224-g62824315b <https://github.com/opensvc/opensvc/commit/62824315b62d2c8792c8dc381318ea7ef269ef11>`_ Push the default docker start_timout from 2 to 5
| `2.1dev-223-gab05be354 <https://github.com/opensvc/opensvc/commit/ab05be35429371d6e7f960bbc93e6fd4fbc00822>`_ Refacto stats.provider Ux & windows
| `2.1dev-222-g950ffb59d <https://github.com/opensvc/opensvc/commit/950ffb59dcf29422640343f4f07386e89313d75a>`_ Reformat utilities.stats.provider.aix
| `2.1dev-221-g03e2d6c46 <https://github.com/opensvc/opensvc/commit/03e2d6c46a5149bfcaf3d9afe7b95ed6730f6059>`_ Move rcStatsAIX.py to utilities.stats.provider
| `2.1dev-220-gb3a546f75 <https://github.com/opensvc/opensvc/commit/b3a546f7530deec976f00423363654263cffd6be>`_ Reformat code utilities.stats.provider
| `2.1dev-219-gefee3619b <https://github.com/opensvc/opensvc/commit/efee3619b1b3ac96f33485f4c9b0209d8802dee9>`_ Optimize imports on utilities.stats.provider
| `2.1dev-218-ge41671ae8 <https://github.com/opensvc/opensvc/commit/e41671ae80b079945554b19afd2a1d636492f47d>`_ Move rcStats to utilities.stats.provider
| `2.1dev-217-g720e02ed1 <https://github.com/opensvc/opensvc/commit/720e02ed10f0d056d5cfa8d6e94f28f01264aab0>`_ Fix double-add of "svc" in the scaling=>service_command(None, cmd) codepath
| `2.1dev-216-gc21ab739a <https://github.com/opensvc/opensvc/commit/c21ab739a1cdcb4f8642c268f9e7d65c8f408325>`_ Fix a typo in daemon.shared
| `2.1dev-215-g2da9d60f7 <https://github.com/opensvc/opensvc/commit/2da9d60f75e95a54bc23d743d5198d901c416a76>`_ Fix object create commands in scaling and POST /object_create codepath
| `2.1dev-214-g20f25780f <https://github.com/opensvc/opensvc/commit/20f25780fdbdbb7323383c0c38a27c7163e92e3b>`_ Move the status action to common object actions
| `2.1dev-213-g3da3dec9e <https://github.com/opensvc/opensvc/commit/3da3dec9e5815bf9a8f5b52e1f571cf817ed1f24>`_ Add pylint ignore undefined-variable on __spec__ use for py2
| `2.1dev-212-g6245b9e1c <https://github.com/opensvc/opensvc/commit/6245b9e1c62a10433b87d0d86db248e4492927dd>`_ Update bin/pkg/make_completion to support the new file layout
| `2.1dev-211-ge6ce614fa <https://github.com/opensvc/opensvc/commit/e6ce614fa67ed699e27320faa6f9e06459dc94ba>`_ Update bin/pkg/make_man to support the new file layout
| `2.1dev-210-g40ad61a17 <https://github.com/opensvc/opensvc/commit/40ad61a17ac3ba491d66f0cc1a37e9b7621f622e>`_ Update bin/pkg/make_doc for new files organisation
| `2.1dev-209-g24934d4d0 <https://github.com/opensvc/opensvc/commit/24934d4d068217e3a59d2745904e8637850b211f>`_ Remove obsolete bin/pkg/make_tests
| `2.1dev-208-gb08f1b785 <https://github.com/opensvc/opensvc/commit/b08f1b7853745866fee09488f0c51432b1149aaa>`_ Set PYTHONPATH for the pylint run in travis
| `2.1dev-207-g00edd104e <https://github.com/opensvc/opensvc/commit/00edd104ec792f0d1bdf65860a8041efc617e0d8>`_ Update the pylint paths to check in the travis configuration file
| `2.1dev-206-g5dc3fdcb6 <https://github.com/opensvc/opensvc/commit/5dc3fdcb6e74f73b3013a5f30d89a3cdc2a851fc>`_ [test] Fix add cfg from when relative from path is used
| `2.1dev-205-gbb65bd53f <https://github.com/opensvc/opensvc/commit/bb65bd53f80c1e0e631e8287597d1f08c4a0d0e1>`_ [test] Update tox pytest command with new location
| `2.1dev-204-gdcc3571a4 <https://github.com/opensvc/opensvc/commit/dcc3571a4b72c2fc1f75859fa4fcf55de5a3e278>`_ [test] fix with new command.mgr
| `2.1dev-203-gfc3d3b4e7 <https://github.com/opensvc/opensvc/commit/fc3d3b4e7b7750b746f1cb01fbd563d3fe8356cc>`_ [test] fix with new location
| `2.1dev-202-gb7f00ee6c <https://github.com/opensvc/opensvc/commit/b7f00ee6cbdf49c65e4f986d17b3dcdb86310246>`_ [test] Move tests from opensvc/tests/ to opensvc/
| `2.1dev-201-ga221085a4 <https://github.com/opensvc/opensvc/commit/a221085a46f3a4affe9fcddc008ce666651f61e8>`_ Fix "om daemon start"
| `2.1dev-200-ge4a6df5a6 <https://github.com/opensvc/opensvc/commit/e4a6df5a66e80f849d201ced7376c97a9467fc85>`_ Rename the lib directory to 'opensvc'
| `2.1dev-199-g2dfc1ff1d <https://github.com/opensvc/opensvc/commit/2dfc1ff1d7cdd54601e7e9c04c623fc9ac24a691>`_ [test] Remove useless sys.path update
| `2.1dev-198-g9827207e1 <https://github.com/opensvc/opensvc/commit/9827207e1c59b9a17b9d8d8e53694de5ba142256>`_ [test] Fix TestServiceActionWithoutPrivs with new location of geteuid
| `2.1dev-197-ga186df960 <https://github.com/opensvc/opensvc/commit/a186df96067ab55020323a6875de6a0bee84471e>`_ [test] Add test for check_privs
| `2.1dev-196-g72a18e607 <https://github.com/opensvc/opensvc/commit/72a18e6078a43e5337a9f3e4ed04e63451f5c707>`_ [test] Fix import to new libs location
| `2.1dev-195-gef3048336 <https://github.com/opensvc/opensvc/commit/ef3048336326854729fc1b6b606700f3faabce3a>`_ [test] Fix test failures on python 27 (extra __init__.py)
| `2.1dev-194-g4a85cab23 <https://github.com/opensvc/opensvc/commit/4a85cab23ca8d2080ff67b2bc75dc52bd3168616>`_ Remove the now unused lib/osvcd.py
| `2.1dev-193-gd6eaa3a41 <https://github.com/opensvc/opensvc/commit/d6eaa3a4103a6a1e7711fe83647665b69d39e588>`_ Move commands to the 'commands' package
| `2.1dev-192-g5b71bd75c <https://github.com/opensvc/opensvc/commit/5b71bd75cdf1289676d611931d6b20cc5ed96cc0>`_ Move rcNsr and rcBrocade to the 'drivers' package
| `2.1dev-191-geddd7a04f <https://github.com/opensvc/opensvc/commit/eddd7a04fd46cc6c6e28e580c9d1c048a7013f31>`_ Move rcCollectorCli to core.collector.cli
| `2.1dev-190-g54221c908 <https://github.com/opensvc/opensvc/commit/54221c908d56f05b06f7a16e50d559dda448ccce>`_ Move rcGce and rcAmazon to utilities.subsystems
| `2.1dev-189-g2511ad4fc <https://github.com/opensvc/opensvc/commit/2511ad4fc2cc346be2ed300d83ad96fcc8963a27>`_ Move rcPgLinux to drivers.pg.linux
| `2.1dev-188-gd04e69ad3 <https://github.com/opensvc/opensvc/commit/d04e69ad317242731af909baf88f556c5bc3bb29>`_ Move wmi and winstats to the 'foreign' package
| `2.1dev-187-g51447ba2c <https://github.com/opensvc/opensvc/commit/51447ba2ca5b1c9d55f1b91ec532eecf74501ca6>`_ Rename xmlrpcClient to core.collector.rpc
| `2.1dev-186-g048848f2f <https://github.com/opensvc/opensvc/commit/048848f2f9914d7322f4cb7972859095a76496c4>`_ Rename the 'rcGlobalEnv' module to 'env'
| `2.1dev-185-gaab982d29 <https://github.com/opensvc/opensvc/commit/aab982d29b9cda61623a5ad7d85701ad9d6c5802>`_ Dispatch rcUtilities functions
| `2.1dev-184-ga43445076 <https://github.com/opensvc/opensvc/commit/a43445076ec2e7b1d716ef60f769bbb6cd2b83c9>`_ Remove all unused imports
| `2.1dev-183-gf83ec35a7 <https://github.com/opensvc/opensvc/commit/f83ec35a71791ed65f5279a988e48fe277f1fb49>`_ Move fcache functions from rcUtilities to utilities.fcache
| `2.1dev-182-g694b7b782 <https://github.com/opensvc/opensvc/commit/694b7b78261081f9e92fc1a02cbdc13ff56e5df2>`_ Move iter_drivers() and import_driver() from rcUtilities to utilites.drivers
| `2.1dev-181-ge58ebf105 <https://github.com/opensvc/opensvc/commit/e58ebf105f61981a026decb6b04ec682d309ade5>`_ [test] fix missing import simce move extconfig
| `2.1dev-180-g12fbf72f2 <https://github.com/opensvc/opensvc/commit/12fbf72f2a1b784b34ede3dc779c97716ab98b30>`_ Fix optparser.get_parser version value
| `2.1dev-179-ge740bb8e6 <https://github.com/opensvc/opensvc/commit/e740bb8e6e8cb6a1fcef73cc11b994ed8d99de3e>`_ [test] Add test nodemgr print devs
| `2.1dev-178-g9c824022e <https://github.com/opensvc/opensvc/commit/9c824022ee49f1e23d84b1d3ff5e347e9ec480ee>`_ Add noop devtree for darwin
| `2.1dev-177-g4ac6a9c5d <https://github.com/opensvc/opensvc/commit/4ac6a9c5d309501d1e7af1b18bbe38c5ef8a1468>`_ Fix eval_expr function import in tests
| `2.1dev-176-g3db6b8cfa <https://github.com/opensvc/opensvc/commit/3db6b8cfaee835976ff4028437ca2f10516318f6>`_ Move the session cache functions to utilities.cache
| `2.1dev-175-g0c50663b0 <https://github.com/opensvc/opensvc/commit/0c50663b0787620433e8e2eed89df07d96011201>`_ Add a __init__.py to utilities.subsystems.lvm
| `2.1dev-174-gb8bbd9da7 <https://github.com/opensvc/opensvc/commit/b8bbd9da70554f1016544f278cb20387257f7bae>`_ Move rcEthtool to utilities.subsystems.ethtool
| `2.1dev-173-gd3e0a2498 <https://github.com/opensvc/opensvc/commit/d3e0a2498133daaaa1a9e61663e199ce67a13966>`_ Move rcLvmAIX to utilities.subsystems.lvm.aix
| `2.1dev-172-g4aa657bbc <https://github.com/opensvc/opensvc/commit/4aa657bbc456d35567ca8860712c015d5c1de2c2>`_ Move rcBtrfs to utilities.subsystems.btrfs
| `2.1dev-171-gf5093b82a <https://github.com/opensvc/opensvc/commit/f5093b82ae55f08accac0a42dc360007bfa9e318>`_ Move rcVeritas to utilities.subsystems.veritas
| `2.1dev-170-gad3d7abdd <https://github.com/opensvc/opensvc/commit/ad3d7abddfd05d2af6a580be36b4bf7048b3aa81>`_ Move rcZone and rcZfs to utilitities.subsystems
| `2.1dev-169-gc4f393199 <https://github.com/opensvc/opensvc/commit/c4f393199f157035d80466ed0bc937b630e73b5c>`_ Move rcAdvfs to utilities.subsystems.advfs
| `2.1dev-168-g0c3c222ec <https://github.com/opensvc/opensvc/commit/0c3c222eca7f88935aff4e99c7fc9b64c67a4b78>`_ Move rcConfigParser to utilities.configparser
| `2.1dev-167-gb74c10a4e <https://github.com/opensvc/opensvc/commit/b74c10a4e7f6e3e77eae737c8e8e40633cb7365c>`_ Move read_cf() and read_cf_comments() to core.extconfig
| `2.1dev-166-ga1c1d33c8 <https://github.com/opensvc/opensvc/commit/a1c1d33c8ac37c1d698f589d57f08c37ed034951>`_ Move rcContainer to utilities.subsystems.docker
| `2.1dev-165-g66e4c38f9 <https://github.com/opensvc/opensvc/commit/66e4c38f969b7c9a2f01308edae70b363d7aedf3>`_ More moves
| `2.1dev-164-g167998233 <https://github.com/opensvc/opensvc/commit/1679982336025c180be91d4c618d4b72946b7a92>`_ [test] Fix send sysreport expected call_count
| `2.1dev-163-g60708483d <https://github.com/opensvc/opensvc/commit/60708483da80537e3c64b63a6f76718f379889d0>`_ Move rcWakeOnLan to utilities.wakeonlan
| `2.1dev-162-g9593d5e7d <https://github.com/opensvc/opensvc/commit/9593d5e7dc043f8df168eebc120581bd9496022f>`_ Move rcLogger to core.logger
| `2.1dev-161-gd7105db4e <https://github.com/opensvc/opensvc/commit/d7105db4e73464c23756f66215e6d9dd1ede636f>`_ Move rcSysreport -> core.sysreport
| `2.1dev-160-g87f4bf4c6 <https://github.com/opensvc/opensvc/commit/87f4bf4c6fa2682702c2408afddd53742e8bdc0d>`_ Move rcAsset to utilities.asset
| `2.1dev-159-g38baac285 <https://github.com/opensvc/opensvc/commit/38baac2855a0fc145f25e1849e8379904569bba1>`_ Move rcDiskInfo to utilities.diskinfo
| `2.1dev-158-g3e0598949 <https://github.com/opensvc/opensvc/commit/3e0598949e1ca2fd32a55af75ed63b086f5571e9>`_ Move rcDevTree to utilities.devtree
| `2.1dev-157-g32a1093e9 <https://github.com/opensvc/opensvc/commit/32a1093e9a36ae8a38104c64f9658b629ac4774e>`_ Move collector and compliance to core.collector and core.compliance
| `2.1dev-156-g1cdd3850a <https://github.com/opensvc/opensvc/commit/1cdd3850a2f6b6307b41757bcdcbe78af5d9424c>`_ Move rcScheduler to core.scheduler
| `2.1dev-155-g53d3a5960 <https://github.com/opensvc/opensvc/commit/53d3a5960e64bf0d99c115a9dd3ab23e6f4bd86f>`_ Move the cloud drivers to drivers.cloud
| `2.1dev-154-ge772b11d4 <https://github.com/opensvc/opensvc/commit/e772b11d49513c6bc8d7bc3d8ba36d1eec9cc927>`_ Move all foreign packages to foreign/
| `2.1dev-153-g3b8a6531f <https://github.com/opensvc/opensvc/commit/3b8a6531fb977613b514108f4fa4f647e919557d>`_ Fix the daemon with py2
| `2.1dev-152-ga7c72d90e <https://github.com/opensvc/opensvc/commit/a7c72d90e4e31df000feba568af45ac1e223e755>`_ Move converters to utilities.converters
| `2.1dev-151-g5a504ef3b <https://github.com/opensvc/opensvc/commit/5a504ef3bb3b56151b339b83a2c8aba75f4c1f32>`_ Fix missing datetime import from test_utilities
| `2.1dev-150-g9f9d6dd2f <https://github.com/opensvc/opensvc/commit/9f9d6dd2f5fef6b38f3ea4b23bdb958aa4e9ab26>`_ Move contexts to core.contexts
| `2.1dev-149-g46862e31f <https://github.com/opensvc/opensvc/commit/46862e31f033e03b1c5003ee542c0deffe529db1>`_ Move ip converters and getaddr from rcUtilities to utilities.net
| `2.1dev-148-gf13dcf59b <https://github.com/opensvc/opensvc/commit/f13dcf59be0ec0917fca8f85898ace0c53f69fb9>`_ Fix a pytest error on moved poolDirectory
| `2.1dev-147-g8e9301610 <https://github.com/opensvc/opensvc/commit/8e930161036ba88509d2f46bd2ee4118ce2c9c3a>`_ Move comm to core.comm
| `2.1dev-146-g395b52617 <https://github.com/opensvc/opensvc/commit/395b52617e5b94cc5d0d3a48bfa41fff232b2be3>`_ Move freezer to core.freezer
| `2.1dev-145-gf6b243001 <https://github.com/opensvc/opensvc/commit/f6b24300110512453f9fe4a7ac7f65d682c4930e>`_ Move lock to utilities.lock
| `2.1dev-144-g2e3db7b4e <https://github.com/opensvc/opensvc/commit/2e3db7b4ef0c06758d639bccb852b06ca5356772>`_ Move keywords to core.keywords
| `2.1dev-143-g40edd88fd <https://github.com/opensvc/opensvc/commit/40edd88fd27f0cef4f4b26df816450a74cbf4360>`_ Move extconfig to core.extconfig
| `2.1dev-142-g1d0893225 <https://github.com/opensvc/opensvc/commit/1d08932259f4c28ada01a9e5d8ed139df1268426>`_ Move network to core.network
| `2.1dev-141-g175429412 <https://github.com/opensvc/opensvc/commit/175429412d6a81897990ca3df0cde58007d96d45>`_ Move the BasePool definition to core.pool
| `2.1dev-140-g0443eb0c5 <https://github.com/opensvc/opensvc/commit/0443eb0c5a8e53a943bca4f213726804506f25d4>`_ Move storage to utilities.storage
| `2.1dev-139-g6a91bf964 <https://github.com/opensvc/opensvc/commit/6a91bf9649250002e49984cd1c86f82157227085>`_ Move svcBuilder to core.objects.builder
| `2.1dev-138-g8a8f2e067 <https://github.com/opensvc/opensvc/commit/8a8f2e06716a77704200037902e14efcc19135f8>`_ Move the pool drivers to drivers.pool.<drv>[.<sysname>]
| `2.1dev-137-g4e9dd1715 <https://github.com/opensvc/opensvc/commit/4e9dd1715e53cf7d142359f0298726cda6246d35>`_ Move rcMd5 to utilities.hash.md5
| `2.1dev-136-g2028cf54e <https://github.com/opensvc/opensvc/commit/2028cf54e8376afbcee4f1eba190e23f6bbe74bb>`_ Move rcStatus as core.status
| `2.1dev-135-g4543f3145 <https://github.com/opensvc/opensvc/commit/4543f31454705924c8a328a1221caac8f55c3c15>`_ Move exceptions to core.exceptions
| `2.1dev-134-gf57ed28ff <https://github.com/opensvc/opensvc/commit/f57ed28ff39628e4a4f2008908fe89e3d8ff608f>`_ Move resources and resourceset modules to the core package
| `2.1dev-133-gd4d318642 <https://github.com/opensvc/opensvc/commit/d4d318642972a95eaabb1921c5630915028590ca>`_ Rename excError to Error
| `2.1dev-132-g68421d655 <https://github.com/opensvc/opensvc/commit/68421d655999e12eefc8137957e3e7ec5baf54c1>`_ Rename excNotSupported to NotSupported
| `2.1dev-131-gd9e99a9bb <https://github.com/opensvc/opensvc/commit/d9e99a9bb70d10ef45fcc6561b20e0643f4feb61>`_ Rename excNotAvailable to NotAvailable
| `2.1dev-130-g9c3f20aa5 <https://github.com/opensvc/opensvc/commit/9c3f20aa5d495050d5ba12f74d9c5455b6ac3f97>`_ Rename excScsiPrNotsupported to ScsiPrNotsupported
| `2.1dev-129-g6b78dd661 <https://github.com/opensvc/opensvc/commit/6b78dd661a1836d5160815b25af820469015d9c7>`_ Rename excInitError to InitError
| `2.1dev-128-g22aa7c37a <https://github.com/opensvc/opensvc/commit/22aa7c37a9fc403fa5628e6ca393b1a4b7449a90>`_ Rename excAbortAction to AbortAction
| `2.1dev-127-g30179fc27 <https://github.com/opensvc/opensvc/commit/30179fc27983c2676c216b2a448281b18e6d76c5>`_ Rename excContinueAction to ContinueAction
| `2.1dev-126-ge99b2059d <https://github.com/opensvc/opensvc/commit/e99b2059d4cfa71e925f535a7b239cd653237fa3>`_ Rename excEndAction to EndAction
| `2.1dev-125-g809f10d09 <https://github.com/opensvc/opensvc/commit/809f10d0977697ec1989bcacd7785dc738ab31a2>`_ Rename excUndefined to Undefined
| `2.1dev-124-g1749ea37a <https://github.com/opensvc/opensvc/commit/1749ea37add46e9667af7f9184671ae29c85d243>`_ Rename excSignal to Signal
| `2.1dev-123-ga77f4e148 <https://github.com/opensvc/opensvc/commit/a77f4e148e89e556e4d09e1cfc853a1a2f2e6cf5>`_ Rename excAlreadyDone to AlreadyDone
| `2.1dev-122-g0384b58c6 <https://github.com/opensvc/opensvc/commit/0384b58c6ff752c0cf5e1986cb9da91c9de8e7a6>`_ Rename excVersion to Version
| `2.1dev-121-g6124cc8bb <https://github.com/opensvc/opensvc/commit/6124cc8bb0ecfb3ad7ab3cb616d32092641ec70a>`_ Rename excEncapUnjoinable to EncapUnjoinable
| `2.1dev-120-g3e980d75c <https://github.com/opensvc/opensvc/commit/3e980d75c6f55c3427033a26b80ff0b709c53ded>`_ Make all exceptions derive from OsvcException instead of Exception
| `2.1dev-119-ga39ef3d6a <https://github.com/opensvc/opensvc/commit/a39ef3d6a72b29cc6bd090fac1e6cdc9a1cc068a>`_ Move rcExceptions to the exceptions package
| `2.1dev-118-gb3a503760 <https://github.com/opensvc/opensvc/commit/b3a5037604db15db2a34d0ef88926f672f86b4bf>`_ [drivers] Add missing __init__.py for python2
| `2.1dev-117-g883d2a42f <https://github.com/opensvc/opensvc/commit/883d2a42f419501050b7bda4dab671d4b8ebfdfa>`_ [resource] Lint
| `2.1dev-116-g712f48254 <https://github.com/opensvc/opensvc/commit/712f4825434804fecd0ef70c1c910f551c1d3f8c>`_ [resource] Pep8
| `2.1dev-115-gf4ed49b13 <https://github.com/opensvc/opensvc/commit/f4ed49b13ae58090c35640f4576892eb1a6e3f8b>`_ [resource] Optimize imports
| `2.1dev-114-gb054a0afa <https://github.com/opensvc/opensvc/commit/b054a0afaa9b81fc5732dded8c100152b0f36b3d>`_ [resource] Fix promote_dev_rw
| `2.1dev-113-g8bca5a8aa <https://github.com/opensvc/opensvc/commit/8bca5a8aa6e292d960d967fc0108827d3c92c3d7>`_ Move rcSsl to utilities.ssl
| `2.1dev-112-g98f0fcbb3 <https://github.com/opensvc/opensvc/commit/98f0fcbb3346544c4d466f2d44395a0410d4ae22>`_ [test] Fix test_nodemgr_daemon.py for new daemon.main
| `2.1dev-111-g9475f1737 <https://github.com/opensvc/opensvc/commit/9475f173738736be8439858d30a3bebfed2aadfd>`_ [test] Fix test_nodemgr.py for new node location
| `2.1dev-110-gcb54dd694 <https://github.com/opensvc/opensvc/commit/cb54dd6948460949e78f74b8a5295dfdb2f8eba6>`_ [test] Use native import in test_fs_flag.py
| `2.1dev-109-g3a2ad702f <https://github.com/opensvc/opensvc/commit/3a2ad702feba88aa11faa8425000bb578906dcb6>`_ [test] Fix Svc import in test_svc.py
| `2.1dev-108-gb00a344f0 <https://github.com/opensvc/opensvc/commit/b00a344f0021f6da39c5fa8b256e173796155314>`_ [test] Change daemon.main.main signature with args=None, simplify tests
| `2.1dev-107-ga81731070 <https://github.com/opensvc/opensvc/commit/a817310706decb58494399999bb0913db33cf81b>`_ Move array drivers to drivers.array
| `2.1dev-106-g0497287eb <https://github.com/opensvc/opensvc/commit/0497287eb4147f338180783f79ebee860e319773>`_ Move the object keywords dictionnaries to core.objects
| `2.1dev-105-g1c33fb03c <https://github.com/opensvc/opensvc/commit/1c33fb03c704f1f58dbca57d2a9dd116bc9f0a94>`_ Move resData::Data to resources::DataResource
| `2.1dev-104-gbc565713f <https://github.com/opensvc/opensvc/commit/bc565713f95b2a3281c7f4f9bdd00ee5eaa11b8c>`_ Move svc, vol, cfg, sec, usr and ccfg objects to core.objects
| `2.1dev-103-gcc2af967c <https://github.com/opensvc/opensvc/commit/cc2af967cc48a2952a1dd6bbd098f9069fb527d0>`_ Move node to core.node
| `2.1dev-102-gd9da3571a <https://github.com/opensvc/opensvc/commit/d9da3571a85fc2cdc38e9d0fcfe95b9aa1d3c67b>`_ Fix py2 print() exception in utilities.proc
| `2.1dev-101-gb8429f6bf <https://github.com/opensvc/opensvc/commit/b8429f6bfa73e1f4c7727ab17bdc538499d84093>`_ Don't start daemon on import osvcd
| `2.1dev-100-gfd16678fe <https://github.com/opensvc/opensvc/commit/fd16678fe51777a590c07eb50be03cf965014b4c>`_ [test] Update proc import with its new location
| `2.1dev-99-g6ec556f82 <https://github.com/opensvc/opensvc/commit/6ec556f8249e6d687c41d13e6bc81923788d303b>`_ [test] Update try_decode import location
| `2.1dev-98-gfc57b87c9 <https://github.com/opensvc/opensvc/commit/fc57b87c92493ffd86bc2080d08175a3d7f1fc32>`_ [test] Remove unused import from test_provision.py
| `2.1dev-97-g0213a55ad <https://github.com/opensvc/opensvc/commit/0213a55ad9db77c868ef6bd3c69497c3a64a51a9>`_ [test] Fix which mocker with its new location]
| `2.1dev-96-g78ba019e3 <https://github.com/opensvc/opensvc/commit/78ba019e3714489653e460b1ba765dbfb53a5d72>`_ Move is_glob() from rcUtilities to utilities.string
| `2.1dev-95-g5b83cc3cd <https://github.com/opensvc/opensvc/commit/5b83cc3cd70b79ae2c49b355dd0284c8156a4e68>`_ Move banner() from rcUtilities to utilities.render.banner
| `2.1dev-94-g09adaa94a <https://github.com/opensvc/opensvc/commit/09adaa94ad6488bde53c8a1a41f701673f0e752c>`_ Start dispatching rcUtilities content into the utilities package
| `2.1dev-93-g6d88621d7 <https://github.com/opensvc/opensvc/commit/6d88621d73c91fbd486745d838a7f9afe2406d2d>`_ Fix winservice Deamon import from new location
| `2.1dev-92-g214890bc8 <https://github.com/opensvc/opensvc/commit/214890bc8b83c0adb4ab8af923a8c60649362aad>`_ Ignore lint assignment-from-no-return on pseudo abstract method
| `2.1dev-91-g669aad1a1 <https://github.com/opensvc/opensvc/commit/669aad1a123d802f8289fc8f131229d5d362a332>`_ Remove the now unused HANDLERS list from the listener
| `2.1dev-90-g0f567fa58 <https://github.com/opensvc/opensvc/commit/0f567fa58385af420241af44b275b33889f93e45>`_ Move rcPasswd to utilities.password
| `2.1dev-89-g9370ecee9 <https://github.com/opensvc/opensvc/commit/9370ecee930c072156ec236a911e29266de95114>`_ Replace rcMounts by utilities mounts
| `2.1dev-88-g1b8ad8e03 <https://github.com/opensvc/opensvc/commit/1b8ad8e035939e2b4625db605efb0d88005b3165>`_ Lint utilities mounts files
| `2.1dev-87-ge86f4519e <https://github.com/opensvc/opensvc/commit/e86f4519eca3f9f4891cde264f18ca5e458dde6b>`_ Reformat utilities mounts files
| `2.1dev-86-gdd8e1d92d <https://github.com/opensvc/opensvc/commit/dd8e1d92d60f94a555c3c52ea3d1ca950d9eadd4>`_ [test] Fix test_term for its new location
| `2.1dev-85-g24682d35a <https://github.com/opensvc/opensvc/commit/24682d35ad6bef88c685aae679a84decc20b2775>`_ [Mounts] Ensure same naming logic with other base class in utilities, use relative import for base class
| `2.1dev-84-gac500cca3 <https://github.com/opensvc/opensvc/commit/ac500cca31f8cd0e6522abf4083ee19b58f8bcf0>`_ Move the daemon code in the daemon package
| `2.1dev-83-gf91003fe3 <https://github.com/opensvc/opensvc/commit/f91003fe31ee22ccd36179b171e08d02041c8474>`_ Move rcPkg to utilities.packages.update and utilities.packages.list
| `2.1dev-82-g90f76039d <https://github.com/opensvc/opensvc/commit/90f76039d996c11f99b9d70299e9d543506bab2b>`_ [Mounts] Move rcMounts to utilities/mounts
| `2.1dev-81-gab1141e06 <https://github.com/opensvc/opensvc/commit/ab1141e069a052654bdb72f8b76b97fa92b751cf>`_ Move snap to utilities.snap
| `2.1dev-80-gad780a6d9 <https://github.com/opensvc/opensvc/commit/ad780a6d96390b0bf1bbc7aa3da335c7d4b7abd5>`_ Move hostid to utilities.hostid
| `2.1dev-79-g8c24d53dd <https://github.com/opensvc/opensvc/commit/8c24d53dd5baef36f5afe21367653b7450634c65>`_ Move rcSystemd to utilities.systemd
| `2.1dev-78-ge656d7e0e <https://github.com/opensvc/opensvc/commit/e656d7e0e420762cb53b0936bc245bfc7d98b8ec>`_ [lint] Add disable no-member python 2 on sec.py
| `2.1dev-77-g07930e53a <https://github.com/opensvc/opensvc/commit/07930e53a91ef945d2ae320ca03f51466f6020cd>`_ [test] Fix test with new module location
| `2.1dev-76-g0879b4c8a <https://github.com/opensvc/opensvc/commit/0879b4c8a8ce909e84f9ece43a0ea75d5352397c>`_ Move rcIfconfig to the utilities.ifconfig package
| `2.1dev-75-g0c037b463 <https://github.com/opensvc/opensvc/commit/0c037b46326663f358bee7c84ba1f1fc8a3d578b>`_ Add missing import in utilities.render.term
| `2.1dev-74-g542c23b60 <https://github.com/opensvc/opensvc/commit/542c23b603d2fe584a89bea994f82a64408e2927>`_ Move term_width() to utilities.render.term
| `2.1dev-73-gab2f1c891 <https://github.com/opensvc/opensvc/commit/ab2f1c891bd989b6f70e37fd6cde31ff6c63c28a>`_ Move fmt_service as a utilities.render.instance package
| `2.1dev-72-g8e9673bf7 <https://github.com/opensvc/opensvc/commit/8e9673bf703c99c34594b2f812dac9a54eee3974>`_ Move fmt_cluster as a utilities.render.cluster package
| `2.1dev-71-g98ff5e75a <https://github.com/opensvc/opensvc/commit/98ff5e75a508cff8d0149a4e26a0699641315da8>`_ [test] Fix import location
| `2.1dev-70-gfc1c8129c <https://github.com/opensvc/opensvc/commit/fc1c8129c1b61ccb4055bf36a44dc48441f50096>`_ [test] Fix tests for python2 & python3
| `2.1dev-69-gf12f332eb <https://github.com/opensvc/opensvc/commit/f12f332ebb201b07ac15c4583762c57f89a33b58>`_ Move rcColor to utilities.render.color
| `2.1dev-68-g6f116655e <https://github.com/opensvc/opensvc/commit/6f116655e5b15a8066f7f23013cb669907f758ed>`_ Add missing lib/utilities/render/__init__.py
| `2.1dev-67-gd3f85fc6a <https://github.com/opensvc/opensvc/commit/d3f85fc6a682853e47de24c2c00d0e708d799139>`_ Move renderers utilities
| `2.1dev-66-g9cd6264da <https://github.com/opensvc/opensvc/commit/9cd6264dae01cefebbb342ef3a59b36cc0a76b39>`_ Add the 'utilities' package to the pylint run in the travis configuration
| `2.1dev-65-ge13819d69 <https://github.com/opensvc/opensvc/commit/e13819d69c372f8e3a0572ff733dad0b01449930>`_ Add some missing __init__.py in drivers/resource/
| `2.1dev-64-gc64a0c538 <https://github.com/opensvc/opensvc/commit/c64a0c53864271f64e22e79d88887c2cf9ee058c>`_ py2 compat fix for the new checkers lookup code
| `2.1dev-63-gd61fff929 <https://github.com/opensvc/opensvc/commit/d61fff9290a2388f25a335a264357bd72d47d0fe>`_ Move checkers to the drivers.check package
| `2.1dev-62-gf3bb9f5b6 <https://github.com/opensvc/opensvc/commit/f3bb9f5b674770f6635ea4d0e110991fa48a85b2>`_ Move rcLoop<sysname> into the utilities.devices package
| `2.1dev-61-g627ebeacc <https://github.com/opensvc/opensvc/commit/627ebeacc70515fcb6a2c0f52b9e40120f7cee94>`_ Dispatch rcUtilities<sysname> functions in utilities subpackages
| `2.1dev-60-g593429887 <https://github.com/opensvc/opensvc/commit/593429887933490a89882903972cb249aed25197>`_ [driver] Fix missing arg in ip.netfs __init__ super call
| `2.1dev-59-g38a5526fd <https://github.com/opensvc/opensvc/commit/38a5526fdaa5d4b96f15a693651be36fe0f428ca>`_ [TEST] Ensure we can create resource for all drivers
| `2.1dev-58-gd9150c0bd <https://github.com/opensvc/opensvc/commit/d9150c0bd0a2010dc5eaa1c365d4317b2ed8cb26>`_ Remote a debug statement from utilities.ping
| `2.1dev-57-g3f568e6d0 <https://github.com/opensvc/opensvc/commit/3f568e6d0f79f0c146827be4f29ff8c07504faa0>`_ Add the utilities and utilities.ping subpackages
| `2.1dev-56-g8d5ecc80f <https://github.com/opensvc/opensvc/commit/8d5ecc80f3d5da15daa3712dae3bc722835520ce>`_ Factorize all drivers prototypes and kwargs in parent class __init__ calls
| `2.1dev-55-g9cceca642 <https://github.com/opensvc/opensvc/commit/9cceca6423f01f04f1ed4284259664f7026f4308>`_ Fix getaddr() fallback in the base container driver
| `2.1dev-54-gf5e7e944f <https://github.com/opensvc/opensvc/commit/f5e7e944fecc27040c906d4d3096987089f7a3e8>`_ Use new-style class for rcMounts
| `2.1dev-53-gfac5810b2 <https://github.com/opensvc/opensvc/commit/fac5810b2e27bb8471b36acbed8882af219af4fc>`_ Fix mimport() pytest
| `2.1dev-52-gb7a443b86 <https://github.com/opensvc/opensvc/commit/b7a443b868c27a96bae3b8663ad5afaceb01b167>`_ Fix the ximport() pytest
| `2.1dev-51-g1838c3e90 <https://github.com/opensvc/opensvc/commit/1838c3e90d0879af944809d3c0f5058a85005e87>`_ Fix a possible IndexError exception in list_services()
| `2.1dev-50-g2f3a3a51d <https://github.com/opensvc/opensvc/commit/2f3a3a51d874e3cf2b3b30f72aa71578c5b7af63>`_ Fix the super() arguments in the container.openstack driver
| `2.1dev-49-g6991ff33f <https://github.com/opensvc/opensvc/commit/6991ff33fa3f0071472d9fd40635a9d8d8666520>`_ py2 compat for all super() calls
| `2.1dev-48-gb9700a2e4 <https://github.com/opensvc/opensvc/commit/b9700a2e43a64f291828a2b136a650df164d4ba9>`_ Fix missing self arg in drivers.container.zone __init__
| `2.1dev-47-g3e6630a56 <https://github.com/opensvc/opensvc/commit/3e6630a56d03374a9fcdcb7d7f236688956fefa8>`_ Fix repeated duplicate init arg for driver disk hpvm
| `2.1dev-46-gcc815a67f <https://github.com/opensvc/opensvc/commit/cc815a67fc594c4b5eb05f811dda60717f640537>`_ [test] Prepare driver resource instance create tests
| `2.1dev-45-g8d635f850 <https://github.com/opensvc/opensvc/commit/8d635f8500cce217c2d1ae6b31606a9a50409dcf>`_ Fix driver_import for HP-UX, add initial test for resources
| `2.1dev-44-gb48ecefcb <https://github.com/opensvc/opensvc/commit/b48ecefcb2c30ebc5b49f4aadf3ff0a2794f7828>`_ Cleanup unused local vars in scsireserv code
| `2.1dev-43-gee7b0363d <https://github.com/opensvc/opensvc/commit/ee7b0363d393da65056a2b90db1149cf3a3eaad7>`_ Optimize imports in scsireserv code
| `2.1dev-42-g063886d54 <https://github.com/opensvc/opensvc/commit/063886d54df1792e4c17c6b2be1b948f21ceab6f>`_ Reformat scsireserv code
| `2.1dev-41-g350f04609 <https://github.com/opensvc/opensvc/commit/350f046099277f48e0a8acb65cab4b43d6a3c413>`_ Move the scsireserv driver to drivers/resource/disk/ (class name is now DiskScsireserv)
| `2.1dev-40-g1aaf603a4 <https://github.com/opensvc/opensvc/commit/1aaf603a4993144b0ba1ec10e979b337f9839533>`_ Merge the provisioning method from prov files into the drivers/resource/ tree
| `2.1dev-39-g9a7c1728f <https://github.com/opensvc/opensvc/commit/9a7c1728fc4585e9617f49a9692973b349abe212>`_ Rename fs.directory provisioner name for FsDirectory driver
| `2.1dev-38-g16d268d9a <https://github.com/opensvc/opensvc/commit/16d268d9a0349165793298b41f722175c1c6f66a>`_ [test] Use new fs flag class name: FsFlag
| `2.1dev-37-ge31139a64 <https://github.com/opensvc/opensvc/commit/e31139a64350b9827fd9ab0007d1007b005eeaae>`_ [test] Use new class name for docker contaziner (ContainerDocker)
| `2.1dev-36-gb96d9482f <https://github.com/opensvc/opensvc/commit/b96d9482fc281cc6736696f0091c395d65d78d8f>`_ [test] Use fs new class name
| `2.1dev-35-g88ebf31db <https://github.com/opensvc/opensvc/commit/88ebf31db70bdca89a125cf642411126c617f307>`_ [test] test_has_disk_vg_resource use new class name DiskVg
| `2.1dev-34-g5fbe2261b <https://github.com/opensvc/opensvc/commit/5fbe2261b15658fa0d049e63249c4ba355b68b3c>`_ [test] ximport test use provVolume and Prov instead of resFs Mount
| `2.1dev-33-gd7c026183 <https://github.com/opensvc/opensvc/commit/d7c026183c997f25990bae5297bb1538b141b3ce>`_ [test] mimport use new fs linux class name (Fs)
| `2.1dev-32-g7558094d4 <https://github.com/opensvc/opensvc/commit/7558094d418647a9693cbef8109dadd95df67c2d>`_ Adapt bin/pkg/make_doc to the new driver organization
| `2.1dev-31-g6739d52f6 <https://github.com/opensvc/opensvc/commit/6739d52f62f8da1a27f04d96c12443cc3231454a>`_ Move the scsireserv driver to drivers/resource/disk/
| `2.1dev-30-gba83ae075 <https://github.com/opensvc/opensvc/commit/ba83ae075e59f283f9e5ca43aaf9f3b2b1a93b4f>`_ More imports reordering
| `2.1dev-29-gbc42af4dc <https://github.com/opensvc/opensvc/commit/bc42af4dc3032ce9027f5da724dde601f5a4638a>`_ Add missing __init__.py in the drivers directory
| `2.1dev-28-gdb4ef759e <https://github.com/opensvc/opensvc/commit/db4ef759eb281f97a4fe79b94b85f424a6dbc3c5>`_ Code reorganization
| `2.1dev-27-g56c4ab866 <https://github.com/opensvc/opensvc/commit/56c4ab86626494762958bffe8521c142a2cc049e>`_ Remove useless method from the sync.btrfs driver
| `2.1dev-26-g32fd7f6a1 <https://github.com/opensvc/opensvc/commit/32fd7f6a171ba1f4560ae88c67c88beebcec0d68>`_ Don't try to load "subset" driver group drivers from validate_config()
| `2.1dev-25-g6ace871ba <https://github.com/opensvc/opensvc/commit/6ace871baa868f506dc8bdf45b1247935c892ee4>`_ Better mimport() lookup failure exception message
| `2.1dev-24-g61ecc762f <https://github.com/opensvc/opensvc/commit/61ecc762f78e2f24a72dc3fbd59800bd63260ab6>`_ Make sure the necessary drivers are loaded when validating a config
| `2.1dev-23-g1e6b5846f <https://github.com/opensvc/opensvc/commit/1e6b5846fabf3d454cc175b9ee468202190e3be6>`_ Load sync.rsync driver before using its kwstore in add_mandatory_syncs()
| `2.1dev-22-g881c51d77 <https://github.com/opensvc/opensvc/commit/881c51d77896ed3ab34fb7d207c4f15e3d10d5cc>`_ Move the driver kwstore merge into the main kwstore to the first mod import
| `2.1dev-21-g7b2e3178f <https://github.com/opensvc/opensvc/commit/7b2e3178f421d03b85b557b4eb30988e60057368>`_ Add a "name" attribute to KeywordStore
| `2.1dev-20-g40c6549eb <https://github.com/opensvc/opensvc/commit/40c6549eb266ee4b2cecb9686706bb83e7715ccc>`_ Support KeywordStore += Section iadder
| `2.1dev-19-g3fd93c2a6 <https://github.com/opensvc/opensvc/commit/3fd93c2a626c20b73d5626546d764ca2f8f701a4>`_ Better Section::getkey() implementation
| `2.1dev-18-g095801925 <https://github.com/opensvc/opensvc/commit/0958019253dbf893770b4db1ee25fe2ab14f90f4>`_ Add the keyword section to the keyword signature
| `2.1dev-17-gd637a1429 <https://github.com/opensvc/opensvc/commit/d637a142949fbc351053db377d8420aa9fa03dbc>`_ Simplify svcdict::full_kwstore() implementation
| `2.1dev-16-g6aed56d64 <https://github.com/opensvc/opensvc/commit/6aed56d64c8e9227c219160e20bb482405c4cb17>`_ Fix duplicate definition of the "ipdev" keyword in the ip.cni drv
| `2.1dev-15-gf20a964ce <https://github.com/opensvc/opensvc/commit/f20a964ce81d767de4eb78adaba7182a8d6adecb>`_ Fix duplicate definition of the "environment" keyword in the container.docker drv
| `2.1dev-14-g68e48f95c <https://github.com/opensvc/opensvc/commit/68e48f95cec94d5d4d3e483de4d92f52a2ec93d1>`_ Do not allow (rtype, keyword) dup in keywords Section() objects
| `2.1dev-13-ga3ac455e8 <https://github.com/opensvc/opensvc/commit/a3ac455e864552723f30aa799911a2d558f2ddcb>`_ Fix svc default keywords exposed to Data-derived objects
| `2.1dev-12-g9a8745bc6 <https://github.com/opensvc/opensvc/commit/9a8745bc6f1f32cddf39fe9b4dc0b7a0c5e5ec3a>`_ Move keyword definitions to the drivers
| `2.1dev-11-gf60e8b5a3 <https://github.com/opensvc/opensvc/commit/f60e8b5a38f107c8121c5be7601ccc735689921e>`_ Untrack all autogenerated files in usr/share/man/
| `2.1dev-10-gd2be77d2f <https://github.com/opensvc/opensvc/commit/d2be77d2f5bbf2eb083ed9272c7a4f178f287812>`_ Untrack all autogenerated files in usr/share/doc/
| `2.1dev-9-g7b10ad076 <https://github.com/opensvc/opensvc/commit/7b10ad0766aa5fee870ff003aca779333e63bd7b>`_ Remove unused import of mimport from pool and network modules
| `2.1dev-8-g21f4a9423 <https://github.com/opensvc/opensvc/commit/21f4a942373da58d7c9027aeb4d3d4fe1b5822d9>`_ Fix ignored resources with no type
| `2.1dev-7-gbee0212d1 <https://github.com/opensvc/opensvc/commit/bee0212d1c58b9862c315fe73c2297862256048c>`_ Remove the add_<drvgrp>() compat from svcBuilder
| `2.1dev-6-g37de2e7a3 <https://github.com/opensvc/opensvc/commit/37de2e7a3d6b8a32f834f7ce01b987aa1dbd39f0>`_ Fix fs.directory and volume type setting
| `2.1dev-5-gd1683075d <https://github.com/opensvc/opensvc/commit/d1683075d31ac708ca78e2b7d194338609830799>`_ Fix Resource::format_driver_basename when type is None
| `2.1dev-4-ge9366f98c <https://github.com/opensvc/opensvc/commit/e9366f98c19c8e6466c41b70215666c01107993d>`_ Add the reverse_deprecated_keywords attribute to KeywordStore
| `2.1dev-3-g5a6af625b <https://github.com/opensvc/opensvc/commit/5a6af625b0d8c3f32f0ee7e4dc9e526d74463676>`_ Add driver_group and driver_basename to the Resource class attributes
| `2.1dev-2-gf170331d5 <https://github.com/opensvc/opensvc/commit/f170331d5df7011cd8dd812215ab9087d760bc1d>`_ Fix backward compat in builder
| `2.1dev-1-g8e2466b43 <https://github.com/opensvc/opensvc/commit/8e2466b43aed39d7e43cb3cd990e03e6fa33283b>`_ Refactor BaseSvc::__iadd__() for readability
