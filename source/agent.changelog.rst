Changelog
=========


| `2.1-297-g32a25c9b2 <https://github.com/opensvc/opensvc/commit/32a25c9b29fd98c06e7a4509f178bafc02c3c91f>`_ Add a fs.flag freebsd port
| `2.1-296-gae05670cd <https://github.com/opensvc/opensvc/commit/ae05670cd73586fb58b5fcd58d22e66d8ea569ed>`_ Add a dummy utilities.devices freebsd implementation
| `2.1-295-g7cd748512 <https://github.com/opensvc/opensvc/commit/7cd74851210cc946d8f3f1af4b1adef941dd7073>`_ Merge pull request #323 from cgalibern/fix-rebase
| `2.1-294-g82e6044ea <https://github.com/opensvc/opensvc/commit/82e6044ea563a08404d8746394d2bc60bd114dc3>`_ Fix daemon start failure (after node crash, when new pid is same a previous one)
| `2.1-293-gd24b9bb85 <https://github.com/opensvc/opensvc/commit/d24b9bb85c0e59da46e15f61de99fe08d3283613>`_ [test] Add utf8 scenario during edit cfg or secret values
| `2.1-292-gc28fd63e4 <https://github.com/opensvc/opensvc/commit/c28fd63e4831e2344f6a15637180f313d172b4df>`_ [test] Ensure string secret created from files can be edited
| `2.1-291-gfca678527 <https://github.com/opensvc/opensvc/commit/fca678527e360bbe192074a4f75561774d0b2b41>`_ [test] Add spec for edit cfg or secrets
| `2.1-290-g4c30b43fd <https://github.com/opensvc/opensvc/commit/4c30b43fd3b18ef4481906e6958485eb3c74abb6>`_ Fix resource preserved option
| `2.1-289-g632c95768 <https://github.com/opensvc/opensvc/commit/632c9576816d461ac25f435066431df3df6043fc>`_ Disable '--dry-run' for config actions (deploy, create, update, delete, eval, set, get, unset)
| `2.1-288-gf9fb53ecb <https://github.com/opensvc/opensvc/commit/f9fb53ecbb35e5186adc773f831bb07ade92f554>`_ 'om <svc> stop --dry-run' should not freeze service (fix)
| `2.1-287-gf54140b06 <https://github.com/opensvc/opensvc/commit/f54140b063c69a420a5370fca548dbdfccab6efe>`_ [test] Test service default and custom status_schedule
| `2.1-286-ge7b1b64af <https://github.com/opensvc/opensvc/commit/e7b1b64afc05a9fb196769882482277d58814f13>`_ [test] Test service print schedule is correct when tasks
| `2.1-285-g72b578079 <https://github.com/opensvc/opensvc/commit/72b578079ff481cf189e9fa08030da6d197fff15>`_ Update README.md
| `2.1-284-g0a8a6acf9 <https://github.com/opensvc/opensvc/commit/0a8a6acf9ece5b2d1684ea791da410d76e9f3a86>`_ Merge pull request #315 from cgalibern/master-cp-b2.1
| `2.1-283-gadcab6e0c <https://github.com/opensvc/opensvc/commit/adcab6e0c59ffd02b4893adedc655d8d8644d6cd>`_ Fix some lint warning on drbd driver
| `2.1-282-g28ae9cd62 <https://github.com/opensvc/opensvc/commit/28ae9cd62a26d8b2a4d00d725e7b7b298647357d>`_ Fix invalid disk.drbd.mesh capability when module use version 8
| `2.1-281-g3b7958897 <https://github.com/opensvc/opensvc/commit/3b7958897094fd70ff2d7e77b469ca54dca18713>`_ PEP8 drivers.resource.volume
| `2.1-280-g2fc94088d <https://github.com/opensvc/opensvc/commit/2fc94088d342a0c365bcf68e594b7df3026ff46f>`_ Fix stats_meminfo error on Solaris 11.4
| `2.1-279-g525a56a69 <https://github.com/opensvc/opensvc/commit/525a56a6915998c0314bd00dea0bc974bf3beb45>`_ Cleanup dead code since #33fc4e4fb74d80412d45157d436a6d737aa49855
| `2.1-278-gb28ef3d74 <https://github.com/opensvc/opensvc/commit/b28ef3d74f5181d6e691a9de412e5fe652cea131>`_ Fix a share.nfs hang on Linux on showmount
| `2.1-277-g3a44d35e3 <https://github.com/opensvc/opensvc/commit/3a44d35e3b7e5c5eacf999db8f43dc416fd92a9b>`_ Relax shared volumes claim restrictions
| `2.1-276-gbe631728a <https://github.com/opensvc/opensvc/commit/be631728a07e5ab09eb90472ebf1ea653d05c2c4>`_ Accept 'B' unit during convert_size
| `2.1-275-ge7c7b052e <https://github.com/opensvc/opensvc/commit/e7c7b052e906479d468d7386341fb09407f57c74>`_ Don't alert on missing prov kw on section_kwargs() if provision=false
| `2.1-274-gd633eb86a <https://github.com/opensvc/opensvc/commit/d633eb86a45279356dfcb750622ca1d6e2a5cfdc>`_ Fix the provision and unprovision boolean keyword
| `2.1-273-g1360e56e3 <https://github.com/opensvc/opensvc/commit/1360e56e3f35e82f20f0c2a38e455d9b6f105786>`_ Fix resources staying in P state even we up
| `2.1-272-g58699cae0 <https://github.com/opensvc/opensvc/commit/58699cae0cad92abb74b6b9b55ae54fe936b108c>`_ Support more uptime format in the parser called from pushasset
| `2.1-271-g377f533db <https://github.com/opensvc/opensvc/commit/377f533dbb38522b87e479a4774476c567d7d943>`_ Remove a f"" use from the volume resource driver
| `2.1-270-gf29ebcac1 <https://github.com/opensvc/opensvc/commit/f29ebcac1d5241c84be66c5aa233c5f2ab6ea455>`_ Fix undue volume instance stop on user instance's stop
| `2.1-269-g48e0b2aee <https://github.com/opensvc/opensvc/commit/48e0b2aeef6f8c1f53f7f91134b8a58ec4d1b591>`_ Fix missing resource status "info" key for data-derived resources
| `2.1-268-gec39d5066 <https://github.com/opensvc/opensvc/commit/ec39d5066a3a1417f3b1ffdfd60f62abaa4c7991>`_ Add the <name>.svc.<nodename>.node.<clustername> A records to the cluster DNS
| `2.1-267-g9a5d88aba <https://github.com/opensvc/opensvc/commit/9a5d88aba482479469a6a1ccfb7f91357fab0e26>`_ Fix a potential stack in daemon.dns
| `2.1-266-ge7a856f63 <https://github.com/opensvc/opensvc/commit/e7a856f6356633b9475d8fdc3aaf34c36c700fde>`_ Remove trailing whitespaces from daemon.dns
| `2.1-265-g354e13aa9 <https://github.com/opensvc/opensvc/commit/354e13aa9b913e6383b3c06a5f5e4037bfaa6d9c>`_ Fix declaration for auth, kv_store and requester for python 2
| `2.1-264-g1449406e1 <https://github.com/opensvc/opensvc/commit/1449406e1b2b077a20fa99f0e81f660f3f7b69bb>`_ Fix resource selector using --tags
| `2.1-263-gd60931366 <https://github.com/opensvc/opensvc/commit/d60931366a5cb1dcfec8d5fd0a7306e5eef72739>`_ Add noop_log
| `2.1-262-g57ed2af4b <https://github.com/opensvc/opensvc/commit/57ed2af4b7d7020182b50d9f446d2b7791547fcb>`_ Make site drivers as importable module
| `2.1-261-g76c699f0a <https://github.com/opensvc/opensvc/commit/76c699f0a943a530fca2d0024e2a19410180eb9f>`_ Add the 'log_handlers' kwarg to all BaseSvc derived classes
| `2.1-260-g5a7d3230c <https://github.com/opensvc/opensvc/commit/5a7d3230cb89407ad10a0430233157d48d40e063>`_ Fix api client for python2
| `2.1-259-gf22942750 <https://github.com/opensvc/opensvc/commit/f22942750c68734cc2336a221c5603d1059357cf>`_ Log unexpected stacks from resource set actions
| `2.1-258-gb11718230 <https://github.com/opensvc/opensvc/commit/b11718230e5f17a7ee80232dd88916f5a857c09f>`_ AuthFactory use now auth_provider.data_to_header() to construct header
| `2.1-257-ga87b6a013 <https://github.com/opensvc/opensvc/commit/a87b6a0131dad3364eff008c658a0bb6a1331668>`_ Fix KvSec.create (simply serialize value to sec key object)
| `2.1-256-g2f2413e1e <https://github.com/opensvc/opensvc/commit/2f2413e1ece42bbca7e7dcb6f09a6c1ca1589e29>`_ Add requester utilities for site drivers
| `2.1-255-g018bcb204 <https://github.com/opensvc/opensvc/commit/018bcb20445a19badd6bf864e6a62ab3c91561c8>`_ Create an authorization header factory that use a kv_store
| `2.1-254-g42ca82a80 <https://github.com/opensvc/opensvc/commit/42ca82a80fc9c885f76b5eae45112c365fa543fe>`_ Add kv_store utilities
| `2.1-253-g49e638c0b <https://github.com/opensvc/opensvc/commit/49e638c0b8f0d14054d69b4f25e36356517e9847>`_ Add public method to retrieve sec or cfg object
| `2.1-252-gb3a66ae24 <https://github.com/opensvc/opensvc/commit/b3a66ae24a0256ba38a8795612b6a7487fdc0c6d>`_ Allow {node.labels.l} and {node.env.v} references
| `2.1-251-g0e48f3b20 <https://github.com/opensvc/opensvc/commit/0e48f3b2093b1a310ca9005331c96f8d64475869>`_ Fix a stack when fs user or group name does not exist
| `2.1-250-g9ffac119f <https://github.com/opensvc/opensvc/commit/9ffac119fd0f6a8dfa679ed649a8762927316553>`_ Add user/group/perm keywords to the BaseFs driver
| `2.1-249-ge0d438cf8 <https://github.com/opensvc/opensvc/commit/e0d438cf8d1555dd2dc0c2d55f01645fad62636b>`_ Support "_" in drivers base name
| `2.1-248-gfdd52c610 <https://github.com/opensvc/opensvc/commit/fdd52c61021359376ae002477b0d6afdd43a9a58>`_ Fix PTR records
| `2.1-247-g9de3419cc <https://github.com/opensvc/opensvc/commit/9de3419ccac00a8e1e8b78caf9d0f2ceac2c5434>`_ Update driver import search order for site-opensvc drivers
| `2.1-246-g16582102a <https://github.com/opensvc/opensvc/commit/16582102ac0653fedff8d4aee91d91536adb0b54>`_ Merge pull request #297 from cgalibern/master-cp-b2.1
| `2.1-245-gb4de86b7b <https://github.com/opensvc/opensvc/commit/b4de86b7bc6f952c9478c450936ec84fb8ab4787>`_ Remove unused import from action handler
| `2.1-244-g052503cf7 <https://github.com/opensvc/opensvc/commit/052503cf7b1cb7811b14dc70f06c3b61939f194b>`_ Fix the current value parser for the pg_oom_control keyword
| `2.1-243-g3312dd403 <https://github.com/opensvc/opensvc/commit/3312dd403a86ca0a2df5ec4ed0ed28c87c6fb628>`_ Fix undue pg update on sibbling services
| `2.1-242-g27d1159af <https://github.com/opensvc/opensvc/commit/27d1159af410171eef629317ce6ac39647b15688>`_ Fix the "next run" attr of "print schedule" not empty when schedule is empty
| `2.1-241-g6abfacea6 <https://github.com/opensvc/opensvc/commit/6abfacea606660643394f4e28534dd66d3d913fd>`_ Sort the "print schedule" output by configuration parameter name
| `2.1-240-g72b7563bf <https://github.com/opensvc/opensvc/commit/72b7563bf24a2b3decfc6ddeaf5d3865ebe7d85d>`_ Fix a resource info clear issue at the begining of tasks run action
| `2.1-239-g861367591 <https://github.com/opensvc/opensvc/commit/861367591eaf89bf7ea600b761349e2ca92c6666>`_ [test-gitlab] Ensure /usr/bin/true and /usr/bin/false exists during tests
| `2.1-238-g38dda2fec <https://github.com/opensvc/opensvc/commit/38dda2fec2aa6fa7e1a8fa8cc3b1ac998271a294>`_ [test] Add more small time to mock daemon_start_native
| `2.1-237-g9b9060734 <https://github.com/opensvc/opensvc/commit/9b90607347b1c6a721b3bd101438fe84505c9384>`_ Pep8 extconfig.py
| `2.1-236-g844e89921 <https://github.com/opensvc/opensvc/commit/844e89921a4af3b1bc54b295a84e1381716f4147>`_ Fix encap action failure (regression in 20cfc94ff39f6f774e4600a9e30a6f242612e644)
| `2.1-235-g6688e0ef3 <https://github.com/opensvc/opensvc/commit/6688e0ef3126bdcf5511f451cb6c3aa8d4452ef0>`_ [test] Reduce test time for ip
| `2.1-234-g5586b9b57 <https://github.com/opensvc/opensvc/commit/5586b9b577ab8b9db5a79d5c347e56cfb029f63b>`_ [test] Ensure service default hook is called only once even if multiple resource
| `2.1-233-g49cd37dc9 <https://github.com/opensvc/opensvc/commit/49cd37dc922c6cec059b6be995fa103544693ddd>`_ Add service hooks for startstandby action
| `2.1-232-g19f7fe30f <https://github.com/opensvc/opensvc/commit/19f7fe30fc731e3261685784ae775d4a258197b4>`_ [travis] Only report coverage for python3
| `2.1-231-gc71457a78 <https://github.com/opensvc/opensvc/commit/c71457a786f2fde937fca2580758f139536cc2c7>`_ Remove dead code from action_triggers
| `2.1-230-ga77ddefdd <https://github.com/opensvc/opensvc/commit/a77ddefdd05040ffef9c1711a102d2a4b46fb583>`_ [test] fix run task with ' ; ' in command (python2)
| `2.1-229-gca2eee297 <https://github.com/opensvc/opensvc/commit/ca2eee29721de8989fd4a90fae4465bb5bb241ce>`_ Re-factorize action_triggers
| `2.1-228-g3caac64c5 <https://github.com/opensvc/opensvc/commit/3caac64c5f454372ebe649b0cbaed18c7e5198bc>`_ [test] Add run task tests
| `2.1-227-gf09273407 <https://github.com/opensvc/opensvc/commit/f092734073cecc344661b3893df89548ab967014>`_ [test] Ensure tasks are optional by default
| `2.1-226-g20353d3e1 <https://github.com/opensvc/opensvc/commit/20353d3e169083e195308fc2df4d0c216fd42fc6>`_ [test] Remove invalid sections DEFAULT from node.conf fixture
| `2.1-225-g197fbba4e <https://github.com/opensvc/opensvc/commit/197fbba4e494e837612c0b8978d2dc85ac48e363>`_ Allow complex pre or blocking_pre commands for node auto reboot
| `2.1-224-g3ffc420f0 <https://github.com/opensvc/opensvc/commit/3ffc420f0e8ed5f8296d9e19dee22e4cf7410e62>`_ [Test] Allow mixed use of has_cluster_config & has_node_config fixtures
| `2.1-223-g95689fb24 <https://github.com/opensvc/opensvc/commit/95689fb245839715d7d0f29dfdb05dc35107908e>`_ [test] Ensure auto_reboot respect node reboot.once setting
| `2.1-222-gc800f4668 <https://github.com/opensvc/opensvc/commit/c800f46682f05fb20a972f9c46e90998d0dbd2b5>`_ Fix auto_reboot failure when reboot.blocking_pre, or reboot.pre defined
| `2.1-221-g09f391fb5 <https://github.com/opensvc/opensvc/commit/09f391fb59119e0b2ad51185bfb927b4cdc9dade>`_ Factorize more selector functions in utilities.selector
| `2.1-220-g43c7ee249 <https://github.com/opensvc/opensvc/commit/43c7ee2496c71a07b976fdc4fc9254bb85dc5354>`_ Factorize selector fragment splitting code in utilities.selector
| `2.1-219-gf4e9ec399 <https://github.com/opensvc/opensvc/commit/f4e9ec399be649b09085a86822f6cf28b9d0f2d7>`_ Factorize the matching() funtion in selectors in a new utilities.selector module
| `2.1-218-g1d2ef3de1 <https://github.com/opensvc/opensvc/commit/1d2ef3de1c806a613afadbe57e9849975bf58e05>`_ Move the PgMixin in its own submodule core.objects.pg
| `2.1-217-g0200ab0e8 <https://github.com/opensvc/opensvc/commit/0200ab0e80e349535bf30959ad8c4dd28a67e674>`_ Factorize object path globing algorithm in utilities.naming
| `2.1-216-gce1ff168a <https://github.com/opensvc/opensvc/commit/ce1ff168aeef89dfe4e2de06b9412ab2160d8f2b>`_ Use a walk()-based implementation of pids() in drivers.pg.linux
| `2.1-215-g3dfd58c86 <https://github.com/opensvc/opensvc/commit/3dfd58c86d6f324b9b9be43ada75703f75df1017>`_ Add the the "nscfg" subsystem to the "om" command
| `2.1-214-gdcb61eb68 <https://github.com/opensvc/opensvc/commit/dcb61eb68ddc4427b83dd8ca8a2edf3b45407025>`_ Fix missing s/cluster/nscfg/ in the nscfg command parser
| `2.1-213-g431c79446 <https://github.com/opensvc/opensvc/commit/431c794469cef4c019a0a876ab100683ddb41770>`_ Fix a print message in bin/pkg/make_doc
| `2.1-212-g18a18cd76 <https://github.com/opensvc/opensvc/commit/18a18cd76380a4b64c50191c2a8479ec7dea1e5c>`_ Add the RBAC rule allowing squatter only to create/update nscfg objects
| `2.1-211-g461f5093a <https://github.com/opensvc/opensvc/commit/461f5093ab2cd78a06ad5367698fffd868abf932>`_ Object selector policy changes
| `2.1-210-g59fd242aa <https://github.com/opensvc/opensvc/commit/59fd242aa582d2f69d67993e303a3cd0c9740c6d>`_ Change the "no service selected" message to "no object selected"
| `2.1-209-gcc8c6f01d <https://github.com/opensvc/opensvc/commit/cc8c6f01d684bda376287361a3fb59d991104614>`_ Add self.pg test before using its methods
| `2.1-208-ga7b47b4c5 <https://github.com/opensvc/opensvc/commit/a7b47b4c577b1796bcf417027ab58f30ea1b14c7>`_ Add nscfg kind objects
| `2.1-207-g8e055b737 <https://github.com/opensvc/opensvc/commit/8e055b737031491fd040f678c2d918b55fdad6ae>`_ Fix the [DEFAULT#rindex] instead of [DEFAULT] in doc templates
| `2.1-206-g1dcecf63d <https://github.com/opensvc/opensvc/commit/1dcecf63d3191434914bead44c0a47ed13c9ff7d>`_ Add the "interval" option to all heartbeat drivers configuration syntax
| `2.1-205-gf06f7d18f <https://github.com/opensvc/opensvc/commit/f06f7d18fdef8e7c41486ccd1ac53165f771a81b>`_ Log the reason of find_pool() not returning a pool
| `2.1-204-ge3dbfdd5a <https://github.com/opensvc/opensvc/commit/e3dbfdd5aaba0905ac351f1c68f3ab77c7333e16>`_ Add the "pg update" svc action
| `2.1-203-gcb07b79f2 <https://github.com/opensvc/opensvc/commit/cb07b79f2862fb5265bce7da806151a45a05ad8d>`_ Log finer origin of service action in encap nodes
| `2.1-202-g4a67cd689 <https://github.com/opensvc/opensvc/commit/4a67cd689805227c62852e151fcb8c52690e86b5>`_ Add "DEFAULT.stat_timeout" to the svc dictionnary
| `2.1-201-g5e01aac40 <https://github.com/opensvc/opensvc/commit/5e01aac40f935e165588f5a782c3f3a0cabc4c49>`_ Fix the broken references check in "validate config" code path
| `2.1-200-gc0a7562cf <https://github.com/opensvc/opensvc/commit/c0a7562cfb991888db2400665138a413658379f3>`_ Fix the freenas pool driver
| `2.1-199-gcf96c44fe <https://github.com/opensvc/opensvc/commit/cf96c44fe0c81b76c3b072f44dac158aa4398cb0>`_ Fix a warning stack on svc action when args contain a "%"
| `2.1-198-g38555c4e4 <https://github.com/opensvc/opensvc/commit/38555c4e4a5c0cb16ab453eb75beb4262ac9b857>`_ Add the comment keyword in all data sections
| `2.1-197-g512159be1 <https://github.com/opensvc/opensvc/commit/512159be1b2a17a33453ebb1b605d09f2d65814b>`_ Fix sync.srdfs promote_devs_rw() when syminq does not report /dev/mapper/ devs
| `2.1-196-gac6ed9a20 <https://github.com/opensvc/opensvc/commit/ac6ed9a20ba905d2aa78d6bb0020fcecf0ab23b5>`_ Adapt the "resize zvol" freenas array driver command to v2.0 api
| `2.1-195-gd650d184c <https://github.com/opensvc/opensvc/commit/d650d184cc5ca3411d1290ba4b06870b232a4870>`_ Fix the unmap command of the freenas array driver
| `2.1-194-g0e6c2b2d6 <https://github.com/opensvc/opensvc/commit/0e6c2b2d6626a80bb5f3419d53252a4d903ef807>`_ Fix the "iscsi add targetgroup" command of the freenas driver
| `2.1-193-gf9c39049a <https://github.com/opensvc/opensvc/commit/f9c39049a8949d801b8a5d60256d573d1b712bcf>`_ Add a per-instance "preserved" attribute in the status structure
| `2.1-192-gbf074a288 <https://github.com/opensvc/opensvc/commit/bf074a2888f0ac2ab1d6f19473cd6c6f6f4db843>`_ Use (ns0, ns1, ...) as the nameserver names in the dns records
| `2.1-191-g81f81cd0c <https://github.com/opensvc/opensvc/commit/81f81cd0c360ae4e2b267b96c3fb0c2935c39040>`_ Align the POST /node_action result with POST /object_action
| `2.1-190-g3529a3ca4 <https://github.com/opensvc/opensvc/commit/3529a3ca4fbd95cd8ffe28ca25b299ed5b401c7a>`_ Add a GET /daemon_actions handler
| `2.1-189-g612ee602b <https://github.com/opensvc/opensvc/commit/612ee602bf8f201396daaa0c429822a7678dc4da>`_ Update status.json when starting to run a task
| `2.1-188-g0efb356cb <https://github.com/opensvc/opensvc/commit/0efb356cbb8928b6f869dc69bfa4f8bd2848e394>`_ Handle exception raised when only one node remains in the cluster
| `2.1-187-g31e4e7df8 <https://github.com/opensvc/opensvc/commit/31e4e7df86eab8d47ab8ddc5ba6b39d847a48577>`_ Merge pull request #269 from cgalibern/master-for-cherry-pick-b2.1
| `2.1-186-gef89cd5ec <https://github.com/opensvc/opensvc/commit/ef89cd5ecef68d429863e94b8e6400e02895be8b>`_ Document env section override via 'data' option in POST /object_create
| `2.1-185-g9b25f1055 <https://github.com/opensvc/opensvc/commit/9b25f1055b943d1e9ad978f140eabab9d924910e>`_ Fix the "daemon_join" action via the POST /node_action handler
| `2.1-184-g3a69646f7 <https://github.com/opensvc/opensvc/commit/3a69646f7807527b7470e8a35f76d3b5f036b476>`_ Move cluster.split_action to node.split_action
| `2.1-183-g800675a0b <https://github.com/opensvc/opensvc/commit/800675a0baf35511ec67b8351fa2419c8b127509>`_ Add alternate 'reboot' split action when split brain cluster node has no quorum
| `2.1-182-g49bb2227d <https://github.com/opensvc/opensvc/commit/49bb2227de1d806324f697a930ee19e588184b9e>`_ Add "GET /daemon_relay_status" as a valid route to the relay_status handler
| `2.1-181-g5fb394927 <https://github.com/opensvc/opensvc/commit/5fb394927fddeaff24bd86c8eeb79edb57d28025>`_ Add the limit_ keywords in the task.host resources
| `2.1-180-g99a42d1a3 <https://github.com/opensvc/opensvc/commit/99a42d1a36d268df881f3fd73f842be68ef77837>`_ Add session_id and pid to async POST /object_action result data
| `2.1-179-g68bbdbdfe <https://github.com/opensvc/opensvc/commit/68bbdbdfebeb0a42caba1dbcf16338132b6e7448>`_ Fix a use before set bug in the DEFER fallback codepath of extconfig
| `2.1-178-ga458dc9f6 <https://github.com/opensvc/opensvc/commit/a458dc9f64498c60494e8b6c937b938a96f65591>`_ Fix om daemon restart --node 'xxx' systemd opensvc-agent desynchronization
| `2.1-177-g4c091256f <https://github.com/opensvc/opensvc/commit/4c091256fdd6f09b9a1bd29b7a7d14963fe63e17>`_ Add the DEFAULT.registry_creds kw to the svc dictionnary
| `2.1-176-gce454fe4d <https://github.com/opensvc/opensvc/commit/ce454fe4d725cf16d6fd378233ef58c758c5ff00>`_ Prefer setfattr for the fs writable test instead of open-write <mnt>/.opensvc
| `2.1-175-g6bbf8c4a0 <https://github.com/opensvc/opensvc/commit/6bbf8c4a04f1659297d8e5152a5651894a0301aa>`_ Update the svcmon help message to reflect the stdby symbols changes
| `2.1-174-g31d0fd098 <https://github.com/opensvc/opensvc/commit/31d0fd098639d8e6376aa1cd3b4b58153ecca749>`_ Fix a potential stack on api result parsing
| `2.1-173-g8ea8f5c6a <https://github.com/opensvc/opensvc/commit/8ea8f5c6af997634914cb27f1f28a714df8347d8>`_ Fix a stack in monitor reconfigure
| `2.1-172-gd3834c05a <https://github.com/opensvc/opensvc/commit/d3834c05a02d8c628054b3d8882310a193130f6b>`_ Move volume_env_data() from Pool to Volume resource
| `2.1-171-g5af4b66ee <https://github.com/opensvc/opensvc/commit/5af4b66ee5f115b4ef2d318f318ede321fe5c366>`_ Move pool volume_env parsing from volume resource to the base pool class
| `2.1-170-gb72fc4247 <https://github.com/opensvc/opensvc/commit/b72fc42478fd504ec937b6adfee35efc4755be6d>`_ Don't confuse a no-cf volatile object with a remote object in print_config_data()
| `2.1-169-gb84c1128f <https://github.com/opensvc/opensvc/commit/b84c1128f46c1a77cd25d52ab56bdf2e9d334067>`_ Don't clear BaseSvc::cd on BaseSvc::unset_all_lazy() for volatile objects
| `2.1-168-gc46d3b0ce <https://github.com/opensvc/opensvc/commit/c46d3b0ce976abe713dcff275f5082e80bb352b7>`_ Don't log an error on every action when a drbd res file does not exist
| `2.1-167-g16d4cce74 <https://github.com/opensvc/opensvc/commit/16d4cce748470ee160d139e16db8fa0bef9f5e07>`_ Don't log from BaseSvc::_update()
| `2.1-166-g82fdc5c3f <https://github.com/opensvc/opensvc/commit/82fdc5c3f80752079ff7fedd8ae15fe4ff0d3d0a>`_ Fix image pulling when no registry_creds is specified
| `2.1-165-g36f405241 <https://github.com/opensvc/opensvc/commit/36f405241af8d3e5ca964be32255bfed929d8f7f>`_ Avoid starting per-object status refresh while initial status commands still run
| `2.1-164-geb85b6375 <https://github.com/opensvc/opensvc/commit/eb85b63752233f512852e5f94e7f8c8a21285887>`_ Fix tcp ~15s hangs in containers tcp connections
| `2.1-163-g9f7f533b7 <https://github.com/opensvc/opensvc/commit/9f7f533b7ba675c8f58fbb3a7e01dcbe713541cd>`_ Fix fs#1.mnt reference
| `2.1-162-g0409d765a <https://github.com/opensvc/opensvc/commit/0409d765ab9748297c843b37dce25de71db0f1f3>`_ Add the {volume#<n>.mnt} reference
| `2.1-161-g745c0ab09 <https://github.com/opensvc/opensvc/commit/745c0ab09515ade2129546efc54d76bcb001e51d>`_ Fix a pylint3 error in the freenas array driver
| `2.1-160-g20e8753fc <https://github.com/opensvc/opensvc/commit/20e8753fc73a673ecb4fba719910b2098694e1d2>`_ Settle udev before running a "multipath -f <dev>" to avoid the "in use" error
| `2.1-159-g2d6ec758b <https://github.com/opensvc/opensvc/commit/2d6ec758bceaaca78b6eb365a3c2704087c60905>`_ Move the freenas array driver to v2 rest api
| `2.1-158-g17f771403 <https://github.com/opensvc/opensvc/commit/17f771403009d22077d901ce72233a6a23872a86>`_ Don't use comma as a mapping separator in pool logs
| `2.1-157-g7dced24aa <https://github.com/opensvc/opensvc/commit/7dced24aa79b9d45873336229c89504b987eea97>`_ Merge pull request #245 from arnaudveron/master
| `2.1-156-g83411a590 <https://github.com/opensvc/opensvc/commit/83411a590d1052a69805ea9dac9b014d1934ba52>`_ Fix exception raised when tag is not found
| `2.1-155-gebfed97ee <https://github.com/opensvc/opensvc/commit/ebfed97ee5ba42ddc68fb70726cf982e3c0118ac>`_ Merge pull request #243 from cgalibern/update-listener-session-active-with-thread-id
| `2.1-154-g3f126cbd9 <https://github.com/opensvc/opensvc/commit/3f126cbd9dea0df97620d11a5493729ee23ec2c5>`_ Update listener stats session alive with thead id
| `2.1-153-g4830ebddc <https://github.com/opensvc/opensvc/commit/4830ebddc956fc20963f59e1db28de64ae417b8c>`_ Implement Node().get_tid() for Solaris
| `2.1-152-g78af2e304 <https://github.com/opensvc/opensvc/commit/78af2e304c1dca0a08553e58e3687ab546721309>`_ Merge pull request #242 from cgalibern/master-cp-b2.1
| `2.1-151-g002b8931b <https://github.com/opensvc/opensvc/commit/002b8931b8eb34203de690fd04c629381a78f774>`_ [test] Fix missing assert on daemon lock show has correct output
| `2.1-150-gb1971950a <https://github.com/opensvc/opensvc/commit/b1971950ab30ed89b9d4395d89956d1407429adf>`_ [test] Fix missing assert on daemon lock show has correct output
| `2.1-149-gcb77cb9f9 <https://github.com/opensvc/opensvc/commit/cb77cb9f96e893b9f0301a89dc2378bbb9ae4e09>`_ Fix 'om daemon start' restart running daemon
| `2.1-148-g5549b0cc0 <https://github.com/opensvc/opensvc/commit/5549b0cc07406d0a9bb99bf5ee6e4c8efa8e9e59>`_ Lint & PEP8 daemon command
| `2.1-147-g3ef1ad91d <https://github.com/opensvc/opensvc/commit/3ef1ad91d03ee21876b9ebd73cb4d6499b246408>`_ Make sure the linux vg resource removes tags even when the vg is already down
| `2.1-146-g17397734a <https://github.com/opensvc/opensvc/commit/17397734a9af63a2b83916a7453cb9bbae348c7e>`_ Merge pull request #239 from cgalibern/master-cp-b2.1
| `2.1-145-g7de8bdca7 <https://github.com/opensvc/opensvc/commit/7de8bdca7bb594f2ce4a93e53abb3f0fe5c1c11e>`_ Restore encap config initial push
| `2.1-144-gf075a7982 <https://github.com/opensvc/opensvc/commit/f075a7982902ecccef99aa161e35d74bed8fa217>`_ Avoid short-looping GET /sync when the handler reports a problem
| `2.1-143-gd1ad6a502 <https://github.com/opensvc/opensvc/commit/d1ad6a5023cee4633984ad6ba92eee15950cd147>`_ Fix Ip::wait_dns_record() GET /sync request payload
| `2.1-142-g445a4e840 <https://github.com/opensvc/opensvc/commit/445a4e8408cd70143df1ff0b3f706afee7631e14>`_ Log handlers exceptions for clients using the raw protocol
| `2.1-141-g629b63e88 <https://github.com/opensvc/opensvc/commit/629b63e8873e22601d4140e77436ba7ca4eeca66>`_ Don't install empty svc config from encap into the global
| `2.1-140-g75857b6cb <https://github.com/opensvc/opensvc/commit/75857b6cb42a441918e9c22d6c5621893c667e1b>`_ Handle two ip.cni driver corner cases
| `2.1-139-g5f744895f <https://github.com/opensvc/opensvc/commit/5f744895fae6405f6f788296d897382e42d81ebc>`_ Merge pull request #235 from cgalibern/fix-drain-wait
| `2.1-138-gc22ea55e8 <https://github.com/opensvc/opensvc/commit/c22ea55e85ec749b4bc2443b78d5045d4dd18c89>`_ Fix 'om node drain --wait' error
| `2.1-137-g872a033fa <https://github.com/opensvc/opensvc/commit/872a033fa0a46d5a4957a41d881ad215a40c0445>`_ Merge pull request #232 from cgalibern/master-cherry-pick-b2.1
| `2.1-136-g226a96f7a <https://github.com/opensvc/opensvc/commit/226a96f7a8327b96801da55a9c06cb5d8480c71a>`_ Fix a pylint error on missing import in the dns thread codebase
| `2.1-135-g5fc4d65e7 <https://github.com/opensvc/opensvc/commit/5fc4d65e720105de16331f8f4bbce7a0e4c36cb8>`_ Simplify the GET /sync handler
| `2.1-134-g5e4a26284 <https://github.com/opensvc/opensvc/commit/5e4a26284e991a8e7f898afc3a28e784e56bbd15>`_ Don't listen on the dns socket until the monitor has left 'init' status
| `2.1-133-gf7c21c8e8 <https://github.com/opensvc/opensvc/commit/f7c21c8e8227f9d74a3f9909773ae5aa9999f339>`_ dns thread enhancements
| `2.1-132-ge9a7c3b87 <https://github.com/opensvc/opensvc/commit/e9a7c3b87c8ece0e65d6874a575fb947b2ed2135>`_ Fix a "gen_cert > _fullpem" infinite recursion
| `2.1-131-g28b752659 <https://github.com/opensvc/opensvc/commit/28b752659bc742e08d64f951e702d15db0a99b0d>`_ Add signal capabilities to docker and podman containers
| `2.1-130-g3bb86a1fa <https://github.com/opensvc/opensvc/commit/3bb86a1fa627f9435db70c7e0d66121dcb80c5d2>`_ Make gen_cert use a single sec configuration commit.
| `2.1-129-ga69c14b89 <https://github.com/opensvc/opensvc/commit/a69c14b8923fa6e6c7a1457349f8ec83b4fdf96a>`_ Don't try send signal to not-up containers
| `2.1-128-gb5d7c601c <https://github.com/opensvc/opensvc/commit/b5d7c601c85c82ff95d6fba28a663436b96e689e>`_ Accept a timeout in Node::_daemon_unlock() and use a 120s timeout in disk.drbd
| `2.1-127-g17f383a95 <https://github.com/opensvc/opensvc/commit/17f383a95a020173d3d71a1b8f245651a87204db>`_ Fix volume.signal honored only on the first volume resource found
| `2.1-126-gad274c097 <https://github.com/opensvc/opensvc/commit/ad274c097aac75e6a0c08d218bc444a0bb96d70d>`_ Remove a cluster data lock acquire in the PTR record formatter of the dns thread
| `2.1-125-g52a5a2660 <https://github.com/opensvc/opensvc/commit/52a5a266069238c68dcf1bb834a5eec18c2136f8>`_ Fix a stack in daemon_backlogs() when the response contains an error
| `2.1-124-ge23de3a3b <https://github.com/opensvc/opensvc/commit/e23de3a3bf46f92eb22d19c79cc0a5418a5ba382>`_ Merge pull request #230 from cgalibern/fix-crm-stack-during-daemon-restart
| `2.1-123-g23fa87367 <https://github.com/opensvc/opensvc/commit/23fa873679e59c2596aea80e4718faca3db222d7>`_ Fix stack from crm when daemon is restarting
| `2.1-122-g380e32cc5 <https://github.com/opensvc/opensvc/commit/380e32cc506da99d7be259f77e58f081304f5d04>`_ Merge pull request #227 from cgalibern/readd-test-deselected
| `2.1-121-gb86c07426 <https://github.com/opensvc/opensvc/commit/b86c0742663dab47a016ac2e5b8394903ccfeb65>`_ [test] Move test_scheduler.py
| `2.1-120-g853b94c85 <https://github.com/opensvc/opensvc/commit/853b94c85033f306c324cc4c9343ac2ce276d957>`_ [test] Add deselected core.scheduler
| `2.1-119-g863ec2139 <https://github.com/opensvc/opensvc/commit/863ec213934bd702a879bddaff9c2639989b201f>`_ [test] Add deselected utilities.proc.check_privs
| `2.1-118-g6722e2727 <https://github.com/opensvc/opensvc/commit/6722e2727cb40a37b4742564af2f3585f65ff5a2>`_ [test] Add deselected core.extconfig.eval_expr
| `2.1-117-gfd8411119 <https://github.com/opensvc/opensvc/commit/fd8411119b9edd86ca87faf2180cce830e8258eb>`_ Merge pull request #226 from cgalibern/master-cp-b2.1
| `2.1-116-g6c23e8b07 <https://github.com/opensvc/opensvc/commit/6c23e8b07dc6cd0e1ccb5ba47f693f843b8d06f9>`_ [test] Speed up test with avoid computation of version from git
| `2.1-115-gc5ba01c7e <https://github.com/opensvc/opensvc/commit/c5ba01c7ef1e2ba45e8603059fe4b57fb6734672>`_ Implement "om daemon lock show" to show cluster locks
| `2.1-114-g9c8d014e4 <https://github.com/opensvc/opensvc/commit/9c8d014e42eda18cb9782b81dde439f2dac469a2>`_ [api] Implement get /cluster/locks to retreive cluster lock
| `2.1-113-g3852f57db <https://github.com/opensvc/opensvc/commit/3852f57db207be551defc1d605595078bbdac288>`_ Fix the rsync on snap codepath
| `2.1-112-g2b9aad2e2 <https://github.com/opensvc/opensvc/commit/2b9aad2e2db3ec6983aeec7fb192a512e7bc2746>`_ Add more labels to containers
| `2.1-111-g966faa73e <https://github.com/opensvc/opensvc/commit/966faa73eccd17987663dfa006f072b4fc0bfc05>`_ Fix a wait dns stack on cluster sync request
| `2.1-110-gf7a4f8f39 <https://github.com/opensvc/opensvc/commit/f7a4f8f390d6bb44a43799302eac86494811d1c4>`_ Expose a resource cache clear method from the Resource class
| `2.1-109-g201b765cc <https://github.com/opensvc/opensvc/commit/201b765cce881795ecb72d1f86b65d3de07d1c39>`_ Add the "signal" keyword to the volume driver
| `2.1-108-gf443e4c50 <https://github.com/opensvc/opensvc/commit/f443e4c503e9eaac177ebb385dbe10b79b1d8420>`_ Merge pull request #221 from cgalibern/master-cp-b2.1-add-cluster-node
| `2.1-107-gb8eecb389 <https://github.com/opensvc/opensvc/commit/b8eecb389b77d27c09e361b24b2b0d19df251704>`_ Fix listener crash during invalid daemon join call
| `2.1-106-g4fdff7c33 <https://github.com/opensvc/opensvc/commit/4fdff7c332f1c92942974e14a602c2c97dedc855>`_ Merge pull request #218 from cgalibern/fix-join-rejoin-node-arg
| `2.1-105-geb4dbcc57 <https://github.com/opensvc/opensvc/commit/eb4dbcc57e4679df4577acced2f3197c08fd6fd7>`_ Ensure --node arg is present during 'om daemon join/rejoin'
| `2.1-104-g9cafde4b1 <https://github.com/opensvc/opensvc/commit/9cafde4b18db02eca590a12f1b9089127dde19cf>`_ Merge pull request #217 from cgalibern/master-cp-b2.1
| `2.1-103-g59283a3b3 <https://github.com/opensvc/opensvc/commit/59283a3b35618a2ccea4abd698f6490d4eebf19a>`_ Fix flex_target not updated on node labels change
| `2.1-102-gfbd68ec9e <https://github.com/opensvc/opensvc/commit/fbd68ec9ed99f8b400f2116d1770a2cfd4833c69>`_ Fix "wait parents" lingering smon status on switch actions
| `2.1-101-g85d8f5dba <https://github.com/opensvc/opensvc/commit/85d8f5dbabac877557c7568c8f38b222de3b5e1a>`_ Fix wait_dns occasional failures
| `2.1-100-g29ae49495 <https://github.com/opensvc/opensvc/commit/29ae4949518d206655c311d75bf7154c494454d0>`_ Merge pull request #215 from cgalibern/test-join-leave
| `2.1-99-gb96e04a5b <https://github.com/opensvc/opensvc/commit/b96e04a5b3d587bc02d6bb698715a9b073bbd557>`_ [test] Add handler tests for POST /join & /leave
| `2.1-98-gf7eda2503 <https://github.com/opensvc/opensvc/commit/f7eda2503bd0ea8fcdf0a71b0afc448cbfa36843>`_ [test] Ensure add_cluster_node update cluster config nodes
| `2.1-97-g5f5556ee5 <https://github.com/opensvc/opensvc/commit/5f5556ee57221a6a26824f67b11e479b6375bf32>`_ [test] Ensure fresh install define cluster_nodes with nodename
| `2.1-96-g52492df8f <https://github.com/opensvc/opensvc/commit/52492df8f14b5c80b227c609369452895058cbf0>`_ Merge pull request #213 from arnaudveron/fix-make_deb
| `2.1-95-gf60ca93f6 <https://github.com/opensvc/opensvc/commit/f60ca93f6488351e45a6d54001e3f00ca10ee462>`_ Fix error message in make_deb
| `2.1-94-g0401b99d1 <https://github.com/opensvc/opensvc/commit/0401b99d122b9a6dc47e3100d7613f6a45fcec69>`_ [test] fix assert call_count == 1 vs assert_called_once
| `2.1-93-g0953eccb9 <https://github.com/opensvc/opensvc/commit/0953eccb9eca8bc3a8c00577cc345801bb3417b7>`_ Merge pull request #210 from cgalibern/master-checrry-pick-2.1
| `2.1-92-g68755b039 <https://github.com/opensvc/opensvc/commit/68755b0398401961625b7e655a8dec7b51d8256d>`_ Ensure lock_release returns when lock released in shared.CLUSTER_DATA
| `2.1-91-ged2f3d340 <https://github.com/opensvc/opensvc/commit/ed2f3d3407c12d97980bf1d7b4c6be31adaf8d23>`_ Don't set registry creds option on docker/podman start commands
| `2.1-90-g72a28caf2 <https://github.com/opensvc/opensvc/commit/72a28caf2d4100c6d9536ca5902f5ec144893eee>`_ Fix missing templates in usr/share/doc
| `2.1-89-gddb3e551d <https://github.com/opensvc/opensvc/commit/ddb3e551d952d3b910829d30b65607a30a831261>`_ Fix provision orchestration issue with parents=foo@node1
| `2.1-88-gc7fa7150f <https://github.com/opensvc/opensvc/commit/c7fa7150f30a2648f857dc6978347426fa0ff53f>`_ Fix a stack in docker and podman resource drivers
| `2.1-87-g755ef2855 <https://github.com/opensvc/opensvc/commit/755ef2855941234ff47cfac4befdd5914333f3a8>`_ Add a capability to drivers supporting regisrty_creds
| `2.1-86-g51e2945d7 <https://github.com/opensvc/opensvc/commit/51e2945d7a4f80b1b8972d730981df62a1dbe649>`_ Make "kind" a required option of the GET /keywords handlers
| `2.1-85-g1702db945 <https://github.com/opensvc/opensvc/commit/1702db945ac336a6e2a5df26ec8d272cd0e66394>`_ Support registry creds config as secrets
| `2.1-84-g76737895c <https://github.com/opensvc/opensvc/commit/76737895c227ceefd9630339b512e76cc87ae383>`_ Fix postintall() on daemon monitor fetch_service_config()
| `2.1-83-ge97f2cef5 <https://github.com/opensvc/opensvc/commit/e97f2cef5e29d015fa54d3c2153143fe1bae6486>`_ Fix "om <sec> install"
| `2.1-82-ge692d1221 <https://github.com/opensvc/opensvc/commit/e692d1221f48e3fe43556c794d6fff23e178adc1>`_ Don't run docker and podman task on provision
| `2.1-81-g8c73de0d4 <https://github.com/opensvc/opensvc/commit/8c73de0d456b6671611be99d0129305ff287c4e0>`_ Fix a log message typo in Node::find_pool()
| `2.1-80-g10f7b6ca6 <https://github.com/opensvc/opensvc/commit/10f7b6ca6ebfd48c483a4a8f42475009c665ff71>`_ Discard volatile pool from candidates if pool type not requested
| `2.1-79-g146bd4270 <https://github.com/opensvc/opensvc/commit/146bd4270cf7e9218b0fb66260fe4802e0ce6ca0>`_ Fix case of resource status_info not updated
| `2.1-78-g4f5091800 <https://github.com/opensvc/opensvc/commit/4f50918000eeeeed83fa4e97382e7bfaa345212f>`_ Fix a typo in the status_info resource lazy load from cache
| `2.1-77-g482362a6c <https://github.com/opensvc/opensvc/commit/482362a6c75dbec31862dcd2601ecbcbe066f37a>`_ Fix a resource info corruption on peer node labels change
| `2.1-76-g945f422a2 <https://github.com/opensvc/opensvc/commit/945f422a2adc3bcdf4fe2144d617c2752f3143cd>`_ Fix two potential dns db desync situation
| `2.1-75-g4b9767b30 <https://github.com/opensvc/opensvc/commit/4b9767b303e5a7be9b56e4d3cafea09d6177b849>`_ Merge pull request #206 from cgalibern/node-x-podman
| `2.1-74-g0d318797a <https://github.com/opensvc/opensvc/commit/0d318797a883b6f4dbb120bcf270e13006a8533b>`_ [container.oci] Fix podman location
| `2.1-73-gab76014fa <https://github.com/opensvc/opensvc/commit/ab76014fadd2010258f66fb704aadaa8ddc57014>`_ Merge pull request #198 from cgalibern/test-drbd-provisioner
| `2.1-72-g38a1c9e5f <https://github.com/opensvc/opensvc/commit/38a1c9e5fcd7f4cab111962e1f7bea7704efc4a8>`_ [test] Add tests om drbd provisioner
| `2.1-71-g6bd6556d5 <https://github.com/opensvc/opensvc/commit/6bd6556d5545c4e4de08265fa30d7060d85f5391>`_ [test] klass_has_capability fixture into conftest.py
| `2.1-70-gb9d8efbfb <https://github.com/opensvc/opensvc/commit/b9d8efbfb78ce5a392332cee74a33412a90857fc>`_ Set use-vc in resolv.conf options for containers using backend ipaddr
| `2.1-69-gf82409d02 <https://github.com/opensvc/opensvc/commit/f82409d0253ca85c7deb4f1ea929ccc03ea700cb>`_ Merge pull request #192 from cgalibern/fix-travis-pytest
| `2.1-68-gd801dcb1e <https://github.com/opensvc/opensvc/commit/d801dcb1e2f5321dd22e3a41c4bd1c2f33d4ee0c>`_ [travis] Move to focal to avoid pytest error
| `2.1-67-g9c801198a <https://github.com/opensvc/opensvc/commit/9c801198a0bde41466de49d70cfc6cae90a285c4>`_ Allow disable/freeze/thaw on PRD objects deployed on DEV nodes
| `2.1-66-g916cac9cb <https://github.com/opensvc/opensvc/commit/916cac9cb66c35c876b91b3796081b96044e8d4a>`_ Fix a stack with task.docker and task.podman when no timeout is set
| `2.1-65-ge3fffa424 <https://github.com/opensvc/opensvc/commit/e3fffa424634904e8871a1ce3a39bce0deae616a>`_ Add a pool "status_schedule" keyword
| `2.1-64-gb09f83433 <https://github.com/opensvc/opensvc/commit/b09f8343328693fe6ef72f412b5fa61a4d218c05>`_ disk.drbd driver enhancements
| `2.1-63-g3d4af468b <https://github.com/opensvc/opensvc/commit/3d4af468bda313ece5a326ca965de151b097b592>`_ Merge pull request #187 from cgalibern/fix-local-expect
| `2.1-62-g31fc738da <https://github.com/opensvc/opensvc/commit/31fc738dacca9ff3f2a4c4c7a48d2b4c16626af2>`_ Fix early detection of local_expect started
| `2.1-61-g2307c9b32 <https://github.com/opensvc/opensvc/commit/2307c9b328593e1011bdc95367708a7220c8b0a9>`_ Merge pull request #186 from cgalibern/misc-fix
| `2.1-60-g719382e91 <https://github.com/opensvc/opensvc/commit/719382e91e9b6af438478fc4128447854115d777>`_ Lint & PEP8 svc.py
| `2.1-59-g7378e6619 <https://github.com/opensvc/opensvc/commit/7378e6619fd6e01c78c6bd48c84b70e29c5b0d5a>`_ Lint & PEP8 node.py
| `2.1-58-gf293b0980 <https://github.com/opensvc/opensvc/commit/f293b0980afc9734a24f0c638e6074db6012d8e2>`_ Always use DEFAULT_DAEMON_TIMEOUT from core/comm.py
| `2.1-57-gabdad0cd8 <https://github.com/opensvc/opensvc/commit/abdad0cd8e09158079381b16f55ed06019fd4c34>`_ Respect drain wait time on a pending node drain
| `2.1-56-g7a194ea3b <https://github.com/opensvc/opensvc/commit/7a194ea3b54ec5199141f16b559d534cac90c3e6>`_ Use timeout=5 during disk/drbd replicated_config daemon_post
| `2.1-55-g3859d8d83 <https://github.com/opensvc/opensvc/commit/3859d8d836cc7e780faebb001964b82cea3185e7>`_ Refacto data.py with DEFAULT_DAEMON_TIMEOUT=5
| `2.1-54-g68f438881 <https://github.com/opensvc/opensvc/commit/68f4388812e5c6382583313e1cf8575dd4697e6a>`_ Align daemon_post timeout from 2->5 during svc wake_monitor
| `2.1-53-gf1cae49e3 <https://github.com/opensvc/opensvc/commit/f1cae49e35ed41fbc5ceb2e996913dbc9922a974>`_ Add timeout to node daemon_post calls
| `2.1-52-gc7cd368eb <https://github.com/opensvc/opensvc/commit/c7cd368ebad657b9498629f717bda2f1858103e0>`_ Update _daemon_lock error when timeout is None
| `2.1-51-g9dc9caf8e <https://github.com/opensvc/opensvc/commit/9dc9caf8e3b822c880571860298a244b646ced99>`_ Give preference to non shared pools to allocate a non shared volume
| `2.1-50-gde279a2c0 <https://github.com/opensvc/opensvc/commit/de279a2c0f82e9487a1a71a3d0c3ed4b67f2970c>`_ Define a pre_provision_stop() method in the volume resource driver
| `2.1-49-gb99ed9182 <https://github.com/opensvc/opensvc/commit/b99ed91823e4fa589350f248cb99c02a956e9985>`_ Report vol obj avail warn at warn-level volume resource status log message
| `2.1-48-gc09cc52e1 <https://github.com/opensvc/opensvc/commit/c09cc52e1eca9e654a17dd12f4094f1c543c81e6>`_ Report vol obj overall=warn as volume resource warn log
| `2.1-47-gac17d8df2 <https://github.com/opensvc/opensvc/commit/ac17d8df29f59d367e0b0086be928fc0151c8646>`_ Allow the "status" action on invalid nodes to not loop on status in daemon init
| `2.1-46-g9f7cfb48a <https://github.com/opensvc/opensvc/commit/9f7cfb48a5ace7fd8a1d6f53e9421b8e8a72d4f1>`_ Force create-md in the drbd provisioner codepath
| `2.1-45-g13b99474e <https://github.com/opensvc/opensvc/commit/13b99474e1aa3f492fc89283070dc665e13dc3f7>`_ Fix resource restarting before provisioned
| `2.1-44-gdded8dbd8 <https://github.com/opensvc/opensvc/commit/dded8dbd820d809a11b4ecd35b8569ae5272a388>`_ Fix the cluster lock acquire request timeout
| `2.1-43-gd6b339c0e <https://github.com/opensvc/opensvc/commit/d6b339c0e1342c3f67add9867586e64275a0d9b9>`_ Merge pull request #182 from cgalibern/cleanup-secrets-from-sysreport
| `2.1-42-gb37a05024 <https://github.com/opensvc/opensvc/commit/b37a050247b8abdbe5c4616b6395b1065a4c495a>`_ Update support & sysreport proc for cluster secrets
| `2.1-41-g25c673a3c <https://github.com/opensvc/opensvc/commit/25c673a3c7654c6380f3fcfa7b566f3a8dd9f385>`_ Test containerized tasks always use timeout kw value
| `2.1-40-g8ad7800ee <https://github.com/opensvc/opensvc/commit/8ad7800ee87203f61b62ef2f9f5208213c2d6047>`_ [drivers.zone.provision] Fix generated sysidcfg
| `2.1-39-g884d139aa <https://github.com/opensvc/opensvc/commit/884d139aaa7462910e29a66928076a42283d23c0>`_ [drivers.zone.provision] Allow provision without ip resources
| `2.1-38-ge19e7301c <https://github.com/opensvc/opensvc/commit/e19e7301c4984983cfd65c5632ec02f584ca70c4>`_ Fix a variable name error in task.podman
| `2.1-37-g8fdaaa0cd <https://github.com/opensvc/opensvc/commit/8fdaaa0cd0c65b826f7d235423e6153173b8d4e8>`_ Don't import "start_timeout" in the task.docker and task.podman keywords
| `2.1-36-gffc527e87 <https://github.com/opensvc/opensvc/commit/ffc527e87b872d4785903b37867dbab14075a59b>`_ Rename the core.node.ACTIONS_WAIT_RESULT to ACTIONS_NOWAIT_RESULT
| `2.1-35-g6dd22fe13 <https://github.com/opensvc/opensvc/commit/6dd22fe1364723c065e7beed912dcc3e6367a61f>`_ Make POST /node_action accept again action for daemon, network and pool subsystems
| `2.1-34-g8d5bb7c15 <https://github.com/opensvc/opensvc/commit/8d5bb7c15100540a6ceb4dcf4da70dc8efe2d0dc>`_ Fix ha svc with hard affinity not started when they could
| `2.1-33-g628ab7968 <https://github.com/opensvc/opensvc/commit/628ab79684d1112ebaa6288663a60ce0e9a21f3f>`_ Fix containerized tasks always using the default 5s start_timeout
| `2.1-32-g417d7ce05 <https://github.com/opensvc/opensvc/commit/417d7ce05b87cd130dbff07e9f02d9221b874a67>`_ Honor the parents relations during a multi-object switch
| `2.1-31-g18461aeb0 <https://github.com/opensvc/opensvc/commit/18461aeb06dedb335289c8ed77c332ba994ceddd>`_ Fix and optimize daemon monitor get_local_paths()
| `2.1-30-gc1381534f <https://github.com/opensvc/opensvc/commit/c1381534faf4ac0d288b1ff100ac277d0e2c2591>`_ Add the GET /object_confirmations handlers
| `2.1-29-g031d2d794 <https://github.com/opensvc/opensvc/commit/031d2d794f8ca247114974b81cb44fe834653875>`_ Merge pull request #176 from cgalibern/diag-travis
| `2.1-28-gd889a11c8 <https://github.com/opensvc/opensvc/commit/d889a11c80a3e48ff7268153fa148cb4fea2d490>`_ [coverage] Exclude virtualenv and new foreign path from coverage
| `2.1-27-g3ac38bd55 <https://github.com/opensvc/opensvc/commit/3ac38bd552cc5c454bd8ac707f01dac9aa101821>`_ [travis] Diag failing test
| `2.1-26-g4340f180e <https://github.com/opensvc/opensvc/commit/4340f180ef29f94b145fc89b4693debf05e5cc6b>`_ [travis] cleanup not anymore required sudo
| `2.1-25-g311a8327a <https://github.com/opensvc/opensvc/commit/311a8327a935df7e34ed7b5aa0d9c5fa9c0750f5>`_ Fix a stack on task run when stdin is closed
| `2.1-24-ga4ab2b680 <https://github.com/opensvc/opensvc/commit/a4ab2b6804253ab664d4788d5e5e464f465d0cbb>`_ Honor "stop --force" in the drbd driver
| `2.1-23-g43a46757a <https://github.com/opensvc/opensvc/commit/43a46757ab7e99ca02783457adcae93b59804e2e>`_ Merge pull request #169 from cgalibern/up-master-b2.1
| `2.1-22-g0d87c622f <https://github.com/opensvc/opensvc/commit/0d87c622ffe346d4e9f012f461815204f8270ea3>`_ [driver.container.zone] Update for solaris10 brand zones
| `2.1-21-g69cb15663 <https://github.com/opensvc/opensvc/commit/69cb15663372e9cd78ed8941de6013e321878618>`_ [driver.container.zone] Ensure mock capabilities
| `2.1-20-gb558ce1ff <https://github.com/opensvc/opensvc/commit/b558ce1ff7bc43ed2de5d316d8836b259ebdb9f7>`_ [driver.container.zone] Add container.zone.brand-solaris10 capability
| `2.1-19-g0ab9da8c6 <https://github.com/opensvc/opensvc/commit/0ab9da8c694528c73467fa00b57932242275eb37>`_ Merge pull request #167 from cvaroqui/master
| `2.1-18-g3f5dab236 <https://github.com/opensvc/opensvc/commit/3f5dab236df5e5ede6f035f2994844823b662ed4>`_ Merge branch 'master' into master
| `2.1-16-gdd539d0cc <https://github.com/opensvc/opensvc/commit/dd539d0ccb945f57e8aeb7f984748bc4812709b2>`_ Fix another drbd driver regexp declared binary instead of raw
| `2.1-16-g0ef30b677 <https://github.com/opensvc/opensvc/commit/0ef30b677dbebbd6e6ff3182b429ebd018f3189c>`_ Merge pull request #165 from cvaroqui/master
| `2.1-15-ga65634265 <https://github.com/opensvc/opensvc/commit/a6563426533447bb7084d8e8ca9b3f347b10a3a3>`_ Fix 'handler GET resource/disk/drbd/allocations is not supported'
| `2.1-14-ga56d3bf7b <https://github.com/opensvc/opensvc/commit/a56d3bf7bf6e26a72eef0dfbe18fab2f1264f413>`_ Fix utilities.subsystems.docker container_by_label() for podman
| `2.1-13-g9416898d4 <https://github.com/opensvc/opensvc/commit/9416898d4e8bab0476beb222f92bb8afe6783e92>`_ Fix zone brands[solaris10 & native] provisioning (#161)
| `2.1-12-g27fa8bffb <https://github.com/opensvc/opensvc/commit/27fa8bffb4acb3744ebf3f65368202f48a854522>`_ Merge pull request #159 from cgalibern/package-solaris
| `2.1-11-g5b2c3ccff <https://github.com/opensvc/opensvc/commit/5b2c3ccff2a1efa06a8f08fabbd605be0d0fd564>`_ [packaging] Fix solaris daemon restart during package relocate operations
| `2.1-10-g3d0b23a2c <https://github.com/opensvc/opensvc/commit/3d0b23a2ce8c48f52ff6bb9c58388670bdfcdc2e>`_ Merge pull request #156 from arnaudveron/fix-drbd-regexp
| `2.1-9-gb9a795530 <https://github.com/opensvc/opensvc/commit/b9a79553035596dc02876405cca1addcdb38a63d>`_ Fix regexp declaration in drbd driver
| `2.1-8-gb4ac7ead3 <https://github.com/opensvc/opensvc/commit/b4ac7ead37f5ba1d44055f9da783854416771555>`_ Merge pull request #155 from cvaroqui/master
| `2.1-7-g54e12cac5 <https://github.com/opensvc/opensvc/commit/54e12cac58292ba5fd758ceeaad789d0c540a3db>`_ Fix a stack on provision in disk.drbd when the listener reports unsupported handler
| `2.1-6-gba8b2a595 <https://github.com/opensvc/opensvc/commit/ba8b2a595f48f106c4935427c0e9de915b0ec076>`_ Merge pull request #153 from cgalibern/fix-printdev-on-faulty-pool
| `2.1-5-g50d17356e <https://github.com/opensvc/opensvc/commit/50d17356e527e155147af7bcd06afdd683b66fc2>`_ Fix om node print devs stack when FAULTY zpool exists (Solaris)
| `2.1-4-gdbc846b71 <https://github.com/opensvc/opensvc/commit/dbc846b71816503f2306f52f69a1e326f69b3d75>`_ Merge pull request #152 from opensvc/b2.1
| `2.1-3-gef594d291 <https://github.com/opensvc/opensvc/commit/ef594d291a4645026fa6e787542d84174d3e2f70>`_ Merge pull request #149 from cvaroqui/b2.1
| `2.1-2-gcfb8d53df <https://github.com/opensvc/opensvc/commit/cfb8d53dfe55c61a1cb50fa25fab027d75cc72a6>`_ Avoid using version for release when the git head commit is tagged
| `2.1-1-g10a6e8ca3 <https://github.com/opensvc/opensvc/commit/10a6e8ca3704c1df966f41d4cfe3099c1e3fef77>`_ Fix a stack in utilies.version
