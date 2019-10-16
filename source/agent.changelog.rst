Changelog
=========


| `2.0-235-gfe0bf586 <https://github.com/opensvc/opensvc/commit/fe0bf5863e2d60f2b0a79e68b9266c3e81191b58>`_ Inform api client that the submited node selection is empty
| `2.0-234-g6b3ab0a6 <https://github.com/opensvc/opensvc/commit/6b3ab0a634376d80309d7810d08bbf089f138ec5>`_ Fix error on "om node sysreport" with new CMD
| `2.0-233-g110e05c8 <https://github.com/opensvc/opensvc/commit/110e05c8e74aa994af806f74c74f1cfd8461c6b7>`_ Persist routed_bridge subnets assignments
| `2.0-232-gdc07659f <https://github.com/opensvc/opensvc/commit/dc07659f7572cb8bbf5ecb36a1a9151e7549d792>`_ Add ExtConfig::oget_scopes()
| `2.0-231-ga34a1135 <https://github.com/opensvc/opensvc/commit/a34a1135b8e10ead778e025383e10407ba7ebd38>`_ Fix "'Listener' object has no attribute 'get_namespaces'"
| `2.0-230-gff364bf3 <https://github.com/opensvc/opensvc/commit/ff364bf33cce18f7ec66a4a5c0fbb71de0c5eb49>`_ Add locking aroung disk.zpool sub_devs cache read and write
| `2.0-229-g7b79cd69 <https://github.com/opensvc/opensvc/commit/7b79cd6994607c1defc85ce189b05647a7fb8a1e>`_ Return info from service_action and node_action api handlers
| `2.0-228-g0f951860 <https://github.com/opensvc/opensvc/commit/0f9518607c2b8f85da2c00b8c1e6c0b511b6b463>`_ Fix multiplex storm on logs --follow
| `2.0-227-gd0074af7 <https://github.com/opensvc/opensvc/commit/d0074af7865db0304876b2c0ea83b973d65ebc5d>`_ Don't exec tasks that require a collector when dbopensvc is not set
| `2.0-226-g2d13b528 <https://github.com/opensvc/opensvc/commit/2d13b528d9b5df118175c55398d8fde44dc6696d>`_ Serve the webapp index.html whatever the req path if accept:text/html
| `2.0-225-g71392634 <https://github.com/opensvc/opensvc/commit/71392634be4e8851a0319f948ef06dae0391e47a>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-223-gb1c586ad <https://github.com/opensvc/opensvc/commit/b1c586adbb430fc80005da3daf4f7dba474d8799>`_ Shortcut the ssl context init when talking http/2 over uxsock
| `2.0-222-gfa14defe <https://github.com/opensvc/opensvc/commit/fa14defe91d7046cd9289e347c7f2bdbba94cfe2>`_ Fix a use-before-set in the mgr codepath
| `2.0-222-g5fdd5f42 <https://github.com/opensvc/opensvc/commit/5fdd5f4262ac36fa7445cb936f2d4a6475e752bc>`_ Fix hb "beating" attr staying True when the thread is stopped
| `2.0-221-g7971c708 <https://github.com/opensvc/opensvc/commit/7971c70849900cbf80871607557a39b64acd0707>`_ Service logs fixes
| `2.0-220-g60b66c27 <https://github.com/opensvc/opensvc/commit/60b66c27bcdf49d70fdc17818cabcfd7a51d34ee>`_ Fix the alt_names not embedded in the certificate signed by cluster CA issue
| `2.0-219-g08f7144f <https://github.com/opensvc/opensvc/commit/08f7144fe071a39c0aa564bcdc21b7a23fc3f17c>`_ Add a check=last_run keyword to task drivers
| `2.0-218-ge2e67fca <https://github.com/opensvc/opensvc/commit/e2e67fca9d1d4e36e45e14c6133a91e0250498b0>`_ Don't tag the non-detached container.{podman,docker} "nostatus"
| `2.0-217-g868ad7cc <https://github.com/opensvc/opensvc/commit/868ad7cc382521a29310ff2c5ea9cb95dff7af3d>`_ Fix type=host tasks run_requires not honored
| `2.0-216-g59c29a24 <https://github.com/opensvc/opensvc/commit/59c29a2491a1b0778661ee362571834e14817054>`_ Restore http/2 over uxsock as the preferred protocol with the local daemon
| `2.0-215-g96097cf8 <https://github.com/opensvc/opensvc/commit/96097cf8276bb125d614546dfea0de059f6939b7>`_ Simplify a too convoluted method of the Scheduler class
| `2.0-214-g47db759d <https://github.com/opensvc/opensvc/commit/47db759d0cc317e4738a1755b123efafb4591c9c>`_ Remove two more useless CLUSTER_DATA lock acquires
| `2.0-213-g550b5265 <https://github.com/opensvc/opensvc/commit/550b5265d43f4918045767984c18bd4736126baa>`_ Enhance the scheduler precision
| `2.0-212-gd9bf2659 <https://github.com/opensvc/opensvc/commit/d9bf26593ef862e47af5a08c3b3bd27090192789>`_ Fix a CLUSTER_DATA global access error in the monitor thread reconfigure codepath
| `2.0-211-g11341b23 <https://github.com/opensvc/opensvc/commit/11341b2317239022bc7820689cc8fe3721d5c781>`_ Fix a NODE global access error in the monitor thread reconfigure codepath
| `2.0-210-gbf70177e <https://github.com/opensvc/opensvc/commit/bf70177e0f58ca40c4c85f7d79f170c695cbacb5>`_ Inhibit the scheduler runs random delay for more schedule definitions
| `2.0-209-g86342b32 <https://github.com/opensvc/opensvc/commit/86342b329ecad07cad9fd16bafe83e25c461318c>`_ Avoid +1min effect over the defined scheduler task interval
| `2.0-208-g843844e5 <https://github.com/opensvc/opensvc/commit/843844e557d48ded9a582f8c8ac076586a7024d5>`_ Fix potential stack on nodes_info.json update
| `2.0-207-ge822b1ef <https://github.com/opensvc/opensvc/commit/e822b1ef99855c038a79fb8eca4594736244e39c>`_ Fix "undef" status of parents, children and slaves in print status
| `2.0-206-g413e0632 <https://github.com/opensvc/opensvc/commit/413e06324be7f402b626dadb9fffa7d7ffd36431>`_ Set perms on the <var>/certs directory and private_key
| `2.0-205-g791993e4 <https://github.com/opensvc/opensvc/commit/791993e45601ed5baa0e741906d7d1a47734fdba>`_ Use get_solaris_version() instead of get_os_ver() in the zone driver
| `2.0-204-g2f9e7f2b <https://github.com/opensvc/opensvc/commit/2f9e7f2b19734cabe9a31debcbe3a43aa839a549>`_ Don't refresh nodes_info.targets upon full data rx
| `2.0-203-g43367eac <https://github.com/opensvc/opensvc/commit/43367eac9ded49ecd5da75b8fd8fff08909ae76a>`_ Add a sanity check on the slot attr presence in the hb.disk peer dataset
| `2.0-202-g428b18f4 <https://github.com/opensvc/opensvc/commit/428b18f42542c7fc03ecf0994c56bdb05e2107b8>`_ Prefer the raw socket protocol to talk on the unix socket
| `2.0-201-gc617ec89 <https://github.com/opensvc/opensvc/commit/c617ec89d5dad2c897498806eab629d579939f12>`_ Fix a potential stack in get_all_ns()
| `2.0-200-gd44cefce <https://github.com/opensvc/opensvc/commit/d44cefce913efaa6d74ed2738ab03e66de83018a>`_ Fix a bug in lsnr get_namespaces() codepath
| `2.0-199-g0d063bda <https://github.com/opensvc/opensvc/commit/0d063bda48938cc9ee30bb1bb452b80dd9d701a5>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-197-g8ba92bc2 <https://github.com/opensvc/opensvc/commit/8ba92bc25f93e818325ee8853555444ccceeb020>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-196-g69b8dd65 <https://github.com/opensvc/opensvc/commit/69b8dd65e59d62ef312b58d5e79f89926b556041>`_ Performation optimizations
| `2.0-195-g10ca4494 <https://github.com/opensvc/opensvc/commit/10ca44948efb50ecc48f95d6893869ec373fac00>`_ Prevent the "shutdown failed => shutdown" loop
| `2.0-194-ga09b088d <https://github.com/opensvc/opensvc/commit/a09b088d4b3e7985698c287a08967e550cf6427d>`_ Performance optimizations
| `2.0-193-g1557ec56 <https://github.com/opensvc/opensvc/commit/1557ec568c3641fdc51939c34248d845696454f4>`_ Fix is_service() for objects ending with "-conf"
| `2.0-193-g1ec9c557 <https://github.com/opensvc/opensvc/commit/1ec9c557de32df1581031c1cdb5245b02bc3130c>`_ Save one call to Node::svcs_selector() in multi-object actions
| `2.0-192-g12188c99 <https://github.com/opensvc/opensvc/commit/12188c991f9108c3eaaf7b03ffb8dce6f312601f>`_ Add the "om <cfg|usr|sec> append --key <key> --value|--from" action
| `2.0-191-g69520caf <https://github.com/opensvc/opensvc/commit/69520caf06ce214497afb69840418ac54ec6ed82>`_ Update nodemgr man page
| `2.0-190-g5def9fc2 <https://github.com/opensvc/opensvc/commit/5def9fc247be893cda698eb8f85a1615c12e5273>`_ Support "pkcs --password" with usrmgr too
| `2.0-189-gfc0278b8 <https://github.com/opensvc/opensvc/commit/fc0278b83f67204cf5ae77616aa4454eb129b80b>`_ Add "om <sec> pkcs --password" argument
| `2.0-188-ge4cd43cd <https://github.com/opensvc/opensvc/commit/e4cd43cd8837c8c2c623ca8fa86dd02747d51908>`_ Prevent thread reconfigure while objects transition
| `2.0-187-g37fed083 <https://github.com/opensvc/opensvc/commit/37fed083d4a33fbbd534cf172ccef4f45006cc42>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-185-g22b78cde <https://github.com/opensvc/opensvc/commit/22b78cde76e1d9d3bec9902b3438d4774fdc2e80>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-184-g2bc880ac <https://github.com/opensvc/opensvc/commit/2bc880aca46eb7481943d3a10ed58084dc3086c0>`_ Fix "gen cert" action on py3
| `2.0-183-g62fc77f5 <https://github.com/opensvc/opensvc/commit/62fc77f5549e86ad048aa58a807b910b8a55cea3>`_ Fix non-shared volume resources not rolled-back after prov on non-leader
| `2.0-183-g06cdf33f <https://github.com/opensvc/opensvc/commit/06cdf33fac54e4c3752553de9810d5039a333c90>`_ Remove unused BaseSvc method
| `2.0-182-g9746191a <https://github.com/opensvc/opensvc/commit/9746191abf2cd3cac91756d9fe4ac5a0a88c4bc8>`_ Fix undue rollback of volumes
| `2.0-181-gc839decf <https://github.com/opensvc/opensvc/commit/c839decff5ea4bd67d580ff47ed948868b33c44f>`_ Use Node::_wait() to wait for orchestrated actions
| `2.0-180-g207558ba <https://github.com/opensvc/opensvc/commit/207558ba1a795ee014c32028dd9fda10d3547280>`_ Fix the previous patch logic with --wait
| `2.0-179-g34bb138f <https://github.com/opensvc/opensvc/commit/34bb138f5d58f5c66ecc791f9a31dc68dab8fcda>`_ Fix --wait on cluster nodes orchestrated actions
| `2.0-178-g9e5b8a8e <https://github.com/opensvc/opensvc/commit/9e5b8a8ef6aa7319bc1a22df0c3ca5cf09079f29>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-176-g4277cea5 <https://github.com/opensvc/opensvc/commit/4277cea595969d35ef6745679a69cd0a1729fdf3>`_ Refresh templates for the new wait_dns keyword
| `2.0-176-g1c0f0ef8 <https://github.com/opensvc/opensvc/commit/1c0f0ef8eafd699456b71b1760eeb9103948ba35>`_ Fix object async action --wait
| `2.0-175-gb9ee3bb1 <https://github.com/opensvc/opensvc/commit/b9ee3bb1f85ce8e94744ae664e36022da9c82d5c>`_ Add the wait_dns keyword to ip resources
| `2.0-174-g929171df <https://github.com/opensvc/opensvc/commit/929171dfa814f03436af1605076afd6243b2f7c0>`_ Fix purge/unprovision orchestration of objects with child relations
| `2.0-173-gd0c430a9 <https://github.com/opensvc/opensvc/commit/d0c430a99597eccaa030d47e029eff0328de8b2c>`_ Fix py2/py3 issues with add/decode keys
| `2.0-172-g68029632 <https://github.com/opensvc/opensvc/commit/680296327dd44cab5daba5eb6651ddc351d740fe>`_ Avoid multiple PTR per svc instance when a single hostname is set
| `2.0-171-g7e36c81a <https://github.com/opensvc/opensvc/commit/7e36c81a591caebd04fa467d49d77b45aeef5925>`_ Fix the multiplexer for specific service
| `2.0-170-g46a35139 <https://github.com/opensvc/opensvc/commit/46a351397a7b7300c7b0802c1febb4e4750dad81>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-168-g87643342 <https://github.com/opensvc/opensvc/commit/8764334277b8b0942bb047d2c103345075b22b92>`_ Add a missing lock in transition_count()
| `2.0-168-g4649b11b <https://github.com/opensvc/opensvc/commit/4649b11b72e594806541877145fc2b7b98f59211>`_ Support the 'in' operator in 'om node wait'
| `2.0-167-ge274e14f <https://github.com/opensvc/opensvc/commit/e274e14fc985d993fa07b4fbed8efb0103fa8fe3>`_ Use "om <kind>" instead of "<kind>mgr" in the rst docs
| `2.0-166-ge3319eb5 <https://github.com/opensvc/opensvc/commit/e3319eb52a48bcc17c18b81d6c1216c37f6e17f0>`_ Add a lock debugging RLock class
| `2.0-165-g05adcf79 <https://github.com/opensvc/opensvc/commit/05adcf794b12c2a55f65a0b6373c59a81764a3b1>`_ Better logging of node async action requests
| `2.0-164-g8d33a7af <https://github.com/opensvc/opensvc/commit/8d33a7af5db19cb72f51f86aa29de978caca8eaf>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-162-gc74ec6df <https://github.com/opensvc/opensvc/commit/c74ec6dfc1cc945fd453d445ecce06b947f30c04>`_ Fix the pool and access kw setting in the DEFAULT section of vols
| `2.0-162-g477db7f6 <https://github.com/opensvc/opensvc/commit/477db7f66f9bda5fdaeb0fd54ba352bfa0d0dce7>`_ Output version on stdout instead of stderr and exit 0 instead of 1
| `2.0-161-gb8a0545b <https://github.com/opensvc/opensvc/commit/b8a0545bbe41081971ea0b8c13b886c3723884ad>`_ Update usr/share/doc/ templates
| `2.0-160-g7312e75f <https://github.com/opensvc/opensvc/commit/7312e75f60c0477d9281d1456e9f0938e8adcf86>`_ Support --sections in "om <selector> mon" action
| `2.0-159-gdf34bc17 <https://github.com/opensvc/opensvc/commit/df34bc17e8c3cb144f87f24c6d06e44cebcfee91>`_ Avoid looping on instance "stop=>stop failed" upon purge
| `2.0-158-g494ef2df <https://github.com/opensvc/opensvc/commit/494ef2df5f38332fb406aee323d8431a42d8a924>`_ Threading locks optimizations
| `2.0-157-g41a6f335 <https://github.com/opensvc/opensvc/commit/41a6f335d4e6a465c4051895417ae3db3a22c0a3>`_ Fix is_service() not honoring OSVC_NAMESPACE
| `2.0-156-gc0d27afb <https://github.com/opensvc/opensvc/commit/c0d27afbe0beeef97df8e5edf2dedf8d43951340>`_ Drop a useless SERVICES_LOCK acquire in get_service()
| `2.0-155-g41c7cc35 <https://github.com/opensvc/opensvc/commit/41c7cc3539c9971d2f1bb6dd1eb2e81501ccdeae>`_ Drop "wait " svc mon state on "abort" action
| `2.0-154-g0c059d6d <https://github.com/opensvc/opensvc/commit/0c059d6dac3c69c4170eea04690be412fedaec4c>`_ Optimize the number of unlink(), fstat() and fopen() in app res lock acquire/release
| `2.0-153-g1e3c53fd <https://github.com/opensvc/opensvc/commit/1e3c53fdde5047f7f27daaff8d3771d0a8d09e5b>`_ Don't use jsonpath_ng in the monitor loop
| `2.0-152-g05885837 <https://github.com/opensvc/opensvc/commit/058858370cac86e0689b4e7ec777f429e77ab873>`_ Factorize the node frozen file fstat() calls in the monitor loop
| `2.0-151-g32b26346 <https://github.com/opensvc/opensvc/commit/32b26346a0f0d2bc22d0f99d3e2084c186dbbadb>`_ Don't try to decode cert from buff if buff is None
| `2.0-150-g5a733635 <https://github.com/opensvc/opensvc/commit/5a733635b81e7bed5ab604493b16fb656e678706>`_ Set task.schedule kw default to None, instead of @0
| `2.0-149-g9085fc40 <https://github.com/opensvc/opensvc/commit/9085fc406e343820e7fc6c1114b3656838e6d7d8>`_ Fix DEFAULT.monitor_schedule not honored
| `2.0-148-g47636021 <https://github.com/opensvc/opensvc/commit/4763602169b36d406b906dedc86beb06a20121d9>`_ Apply the new alt_names logic to the csr too
| `2.0-147-gf062eb1e <https://github.com/opensvc/opensvc/commit/f062eb1e53c5108e96dd3bdcc05e864bb03eb06e>`_ Fix the alt_names sec handling
| `2.0-146-g046d3fc3 <https://github.com/opensvc/opensvc/commit/046d3fc3d5a4a18e296d8c8443292340e0a705ce>`_ Don't run gen_cert on usr create if the ca sec does not have a privkey
| `2.0-145-g946c47c8 <https://github.com/opensvc/opensvc/commit/946c47c87805a62ca46d768c444d08aff3286663>`_ Fix a stack in the "om <path> docker login {as_service} <reg>" codepath
| `2.0-144-gda31d695 <https://github.com/opensvc/opensvc/commit/da31d695fa7c1285cf6b5fde30e7470b7c800f24>`_ Fix a stack on "om net status" just after a daemon restart
| `2.0-143-g356ba4f1 <https://github.com/opensvc/opensvc/commit/356ba4f10c1c068086ae8e902b18e60b812b1456>`_ Fix a stack on lsnr status() when called before lsnr init
| `2.0-142-g5eca5fc1 <https://github.com/opensvc/opensvc/commit/5eca5fc1b3748e4a7f5941b4b0563c9b3d1b6020>`_ Reload grants of lsnr-connected users on usr cksum change
| `2.0-141-g4558d0d7 <https://github.com/opensvc/opensvc/commit/4558d0d74b52421bc2c3f4ee8b8243c09fc32339>`_ Accept generating a csr on "gen cert" if the cluster ca has no private_key key
| `2.0-140-ge18f6097 <https://github.com/opensvc/opensvc/commit/e18f60976b28e3ddfd8a207e1fcd5beb133c392f>`_ Support context's cluster without 'certificate_authority' key
| `2.0-139-g3c6dd835 <https://github.com/opensvc/opensvc/commit/3c6dd83547367197b1bd8e4068b598ffb342bb1c>`_ Fix the cluster CA detection in the usr create codepath
| `2.0-138-g394f2831 <https://github.com/opensvc/opensvc/commit/394f2831949becc21b77e6be891fe7038ce11b7b>`_ Skip usr 'gen cert' if cluster.ca is not set or does not exist
| `2.0-137-g21312c90 <https://github.com/opensvc/opensvc/commit/21312c902cf09cb11aad056d14c680297204632a>`_ Detect the presence of ssl.HAS_ALPN to activate h2
| `2.0-136-g429cf0db <https://github.com/opensvc/opensvc/commit/429cf0db4f588cbdbf24588cc6e819f6f54f2638>`_ Add one more shortcut codepath in nodes_selector
| `2.0-135-g663e5e94 <https://github.com/opensvc/opensvc/commit/663e5e94e445033c43654796948bab3f268889b2>`_ Don't use shlex.split() on node the selector pattern
| `2.0-134-g5f45c4c0 <https://github.com/opensvc/opensvc/commit/5f45c4c08f9a3728fdfedb463953a4be9047f281>`_ Fix BaseSvc nodes default value in encap when nodes@encapnodes is not defined
| `2.0-133-gfc6f6788 <https://github.com/opensvc/opensvc/commit/fc6f6788c3517819b38ac9da285035480cdfb46a>`_ Fix creation of objs in a new 'test2' ns when admin:test is granted
| `2.0-132-gb74a5e09 <https://github.com/opensvc/opensvc/commit/b74a5e09a8e5f1185dcd8d67adc7997a2b829f19>`_ Fix the 'om <pattern> ls' listing all objects when pattern has no match
| `2.0-131-g3494ac46 <https://github.com/opensvc/opensvc/commit/3494ac46093b9eaa356fea9596c77c3b70bf6c53>`_ Support the sec and usr pkcs12 command on py3
| `2.0-130-g0edcca7e <https://github.com/opensvc/opensvc/commit/0edcca7e496fa9c56b64ea5a24ed407c42248834>`_ Handle empty string trigger gracefully
| `2.0-129-ga012a125 <https://github.com/opensvc/opensvc/commit/a012a12556ce7b3d9250fcff97ef071d22336317>`_ Honor configs_environment in docker containers
| `2.0-128-gad767bf7 <https://github.com/opensvc/opensvc/commit/ad767bf74469a34564e913d6ed6ceca5772baab4>`_ Change for a more generic error message
| `2.0-127-g6fcb3e5e <https://github.com/opensvc/opensvc/commit/6fcb3e5e7ee710fa908aa975ab0174ebe142879e>`_ Add kind type to error message
| `2.0-126-gb566a7a4 <https://github.com/opensvc/opensvc/commit/b566a7a47a303229bdac48c9e1867dbc2b6abbc2>`_ Fix erroneous lowercase of DEFAULT section during keyword parsing
| `2.0-125-g0ecfa36e <https://github.com/opensvc/opensvc/commit/0ecfa36e94f6dc7399db9679213904eda3a4f1e6>`_ Ensure CLUMGR_DIR is created before returning from function
| `2.0-124-gfa77b96f <https://github.com/opensvc/opensvc/commit/fa77b96fdbf154517e10d66b342fb91c07a10e4d>`_ Add advanced routing configuration option to routed_bridge
| `2.0-123-gff148863 <https://github.com/opensvc/opensvc/commit/ff14886382f11c1f0033f1483ca9acce6438f800>`_ Fix the resources logger name
| `2.0-122-gd0a7d57c <https://github.com/opensvc/opensvc/commit/d0a7d57c6cd2901ce834b4aa102ed4f538747a45>`_ Add cluster manager directory in rpm specfile
| `2.0-121-gb538b858 <https://github.com/opensvc/opensvc/commit/b538b858a8b248c474c3c7c25fab2a3b3343131c>`_ Add macaddr keyword in netns resource driver
| `2.0-120-ga0351b4b <https://github.com/opensvc/opensvc/commit/a0351b4bdc2df9c012a61fb03fd35a44455a4bcc>`_ Fix cluster manager download url
| `2.0-119-g27b8f13b <https://github.com/opensvc/opensvc/commit/27b8f13b2d9ed742128678b4268540067b8a1559>`_ Fortify the ccfg class against 'name' kwarg passed
| `2.0-118-gf5f27058 <https://github.com/opensvc/opensvc/commit/f5f270584efb3bd1225630e65b28d9ac11708d64>`_ Factorize rest markup removal code
| `2.0-117-g1f133d6b <https://github.com/opensvc/opensvc/commit/1f133d6b775b864e9d111b43989b2932fee6d07c>`_ Update man pages with rest markup removal
| `2.0-116-ga8513835 <https://github.com/opensvc/opensvc/commit/a8513835bfb2db8e652accfbc1efbfc50626166b>`_ Update ManPageFormatter to remove rest markup from man pages
| `2.0-115-g37bdba60 <https://github.com/opensvc/opensvc/commit/37bdba6060798eb3ee957c62742899728dbc6fa5>`_ Update rest markup
| `2.0-114-g02fa5811 <https://github.com/opensvc/opensvc/commit/02fa581134c775ef03b891f298c2a0708d311a27>`_ Add sphinx roles to nodedict
| `2.0-113-gb8084b95 <https://github.com/opensvc/opensvc/commit/b8084b95b4dbc4bd635e0d0d2bd960c3fb0fa30b>`_ Add sphinx roles to secdict
| `2.0-112-g14390a2b <https://github.com/opensvc/opensvc/commit/14390a2b4b9cf4d70cd5666ebdee8ed8baad2bac>`_ Add sphinx roles to clusterdict
| `2.0-111-g57ec0629 <https://github.com/opensvc/opensvc/commit/57ec062989838662e315b28177e055606777fba0>`_ Add sphinx roles to cfgdict
| `2.0-110-g3cdefd6c <https://github.com/opensvc/opensvc/commit/3cdefd6c742a9263c8a1b6dffdde97ca0717a75f>`_ Add sphinx roles to svcdict
| `2.0-109-g1eb1c845 <https://github.com/opensvc/opensvc/commit/1eb1c845b935b9982e6d6867a1f7eab48b8a95b1>`_ Add usrdict to rst dump script
| `2.0-108-g2c57e1cb <https://github.com/opensvc/opensvc/commit/2c57e1cb80b7869b980fc6f4157e3a114ded4c5f>`_ Add sphinx roles to usrdict
| `2.0-107-ge9f504ff <https://github.com/opensvc/opensvc/commit/e9f504fffde23ef56cc388413f9b4d2bbecb9fae>`_ Add "delete" to the service_action admin actions list
| `2.0-106-g3d17f539 <https://github.com/opensvc/opensvc/commit/3d17f539a586012d3504ff52e30f91f4b30ae95a>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-103-g8cb3261b <https://github.com/opensvc/opensvc/commit/8cb3261bd825f48adf6e3c3f3a054d6a63f47498>`_ Add missing properties in the keywords dump
| `2.0-102-g631ecf63 <https://github.com/opensvc/opensvc/commit/631ecf63a0f2b3e2157dd0ec65d0a017044a6004>`_ Fix the get_keywords handler for kind!="ccfg"
| `2.0-101-g97efdf85 <https://github.com/opensvc/opensvc/commit/97efdf8532385a538ad61d54039ee36117a4764b>`_ Remove unused network[routed_bridge].subnet keyword
| `2.0-100-g2f881db6 <https://github.com/opensvc/opensvc/commit/2f881db6cc5910f9e87a6742485b5213e83c4e96>`_ Add 'om node updateclumgr' command
| `2.0-99-gbe886479 <https://github.com/opensvc/opensvc/commit/be886479e768abbcaff30a9f3011e4f3a880e1cc>`_ Include cluster manager to packaging scripts
| `2.0-98-g4f02bf3f <https://github.com/opensvc/opensvc/commit/4f02bf3fa397b4d0cd62c0a429e5efc2ef5668dc>`_ Change to keywords dump format to avoid collision between rtypes
| `2.0-97-gc1b67f76 <https://github.com/opensvc/opensvc/commit/c1b67f76e3c5c0497107b97d3d4dfb411c11bd99>`_ Add the keyword types to the keywords dump served by get_keywords
| `2.0-96-g9c558931 <https://github.com/opensvc/opensvc/commit/9c558931141f9ea0bc6fbbb9bc7cbb6efdd87cee>`_ Add api version
| `2.0-95-g33ea9c2f <https://github.com/opensvc/opensvc/commit/33ea9c2f84e812c6025b08c05feff0d57a4998d5>`_ Add the get_keywords listener handler
| `2.0-94-gc874693d <https://github.com/opensvc/opensvc/commit/c874693d56c2058dc27c195ebcde94bc0b596071>`_ Don't run boot on object kinds other than svc and vol
| `2.0-94-g3deefcbb <https://github.com/opensvc/opensvc/commit/3deefcbb00edb01b24f6044736d237f556fd590b>`_ Unset Node object cd and private_cd after register
| `2.0-93-g03eb23d5 <https://github.com/opensvc/opensvc/commit/03eb23d5e29772d1f462f3daa49dbdd5382895ff>`_ Lowercase the keyword in the set/unset codepaths
| `2.0-93-g1b316002 <https://github.com/opensvc/opensvc/commit/1b316002fae426b11905d268f3ecb38685bdb934>`_ Exit Linux fs resource realdev() early if self.device is None
| `2.0-92-g1cc1aee3 <https://github.com/opensvc/opensvc/commit/1cc1aee32264d6a85b567d399f3798d88d76c557>`_ Move the elapsed computation and print from _wait() to wait()
| `2.0-91-g201090a2 <https://github.com/opensvc/opensvc/commit/201090a247c9f121cc6cbe80bf338ccaccbedab1>`_ Fix a cert janitor stack in the scheduler thread
| `2.0-90-g8fb3ba99 <https://github.com/opensvc/opensvc/commit/8fb3ba993b656692d9f5b32b4d20154c16ca6a1f>`_ Remove task.task.command duplicate entries in svcdict.py
| `2.0-89-gfc780667 <https://github.com/opensvc/opensvc/commit/fc780667b67aca7cf8b00d4268aea19b2c1eb550>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-84-g063d9d3f <https://github.com/opensvc/opensvc/commit/063d9d3fc4dfa25b874fc72d6fd788dcfbd34684>`_ Add dedicated class for host tasks
| `2.0-83-g4ec51419 <https://github.com/opensvc/opensvc/commit/4ec514196c09338369e15e57f18431067df71e02>`_ Remove duplicate disk.disk.size entry from svcdict.py
| `2.0-82-g28932eae <https://github.com/opensvc/opensvc/commit/28932eaef07c53ba01cff8747f64df117781509a>`_ Fix reST indentation issues
| `2.0-81-g28c60037 <https://github.com/opensvc/opensvc/commit/28c60037a0ecd83a4d2fbd09311f86b814ec143b>`_ Fix duplicate rst container name
| `2.0-80-g859eccf8 <https://github.com/opensvc/opensvc/commit/859eccf8ada49c56493d7ccffec3e91f1c2d8920>`_ Optimize the number of _daemon_status() calls
| `2.0-80-g614f5ccf <https://github.com/opensvc/opensvc/commit/614f5ccfb6a8ae83791b9ba62bca596d4ce7f09b>`_ Merge duplicate node.connect_to
| `2.0-79-g417c6329 <https://github.com/opensvc/opensvc/commit/417c6329f243ce985f869a9d3aa9a6b90cfd8e88>`_ Remove duplicate brocade password key
| `2.0-79-g258ea2ac <https://github.com/opensvc/opensvc/commit/258ea2ac808859c32b46f73196ca3720451ecdad>`_ Avoid downgrading from OrderedDict to dict on print_config_data()
| `2.0-78-g238f0fc7 <https://github.com/opensvc/opensvc/commit/238f0fc7dbf799d5fb55e20cb94a8684825e9629>`_ Fix rst duplicate target names
| `2.0-78-g00a548a0 <https://github.com/opensvc/opensvc/commit/00a548a0e8f6c4586b3f915b0335b8e1e888107d>`_ Avoid sorting json output for ordered dict
| `2.0-77-gf56a2e6f <https://github.com/opensvc/opensvc/commit/f56a2e6ff9a808d88e77930478c8c253a1c35840>`_ Classify EPIPE as retyable in the comm module
| `2.0-77-g70e3303e <https://github.com/opensvc/opensvc/commit/70e3303e691d4103529ad5c3606648d2f227948e>`_ Fix cluster rst files pointing to service rst examples
| `2.0-76-gdcb12e17 <https://github.com/opensvc/opensvc/commit/dcb12e17d9dc5f8a138e16cfae87a32e6d13e269>`_ Use appropriate command line options
| `2.0-75-g794bd2c2 <https://github.com/opensvc/opensvc/commit/794bd2c29d7589a93910214c518414f9dd8e38dc>`_ Add option to display long commit id
| `2.0-74-ge89a9f9e <https://github.com/opensvc/opensvc/commit/e89a9f9e6dbec330137cc5715d0993e2dda3a15e>`_ Fix changelog to ensure current repository is used
| `2.0-73-g728288ae <https://github.com/opensvc/opensvc/commit/728288ae3b61a480f8ec8dfc291af9af792f5bfb>`_ Fix a typo in a catched exception name
| `2.0-72-g1924a640 <https://github.com/opensvc/opensvc/commit/1924a64079298078d566d9c8a1b915da5a7604c5>`_ Log exceptions in the monitor thread pre-loop codepath
| `2.0-71-g741fd43f <https://github.com/opensvc/opensvc/commit/741fd43fa838c00ea539c360e557c8bb19ac5165>`_ Search and create last_boot_id in <pathvar>/node/
| `2.0-70-g73b0f339 <https://github.com/opensvc/opensvc/commit/73b0f339fd501aad172e62ac4c50b81a05c0f9d8>`_ Replace a remaining occurence of Svc::svcname with Svc::name
| `2.0-69-g88ed8802 <https://github.com/opensvc/opensvc/commit/88ed880238fa2354ebd1f98513c2e3501e02d230>`_ Py2 encoding fix in the set BaseSvc action
| `2.0-68-g3d1bba71 <https://github.com/opensvc/opensvc/commit/3d1bba7180ba54b8299df8e7737b208efa098328>`_ Fix encoding error on adding binary data to a cfg
| `2.0-67-g4a2fbc3f <https://github.com/opensvc/opensvc/commit/4a2fbc3f00e883d01cb4b1a9b2604c49bf58a1f2>`_ Implement a deepcopy method in Storage()
| `2.0-66-g5755c6d7 <https://github.com/opensvc/opensvc/commit/5755c6d71c51763cb6145b9c70de5170a761e6f5>`_ Change the internal --to arg name to "to"
| `2.0-65-g68058f3d <https://github.com/opensvc/opensvc/commit/68058f3d0f4cfaa156b15abd45ba69b8589b7a36>`_ Move verbose option management in wait() function
| `2.0-64-g91a9bc77 <https://github.com/opensvc/opensvc/commit/91a9bc7713c1d8e2e14c3d603279d677a6d86876>`_ Add elapsed time to om node wait command
| `2.0-63-g5c535f34 <https://github.com/opensvc/opensvc/commit/5c535f34f475c9d9d2bc6f696ec6be84e6b77164>`_ Fix the h2 request multiplexing for list of nodes
| `2.0-62-g944f2ce4 <https://github.com/opensvc/opensvc/commit/944f2ce48d20e0f3c175448ff9c777e487152935>`_ Add "slave" and "scale" key to monitor.services when opportune
| `2.0-61-g78edb210 <https://github.com/opensvc/opensvc/commit/78edb2104760a74d250f3d0c8939e30d0c30605c>`_ Fix the aes listener socket
| `2.0-60-g118927e9 <https://github.com/opensvc/opensvc/commit/118927e9a4be51dfe061ac5b420f304af4b910fe>`_ Honor the nodes@encapnodes keyword value when set
| `2.0-59-g37ce5bea <https://github.com/opensvc/opensvc/commit/37ce5bea5ff1f997ce3dc29a24d912d311cdfeec>`_ Retry listener socket bind on in-use errors
| `2.0-58-g0b801bd5 <https://github.com/opensvc/opensvc/commit/0b801bd528f2468f9c6f01480cc53ec017460909>`_ Add a "synchronous service status eval" after cf fetch
| `2.0-57-g56dae82f <https://github.com/opensvc/opensvc/commit/56dae82f1724f4e096cbb053a676be53943f7ad4>`_ om node wait optmization
| `2.0-56-g3ec511eb <https://github.com/opensvc/opensvc/commit/3ec511eb0ad6515ff9f03e95012fdaedd9da7df6>`_ Return a deepcopy of DAEMON_STATUS on daemon_status()
| `2.0-55-gf239b340 <https://github.com/opensvc/opensvc/commit/f239b3400beb8da166f50ad02a587517acffa21f>`_ Fix a stack in the daemon_status handler codepath
| `2.0-54-g2b04628e <https://github.com/opensvc/opensvc/commit/2b04628e33f45cad23a8b044d8414152d19f318b>`_ Fix scaling of services in the root ns
| `2.0-53-g3f162a88 <https://github.com/opensvc/opensvc/commit/3f162a88878315244eae8ee18f9cd436a03ee437>`_ Reconfigure the service before refresh the status upon set/edit/...
| `2.0-52-g97f4d3d4 <https://github.com/opensvc/opensvc/commit/97f4d3d4ad6f9d182dde020c78fddc32cc64c989>`_ Fix a pylint error on Node::log lazy masked by Crypt::log attr
| `2.0-51-g4977e2ac <https://github.com/opensvc/opensvc/commit/4977e2acadc27d3ca078b83493a0773b8302113a>`_ Fix the initLogger arguments in a call from svcBuilder
| `2.0-50-g1c783b62 <https://github.com/opensvc/opensvc/commit/1c783b6229d769126ba10596ea35c458c6ba43f0>`_ Support create from template in the create_multiplex() lsnr method
| `2.0-49-g7d5bae98 <https://github.com/opensvc/opensvc/commit/7d5bae984479c114178ecada767ec5ef434ca0ad>`_ Fix the "om svc1 print config --format json|om svc2 create" pattern
| `2.0-48-gb049c378 <https://github.com/opensvc/opensvc/commit/b049c3782505729c75398f6b259f0b7eb47fafb1>`_ Use incremental patching in the "om node wait" codepath
| `2.0-47-g1cf720d4 <https://github.com/opensvc/opensvc/commit/1cf720d41a2731987375f7ab28d7802ce40e28dd>`_ Fix the service logger log routing
| `2.0-46-gd24e2958 <https://github.com/opensvc/opensvc/commit/d24e29589f2cf1ed905831f085f88baad34971a7>`_ Support non-namespaced objects in the api handlers router
| `2.0-45-gbbbe777d <https://github.com/opensvc/opensvc/commit/bbbe777d7af453e9b016723b44b8976ae0be4c96>`_ Fix the disk hb dev keyword value lost on reconfigure
| `2.0-44-g46dc6df5 <https://github.com/opensvc/opensvc/commit/46dc6df5eb91444c631b58fe1ab357b8c43d0238>`_ Fix comments after line continuation introduced in the previous patch
| `2.0-43-g83271f48 <https://github.com/opensvc/opensvc/commit/83271f482348e7ed901e1b0e7070da2edbef2ebb>`_ Fix the pkg type detection for sles15
| `2.0-42-g5ce3c630 <https://github.com/opensvc/opensvc/commit/5ce3c6309ef13e864d91ec18951def438098dc30>`_ Use patch-event based updates in svcmon
| `2.0-41-g7bb7eff5 <https://github.com/opensvc/opensvc/commit/7bb7eff5f2199c78326a5ab89d146b149840c061>`_ Add an id to the patch events dataset
| `2.0-40-g618adb5c <https://github.com/opensvc/opensvc/commit/618adb5c046cb1ca4c00839cc63f1fd9a1ce47aa>`_ Fix a spurious error message in the symmetrix driver
| `2.0-39-gaf377c36 <https://github.com/opensvc/opensvc/commit/af377c36d971712b36312994df89da0184b7412d>`_ Root patch-kind events to the root of the daemon status structure
| `2.0-38-g21cc1fdb <https://github.com/opensvc/opensvc/commit/21cc1fdb492b93df3cfdeccdd550926988233276>`_ Stop using Storage() in the hb drivers
| `2.0-37-g4b800a86 <https://github.com/opensvc/opensvc/commit/4b800a86fcbf443b436d457eb17641b41c3613ab>`_ Accept the "template" option in the create handler
| `2.0-36-g462ec26f <https://github.com/opensvc/opensvc/commit/462ec26f961a0abf9f835e2041e0387bf30582d2>`_ Refuse to create "dummy" service on "svcmgr create --template"
| `2.0-35-gaf40e7dd <https://github.com/opensvc/opensvc/commit/af40e7dd0417650b5be14242e968fcec4bdcf8a4>`_ Preserve the comments in config files
| `2.0-34-gfc1713d3 <https://github.com/opensvc/opensvc/commit/fc1713d3710689d2231ed23360d13c7bffc079b4>`_ Allow create --template to take env customization via stdin
| `2.0-33-g2e406cb2 <https://github.com/opensvc/opensvc/commit/2e406cb2e618c7effaa2095a34d182e61d6683e8>`_ Monitor thread fixes
| `2.0-32-g4f009da0 <https://github.com/opensvc/opensvc/commit/4f009da0d8680f27b2a5e91eca3bfbb29915666a>`_ Avoid a stack on misnamed scaler slaves
| `2.0-31-g1b4a498d <https://github.com/opensvc/opensvc/commit/1b4a498d1b44cbaa05dc3174d4451652f7f34a2b>`_ Fix calls to collector rest helpers from the Svc class
| `2.0-30-g0ccdf0fc <https://github.com/opensvc/opensvc/commit/0ccdf0fcbfb08dff7055277054eb483c15c72e5c>`_ Fix information leak on agg service status for ns-limited users
| `2.0-29-gb4f0c069 <https://github.com/opensvc/opensvc/commit/b4f0c06903f497887b7fcf8622174c57a221e54d>`_ Merge branch 'master' of git+ssh://10.19.0.11/opt/opensvc
| `2.0-27-ge0294441 <https://github.com/opensvc/opensvc/commit/e0294441ff2473018d9b1fe228ee54cb9975e142>`_ Classify the collector_cli action as runnable on any node
| `2.0-27-g37fabdd1 <https://github.com/opensvc/opensvc/commit/37fabdd1a35c03ef2ed9eae6f56afbdbc7b5f926>`_ Add new handlers
| `2.0-26-gd82706e5 <https://github.com/opensvc/opensvc/commit/d82706e5bdf2d673a992bba48d20a4e5cc6b7642>`_ Fix a string wildcard substitution pattern in the listener codepath
| `2.0-25-g83644b70 <https://github.com/opensvc/opensvc/commit/83644b70214ddbc8b155c2326d019b5fd47e5ea2>`_ Update docs, man, completion files
| `2.0-24-gf26d47d8 <https://github.com/opensvc/opensvc/commit/f26d47d8b0e9c92d3d36849a65b2934243b75a31>`_ Adapt internal and exposed properties to the multi-kind reality
| `2.0-23-g9021cd4e <https://github.com/opensvc/opensvc/commit/9021cd4e1bbd04056753478f512f60af3e9f728a>`_ Filter events based on user privs
| `2.0-22-gb1719fa0 <https://github.com/opensvc/opensvc/commit/b1719fa04d5e9bd401e03eda8eeaa37555ed80c5>`_ Fix rbac denies of tls/raw connections requests
| `2.0-21-g770791f0 <https://github.com/opensvc/opensvc/commit/770791f0445e3a96ab7a17d317de4f97bc5cc1ac>`_ Add a __str__ method to the ClientHandler class
| `2.0-20-g954e1551 <https://github.com/opensvc/opensvc/commit/954e1551e91e0cded1fa4364a27b62e3361a066f>`_ Check rbac before multiplexing
| `2.0-19-gc6cad80d <https://github.com/opensvc/opensvc/commit/c6cad80d92769b228eb3f327395ad7620ad0ec46>`_ Stop server-sending the index.css, as it will be bundled in the js
| `2.0-18-ge019db00 <https://github.com/opensvc/opensvc/commit/e019db00575c22526ac7901e76abffb9772dd077>`_ Fix the user_grant() bypass for raw socket protocol
| `2.0-17-g183c3df2 <https://github.com/opensvc/opensvc/commit/183c3df21929e1f89e846c6070ce61279d6abc92>`_ Add "fullpem" and "pkcs12" actions to sec and usr objects
| `2.0-16-g67785236 <https://github.com/opensvc/opensvc/commit/67785236e6615e574bb38402ef259809f55ec2d9>`_ Fix and simplify rbac controls
| `2.0-15-g72f0d4a4 <https://github.com/opensvc/opensvc/commit/72f0d4a4b456b43bfa5c6ef92460cf086f192a0d>`_ Add the /whoami api handler
| `2.0-14-ga09f7e09 <https://github.com/opensvc/opensvc/commit/a09f7e09fb876ab85b3d3fe4298e398600c97eba>`_ Correctly wait for a stream request to finish sending its data before replying
| `2.0-13-gc22a7b65 <https://github.com/opensvc/opensvc/commit/c22a7b654588af68170c7057df20f8d5dd87d204>`_ Compute the Content-Length header in the client-side (get, post, stream)
| `2.0-12-gab0bafb5 <https://github.com/opensvc/opensvc/commit/ab0bafb5ec758955b209c6b8d6e71b7017f31573>`_ Avoid short-looping the merge_hb_data on set_smon() always reporting a change
| `2.0-11-gf10b1090 <https://github.com/opensvc/opensvc/commit/f10b10906b268ad900debeaf74012bf956f6d21e>`_ Fix a pylint harmless error in the lsnr authentication codepath
| `2.0-10-ge0c61d94 <https://github.com/opensvc/opensvc/commit/e0c61d943ae7a1ce0cdea8cf1f3fa5178b551fda>`_ Fix undefined variable uses in the node module
| `2.0-9-gdbc74c6d <https://github.com/opensvc/opensvc/commit/dbc74c6d7b518168caa4f7de4581a9f3782d52f7>`_ Fix the daemon_service_action() kwargs in the call from sync.rsync
| `2.0-8-g34aa14e6 <https://github.com/opensvc/opensvc/commit/34aa14e6e6386ef495675a18b5cf3f1b5035195a>`_ Avoid running "svcmgr status" on init when there are no objects deployed
| `2.0-7-g396cbf94 <https://github.com/opensvc/opensvc/commit/396cbf94f97ca14927612322d9c77e2304eb28af>`_ Fix py2 compat in osvcd listener
| `2.0-6-g4a526268 <https://github.com/opensvc/opensvc/commit/4a5262681d48a4d69eee6724eaa86f6a567f4c2d>`_ Catch socket.error from h2_daemon_get:request()
| `2.0-5-gb18f72ad <https://github.com/opensvc/opensvc/commit/b18f72ad785efd5f9663cf3b94dc343139eb5ec4>`_ Fix the "om mon --stats" command
| `2.0-4-gcb1337e5 <https://github.com/opensvc/opensvc/commit/cb1337e5f9647f50a28773ddb94d4408ce8fa77e>`_ Add a http/2 listener to the daemon
| `2.0-3-gf9b854b9 <https://github.com/opensvc/opensvc/commit/f9b854b9d9acc0e43c0d93658208a12c4db11543>`_ Fix a stack on docker container start when environment has unresolved refs
| `2.0-2-g09031a6d <https://github.com/opensvc/opensvc/commit/09031a6db8cfd79b04c3e91627e99bef9f03c38c>`_ Define a http/2 unix socket path
| `2.0-1-gf43683ca <https://github.com/opensvc/opensvc/commit/f43683ca6f17b53defe75c84824253ece895f2e7>`_ Add modules to implement a http/2 server and client
