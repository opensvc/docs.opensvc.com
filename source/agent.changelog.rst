Changelog
=========


| `2.0-627-g3e50e5aa <https://github.com/opensvc/opensvc/commit/3e50e5aaac852dd334b06d9f01b21f563863e629>`_ Merge pull request #81 from cvaroqui/master
| `2.0-626-gc37b0ca3 <https://github.com/opensvc/opensvc/commit/c37b0ca388b166411502abdb844fc0e04514cf71>`_ Fix a listener thread method call arguments
| `2.0-625-g3a5afe36 <https://github.com/opensvc/opensvc/commit/3a5afe36f171a8ca57aa960647999fd212262f25>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-623-gec80108d <https://github.com/opensvc/opensvc/commit/ec80108dcda0b2084edfff86a44ad5472378a304>`_ Don't log an exception on ConnectionAbortedError in the listener main loop
| `2.0-622-gbf707287 <https://github.com/opensvc/opensvc/commit/bf70728778471eea53d80fb7c1dbd4960cca4480>`_ Don't hang the client browser accessing the webapp when not installed
| `2.0-622-g61c63f92 <https://github.com/opensvc/opensvc/commit/61c63f92e19a4afef49988eedd2608a14802c9dc>`_ Merge pull request #79 from cvaroqui/master
| `2.0-621-g65dc77a4 <https://github.com/opensvc/opensvc/commit/65dc77a49bf8d5782a31a5c6f6977f7f3a8ddf5c>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-618-g1bc441c9 <https://github.com/opensvc/opensvc/commit/1bc441c913eac737f6ec5a70494b837cf07f9c30>`_ Make sec and cfg key install in volume behave more like cp
| `2.0-617-gdfdfc71d <https://github.com/opensvc/opensvc/commit/dfdfc71d344b9d3a042835c9622bac163836a853>`_ Fix a duplicate declaration of the om executable in the rpm spec file
| `2.0-616-g2d0530c2 <https://github.com/opensvc/opensvc/commit/2d0530c24fc25bfd18f752847a1102a0dd716868>`_ Optimize redundant calls to Data::resolve_keys() from Volume::_install_data()
| `2.0-615-gcca2804c <https://github.com/opensvc/opensvc/commit/cca2804c67232df89463e7de05048a8150e16abc>`_ Move the is_glob() implementation from rcCollectorCli to rcUtilities
| `2.0-614-gb068a364 <https://github.com/opensvc/opensvc/commit/b068a364850b7676eb1943149d512aa85582c5d3>`_ Remove a duplicate call to all_keys() in the volume _install_data() codepath
| `2.0-613-g2a6e7a5a <https://github.com/opensvc/opensvc/commit/2a6e7a5a98a9de77b55149990f625163eb35987b>`_ Add more fnmatch pattern hints to the volume resource _install_data() method
| `2.0-612-gc08fbe46 <https://github.com/opensvc/opensvc/commit/c08fbe4650e5dd9108482acd860f8b72a22a7d42>`_ Merge pull request #77 from cgalibern/master
| `2.0-612-g7b68993a <https://github.com/opensvc/opensvc/commit/7b68993a45e11e98f88d2633fb4c4f6a70f5a823>`_ Display the key name in addition to the cfg and sec key install destination
| `2.0-611-g8600ec16 <https://github.com/opensvc/opensvc/commit/8600ec16ececd89c44d58362e42138a717e3f61a>`_ Small optimisation on osvcd_shared.py
| `2.0-611-g5cd82a08 <https://github.com/opensvc/opensvc/commit/5cd82a08b8bd5102b3d325c0279988b9a66488c5>`_ Don't always add a trailing newline to a key value upon sec and cfg key edit
| `2.0-610-gdda7677a <https://github.com/opensvc/opensvc/commit/dda7677acf99c279e10f659d3fe822829d5c087f>`_ Merge pull request #78 from cvaroqui/master
| `2.0-609-g2842f01e <https://github.com/opensvc/opensvc/commit/2842f01e6d3f3eb2fb26ad676a09e42f3ea96770>`_ Add mpathpersist support
| `2.0-608-gfdfd78d3 <https://github.com/opensvc/opensvc/commit/fdfd78d37d24ac8ffca5be6b75d71a5d4816bff7>`_ Merge pull request #74 from cvaroqui/master
| `2.0-606-g6ae2ff63 <https://github.com/opensvc/opensvc/commit/6ae2ff63736ac0231b8b8786736612efc9705cd0>`_ Merge pull request #76 from cgalibern/master
| `2.0-605-gce184f11 <https://github.com/opensvc/opensvc/commit/ce184f11fff9036fd117c39c0472c70ea12cffb1>`_ [CI-travis] Cache pip
| `2.0-604-g34df5360 <https://github.com/opensvc/opensvc/commit/34df53603cb97268411c48ea9ac214637b56539a>`_ [PEP8-LINT] Fix some warnings
| `2.0-603-g3b23d664 <https://github.com/opensvc/opensvc/commit/3b23d664ad376f73ac66c16734af6c65d9a9a62d>`_ [tox] Add pylint step
| `2.0-602-gafd94d2d <https://github.com/opensvc/opensvc/commit/afd94d2df305d0b5bded485f648f1d269a424029>`_ [Test] Fix transient failures on test_run_loop_forever_when_no_other_daemon_are_here
| `2.0-602-g24490dc5 <https://github.com/opensvc/opensvc/commit/24490dc5307a0f55ab75cd8724e6f6489cccf750>`_ TOC fixes and enhancements on Linux
| `2.0-601-g8905aa3c <https://github.com/opensvc/opensvc/commit/8905aa3cafcc477c7dd7f8894a0d4cb52aec6d77>`_ Merge pull request #73 from cvaroqui/master
| `2.0-600-g19fa0259 <https://github.com/opensvc/opensvc/commit/19fa0259a8a8ae1e0578b70a41f6d3eec271b716>`_ Disable volume sync#i0 if it contains no resource with files to sync
| `2.0-599-g7e0cf61a <https://github.com/opensvc/opensvc/commit/7e0cf61ac0efb1dd9555c9b9ff4d3cb05df32cdc>`_ Merge pull request #72 from arnaudveron/master
| `2.0-598-gc59a6465 <https://github.com/opensvc/opensvc/commit/c59a6465c73ae1c66925822aa66280dd986d4d2c>`_ Fix systemd unit name dependency for docker
| `2.0-597-g7da98304 <https://github.com/opensvc/opensvc/commit/7da9830466672a0411fa7a663694225969ab6e7e>`_ Merge pull request #71 from cvaroqui/master
| `2.0-596-g4dc890dc <https://github.com/opensvc/opensvc/commit/4dc890dcc4cc3c2ac859a366d2cf06d3501d1112>`_ Fix podman dns options settings
| `2.0-595-g373e95ea <https://github.com/opensvc/opensvc/commit/373e95eab0494757c5a9a53aef8ccdb38501cc97>`_ Ensure docker/podman --dns-option are set to minimal requirements
| `2.0-594-gc9a96da8 <https://github.com/opensvc/opensvc/commit/c9a96da80f9846a85ed4cbfbae1515a737caf725>`_ Merge pull request #70 from cvaroqui/master
| `2.0-593-g9d76dec5 <https://github.com/opensvc/opensvc/commit/9d76dec5bf0a24523474f5bc2edd5c8396208c4d>`_ Fix the test for registration keys count
| `2.0-592-g121800b9 <https://github.com/opensvc/opensvc/commit/121800b9e1bc1b7e33269f129605b4bdbcccd9af>`_ Merge pull request #69 from cvaroqui/master
| `2.0-591-gf9b91dee <https://github.com/opensvc/opensvc/commit/f9b91dee3804b0ed7531dc7a26dcdfa9edadfc19>`_ Fix the scsireserv registered count for multi-lun resources
| `2.0-590-g7bb37cf7 <https://github.com/opensvc/opensvc/commit/7bb37cf77d0e980083b071719409ebc8ae1866c3>`_ Merge pull request #68 from cvaroqui/master
| `2.0-589-gbf815359 <https://github.com/opensvc/opensvc/commit/bf81535970b96543966baad2e8aaed34552522f6>`_ Fix pylint reported errors
| `2.0-588-g95509c44 <https://github.com/opensvc/opensvc/commit/95509c44a667083e98729e1c1fc0f06aa616bf8b>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-585-gcc90f123 <https://github.com/opensvc/opensvc/commit/cc90f123fc039383188d4fdd9c2fb571d7017e57>`_ Add the Huawei Dorado array and pool drivers
| `2.0-584-g32e9c1eb <https://github.com/opensvc/opensvc/commit/32e9c1eb5a8f362b40e00f4922ae945aa06389cb>`_ Handle path returning "Not ready" scsi errors on scsi3 pr inquiries
| `2.0-583-gbd6f0bfa <https://github.com/opensvc/opensvc/commit/bd6f0bfab5da565b55d6e615a33aeac9c7bdbd49>`_ Always run configure() after create_disk()
| `2.0-582-g8e587027 <https://github.com/opensvc/opensvc/commit/8e587027a1ae0d66ce1b07fe5c3b664503524fb5>`_ Add --nodes option to "om pool create volume"
| `2.0-581-g51be1314 <https://github.com/opensvc/opensvc/commit/51be13143514ed124a6f790f1e40bc3003dffed6>`_ Log the scanscsi actions instead of printing them
| `2.0-580-g85e61394 <https://github.com/opensvc/opensvc/commit/85e6139442236bde78985551496ba7a43e45ae1e>`_ Fix the scoped disk_id settings in disk.disk provisionning codepath
| `2.0-579-gf664904f <https://github.com/opensvc/opensvc/commit/f664904f1c0c6582904acf4bb5391763e9925e64>`_ Fix duplicated r1_result in the sym create disk returned dataset
| `2.0-578-gf417f82d <https://github.com/opensvc/opensvc/commit/f417f82daeee0b74b297dc09661a313ceb8e495f>`_ Fix the daemon unlock handler call parameters
| `2.0-577-g7f8b56a5 <https://github.com/opensvc/opensvc/commit/7f8b56a599ae8753cd041634a8f823a0b3b090ee>`_ Fix the "om array" command wrapper Array object lookup by name
| `2.0-576-gfa992bd7 <https://github.com/opensvc/opensvc/commit/fa992bd75c6da26c356c34dcd50d8c7aca145b79>`_ Change the "om pool create volume" default behaviour to fmt=True
| `2.0-576-g30688a41 <https://github.com/opensvc/opensvc/commit/30688a41d1b320dc5124e44298a76cfed8dfbd2c>`_ Merge pull request #66 from cgalibern/master
| `2.0-575-gf8e95c1b <https://github.com/opensvc/opensvc/commit/f8e95c1b6354d11e2c1797576289d473f1bbc291>`_ Test sec and cfg accept camelCase keys
| `2.0-575-ged883bae <https://github.com/opensvc/opensvc/commit/ed883bae3f3534279e10bb5d1915b21ff49d0350>`_ Fix daemon lock acquire from unix socket
| `2.0-574-ga7b3140a <https://github.com/opensvc/opensvc/commit/a7b3140a132d98525e514a7ab199dbf8424a074f>`_ Merge pull request #65 from cgalibern/master
| `2.0-573-g8701e588 <https://github.com/opensvc/opensvc/commit/8701e5887e8afadf3f8f609eb62aad82fdcc807a>`_ Tox include slow tests and add py35
| `2.0-572-gdcecd399 <https://github.com/opensvc/opensvc/commit/dcecd39970f7d7ac61e18f396945718b36cb7719>`_ Merge pull request #64 from cgalibern/master
| `2.0-571-ge8c09890 <https://github.com/opensvc/opensvc/commit/e8c098904bdffb7523f6a9ed6c48078fb7a960a1>`_ Add tox config
| `2.0-570-g5fd8d8db <https://github.com/opensvc/opensvc/commit/5fd8d8db9c5247921b39c8e621eee7bee11538a2>`_ Merge pull request #63 from cgalibern/master
| `2.0-569-ge7b5b10d <https://github.com/opensvc/opensvc/commit/e7b5b10d8024edb28409cacbd0760e9a5489d001>`_ Fix 'print status' errors when terminal columns are too low
| `2.0-568-g03ce2be7 <https://github.com/opensvc/opensvc/commit/03ce2be7abe920cc5449e8a210200e2d0727a7ad>`_ Test cleanup travis
| `2.0-567-g0e93e8f8 <https://github.com/opensvc/opensvc/commit/0e93e8f80e946ba38f0e467a839cc054241a759f>`_ Merge pull request #62 from cvaroqui/master
| `2.0-566-g3c0b4796 <https://github.com/opensvc/opensvc/commit/3c0b4796a8fdd6c74e1b3b22426c21ac35103770>`_ POST /wake_monitor enhancement
| `2.0-565-ge53f7ce6 <https://github.com/opensvc/opensvc/commit/e53f7ce67d7eb2a1830fefa2dd5cdc8e530f30d7>`_ Fix udevadm hardcoded fullpath
| `2.0-564-g192d7abe <https://github.com/opensvc/opensvc/commit/192d7abe030c6a6162425f9f93e265bafe875e20>`_ Merge pull request #61 from cgalibern/master
| `2.0-563-g92f31e4b <https://github.com/opensvc/opensvc/commit/92f31e4b56829d9f8972187501ef92099a892756>`_ Improve detection of osvcd process
| `2.0-562-gc16c85d2 <https://github.com/opensvc/opensvc/commit/c16c85d2c19880feb92741effc9bf29f1c3e1eb5>`_ Test: don't create node.Node() when loading test files
| `2.0-561-gf9fcf22d <https://github.com/opensvc/opensvc/commit/f9fcf22d0d9d65e41e22b13eda2228b5ed21c1f6>`_ Merge pull request #60 from arnaudveron/master
| `2.0-560-g182613fe <https://github.com/opensvc/opensvc/commit/182613fea465377f5b4c7a60b4f2d72be3f49978>`_ Fix relay query when --node option is not set
| `2.0-559-gded62726 <https://github.com/opensvc/opensvc/commit/ded627266a5218b0a52fe7ba16c2e28dfd4a8b85>`_ Merge pull request #59 from cgalibern/master
| `2.0-558-g05d12966 <https://github.com/opensvc/opensvc/commit/05d12966ad8216b0b975f0a22a44bc25dacf474e>`_ Fix regression on osvc_windservice lock usage
| `2.0-557-g39f9916f <https://github.com/opensvc/opensvc/commit/39f9916ff0f1b7b0c29075676e60ecc92983ec3f>`_ Update daemon process detection and prevent multiple run
| `2.0-556-g54359d0a <https://github.com/opensvc/opensvc/commit/54359d0ab90463829080ea84b8faab6bb0255143>`_ Update daemon process detection and prevent multiple run
| `2.0-555-g82e78296 <https://github.com/opensvc/opensvc/commit/82e782968c368fc179b474b5dc8ce84dfa7e3252>`_ Test: refacto move mock_argv() fixture to conftest.py
| `2.0-554-g6f14bdc0 <https://github.com/opensvc/opensvc/commit/6f14bdc087c1cfa913f3f88bc562aa000b17be7f>`_ Test: make tests pass on Solaris
| `2.0-553-gb6379cac <https://github.com/opensvc/opensvc/commit/b6379cac7de0981539d03eb23589f33c99a2e25e>`_ Test: Fix lock test on Solaris
| `2.0-552-g40f49204 <https://github.com/opensvc/opensvc/commit/40f492041ce37cf407de00c04fea3fcc53f0eaff>`_ Test: Allow test_fs flag on Solaris
| `2.0-551-g68f43668 <https://github.com/opensvc/opensvc/commit/68f43668a6eb9847e9bec013978b03e42fa7af29>`_ Merge pull request #58 from cvaroqui/master
| `2.0-550-g4c99bb85 <https://github.com/opensvc/opensvc/commit/4c99bb858d0fb6fa85f8f88284e70e47bf10eda3>`_ Simplify the logger setup in svcBuilder
| `2.0-549-gf7a78158 <https://github.com/opensvc/opensvc/commit/f7a7815815deffb15bfcb38358e4a20d6b99cd70>`_ Remove daemon lock testing for wake_monitor() codepaths
| `2.0-548-gf238636f <https://github.com/opensvc/opensvc/commit/f238636fa5517d332b704a254d5d9d637ec44d23>`_ Be more tolerant of locking conflict on osvcd startup
| `2.0-547-gad2bf41e <https://github.com/opensvc/opensvc/commit/ad2bf41e8f15d6591a90d0427f916b676dd73b53>`_ Do not open() lock files with O_TRUNC
| `2.0-546-g550fc45d <https://github.com/opensvc/opensvc/commit/550fc45da45029fafba31cbd3cd63e7b3368cb26>`_ Accept formatting a local instance status when the daemon is down
| `2.0-545-g0ee68ce7 <https://github.com/opensvc/opensvc/commit/0ee68ce7da5144aea28beb89aba39b1f6707c8fb>`_ Merge pull request #56 from cvaroqui/master
| `2.0-544-g87c68d13 <https://github.com/opensvc/opensvc/commit/87c68d13342ef48e45ed617271853cd08e6ad72d>`_ Fix hb stack in _configure() error path
| `2.0-543-g09f8deb2 <https://github.com/opensvc/opensvc/commit/09f8deb23cda113bd6bc53de96ed12a8794d2b0d>`_ Allow Uppercase in config file keys
| `2.0-542-gb4a9c967 <https://github.com/opensvc/opensvc/commit/b4a9c967877301b248ca441daf9e515bc7913ad7>`_ Merge pull request #53 from cgalibern/master
| `2.0-539-gaa1eaaf9 <https://github.com/opensvc/opensvc/commit/aa1eaaf962c083bd58a061304e1dbee5b8fd2cb3>`_ Don't retry send actions to daemon when ECONNREFUSED
| `2.0-538-g8d7812ff <https://github.com/opensvc/opensvc/commit/8d7812ff6e1d4ec9e47e220cd394281218757f25>`_ Fix RETRYABLE list with errno values
| `2.0-537-g527237f9 <https://github.com/opensvc/opensvc/commit/527237f92e593c9d7522a03272903a9ee2cbeb15>`_ Merge pull request #55 from cvaroqui/master
| `2.0-537-g7ca3ad76 <https://github.com/opensvc/opensvc/commit/7ca3ad769c5b3bec9f21fbfe8f731a774668f6ac>`_ Don't retry send actions to daemon when ECONNREFUSED
| `2.0-536-gb46bcaa4 <https://github.com/opensvc/opensvc/commit/b46bcaa4af311a9ef29775df183348dc166cb361>`_ Fix a stack sorting fs.dir and fs.flag resources in the same object
| `2.0-536-g5149e1e4 <https://github.com/opensvc/opensvc/commit/5149e1e4079bb68159c72830a501f562b3629f18>`_ Fix RETRYABLE list with errno values
| `2.0-535-g512c9992 <https://github.com/opensvc/opensvc/commit/512c9992fd18fca35005e2443bd351efc9dd84e0>`_ Merge pull request #52 from cgalibern/master
| `2.0-534-g93a1337e <https://github.com/opensvc/opensvc/commit/93a1337e9652c209f8f1919162ef33a4c991431f>`_ Add build status to README
| `2.0-533-g9e242a4f <https://github.com/opensvc/opensvc/commit/9e242a4fb7e0fc62a805fc9fd8eb5683ebe2c9e1>`_ Pep8 resData.py
| `2.0-532-gc7601c12 <https://github.com/opensvc/opensvc/commit/c7601c12fd30f069c3461a1db841c5f6f3f8cde3>`_ Tests: Ensure fs flag filename is correct
| `2.0-531-g4ceeb55a <https://github.com/opensvc/opensvc/commit/4ceeb55a0a6249d0ebbbefe70bf915329cf75e64>`_ Merge pull request #50 from cvaroqui/master
| `2.0-530-gcf6bf915 <https://github.com/opensvc/opensvc/commit/cf6bf91561d1f2c95a097c0c8fc27d905bf54ca3>`_ Don't start/stop task.type=oci containers on start/stop
| `2.0-529-gf1fbb370 <https://github.com/opensvc/opensvc/commit/f1fbb370607ddb3f5efa4ad1481cc9039b56b6c3>`_ Classify "enter" as a no-lock action
| `2.0-528-g8e698d50 <https://github.com/opensvc/opensvc/commit/8e698d5038fd0ad60c22c9bca7a70b1f35cd7e30>`_ Merge pull request #48 from cvaroqui/master
| `2.0-527-g64409e21 <https://github.com/opensvc/opensvc/commit/64409e219c5cbee847d82d6bf7f37935a0c60a71>`_ Add the "enter --rid <rid>" action
| `2.0-526-g8335fb56 <https://github.com/opensvc/opensvc/commit/8335fb56fe1eefdebd40d48a5b6cda6865daa153>`_ Fix a monitor thread stack triggered when a lot of objects are being deleted
| `2.0-525-g34059985 <https://github.com/opensvc/opensvc/commit/340599854cd950e4cb70034d23a751727c2c049a>`_ Merge pull request #47 from cvaroqui/master
| `2.0-524-gb1e45775 <https://github.com/opensvc/opensvc/commit/b1e45775e8db94e0823808759e48738f893ef20a>`_ Fix an issue in event delivery to clients
| `2.0-523-g3569af69 <https://github.com/opensvc/opensvc/commit/3569af69884d6aebdab152e8a7534b73e3d81631>`_ Merge pull request #46 from cvaroqui/master
| `2.0-522-ga3b59a33 <https://github.com/opensvc/opensvc/commit/a3b59a33c5214d5000581167e008d011948a5a52>`_ Allow forwarding to the opensvc backend networks
| `2.0-521-g37017be1 <https://github.com/opensvc/opensvc/commit/37017be16ac3b4e734afba18e98e2a03e38cd570>`_ Merge pull request #45 from cgalibern/master
| `2.0-520-g596297d4 <https://github.com/opensvc/opensvc/commit/596297d420919d091297a46bf7746a816444b737>`_ Add opensvc.iml to git ignored files
| `2.0-519-g2471cc5c <https://github.com/opensvc/opensvc/commit/2471cc5c5436f603ba17ae1ecc33e6622727c9d7>`_ Fix lock creation failure when lock directory doesn't exist
| `2.0-518-gda11b9be <https://github.com/opensvc/opensvc/commit/da11b9be2eb02aa97a1afb11beacc3202f3030fa>`_ Apply pep8 style to lock.py
| `2.0-517-g317298de <https://github.com/opensvc/opensvc/commit/317298de92afe9734063bf1740bc9f90266bc4ef>`_ Tests: tests lock lib
| `2.0-516-g9aea3f0a <https://github.com/opensvc/opensvc/commit/9aea3f0ae9d9f7c9d58fb73e46e933325db4ff31>`_ Test: refacto mgr tests
| `2.0-515-g79564e90 <https://github.com/opensvc/opensvc/commit/79564e90430244321b7389924041949fe9327fe6>`_ Tests: tests config with lvm service
| `2.0-514-g11b2a18f <https://github.com/opensvc/opensvc/commit/11b2a18fab6c0211ec5bec1edb60e86bd807187e>`_ Merge pull request #44 from cvaroqui/master
| `2.0-513-g68684979 <https://github.com/opensvc/opensvc/commit/686849791525318fa221b58638cce275f8555f73>`_ Redirect "om <secpath> ed" to edit config
| `2.0-512-g5a0d1649 <https://github.com/opensvc/opensvc/commit/5a0d16494e9344d8bb1b7b52d0ac8cc28ee3896a>`_ Merge pull request #43 from cvaroqui/master
| `2.0-511-gda23bc13 <https://github.com/opensvc/opensvc/commit/da23bc135c89199c53fe366a14257e5976a1f217>`_ Use a more coherent display name for parents and children in print status output
| `2.0-510-g728a3312 <https://github.com/opensvc/opensvc/commit/728a33121e57ee42b0e66756911397293be133d0>`_ Fix "undef" status of parents in print status output
| `2.0-509-g5adcdad2 <https://github.com/opensvc/opensvc/commit/5adcdad204db6d7e6857f6a501c74531152f770a>`_ Merge pull request #42 from cvaroqui/master
| `2.0-508-gf0fc8cbf <https://github.com/opensvc/opensvc/commit/f0fc8cbfdd116f931bf8dee12ab4fdc5e008d299>`_ Fix "om mon" showing out of current namespace objects
| `2.0-507-gda4c9f27 <https://github.com/opensvc/opensvc/commit/da4c9f27da6ab1dc56dc821e3fd7f43e9edf497c>`_ Merge pull request #37 from cgalibern/master
| `2.0-506-g344b8fac <https://github.com/opensvc/opensvc/commit/344b8fac16fa21b8df4d8ae6eb062b1c17aa4352>`_ Test: run pytest before pylint to have earlier failure status
| `2.0-505-g95780a36 <https://github.com/opensvc/opensvc/commit/95780a36c3268d511429b54c27341f43ac7d1734>`_ Set can_rollback on successful start in the fs.flag driver
| `2.0-504-ga4c2039e <https://github.com/opensvc/opensvc/commit/a4c2039e235a7ff362a02bec707c851441499cd1>`_ Add fs.flag resource driver for SunOS
| `2.0-503-g9e8a46db <https://github.com/opensvc/opensvc/commit/9e8a46db93697d7d6043d614336bbf136663cdd3>`_ Reformat mgr.py
| `2.0-502-gbb92972e <https://github.com/opensvc/opensvc/commit/bb92972e4fb5fc507f9b41ec0c2e71e597abb0df>`_ Add service actions (Tests)
| `2.0-501-g65dc0a41 <https://github.com/opensvc/opensvc/commit/65dc0a4117cf7169f36a01466403436f105def9c>`_ Tests: use capture_stdout fixture
| `2.0-500-gd3edede9 <https://github.com/opensvc/opensvc/commit/d3edede9f3716c45ff2c50df006954a8135a37fe>`_ Test Linux fs driver honoring the "umount fs with io err" policy
| `2.0-499-g94916866 <https://github.com/opensvc/opensvc/commit/9491686656b3b8c67e28788de11f5b3bcf44a8f8>`_ Merge pull request #41 from cvaroqui/master
| `2.0-498-g57c8ffee <https://github.com/opensvc/opensvc/commit/57c8ffee1854dcf25bfa30c1e16c898f20980387>`_ Fix the cfg objects add --from <dir> path walking algorithm
| `2.0-497-g5e759980 <https://github.com/opensvc/opensvc/commit/5e759980561d8cd8bd8bd08332122fa5e7254b72>`_ Merge pull request #40 from cvaroqui/master
| `2.0-496-gf566e5fd <https://github.com/opensvc/opensvc/commit/f566e5fdc65c513da1b8f38d6d919ed529145f49>`_ Fix Svc::resource_handling_dir() stacking on fs drivers with no mount_point
| `2.0-495-ga79c01ac <https://github.com/opensvc/opensvc/commit/a79c01ac27d16e414eaf50210682d28cbf8fdd8b>`_ Set can_rollback on succesful start in the fs.flag driver
| `2.0-494-g5d21decb <https://github.com/opensvc/opensvc/commit/5d21decbaf7b5f987c8290967219e912ca0b98b8>`_ Merge pull request #39 from cvaroqui/master
| `2.0-493-g785f4212 <https://github.com/opensvc/opensvc/commit/785f4212e9052da4a7675122b6a854604dc21313>`_ Fix the cluster.vip scoped declaration
| `2.0-492-g424f4fd8 <https://github.com/opensvc/opensvc/commit/424f4fd8a0bc6a86fc1d0dd5d05741e4aeff991e>`_ Merge pull request #38 from cvaroqui/master
| `2.0-491-gdbbf8b82 <https://github.com/opensvc/opensvc/commit/dbbf8b82c2fdbe8b81233b608086fd1789c2f6cf>`_ Add the "edit --key <k>" action to sec and cfg objects
| `2.0-490-g88656711 <https://github.com/opensvc/opensvc/commit/886567116b1053dbc5ae9cbe68a6ff71d5c264d2>`_ Add a fullpem key to the sec object on "gen cert" action
| `2.0-489-g55e4cb6b <https://github.com/opensvc/opensvc/commit/55e4cb6bd7c9350b7537e9c84ec1a35d999f9a47>`_ Support more container image formats
| `2.0-488-g040d159e <https://github.com/opensvc/opensvc/commit/040d159e439efc72351c33b33547738f5f1593fb>`_ Merge pull request #36 from cgalibern/master
| `2.0-487-g4a31d65d <https://github.com/opensvc/opensvc/commit/4a31d65d47cac6aa275ef84802d6172a78dbb7d0>`_ Disable patch coverage
| `2.0-486-ge83748c1 <https://github.com/opensvc/opensvc/commit/e83748c12f1d6966cafd262d26b6d0d6c363007a>`_ Merge pull request #35 from cvaroqui/master
| `2.0-485-gdb9c283c <https://github.com/opensvc/opensvc/commit/db9c283c961f71e94452f3bc762b6bbe5e9ca6be>`_ Fix fs driver not honoring the "umount fs with io err" policy
| `2.0-484-gfbc46123 <https://github.com/opensvc/opensvc/commit/fbc46123d31667b0e6aeef66db1fb6026f617dc4>`_ Allow the prkey keyword on fs resources
| `2.0-483-g89f5c1d0 <https://github.com/opensvc/opensvc/commit/89f5c1d06e594e0e41f87b8673c366167107d31b>`_ Update docs for a volume_mounts keyword help update
| `2.0-482-g046b6e13 <https://github.com/opensvc/opensvc/commit/046b6e131e4f92da813fc0666d34a366bd22344f>`_ Apply coding style to the solaris zone container driver
| `2.0-481-gf19a63b8 <https://github.com/opensvc/opensvc/commit/f19a63b84a45116c0ec98f76a2c2d523356a77ec>`_ Merge pull request #34 from cgalibern/master
| `2.0-480-gde5d66ff <https://github.com/opensvc/opensvc/commit/de5d66ff644e79c604552bb2a2274b173a3562cf>`_ Tests: re-add some nodemgr tests
| `2.0-479-g7bf3c8e2 <https://github.com/opensvc/opensvc/commit/7bf3c8e20d1009f343e54907cc7f90ebf94804cc>`_ Do not try to halt a zone in 'unavailable' state
| `2.0-478-gab4e8ead <https://github.com/opensvc/opensvc/commit/ab4e8ead9060b9d7e471c5a94ef77a4cb0f50dd9>`_ Fix the fs.flag resource for services in the root namespace
| `2.0-477-g77c67de6 <https://github.com/opensvc/opensvc/commit/77c67de6bce8dc71f4944409c55a3d8fdb46f562>`_ Fix the sym array actions
| `2.0-476-gd16e7dff <https://github.com/opensvc/opensvc/commit/d16e7dff07d61e50da91532c0eadc6b66e93658c>`_ Python3.8 support
| `2.0-475-gfebb2910 <https://github.com/opensvc/opensvc/commit/febb2910a8adfdebae3aefa74f127fe5c9943a9a>`_ Merge pull request #32 from cgalibern/master
| `2.0-474-g0587f558 <https://github.com/opensvc/opensvc/commit/0587f558b0ce6942f068fe9f628d6789e9878666>`_ Tests: replace nose by pytest
| `2.0-473-gcaa774ea <https://github.com/opensvc/opensvc/commit/caa774ead92ddf66deee384e14d8b9c5686b8153>`_ Tests: nose->pytest for test_ci_converters.py
| `2.0-472-g6fb5ad55 <https://github.com/opensvc/opensvc/commit/6fb5ad5554f0eb316234116584d9d7868590ac37>`_ Tests: nose->pytest for test_ci_storage.py
| `2.0-471-g55038ba7 <https://github.com/opensvc/opensvc/commit/55038ba710e51d7645e88ac9de8e6ab52b62aa87>`_ Tests: nose->pytest for test_ci_rcstatus.py
| `2.0-470-g4cf2e6ff <https://github.com/opensvc/opensvc/commit/4cf2e6ff67a6d6ef659fb4583318190d02200ed1>`_ Tests: nose->pytest for test_import.py
| `2.0-469-g0f97fbce <https://github.com/opensvc/opensvc/commit/0f97fbce98db43114e7bbe8fbf9bf2e08be9d774>`_ Tests: nose->pytest for freezer.py
| `2.0-468-gbb70096c <https://github.com/opensvc/opensvc/commit/bb70096cf7ee62d16f481106e34640c8393c7bfe>`_ Tests: prepare nose->pytest for freezer.py
| `2.0-467-g3f969aeb <https://github.com/opensvc/opensvc/commit/3f969aebfaa8e4d61c02140e9f7f105c7b3aa379>`_ Tests: nose->pytest for forest.py
| `2.0-466-g13184463 <https://github.com/opensvc/opensvc/commit/13184463e447eb50970774beacf33b53db9faedf>`_ Tests: prepare nose->pytest for forest.py
| `2.0-465-ge89bab24 <https://github.com/opensvc/opensvc/commit/e89bab2420cad46db1f075e1a0908ef62e73e4d9>`_ Discard 127.0.1.1 as a ipip tunnel endpoint
| `2.0-464-gf73b1c33 <https://github.com/opensvc/opensvc/commit/f73b1c339a2d593747496d640d571fb3083ef370>`_ Tests: Remove unused future import
| `2.0-463-g4ad91acb <https://github.com/opensvc/opensvc/commit/4ad91acbde132fe494e318a0567eea275eb1ac53>`_ Tests: pytest ignore external lib warnings
| `2.0-462-g5f069412 <https://github.com/opensvc/opensvc/commit/5f069412eb84bd373ac5bfc262cea92ae207fbee>`_ Remove some invalid escape sequence in string
| `2.0-461-gfe7f3001 <https://github.com/opensvc/opensvc/commit/fe7f3001f6f8f2c1066009fea3dba677c3e4cd84>`_ Tests use updated sys.path from conftest.py
| `2.0-460-gd3f84776 <https://github.com/opensvc/opensvc/commit/d3f84776bfa43d3b57a656da6babf605e8dd3a98>`_ Use code coverage from pytest
| `2.0-459-gdb556055 <https://github.com/opensvc/opensvc/commit/db556055b08015b85aaaeabaf86a1506d407845d>`_ Fix invalid escape sequence warnings
| `2.0-458-g14ad7eea <https://github.com/opensvc/opensvc/commit/14ad7eea71c6392ab77f1fccd8c7b731df2ce480>`_ Fix Default argument value is mutable
| `2.0-457-g96b7e4cd <https://github.com/opensvc/opensvc/commit/96b7e4cd200713c6a781f89ee6ae14bfcc498119>`_ Update rcUtilities.py with pep8 style
| `2.0-456-ga47fa66d <https://github.com/opensvc/opensvc/commit/a47fa66d5be0c117ffa1b4b827105d04ed1cda84>`_ Fix dump_config_data() trying to replace in non-string values
| `2.0-455-gf6739ea8 <https://github.com/opensvc/opensvc/commit/f6739ea8fb49644a5633bddd4db967fe7cc3ac30>`_ Don't allow dumping "some_kw=None" in configs
| `2.0-454-g1752e77d <https://github.com/opensvc/opensvc/commit/1752e77dffb12ecab7f56d9396ab407fe4a3a6cf>`_ Fix cloning of an object config with line continuations
| `2.0-453-g1c448b7d <https://github.com/opensvc/opensvc/commit/1c448b7d10f1cba41162837b8d876f3c4d82ed0d>`_ Merge pull request #29 from cgalibern/master
| `2.0-452-gffa9bf75 <https://github.com/opensvc/opensvc/commit/ffa9bf75915a192e86d3b576feab651933ba96e7>`_ Move test_ci_utilities.py from nose to pytest
| `2.0-451-g565ff207 <https://github.com/opensvc/opensvc/commit/565ff2074330e5dc5b2c4635a4aa71f74a90f6b1>`_ Allow run tests on Darwin
| `2.0-450-gc0af1ac1 <https://github.com/opensvc/opensvc/commit/c0af1ac12a3d0c6e4f5cf41c074ade887e52ea1b>`_ Allow import rcUtilitiesLinux on non Linux host
| `2.0-449-g794bfa61 <https://github.com/opensvc/opensvc/commit/794bfa615c77690d44fb9398f6d6a97f41927913>`_ Ensure error on dup docker mount destinations
| `2.0-448-gdc7c9971 <https://github.com/opensvc/opensvc/commit/dc7c997118452472a025ec0c1ca2a07563029131>`_ Remove the mount point existence test in stop() of the fs linux driver
| `2.0-447-g9864b7b9 <https://github.com/opensvc/opensvc/commit/9864b7b9fe7bf8010aabcd6f31f655c17878d920>`_ Fix a log message reporting a volume status as integer
| `2.0-446-gacdb543e <https://github.com/opensvc/opensvc/commit/acdb543ea20eedf74d1a8a246224f239239c4265>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-444-g04934a84 <https://github.com/opensvc/opensvc/commit/04934a84d1c00d07f81af82c1e9392ea6ddb6710>`_ Update coverage files
| `2.0-443-geaeef439 <https://github.com/opensvc/opensvc/commit/eaeef43925193ed3c819fdd5dfff2c45478cd043>`_ Update coverage version to allow py-cov requirements
| `2.0-443-g75d890c5 <https://github.com/opensvc/opensvc/commit/75d890c5ccf76a365dcc6e15f70287f0eafb8111>`_ Do not dedup on "set --kw <kw>+=<val>", add "set --kw <kw>|=<val>"
| `2.0-442-g77d81b1c <https://github.com/opensvc/opensvc/commit/77d81b1c2df55428ef3adcae9f30b275479fb84c>`_ Merge branch 'test-dup-dest-in-containter-mounts' into 'master'
| `2.0-441-gd770a262 <https://github.com/opensvc/opensvc/commit/d770a2620585c1b826a79fa14606416ce6086009>`_ Add python 2.7 to gitlab-ci tests, add pytest cov
| `2.0-440-g9a49be36 <https://github.com/opensvc/opensvc/commit/9a49be36d76f8e891246922669769a09e7bafb2d>`_ Ensure raise an error if volume_mounts contains dup dst mount points
| `2.0-439-gb40cbb12 <https://github.com/opensvc/opensvc/commit/b40cbb12ad486648be715c0603be5edc94d0fe04>`_ Better dedup on "set 'foo+=a b'"
| `2.0-438-gc7dfc38b <https://github.com/opensvc/opensvc/commit/c7dfc38b7e7e4a791bc8d374c49f350306a75b74>`_ Raise an error if volume_mounts contains dup dst mount points
| `2.0-437-g00d23023 <https://github.com/opensvc/opensvc/commit/00d2302353a0d844c6d46e46399240a08c021f74>`_ Update fixture osvc_path_tests for 2.7
| `2.0-436-ge15709cc <https://github.com/opensvc/opensvc/commit/e15709ccf60fdf161d686aa86d37bf05c01fda30>`_ Add tests for nodename abbreviation (for 'om mon' formatting)
| `2.0-435-g86cd3f8f <https://github.com/opensvc/opensvc/commit/86cd3f8f9fd2dacdc0fa49b5a0cf34345cccea1a>`_ Update the volume_mounts keyword documentation
| `2.0-434-g3e9b928d <https://github.com/opensvc/opensvc/commit/3e9b928d4a5174e8c42449821849128d058e6469>`_ Try gitlab-ci
| `2.0-433-ga5ec2b2b <https://github.com/opensvc/opensvc/commit/a5ec2b2bcd2a9cc95788ec6edb7f7dd0520e3508>`_ Reformat code
| `2.0-432-g19f9951d <https://github.com/opensvc/opensvc/commit/19f9951db1f864923d38a950491d7657df5592ce>`_ Update effective container volume_mounts access to respect volume resource access
| `2.0-431-g49c812c0 <https://github.com/opensvc/opensvc/commit/49c812c05a712268236d9a14667c4cbcbaad8c6d>`_ Add an "abort_start" method to the fs.flag driver
| `2.0-430-g3791ebe7 <https://github.com/opensvc/opensvc/commit/3791ebe7746e7d590f2c3a9846958d9553bdf0d2>`_ Refresh docs
| `2.0-429-gceb7fe2c <https://github.com/opensvc/opensvc/commit/ceb7fe2cdb5a905b4bc07392f4930057a9c20208>`_ Add a fs.flag resource driver
| `2.0-428-g3b17d534 <https://github.com/opensvc/opensvc/commit/3b17d534757d1aeb4226a00e0ecc465b866de77a>`_ Fix a pylint error on python
| `2.0-427-g5fc61fa5 <https://github.com/opensvc/opensvc/commit/5fc61fa586e8cd9a4dc7d0e9cfcf38e33e169548>`_ Scheduler enhancements
| `2.0-426-g08553faf <https://github.com/opensvc/opensvc/commit/08553faf26671ce4f78a44a9cd6f5621f21de74a>`_ Avoid forking a scheduler tasks when not useful
| `2.0-425-g7ea31e08 <https://github.com/opensvc/opensvc/commit/7ea31e08cc9d1d56edc6f737c4c532c4befc5ec4>`_ Reset more listener client information when the auth is refused
| `2.0-424-gb6efa4bf <https://github.com/opensvc/opensvc/commit/b6efa4bf57407729f8b0b05fce89c9ca4df4559d>`_ Fix giveback not waiting for frozen instance unfreeze
| `2.0-423-g73fd495d <https://github.com/opensvc/opensvc/commit/73fd495dfaababe0906e49e997d89361852c6264>`_ Clean up tasks last ret code on start/stop
| `2.0-422-g542a87ae <https://github.com/opensvc/opensvc/commit/542a87ae7c84d9f9688839bcc3688ba27fbacef5>`_ Don't clear "start failed" while global_expect is set
| `2.0-421-g0ee44b90 <https://github.com/opensvc/opensvc/commit/0ee44b90d56eb42776c06c302e8dd40cf6a1374a>`_ Toc action fixes
| `2.0-420-gea145152 <https://github.com/opensvc/opensvc/commit/ea14515232ada26e97389ea5906865fa756165f3>`_ Clear the "place failed" smon status when the service is up
| `2.0-419-gf4ae4f3e <https://github.com/opensvc/opensvc/commit/f4ae4f3e3e5bb208473ebc1434c9317ee1b4e9ec>`_ Add a expected_status kwarg to set_smon()
| `2.0-418-g3c8aabf7 <https://github.com/opensvc/opensvc/commit/3c8aabf79b5daa53782445b99fdb53c963d6e886>`_ Fix the switch monitor action
| `2.0-417-g8cbab475 <https://github.com/opensvc/opensvc/commit/8cbab475c7568a5b3597e3af689543ad10a83059>`_ Fix object nodes reduction deleting instances that should remain
| `2.0-416-gb44e84d9 <https://github.com/opensvc/opensvc/commit/b44e84d9c5f790cfa100584e0c72931f4868118b>`_ Avoid purging too much data from var on "unprovision --rid ..."
| `2.0-415-gc5eb5bee <https://github.com/opensvc/opensvc/commit/c5eb5bee563d2dc70d3a3823f91aa3def1c939dc>`_ Log the created record name when using the collector ipam prov
| `2.0-414-g8b122160 <https://github.com/opensvc/opensvc/commit/8b122160d45205e9117c3a8d5d9c6873492cbc3d>`_ Fix ip provision when the collector used for ipam
| `2.0-413-gb53525be <https://github.com/opensvc/opensvc/commit/b53525beb713cd40dbd2ec9ef3eb27cfadaf214e>`_ Use a lcall instead of vcall for "lxc-create --template"
| `2.0-412-ge4e00a5f <https://github.com/opensvc/opensvc/commit/e4e00a5f2c3544f503c13333a23e5a58a3e948f1>`_ Fix logger handlers manipulation via LogAdapter instead of Logger
| `2.0-411-gd02eab67 <https://github.com/opensvc/opensvc/commit/d02eab679c0bfd3d64f7f6989eee457db3f3b318>`_ Fix a pylint error in the listener codepath
| `2.0-410-gb88dc815 <https://github.com/opensvc/opensvc/commit/b88dc815064e9b4f3ac019899a5a5be86d80b227>`_ Don't try all authentication method on new http/2 connections
| `2.0-409-g82162586 <https://github.com/opensvc/opensvc/commit/821625863c8fac8a02fa8ba9a8626a877fd8e96c>`_ Log "do <argv> (<origin>)" even if node.dbopensvc is not set
| `2.0-408-gbb3d7c89 <https://github.com/opensvc/opensvc/commit/bb3d7c89cd3e18accdb07fabe6386a2d42161e66>`_ Fix 2 uses of log warn() instead of warning()
| `2.0-407-g20aa2219 <https://github.com/opensvc/opensvc/commit/20aa221949576f79a370003d77fda76e5feed29b>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-405-g894bdfbb <https://github.com/opensvc/opensvc/commit/894bdfbb884c539c0386ecad8405c9a82221fdfb>`_ Avoid raising ValueError when convert_integer() is fed a non convertible
| `2.0-405-g9d665c03 <https://github.com/opensvc/opensvc/commit/9d665c033103c2c31f5b901971b6016a8a14f02e>`_ Logging enhancements
| `2.0-404-g49ad02d7 <https://github.com/opensvc/opensvc/commit/49ad02d770b4e53962ad333421c55ff5161df725>`_ Fix "om daemon blacklist clear"
| `2.0-403-g23c52414 <https://github.com/opensvc/opensvc/commit/23c5241495d4542eceb8268563cd54bc16447d2f>`_ Add missing red/gray instance status colorization
| `2.0-402-gf924b287 <https://github.com/opensvc/opensvc/commit/f924b287f96d454d4443591c9ac35a8f9fb21b55>`_ Misc fixes related to --status handling
| `2.0-401-gb1d0dd0b <https://github.com/opensvc/opensvc/commit/b1d0dd0b18fea06d54e24d85c8e9eaacf1260211>`_ Tweak "om mon" output
| `2.0-400-gb7968079 <https://github.com/opensvc/opensvc/commit/b79680791abf820d9042b0cacf5c297977abe0a2>`_ Fix the "unset" action return code
| `2.0-399-g5f8f318e <https://github.com/opensvc/opensvc/commit/5f8f318e4671ae58b85ef8caf15901174a2df77f>`_ Fix "om <kind> ls|mon" always displaying svc objects, whatever the <kind> value
| `2.0-398-g44b96744 <https://github.com/opensvc/opensvc/commit/44b96744c63454dc66f7c638875a0bcb65ffaba4>`_ Fix the {fqdn} reference for svc in the root namespace
| `2.0-397-g6d51a631 <https://github.com/opensvc/opensvc/commit/6d51a6314d513e22baf27aead956bfe838f01221>`_ Misc small enhancements
| `2.0-396-g2fd6a726 <https://github.com/opensvc/opensvc/commit/2fd6a7269249dc2f0c75637d147ee1025037fefa>`_ Align the print_status_data_eval() prototype between Svc and BaseSvc
| `2.0-395-gbf16aaea <https://github.com/opensvc/opensvc/commit/bf16aaea9b1bde75751f6ce7df1153e85ef0473c>`_ Make sure we don't use in-mem cached resource status
| `2.0-394-g6cf0036e <https://github.com/opensvc/opensvc/commit/6cf0036eddcf33eada508431e3ac9a2ae661985b>`_ Exclude "rejoin" from the nmon status preventing status.json rewrite on label changes
| `2.0-393-g3d7b43da <https://github.com/opensvc/opensvc/commit/3d7b43da320041b330d6e132392ea493a91ebdd3>`_ Don't update status.json on label change when in "init"
| `2.0-392-ga3b58c7e <https://github.com/opensvc/opensvc/commit/a3b58c7e421a6244c3310beb5b9f0af66589205b>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-390-g1025b7f4 <https://github.com/opensvc/opensvc/commit/1025b7f4a896a6654b67f48418e24fa056807875>`_ Fix flex_target={#nodes} not updated fast after label changes
| `2.0-389-g9053e8b8 <https://github.com/opensvc/opensvc/commit/9053e8b888c1937a9f705f9a41f352da4fe5ec93>`_ Clear config ref caches in Svc::unset_conf_lazy() and Svc::unset_all_lazy()
| `2.0-388-gc242536d <https://github.com/opensvc/opensvc/commit/c242536d8731dbf5d8d09bf5f2b84eafffeda5b8>`_ Add a transitions_maxed() method to the monitor thread class
| `2.0-387-gcc08fd38 <https://github.com/opensvc/opensvc/commit/cc08fd38c4acc54ebc063f05add6441bbc06e7b6>`_ Add a clear_ref_cache() method to ExtConfig
| `2.0-387-g3d056a79 <https://github.com/opensvc/opensvc/commit/3d056a798ee249187b8717a6df8e513b03204279>`_ Fix wait_dns undue timeouts
| `2.0-386-g7e604639 <https://github.com/opensvc/opensvc/commit/7e604639b6824f5e0e4dcc1bde1ae5cf22c06710>`_ Add the node.dblog node/cluster keyword
| `2.0-385-g9f4cf322 <https://github.com/opensvc/opensvc/commit/9f4cf322ea482103041f8ad5af88e51ebd6adfec>`_ Fix ordering of instance info in "om mon"
| `2.0-384-g6133b8f1 <https://github.com/opensvc/opensvc/commit/6133b8f1a2d7a6add0edd29e766e43e30d970502>`_ Add extra warnings in the volume start and status codepaths
| `2.0-383-g98d4527c <https://github.com/opensvc/opensvc/commit/98d4527c9d13995703e2edaaec5d3b16641b3a15>`_ Fix empty "om mon" columns
| `2.0-382-g9534a520 <https://github.com/opensvc/opensvc/commit/9534a520dd5c7580b5a9e1e498eedd45cc4fb8e8>`_ Abbreviate the nodenames in the "om mon" human-friendly output
| `2.0-381-g146861a9 <https://github.com/opensvc/opensvc/commit/146861a9dda8a7bca80366bb8f601f14ad45c094>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-379-ge6297ec9 <https://github.com/opensvc/opensvc/commit/e6297ec91aebd3c554f8f5242549ac8e96b74266>`_ Don't report an error when requesting a target state already targeted
| `2.0-378-g381b472a <https://github.com/opensvc/opensvc/commit/381b472a89885ad850600b92646c49513e84e002>`_ Fix a postinstall stack
| `2.0-377-ga842db0f <https://github.com/opensvc/opensvc/commit/a842db0f26d93dc79b3035b9d32bf65f119ea50f>`_ Fix a listener multiplexer stack on request on just-deleted objects
| `2.0-376-g3750828d <https://github.com/opensvc/opensvc/commit/3750828d883fd88084e91286247682f31a2a9b3d>`_ Use json as the default output format for config evaluation
| `2.0-376-g0ab65b01 <https://github.com/opensvc/opensvc/commit/0ab65b01712512eb160c992140ac5167f12e52db>`_ Add the cluster name to the data reported to the collector
| `2.0-375-g16e8f114 <https://github.com/opensvc/opensvc/commit/16e8f114376cd9df43bd12a7c8805aa47b8cbdcc>`_ Use paths from rcGlobalEnv in updateclumgr action
| `2.0-374-gdb9da3b5 <https://github.com/opensvc/opensvc/commit/db9da3b5cd81d7df079cc4c15f7abae8359723a4>`_ Remove a debug print in the hds array driver
| `2.0-373-g0ff34cdf <https://github.com/opensvc/opensvc/commit/0ff34cdf39a7c5675f80b15c68ee40d3976f13bd>`_ Fix the pkcs12, ca and cert extraction to the cert/ shmfs
| `2.0-372-g4f0f9c85 <https://github.com/opensvc/opensvc/commit/4f0f9c85b84d7c7e96b4fed9c871d6665fb2b5ad>`_ Fix the disk.zpool resources status not refreshed after a stop/start
| `2.0-371-ga2d9e646 <https://github.com/opensvc/opensvc/commit/a2d9e646b5dfcfc42c54b0b075b68e3073124b91>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-368-gcfc01858 <https://github.com/opensvc/opensvc/commit/cfc0185804a81f159d68f8f4965efd280576345d>`_ Ignore "comment" internal keyword in "validate config" actions
| `2.0-368-g60aa1cd9 <https://github.com/opensvc/opensvc/commit/60aa1cd97c639edac30a73dcc73830de471fc306>`_ Route "set" and "validate_config" actions to any object nodes
| `2.0-367-g46ad21a4 <https://github.com/opensvc/opensvc/commit/46ad21a4cda19c9c7d90a5d420bb3739531bc2b6>`_ Limit the h2 request retry loop logic to retryable errors
| `2.0-367-g5f88e217 <https://github.com/opensvc/opensvc/commit/5f88e217436dfb0c919d4ba2853a5abed578ca45>`_ Fix app.simple stop when the script is not accessible
| `2.0-366-g3e760702 <https://github.com/opensvc/opensvc/commit/3e76070235627e89e813e68d8b1c072603ff3e91>`_ Fix a pylint error on non-existing BaseSvc::monitor_action
| `2.0-365-ga36784dc <https://github.com/opensvc/opensvc/commit/a36784dc55a60145e29d9ea527ef5ea620fc31af>`_ Fix the double-toc detection in the monitor thread
| `2.0-364-g4df9aafe <https://github.com/opensvc/opensvc/commit/4df9aafed3f3c7db2978c62985e00b7ff96e474d>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-362-g953cabed <https://github.com/opensvc/opensvc/commit/953cabed93ec893ca0b2d0640a9637ff7ad56b6d>`_ Prevent the resource orchestrator from executing multiple toc for the same obj
| `2.0-361-g0a510c38 <https://github.com/opensvc/opensvc/commit/0a510c3807cc9df71b2ffab43d933e5576d47be9>`_ Protect the toc action with the object action lock
| `2.0-360-g7dc83013 <https://github.com/opensvc/opensvc/commit/7dc830139046cab86acf2c274462433d6b7acb58>`_ Implement the retry-loop-until-timeout on h2 "[Errno 146] Connection refused"
| `2.0-359-g1a795442 <https://github.com/opensvc/opensvc/commit/1a795442220d0dd16587c0c7f7fc38702aad8ac7>`_ Fix array driver lookup by array name
| `2.0-358-g1a668360 <https://github.com/opensvc/opensvc/commit/1a668360fc46deff413f0d782be6200984e06016>`_ Fix push{hds,sym,xtremio} when other array sections do not support the "name" kw
| `2.0-357-g09721569 <https://github.com/opensvc/opensvc/commit/097215690f956c483c85f105c35db2efa5cc6501>`_ Add missing "name" keyword declaration in xtreamio and symmetrix arrays
| `2.0-357-g468ca1d7 <https://github.com/opensvc/opensvc/commit/468ca1d794d0d4959489c0c73f5a6bca4032c0cb>`_ Add support for "environment" keyword in app and task resources
| `2.0-356-ga6916372 <https://github.com/opensvc/opensvc/commit/a691637268b8eef4fec118c8a05b8712011d3c12>`_ Fix "om <path> clear"
| `2.0-355-g61e4a003 <https://github.com/opensvc/opensvc/commit/61e4a0035c6280c1f6044808c05dbde4891c6a49>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-353-g0671ed4d <https://github.com/opensvc/opensvc/commit/0671ed4d51330ff57b2511b98a5b3f6e0ca33886>`_ Add openssl.cnf search loop
| `2.0-353-g1a3e3a2b <https://github.com/opensvc/opensvc/commit/1a3e3a2b2cdbe052e0896349d074d978c6b4f9f4>`_ Better error message when piping no data on "om <path> create --config=-"
| `2.0-352-g5c8359df <https://github.com/opensvc/opensvc/commit/5c8359df931f60c3a761889a23932a30aa8dfaee>`_ Daemon scheduler thread status() thread-safety
| `2.0-351-ga6189722 <https://github.com/opensvc/opensvc/commit/a6189722e5d228f21409f934e55bd3adb6443acc>`_ Remove unused file
| `2.0-350-g8893319a <https://github.com/opensvc/opensvc/commit/8893319a884a3e424ff5c2742083d90aae54c1bf>`_ Honor expose=<port>/<proto> in ip.cni config when no hostport is specified
| `2.0-349-g26700d4d <https://github.com/opensvc/opensvc/commit/26700d4deb75788638ee939c68f5cfecf5b24743>`_ Don't report node as speaker if the collector thr is not running
| `2.0-348-g74e87126 <https://github.com/opensvc/opensvc/commit/74e87126a2fab13652b9f3a9a13362b7a7c58db8>`_ Add CNI_CONTAINERID to the stop codepath of ip.cni resources not referencing a container
| `2.0-347-g0d928a61 <https://github.com/opensvc/opensvc/commit/0d928a61189e4f512bc05ba800eaa20ed7c54ce2>`_ Add deprecated keywords support to oci driver
| `2.0-346-g76e83755 <https://github.com/opensvc/opensvc/commit/76e8375597f0f8c34e14c445fec80b16a4ac9f80>`_ Add a GET /object_keys handler
| `2.0-345-g374d1c6f <https://github.com/opensvc/opensvc/commit/374d1c6fce9d409481e0293cc08ca6d823072eb9>`_ Fix autodetection of the oci driver
| `2.0-344-gbd3d22cb <https://github.com/opensvc/opensvc/commit/bd3d22cb4e020852dfcc94ffa25418eff8c9e2f7>`_ Update commands man and completion
| `2.0-343-g7aee3054 <https://github.com/opensvc/opensvc/commit/7aee3054e256a2839a2df03234ebd7d05d95fa8a>`_ Setup perms and ownership in update_ssh_authorized_keys()
| `2.0-342-g12809f74 <https://github.com/opensvc/opensvc/commit/12809f740231148f887ead8c5e8379be4cd00cc4>`_ Add the "om node update ssh authorized keys" command
| `2.0-341-g659773c5 <https://github.com/opensvc/opensvc/commit/659773c500c28ea9da24334efc150a70ee321d77>`_ Be more restrictive in the object_selector algorithm
| `2.0-340-g1aacae86 <https://github.com/opensvc/opensvc/commit/1aacae8630b4b4dac2b09d3b536a9e6dffbd7aa1>`_ Don't run the authenticate_client() method for world-usable handlers
| `2.0-339-ga26e9f16 <https://github.com/opensvc/opensvc/commit/a26e9f162294f1746bdc2beefc71a51863db4709>`_ Support basic authentication on the h2/tls socket
| `2.0-338-ga1ee524a <https://github.com/opensvc/opensvc/commit/a1ee524a287ab424c2c30ccd0f3f59fe60e46bdb>`_ Fix the GET /whoami handler stacking when the authentication failed
| `2.0-337-g7a979fff <https://github.com/opensvc/opensvc/commit/7a979fffd0c96a15484895e2ecf93b3b552e0b92>`_ Add a has_key(key) method to all Data class derived objects (sec/cfg/usr)
| `2.0-336-gfb52f5b1 <https://github.com/opensvc/opensvc/commit/fb52f5b13bbe4816d691acb1e3e9764f1d9d51a8>`_ Move GET /authinfo as a normal handler
| `2.0-335-ge33a8417 <https://github.com/opensvc/opensvc/commit/e33a8417e72bb526f5a625f75aaaa2afd65af1e5>`_ Add a fs resources "stat_timeout" keyword
| `2.0-334-g53afb0fb <https://github.com/opensvc/opensvc/commit/53afb0fbe88121729062f1fe1e16ea377a8ca8dd>`_ Add the multiplex property to handlers
| `2.0-333-gc8956116 <https://github.com/opensvc/opensvc/commit/c89561169368889590f78bc8317fff7a1128e642>`_ Fix the ip drivers dns_wait behaviour
| `2.0-332-gf474aa0e <https://github.com/opensvc/opensvc/commit/f474aa0e614428e6d5b03350be3929a4390e6f8f>`_ Add a GET /sync api handler
| `2.0-331-g6715d24f <https://github.com/opensvc/opensvc/commit/6715d24f348adbf38b90c1003202eb6f0f78d2e7>`_ Fix a possible stack in the scheduler thread
| `2.0-330-ge43a3be3 <https://github.com/opensvc/opensvc/commit/e43a3be3aa660c7913bd666d3ea51e05c8a4d545>`_ Fixes for "om node wait" without duration
| `2.0-329-g0612bfaa <https://github.com/opensvc/opensvc/commit/0612bfaaac39b8e9ae6cd7f178869001b59f3417>`_ Move the object/node in api path detect to h2_router
| `2.0-328-g8cecea0e <https://github.com/opensvc/opensvc/commit/8cecea0e8853521b6ff24056807c7eb090a50411>`_ Fix world-usable handlers not authorized before authentication
| `2.0-327-g168a3435 <https://github.com/opensvc/opensvc/commit/168a34352bfa376e7842a752bfb4e1c346bb070a>`_ Tweak the POST /objet_monitor handler doc
| `2.0-326-g5dbd8052 <https://github.com/opensvc/opensvc/commit/5dbd805218572cd9ebe50b87fa003c7b92ff5520>`_ Restore the "options" parameter of POST /{node,object}_action
| `2.0-325-g6c1de226 <https://github.com/opensvc/opensvc/commit/6c1de22658c992ad4871a2b299598583fe22da29>`_ Fix the namespaces access definition of GET /object_config
| `2.0-324-gf12a31b0 <https://github.com/opensvc/opensvc/commit/f12a31b04185e86791f89b5c437ac272d868de6a>`_ Fix the GET /object_config access policy
| `2.0-323-gf684a467 <https://github.com/opensvc/opensvc/commit/f684a4670f32c0b7fb6613652be61138ef7e31b4>`_ Update the api handlers descriptions
| `2.0-322-gcffd5700 <https://github.com/opensvc/opensvc/commit/cffd5700cb6a7e77a96111e3f0508d515fcfe02f>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-320-g2eb185c7 <https://github.com/opensvc/opensvc/commit/2eb185c78ef083783187759afebb87315e4e1244>`_ Honor world and namespaces=FROM:path access checks to rbac_requires()
| `2.0-319-ga73a777d <https://github.com/opensvc/opensvc/commit/a73a777d4c79c5211a930cd5d2cccefa2f732d76>`_ Make sure we test one last time before returning from the GET /wait handler
| `2.0-319-g3f0ba6a1 <https://github.com/opensvc/opensvc/commit/3f0ba6a17f42ad97cb5c32260016600bb12085bc>`_ More information in the POST /daemon_shutdown handler description
| `2.0-318-g199a69eb <https://github.com/opensvc/opensvc/commit/199a69eb16ea25f148b2fc627b7392cfd7cf99b8>`_ Fix the disk.zpool warning when zpool status reports "No known data errors"
| `2.0-317-g777c304b <https://github.com/opensvc/opensvc/commit/777c304b244b5b4461b40d62c84dcc1498e6060f>`_ Wait fixes
| `2.0-316-g10b7702e <https://github.com/opensvc/opensvc/commit/10b7702e76384f4d200a0870c5a343282a34adef>`_ Fix a stack in the collector thread on object delete
| `2.0-315-g86476945 <https://github.com/opensvc/opensvc/commit/8647694539dbe487a7dcc9adc5459c68864f3180>`_ Fix a regression in the non-binary secret decode
| `2.0-314-g1407407a <https://github.com/opensvc/opensvc/commit/1407407acabe5a5dcb67eeadeeb211d27bfe73e6>`_ Add the GET /wait handler
| `2.0-313-gd684d3fb <https://github.com/opensvc/opensvc/commit/d684d3fbfc9a370cb657c5e2c1e780255c044d8a>`_ Don't join joined node peers when the cluster.nodes is defined in cluster.conf
| `2.0-312-gc09ac423 <https://github.com/opensvc/opensvc/commit/c09ac4238889f894681f7808792e8b28833df4b8>`_ Add a RLock to prevent locally concurrent joins/leaves
| `2.0-311-g3dc4e91c <https://github.com/opensvc/opensvc/commit/3dc4e91c11635d69ba3e029c6d0b6aecb7d4e5a2>`_ Fix a syntax error in the oci container driver
| `2.0-310-g34ceb904 <https://github.com/opensvc/opensvc/commit/34ceb90471625f9bab6585ff3ab6ff80c2ef2c1f>`_ Fix concurrent "daemon join" leading to messed up nodes list
| `2.0-309-g3d30c5bf <https://github.com/opensvc/opensvc/commit/3d30c5bff25f0ff08ece4bb229fbcbd40a1b08b2>`_ Fix the object_logs api handler no longer feeding from peer nodes
| `2.0-308-g5f70d4ef <https://github.com/opensvc/opensvc/commit/5f70d4ef23970fd5c2a32d89928c19fe4d5dbefc>`_ Don't drop container hostname if net=<a docker network name>
| `2.0-307-gde88319e <https://github.com/opensvc/opensvc/commit/de88319e3b68c1081c478da9f4572d435c44ddd0>`_ Fix a stack in the unicast hb driver
| `2.0-306-g479d3308 <https://github.com/opensvc/opensvc/commit/479d3308e9f8f2ff57f6e24858e6d822f8ad622f>`_ Add a warning for zpool with suspended i/o
| `2.0-305-g56352071 <https://github.com/opensvc/opensvc/commit/56352071d86da6f3e1183f971cc5921557779002>`_ Fix the GET /events handlers accessed via raw+tls
| `2.0-304-ga41ab64b <https://github.com/opensvc/opensvc/commit/a41ab64b37ae73ac1762795e9a74d0f77a28be40>`_ Set the GET method in daemon_stream() requests
| `2.0-303-gec8af2c8 <https://github.com/opensvc/opensvc/commit/ec8af2c832d09a4432357fc1424482866ffaabf9>`_ Accepting patching the full dataset received as 1st wait msg
| `2.0-302-gc8f952db <https://github.com/opensvc/opensvc/commit/c8f952db7ca2b81249bd06e36c84872f10b29749>`_ Yet another pip install requirements tweak
| `2.0-301-g5761ae1b <https://github.com/opensvc/opensvc/commit/5761ae1b4922264d629dd5f743d9258f428cb5e7>`_ Yet another pip install requirements tweak
| `2.0-300-gdf41c891 <https://github.com/opensvc/opensvc/commit/df41c891053ce6593fdac111333d7f3988ad077a>`_ Yet another pip install requirements tweak
| `2.0-299-g89269dec <https://github.com/opensvc/opensvc/commit/89269dec6ad8ae8a887fb3f42bfafb4fbb8f7b93>`_ Prevent travis install of astroid 2.2, stacking on infinite recursion
| `2.0-298-gf08a1bf4 <https://github.com/opensvc/opensvc/commit/f08a1bf449fb68ed9f8dda0eb628f34eef1415bb>`_ Fix a pylint error in the "data" module
| `2.0-297-g8fa9a3d8 <https://github.com/opensvc/opensvc/commit/8fa9a3d86959082c59c2a023a24fd3c2f8bcde6e>`_ Fix pylint error in the listener codebase
| `2.0-296-gff51907c <https://github.com/opensvc/opensvc/commit/ff51907c82a30ab2d64741e3f2b4d1aca74be486>`_ Disarm the timeout alarm when the initial full matches the wait condition
| `2.0-295-gd20a9f0c <https://github.com/opensvc/opensvc/commit/d20a9f0c00005cb5f2de881e7229ac4f71dbc2d6>`_ Add the "stream" property to the api handler class
| `2.0-294-g16d389d7 <https://github.com/opensvc/opensvc/commit/16d389d717c11ea9b3c942410ece22630a0e7035>`_ Don't stack on invalid request header
| `2.0-293-gcde01822 <https://github.com/opensvc/opensvc/commit/cde018228c34b83f6954e8f81fe7b672c531c7b9>`_ Don't close listener binded sockets if not necessary
| `2.0-292-g57ed5048 <https://github.com/opensvc/opensvc/commit/57ed50488873fd0aa27719ae4e916693c3bc3f7a>`_ Add a "full" parameter to GET /events
| `2.0-291-g19de7702 <https://github.com/opensvc/opensvc/commit/19de7702ed6120fd37895ada235b15159a16631d>`_ Add a "name" keyword to brocade and hds sections
| `2.0-290-g21533591 <https://github.com/opensvc/opensvc/commit/21533591b522eed96d07df773278c758814db9fd>`_ Fix a secret "gen cert" stack
| `2.0-289-g7cf6dd18 <https://github.com/opensvc/opensvc/commit/7cf6dd181374e566982120184094491c535de860>`_ Add support for deprecated GET /get_node handler
| `2.0-288-g3ad2edc5 <https://github.com/opensvc/opensvc/commit/3ad2edc5f8add877aec0bddceb9dd44938aec3a3>`_ Fix a listener stack in the path parser
| `2.0-287-g4fac46cb <https://github.com/opensvc/opensvc/commit/4fac46cb28f204cd3f2f6f8486e5794f2ea6c742>`_ Support binaries in secret keys
| `2.0-286-ga979b01e <https://github.com/opensvc/opensvc/commit/a979b01e3b2c5284d4724d22d085ba7df6290596>`_ Support 'om <path> oci ...' as an abstract of 'om <path> docker|podman ...'
| `2.0-285-g23d778d1 <https://github.com/opensvc/opensvc/commit/23d778d18680f2429a5cb60099ac9ddc405b620d>`_ Add a default "oci" container type
| `2.0-284-g8ecd864e <https://github.com/opensvc/opensvc/commit/8ecd864e1b7f56521a778ebda2a6d278306bcf40>`_ Fix create/provision from single object template
| `2.0-283-g1395dd62 <https://github.com/opensvc/opensvc/commit/1395dd62627bfa782b8889931dc96b35db8adb64>`_ py2 fixes for the listener
| `2.0-282-g050e42cb <https://github.com/opensvc/opensvc/commit/050e42cb9907f90c54b3b9358915c7026baba937>`_ Fix the commands rst documentation generation not including global options
| `2.0-281-gfebab530 <https://github.com/opensvc/opensvc/commit/febab5301b10b22306ca2b0807ce789ce095d942>`_ Split api handlers out of the listener thread codebase
| `2.0-280-g78d31293 <https://github.com/opensvc/opensvc/commit/78d31293b70d5aee493ffd42dcd769f4e695dd71>`_ Add a "remove" action to sec/cfg/usr objects
| `2.0-279-g1ea94ead <https://github.com/opensvc/opensvc/commit/1ea94eaddf047400c5a3f541369298b677769f10>`_ Fix an error reported by pylint in the lock module
| `2.0-278-g591afaae <https://github.com/opensvc/opensvc/commit/591afaae0414b3b25e746e64edf9c297509a8733>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-276-gafa685a0 <https://github.com/opensvc/opensvc/commit/afa685a04fdfdb394ea2ebec59d6d3a9392a22c7>`_ Implement --verbose and --name for "om pool status"
| `2.0-275-gf908a545 <https://github.com/opensvc/opensvc/commit/f908a545585015f56035faca9149b2f46fd7074b>`_ Add a thread status "alerts" key to store thread (re)configuration alerts
| `2.0-275-gdd7071cd <https://github.com/opensvc/opensvc/commit/dd7071cdd88fce01b7cc8204b97808c2af0c00d4>`_ Add Slack notifications for Travis builds
| `2.0-274-g5bf146e2 <https://github.com/opensvc/opensvc/commit/5bf146e2964b3195c535b7945f613e0d2b0a7d3e>`_ Fix the "join" listener codepath
| `2.0-273-g2c3ca441 <https://github.com/opensvc/opensvc/commit/2c3ca441e3534413e0407edc4852229febde20bb>`_ Reset "node wait" alarm when breaking from the event loop
| `2.0-272-gccb528e5 <https://github.com/opensvc/opensvc/commit/ccb528e5ad0c4d4d3a397c720d21fbe6ebd2b6fa>`_ Remove a doubled call to convert_duration() in the wait codepath
| `2.0-271-g68cd460f <https://github.com/opensvc/opensvc/commit/68cd460f2f42c69cbed387899b79cceaecc80634>`_ Allow raw aes comms to drp nodes in another cluster
| `2.0-270-gcfc8b828 <https://github.com/opensvc/opensvc/commit/cfc8b828d49745b19865c5996dbc8c468636a2ba>`_ Fix event wait errors
| `2.0-269-g5b57b8d2 <https://github.com/opensvc/opensvc/commit/5b57b8d28e828368b59632b2baa8ba116639d9ea>`_ Remove locks from OsvcThread::object_data()
| `2.0-268-gaa739df0 <https://github.com/opensvc/opensvc/commit/aa739df04d1a3d65533a81be4e032a91beb18bcd>`_ Fix an init_node() stacking error codepath
| `2.0-267-g9510b452 <https://github.com/opensvc/opensvc/commit/9510b452f9d4bd158ed7e2eb60548481d3ead26a>`_ Support @drpnodes keywords scoping in cluster.conf
| `2.0-266-g76206fc5 <https://github.com/opensvc/opensvc/commit/76206fc58ade8f62b4c2536a95693bc6e7ba1402>`_ Add the "reset_options=true|false" boolean keyword to sync.rsync
| `2.0-265-gbbcf7aa6 <https://github.com/opensvc/opensvc/commit/bbcf7aa6ab43171e9d55bf99b00ad30e14a53b31>`_ Fix drop of events on objects being deleted
| `2.0-264-gc68a416b <https://github.com/opensvc/opensvc/commit/c68a416b8f01645534afe7df6e0eda7471c4453c>`_ Fix the vip secondary instances frozen after service creation
| `2.0-263-g4dd185eb <https://github.com/opensvc/opensvc/commit/4dd185eb9fb3ea3af6cadb0cd6b79543b53ca5e1>`_ Don't report 0 for net/blk metrics of empty pg
| `2.0-262-gf1d28028 <https://github.com/opensvc/opensvc/commit/f1d28028cda190b5f0505d08ea338c1c8fe37889>`_ Faster unprovision for zpool resources layered on other resources
| `2.0-261-gf21fdd3f <https://github.com/opensvc/opensvc/commit/f21fdd3fbd7f94385825f0c8e4484c74c3664ddb>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-259-ge9ec367e <https://github.com/opensvc/opensvc/commit/e9ec367e0ca4cb63fb8efcd5d683cf6935782f77>`_ Honor the selector passed to the events api handler
| `2.0-259-g8f6770c1 <https://github.com/opensvc/opensvc/commit/8f6770c1d73b33f1b96484cd9a37052705673e0c>`_ Fix event storm during orchestrated provision
| `2.0-258-gb7121385 <https://github.com/opensvc/opensvc/commit/b7121385e866c54a7f402ed8021df84aed411ba2>`_ Fix the "sync nodes" and "sync drp" not skipping non-targeted resources
| `2.0-257-ge524e6f0 <https://github.com/opensvc/opensvc/commit/e524e6f0ce6a34e1291fca36944239919525cf2e>`_ Move the object_data() method from osvcd_lsnr to osvcd_shared
| `2.0-256-gd20f8023 <https://github.com/opensvc/opensvc/commit/d20f80230570e82dc2d3fcea4622fcd0d67379c9>`_ Fix a pylint reported error in the ip driver parent class
| `2.0-255-gc4e1c0bb <https://github.com/opensvc/opensvc/commit/c4e1c0bb376a306d916c2d0dcbe3a4639b1e0853>`_ Provide the client_id in the authinfo api handler resultset
| `2.0-254-g4e16b972 <https://github.com/opensvc/opensvc/commit/4e16b97228e4e901012a60b713f73954d6c74583>`_ Catch ProcessLookupError when killing running process on daemon shutdown
| `2.0-253-gbf278731 <https://github.com/opensvc/opensvc/commit/bf2787316cd7925484f4a5a7d5eb9c519bc5d47e>`_ Clarify the "shutdown daemon requested by None" message
| `2.0-252-g9b426fb6 <https://github.com/opensvc/opensvc/commit/9b426fb6671ce622c47a85da64255ad8118716a9>`_ Restore the "svcmgr ls" default selection to "all svc"
| `2.0-251-ga837a1e8 <https://github.com/opensvc/opensvc/commit/a837a1e8e4011caf5dcec10568bdc3e092c967e9>`_ Fix "do <action> ... (<origin>)" not being logged anymore
| `2.0-250-gd180005d <https://github.com/opensvc/opensvc/commit/d180005df9b8bb017b9d15bce3b9716f385250f2>`_ Add the per-service net metrics to "daemon stats"
| `2.0-249-g24db41a0 <https://github.com/opensvc/opensvc/commit/24db41a008ecdb5baba63768c5021fc09c5a7e67>`_ Fix a stack on "om <path> logs" when peer has no log yet
| `2.0-248-g5c28d198 <https://github.com/opensvc/opensvc/commit/5c28d198f915369e4378cacc41a1b76705ce1fe0>`_ Add a "om <path> pg pids" action
| `2.0-247-ga6a74eed <https://github.com/opensvc/opensvc/commit/a6a74eed9393a91198798cb18f3e6f2f0c156a81>`_ Add zfs send/receive dataset relocation
| `2.0-246-gbded5d0e <https://github.com/opensvc/opensvc/commit/bded5d0e92466eea56b1728436c2ec8fc81cd401>`_ Use /proc/sys/kernel/random/boot_id as source for boot id on Linux
| `2.0-245-g186f1a18 <https://github.com/opensvc/opensvc/commit/186f1a1872a627499cc6a210cb5284c47f0d41a0>`_ Serialize store_rx_data() calls
| `2.0-244-g8de636d2 <https://github.com/opensvc/opensvc/commit/8de636d2c9bcf5bef5f92496cbb87cd95eb6a2eb>`_ Merge branch 'master' of github.com:opensvc/opensvc
| `2.0-241-g7b3d1667 <https://github.com/opensvc/opensvc/commit/7b3d16671d6ddaf9b8dbde168410708e73c4c7b1>`_ Add 'raw_grant' to the whoami information
| `2.0-240-g927fc8da <https://github.com/opensvc/opensvc/commit/927fc8dabf61590c12e019fab266f3586e8cfd38>`_ Add jwt authentication to the listener
| `2.0-239-g54751900 <https://github.com/opensvc/opensvc/commit/547519008ad8b38ab0834e1a3b0add87532f10c7>`_ Better cancelation of the ready states after split+rejoin
| `2.0-239-g4bd4967e <https://github.com/opensvc/opensvc/commit/4bd4967eed978bc0cc05263156154d6d76bc6258>`_ Merge branch 'master' of https://github.com/opensvc/opensvc
| `2.0-238-g20cac081 <https://github.com/opensvc/opensvc/commit/20cac081eeee34da839c08c92162f5d2a9f726c3>`_ Fix a stack in the multicast heartbeat reconfigure codepath
| `2.0-237-g8ed5fd1d <https://github.com/opensvc/opensvc/commit/8ed5fd1dd499d48192db26148bb63c640db59dba>`_ Use synchronous rpc for pushs after register
| `2.0-236-gb10563a2 <https://github.com/opensvc/opensvc/commit/b10563a2fbfffbfcc64c9c7319cd0abf432302ff>`_ Fix re.sub(..., flags=<flags>) for py 2.6 compatibility
| `2.0-236-g9c2b77ea <https://github.com/opensvc/opensvc/commit/9c2b77ea9f68bac4c57c80290d806022e43f0baf>`_ Embed the pyjwt lib
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
