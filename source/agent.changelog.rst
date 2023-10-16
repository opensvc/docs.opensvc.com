Changelog
=========


| `2.1-1694-g6391b3665 <https://github.com/opensvc/opensvc/commit/6391b3665eeaaa7c1c88e56d21e5ef521ee932cc>`_ Merge pull request #633 from cvaroqui/dblogcron
| `2.1-1687-g3b1bfdbe1 <https://github.com/opensvc/opensvc/commit/3b1bfdbe1141590ae953839dc0b15c6b88a91d97>`_ Fix agent the log line coalescing
| `2.1-1686-g79ef507ec <https://github.com/opensvc/opensvc/commit/79ef507ecea62f5809b5b4ed9319ee25b919bd25>`_ Fix the rid reported to the collector svcactions
| `2.1-1686-g55bcc0455 <https://github.com/opensvc/opensvc/commit/55bcc0455b07f219e555a3ba11988b80655efc08>`_ Merge pull request #632 from cvaroqui/kvm
| `2.1-1685-g9e1696bf8 <https://github.com/opensvc/opensvc/commit/9e1696bf8714ef07b892dc364957fac388a9fb39>`_ Report the rid and subset in their own svcactions columns
| `2.1-1684-g6d02a9f2d <https://github.com/opensvc/opensvc/commit/6d02a9f2d6b6808031840b1a20b0d68d334bf794>`_ Obfuscate --value value in wrap-up action log
| `2.1-1683-g3262ae263 <https://github.com/opensvc/opensvc/commit/3262ae263b0488c0efe56ed0bb1013202032853a>`_ Fix report of daemon sid instead of the action sid
| `2.1-1682-g70ab5d0d6 <https://github.com/opensvc/opensvc/commit/70ab5d0d64f0aa68628ba04b7a4256b2bd864847>`_ Report the sid in action logs send to the collector
| `2.1-1681-gc50d4d3ad <https://github.com/opensvc/opensvc/commit/c50d4d3ad3387209b8e7399681a5948c0f36d092>`_ Merge pull request #631 from cvaroqui/dblogcron
| `2.1-1681-ga8820a606 <https://github.com/opensvc/opensvc/commit/a8820a60621b8a512e2810ef0e1ce82c99273ea5>`_ Report to collector a wrap-up status based on the exitcode
| `2.1-1680-g19ff38b1a <https://github.com/opensvc/opensvc/commit/19ff38b1a5255b4992139c3c7fd5c3e7a639e034>`_ Add a dblogcron kw
| `2.1-1679-g20866ec21 <https://github.com/opensvc/opensvc/commit/20866ec217c0fcbff27b97f9c7238576c78de0f6>`_ Merge pull request #630 from arnaudveron/fix-fs-flag-doc
| `2.1-1678-gf0b91e5e1 <https://github.com/opensvc/opensvc/commit/f0b91e5e1f332f08f3c365e8db37e4f49305d5ed>`_ Fix resource fs.flag documentation
| `2.1-1677-gcdfb010d5 <https://github.com/opensvc/opensvc/commit/cdfb010d5f48cb95ed6d02aff40703840211be9d>`_ Merge pull request #629 from arnaudveron/add-command-logger
| `2.1-1676-gf72943135 <https://github.com/opensvc/opensvc/commit/f72943135137a5666c5fdc9644688d58a75e40b2>`_ Add node command logger
| `2.1-1675-ge8ab2afbc <https://github.com/opensvc/opensvc/commit/e8ab2afbcf1a18d88f21174ea07b7d3eb34cfbad>`_ Merge pull request #627 from cvaroqui/fix-comp-import-utilities-uri
| `2.1-1674-gad090000a <https://github.com/opensvc/opensvc/commit/ad090000a444f967d94ddfbdb2b794369cdf770d>`_ Fix comp.py import of utilities.uri
| `2.1-1673-g3bec2e5d7 <https://github.com/opensvc/opensvc/commit/3bec2e5d7b5d9793f055c027b1b6431268012b5a>`_ Merge pull request #626 from arnaudveron/fix-changed-podman-error-message
| `2.1-1672-gedcb0dbb7 <https://github.com/opensvc/opensvc/commit/edcb0dbb792aff13bc5efc856623560e247ef10a>`_ Fix changed podman error message
| `2.1-1671-gc7703de5d <https://github.com/opensvc/opensvc/commit/c7703de5dce2c5a5cddfa30c08268f2bccd61dec>`_ Merge pull request #625 from cgalibern/fix-817b97660894971e18689393c6090d1a57a901c6
| `2.1-1670-g1b535d7ca <https://github.com/opensvc/opensvc/commit/1b535d7ca2968277d4897259e7fe3974d54beefb>`_ Regression fix: not purged object is not purged after 'purge --local'
| `2.1-1669-g11917cf53 <https://github.com/opensvc/opensvc/commit/11917cf539f9354708541b5d83c40548300fc6e8>`_ Merge pull request #624 from cgalibern/fix-om-log-broken-pipe-error
| `2.1-1668-gaf3f97b6e <https://github.com/opensvc/opensvc/commit/af3f97b6e726de3d7b2a82bc345ee797ad7f1cb8>`_ Fix some BrokenPipeError during 'om <xx> log', 'om node event'
| `2.1-1667-gf1c39635b <https://github.com/opensvc/opensvc/commit/f1c39635b587950ff7312233da64f055443fe5de>`_ Merge pull request #623 from cgalibern/fix_kv_store_sec
| `2.1-1667-g95e0a2da7 <https://github.com/opensvc/opensvc/commit/95e0a2da75f7d54e5789cd446a603ad58748116c>`_ Fix a ex.Error message format in container.kvm
| `2.1-1666-gf5ff161c4 <https://github.com/opensvc/opensvc/commit/f5ff161c4e3bcaba18ee6e596e5da959cbf1a53d>`_ Rename the container kw "virtio" to "qga"
| `2.1-1666-g7a0b513a4 <https://github.com/opensvc/opensvc/commit/7a0b513a4c6fecacc601804a73e091a691dc538e>`_ [utilities/kv_store] Don't automatically delete expired keys
| `2.1-1665-gead10ec62 <https://github.com/opensvc/opensvc/commit/ead10ec625835d31eef7cdc8515494d24ba9049c>`_ Add "rcp" and "rcmd" method base on qemu guest agent exec
| `2.1-1665-g8d264000a <https://github.com/opensvc/opensvc/commit/8d264000aaa16e2be60e5baeec94eb0b76a92842>`_ [utilities/kv_store] Don't cache KvSec sec object (fix)
| `2.1-1664-gf04341762 <https://github.com/opensvc/opensvc/commit/f0434176286588af5daa094358ec6fe895993176>`_ Add a virtio boolean kw to container.kvm
| `2.1-1664-g2e67a4152 <https://github.com/opensvc/opensvc/commit/2e67a41527a7e80dc5341abc37d7056a5f055dd2>`_ Merge pull request #622 from cvaroqui/b2.1
| `2.1-1663-gb70a4be7b <https://github.com/opensvc/opensvc/commit/b70a4be7bf753266fbd87e35d828c0b9af3d2af7>`_ Don't stop parsing mount output on first line with more than 8 fields
| `2.1-1662-ge4c316912 <https://github.com/opensvc/opensvc/commit/e4c31691216fc6d42b00ef6f9cad143f4030b00c>`_ Merge pull request #621 from cvaroqui/20230626-scsipr-ack-fix
| `2.1-1661-gf0d8205ea <https://github.com/opensvc/opensvc/commit/f0d8205ea46c81ea8b75a13b4aba0913f3714f5c>`_ Remove py 2.7 from the pytest and pylint gh workflow matrix
| `2.1-1660-gc1b57195a <https://github.com/opensvc/opensvc/commit/c1b57195a9ee42c64fbb0fe49ea36ae56a77836d>`_ Retry clear scsi pr command on every path until one works
| `2.1-1659-g8fb4b4a5c <https://github.com/opensvc/opensvc/commit/8fb4b4a5ca835a64cc94c1a5f85916caf7ad3904>`_ Unregister each multipath path on disk_unregister()
| `2.1-1658-gf530bb88c <https://github.com/opensvc/opensvc/commit/f530bb88cd8826020fac3fcd75c8af973833a570>`_ Unregister the paths on stop when there is no reservation
| `2.1-1657-g327481aef <https://github.com/opensvc/opensvc/commit/327481aef9d5b3b440dad83391689d656dcc27d1>`_ Add missing unit attention ack and retry
| `2.1-1656-g35969d0d4 <https://github.com/opensvc/opensvc/commit/35969d0d4326e2088f550b14da9bf84d243f76b5>`_ Merge pull request #620 from cvaroqui/b2.1
| `2.1-1655-g89c7975f5 <https://github.com/opensvc/opensvc/commit/89c7975f52407e77a05b29ca700295a64aead0ed>`_ Actually implement the --verbose flag in "collector tag show"
| `2.1-1654-g6f3f5ec3e <https://github.com/opensvc/opensvc/commit/6f3f5ec3ec648eb440653e7eaca7975d9b0a2d12>`_ Fix a stack in the table render
| `2.1-1653-gb1e0d8a27 <https://github.com/opensvc/opensvc/commit/b1e0d8a270494b5fc782f11c04d122b8f59292b3>`_ Rename the collector tag commandset options
| `2.1-1652-g78c3bc240 <https://github.com/opensvc/opensvc/commit/78c3bc240f2340bce5836bf2671a56b02adf42ea>`_ Collector tag management commandset enhancements
| `2.1-1651-gbc6776854 <https://github.com/opensvc/opensvc/commit/bc6776854b9e37c9cbac2bcd8c1cd4f87dcc871a>`_ Merge pull request #619 from arnaudveron/add-docker-user-keyword
| `2.1-1650-g2b534172f <https://github.com/opensvc/opensvc/commit/2b534172f0ea4473578427ef0d4dc68fa9aad594>`_ Add user keyword to docker container resource
| `2.1-1649-gbee354c31 <https://github.com/opensvc/opensvc/commit/bee354c3105bf9723fff23011c50b55a006a4e3d>`_ Merge pull request #618 from cvaroqui/enh-collector-tag
| `2.1-1648-g5f5afa4a1 <https://github.com/opensvc/opensvc/commit/5f5afa4a147399c86379e77e477055ab6ba730ee>`_ Add information to the "collector untag" commands
| `2.1-1647-gde86d7f05 <https://github.com/opensvc/opensvc/commit/de86d7f05863f136d024210734a9e29d23aea865>`_ Add the --tag-attach-data to the "om ... collector tag" commands
| `2.1-1646-g37254cc5c <https://github.com/opensvc/opensvc/commit/37254cc5c4f7d1a6dbb05f578f69d49e234d2ef0>`_ Add the dns_janitor_version reference
| `2.1-1645-g1e34ada45 <https://github.com/opensvc/opensvc/commit/1e34ada45e00c3ed2bf64c262c94088ecddd5aaf>`_ Merge pull request #617 from cvaroqui/dns
| `2.1-1644-g0495879eb <https://github.com/opensvc/opensvc/commit/0495879ebdabdd7d7edb5248ec08d2f2f8711705>`_ Fix a pylint false positive due to the queue imports
| `2.1-1643-gfadb532b5 <https://github.com/opensvc/opensvc/commit/fadb532b53cb74ff3e520ff1d889463032fc0355>`_ Fix dns remote backend send()ing the wrong data and restore dns thread stats
| `2.1-1642-g95c3cc9d9 <https://github.com/opensvc/opensvc/commit/95c3cc9d9077d73affccb8a007b907954503cd7d>`_ Fix a py2 compat issue with import queue
| `2.1-1641-g8a71ee7bf <https://github.com/opensvc/opensvc/commit/8a71ee7bfe407e05896a046156f86ec533109b4d>`_ Better select()-based implementation for the pdns remote backend
| `2.1-1640-g3bb0e89e8 <https://github.com/opensvc/opensvc/commit/3bb0e89e87bc6d0dc791cb526a28350b3186a841>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into dns
| `2.1-1637-gddf3f8877 <https://github.com/opensvc/opensvc/commit/ddf3f887724608da1af146698a94ad0484e03e12>`_ Fix select.select() expectional never reached in the dns ux socket server
| `2.1-1636-gc57cce266 <https://github.com/opensvc/opensvc/commit/c57cce26637838f876a4d85a284a930672afca97>`_ Add the missing dns_sock_[gu]id definitions
| `2.1-1635-gdb3c47da1 <https://github.com/opensvc/opensvc/commit/db3c47da18a445cdc7a05801e859a5f5ba22c1e0>`_ Implement dns ux socket uid/gid setting via new listener.dns_sock_[gu]id kws
| `2.1-1635-g210b7b45b <https://github.com/opensvc/opensvc/commit/210b7b45b4bd3d69a57d2ab22657ab5892859d24>`_ Merge pull request #616 from cgalibern/fix-om-pool-status-vg-0k
| `2.1-1634-g22812850f <https://github.com/opensvc/opensvc/commit/22812850fd714e73ec604cd6638f01f075bdedc1>`_ [pool/vg] Fix 'om pool status' compute size when free size is 0k
| `2.1-1634-g59fd7ddf4 <https://github.com/opensvc/opensvc/commit/59fd7ddf45247f4d96b7ad22045c9d3784ac0486>`_ Implement non-blocking pdns remote backend unix socket listener
| `2.1-1633-gc758e29c1 <https://github.com/opensvc/opensvc/commit/c758e29c14d6fba527a77c81e1bce25d3a5d38fc>`_ Merge pull request #615 from arnaudveron/add-http-host-header
| `2.1-1632-ged5599ada <https://github.com/opensvc/opensvc/commit/ed5599adaa4c57e59f6d099f0a54edf72256bd3a>`_ Add http Host header
| `2.1-1631-g3488ad7ac <https://github.com/opensvc/opensvc/commit/3488ad7ac13701ad441b7ace6ecac2f048b271e3>`_ Merge pull request #613 from cgalibern/fix-merge-frozen-after-daemon-shutdown
| `2.1-1630-g572b52494 <https://github.com/opensvc/opensvc/commit/572b5249411011438c49eef17c838193adb9e5a0>`_ [daemon] Undue frozen peer instance merging on daemon startup (fix regression)
| `2.1-1629-gbbf73b951 <https://github.com/opensvc/opensvc/commit/bbf73b9519d87c8b269db806ba474e8d8d41a4a7>`_ Merge pull request #611 from cvaroqui/daemon-api-sec
| `2.1-1628-gb012864eb <https://github.com/opensvc/opensvc/commit/b012864eb14cd7583cc201a5b67592ebe076e5c4>`_ Remove codecov from the github workflow
| `2.1-1627-g9b1a399c3 <https://github.com/opensvc/opensvc/commit/9b1a399c37995fe3b445bdd27ab463ec01ebc7d4>`_ Apply some obfuscation to the daemon listener responses
| `2.1-1626-g5ec09c698 <https://github.com/opensvc/opensvc/commit/5ec09c6988b7f2e4047d54d78d9ba2d5fbd4df9f>`_ Merge pull request #610 from cvaroqui/fix-deref-cache-key-collision
| `2.1-1625-gd4a2c2334 <https://github.com/opensvc/opensvc/commit/d4a2c23349626fe82a17b3d9e805a51d4e93b9cf>`_ Fix node.oci evaluating as "None" instead of either docker or podman
| `2.1-1624-g71d392abb <https://github.com/opensvc/opensvc/commit/71d392abbce948842411ca67f139ebd967ec06d7>`_ Merge pull request #608 from cvaroqui/btrfs
| `2.1-1621-g7911f21e6 <https://github.com/opensvc/opensvc/commit/7911f21e603c31d64d0098ac3cba49c0fb209e57>`_ Fix a wrong var name in a error code path of the sync.btrfs drv
| `2.1-1620-g5000901c9 <https://github.com/opensvc/opensvc/commit/5000901c9f72fcd6662af47eb72320ec64fe7595>`_ Fix a string format in the btrfs utility mod
| `2.1-1619-ge05a85478 <https://github.com/opensvc/opensvc/commit/e05a85478a1b8cb6ee1c77b1a870e123f7ff5361>`_ Delete btrfs snapshots in 20-subvol batches
| `2.1-1618-g3ccc9fe55 <https://github.com/opensvc/opensvc/commit/3ccc9fe5528d0ece0d2edcc96d4194d2907b25bd>`_ sync.btrfs resource log format tweak
| `2.1-1617-g698e436da <https://github.com/opensvc/opensvc/commit/698e436daeb96868c2c6ea2aba97fb04bf66e28a>`_ Evaluate a n/a status for sync.btrfssnap on unprovisioned fs
| `2.1-1616-g6815b843c <https://github.com/opensvc/opensvc/commit/6815b843c8f14fa017acd05a247dea6f2c52f325>`_ Fix multiple sync.btrfs resources mixing src snap dirs
| `2.1-1615-gc391bd4ee <https://github.com/opensvc/opensvc/commit/c391bd4ee714c441727c9d113920095f46e22a90>`_ sync.btrfs and sync.btrfssnap fixes
| `2.1-1614-g06e38fb73 <https://github.com/opensvc/opensvc/commit/06e38fb738359da88b7c9937a21cb622ef1e4465>`_ Fix the btrfssnap status algo for recursive=true
| `2.1-1613-g6dfac6edf <https://github.com/opensvc/opensvc/commit/6dfac6edf77a88d8edc0337573844514834eb5b3>`_ Fix sync.btrfs snaps in .osnap/last/next instead of .osnap/last
| `2.1-1612-gc86d08a32 <https://github.com/opensvc/opensvc/commit/c86d08a32f352f422172d8fe5b64c9471750c8d0>`_ Delete all dst subvols before rm
| `2.1-1611-g9caf96754 <https://github.com/opensvc/opensvc/commit/9caf9675470f9131d514feec107ee26183310eb5>`_ Support whitespace in subvol and paths managed by sync.btrfs drvs
| `2.1-1610-g40696694f <https://github.com/opensvc/opensvc/commit/40696694f56533efe83bfe8132dcb3011bfaacf1>`_ Implement sync.btrfssnap recursive=true
| `2.1-1609-g6f03dd1d0 <https://github.com/opensvc/opensvc/commit/6f03dd1d0e1c0f19d71f4d4ad7b0962baed517cd>`_ sync.btrfs do not accumulate subvols on dst removed from src
| `2.1-1608-gdb2e95d36 <https://github.com/opensvc/opensvc/commit/db2e95d364b5c09dd025d572a5a38bae18b3543b>`_ Remove unused code from utilities.subsystems.btrfs
| `2.1-1607-gc109f86c8 <https://github.com/opensvc/opensvc/commit/c109f86c8fe879e839ecd36ee60356431829603b>`_ Reorder sync.btrs commands for better readability
| `2.1-1607-g122087e42 <https://github.com/opensvc/opensvc/commit/122087e422f333e09b2b3d42f3187acad49ebd7d>`_ Merge pull request #609 from cvaroqui/lxc-start-fix
| `2.1-1606-g68578c07e <https://github.com/opensvc/opensvc/commit/68578c07e21ece827131f03538c8b217aca2a8f3>`_ Implement sync.btrfs subvolumes recursion
| `2.1-1606-g47c122641 <https://github.com/opensvc/opensvc/commit/47c1226417e4c0b074fc410eb7272fee7493a497>`_ Fix the lxc driver start issue
| `2.1-1605-gff603ad53 <https://github.com/opensvc/opensvc/commit/ff603ad532a3ad98d6c6466d1214fc429ea194c6>`_ Merge pull request #607 from sghf/b2.1
| `2.1-1604-g8d212ef67 <https://github.com/opensvc/opensvc/commit/8d212ef673ace60f80b42d5a75dea17d8eb61117>`_ Add MUS, POC, PPR and RCT to allowed env values
| `2.1-1603-gaf095899f <https://github.com/opensvc/opensvc/commit/af095899f550cf976d70331b8379b1b195fb20a3>`_ Merge pull request #606 from cvaroqui/lxc-config-path-fix
| `2.1-1601-ga98109865 <https://github.com/opensvc/opensvc/commit/a9810986594c673678a47a8aa0cf59af62818fba>`_ Merge pull request #604 from sghf/b2.1
| `2.1-1600-gf1e91d072 <https://github.com/opensvc/opensvc/commit/f1e91d0724c88c1f580df6221fb21085b483cd26>`_ Fix missing variable in error message
| `2.1-1599-g762d665ff <https://github.com/opensvc/opensvc/commit/762d665ffb6a973574fa0016c0a8dea2a61ae2ae>`_ Merge pull request #603 from cvaroqui/drbd-on-backend-network
| `2.1-1597-g22b8f4b04 <https://github.com/opensvc/opensvc/commit/22b8f4b0411c53215e6685658d36eae2dad66f9d>`_ Merge pull request #602 from cvaroqui/20221110-hcs-selection-by-id
| `2.1-1594-g6d262e3d1 <https://github.com/opensvc/opensvc/commit/6d262e3d17ae9a858448ad17fb5975916d574778>`_ Merge pull request #601 from agrimal/b2.1
| `2.1-1593-gd14b3a4bc <https://github.com/opensvc/opensvc/commit/d14b3a4bcc514eac50c8f58e03f4417ff2fdbda6>`_ add support for Hitachi VSP 5000 series arrays
| `2.1-1593-g4b4003973 <https://github.com/opensvc/opensvc/commit/4b4003973a7ce29fde6d42b730df629df051675f>`_ Fix the array selection kw of the pool.hcs driver
| `2.1-1592-gde96e8b9e <https://github.com/opensvc/opensvc/commit/de96e8b9ef43dcb9623bc8f3a59b509386511ada>`_ add driver ip.rule
| `2.1-1592-gbf078bdbc <https://github.com/opensvc/opensvc/commit/bf078bdbcfc15c51d40a9e10d35a6c1ca483ace0>`_ Fix the hcs driver --array <id> selection
| `2.1-1592-g911fa5a71 <https://github.com/opensvc/opensvc/commit/911fa5a71fc5260a1f252707601cb877edfe37e9>`_ Add a network kw to pool.drbd and disk.drbd
| `2.1-1592-g414c5dee2 <https://github.com/opensvc/opensvc/commit/414c5dee2cd32cc04c3ddbd4792828c4c3bc4492>`_ Fix a case of lxc config file location set to None
| `2.1-1591-g7fa145988 <https://github.com/opensvc/opensvc/commit/7fa1459888d417fad6e1bc8c6779e33f16a7a728>`_ Merge pull request #600 from cvaroqui/20221102-factorize-ssl-context
| `2.1-1590-g95e733c41 <https://github.com/opensvc/opensvc/commit/95e733c41f710d9c142ee87fbe0a185fe22da0b2>`_ Set allow_none in collector/rpc, not in uri.ssl_context_kwargs()
| `2.1-1589-g706b01f6a <https://github.com/opensvc/opensvc/commit/706b01f6a5cfc93bc80a070f395de58cb5973b84>`_ Fix the utilities.uri module call of ss_context_kwargs
| `2.1-1588-g52f1304af <https://github.com/opensvc/opensvc/commit/52f1304af9f9abc29bc843496a6602528eb793a8>`_ Fix a pylint-detected error in the previous patch
| `2.1-1587-g1f46e558f <https://github.com/opensvc/opensvc/commit/1f46e558f6b4b9b5105497921aba6e9bb23c647d>`_ Factorize the ssl kwargs (context, allow, cipher) in utilities.uri
| `2.1-1586-g3b02d2038 <https://github.com/opensvc/opensvc/commit/3b02d2038311282d6c5433550ab894a6ff5f1d72>`_ Merge pull request #599 from cvaroqui/20221025-fix-collector-rpc
| `2.1-1584-g84187d611 <https://github.com/opensvc/opensvc/commit/84187d611d8fa2226584a4155c50d2e2d0000a06>`_ Merge pull request #598 from cvaroqui/20221024-fix-svcmon-lingering-deleted-objects
| `2.1-1583-gd632949d7 <https://github.com/opensvc/opensvc/commit/d632949d72c6bed90b8cfaae3fed69886a0d5c78>`_ Fix deleted object not deleted in the svcmon watcher
| `2.1-1583-ga41c8a515 <https://github.com/opensvc/opensvc/commit/a41c8a515176d2ef044b23a86d30ef34a7c4f6bf>`_ Fix collector rpc ssl errors
| `2.1-1582-g22fd8c778 <https://github.com/opensvc/opensvc/commit/22fd8c77866085f566b86ae5ffbb76509863080c>`_ Merge pull request #597 from cvaroqui/20221020-fix-ip-cni-provisioned-status
| `2.1-1581-g6f6725007 <https://github.com/opensvc/opensvc/commit/6f672500709a59b03c7b443022183220c0ce4227>`_ Fix a stack introduced by the previous patch
| `2.1-1580-g79da5bcfd <https://github.com/opensvc/opensvc/commit/79da5bcfd87902ce811123b31e7ce5aac18c2ef2>`_ Fix the ip.cni provisioned status
| `2.1-1579-g81a389027 <https://github.com/opensvc/opensvc/commit/81a3890277a97119dc1707ed480bf179b12fe057>`_ Merge pull request #595 from cvaroqui/20221013-fix-asset-model-and-del-sym-dev
| `2.1-1576-gb7318f6eb <https://github.com/opensvc/opensvc/commit/b7318f6eb4b11dcf03e835665b3e091fdaa362d6>`_ Merge pull request #596 from cvaroqui/20221019-fix-pure-disk-id-mixed-case
| `2.1-1575-g2173c63e9 <https://github.com/opensvc/opensvc/commit/2173c63e9a4bdcda6a6e8bc4eabcc67b5937ecb9>`_ Fix the disk_id produced by the pure array storage driver on add and del
| `2.1-1574-g08b067aca <https://github.com/opensvc/opensvc/commit/08b067aca99732212db90c47ee52918ec6bace82>`_ Make sure we don't enter an infinite retry loop on sym dev delete
| `2.1-1574-g5b028a5fc <https://github.com/opensvc/opensvc/commit/5b028a5fcea3654a084ab73d64bd4039917cb4a8>`_ Merge pull request #594 from cvaroqui/20221004-fix-ha-column-on-collector
| `2.1-1573-gf6ebf935a <https://github.com/opensvc/opensvc/commit/f6ebf935a569c2196cfd113a19a3de0fee80283a>`_ Fix the model reported by pushasset
| `2.1-1572-gb88c125ab <https://github.com/opensvc/opensvc/commit/b88c125ab4be08481683cd771bc401bbb4168c48>`_ Merge pull request #593 from cvaroqui/20221004-fix-ha-column-on-collector
| `2.1-1572-g83668fd8c <https://github.com/opensvc/opensvc/commit/83668fd8c381ca28483586526d253419d98756b6>`_ Fix the mpathpersist capability scanner
| `2.1-1571-g3aa7bd528 <https://github.com/opensvc/opensvc/commit/3aa7bd5281d8813b675932e670991f00232e2158>`_ Fix the value of the "ha" column pushed to the collector on "push config"
| `2.1-1570-g9b4881f21 <https://github.com/opensvc/opensvc/commit/9b4881f21031b861a31c1263f75889fc2efb826c>`_ Merge pull request #592 from cvaroqui/20220929-fix-trigger-env
| `2.1-1568-g817b97660 <https://github.com/opensvc/opensvc/commit/817b97660894971e18689393c6090d1a57a901c6>`_ Fix the missing OPENSVC_ env vars in task.command execs
| `2.1-1568-g9f89af1ab <https://github.com/opensvc/opensvc/commit/9f89af1ab989aeb3f531d026499e10063e39d9b7>`_ Merge pull request #591 from cvaroqui/20220929-fix-trigger-env
| `2.1-1567-g642bfb814 <https://github.com/opensvc/opensvc/commit/642bfb8145e7879bda0e10ef6bb93c4244795285>`_ Fix OPENSVC_ env var exposed to resource triggers following a volume resource
| `2.1-1566-g282b6c5ba <https://github.com/opensvc/opensvc/commit/282b6c5ba16e2d790a59b6bb994a22bfedee483f>`_ Merge pull request #589 from cvaroqui/enh-pure-drivers
| `2.1-1558-g213229153 <https://github.com/opensvc/opensvc/commit/213229153a7ee50ce945b921a4ec31365f017c73>`_ Fix a py2 pylint error in the pure array driver
| `2.1-1557-gf1b0fcdd7 <https://github.com/opensvc/opensvc/commit/f1b0fcdd7ca21ff28cbf5a40de9c54e3e6db8989>`_ Fix pylint errors in the pure array driver
| `2.1-1556-gca173ea23 <https://github.com/opensvc/opensvc/commit/ca173ea23253a3ed23bc17d6c820d906fdb0485c>`_ Make "om node pushdisks" not report devs not present in /dev
| `2.1-1555-gfc748d48d <https://github.com/opensvc/opensvc/commit/fc748d48d076c05ab0644a5fbb8786d048290d5d>`_ Add the scheduler table entry for pushhcs
| `2.1-1554-g788b3522f <https://github.com/opensvc/opensvc/commit/788b3522f1f64fed485be3840328477ea1dba065>`_ Add a serialization lock around the linux scsi scan in the disk.disk drv
| `2.1-1553-ga3ccb444a <https://github.com/opensvc/opensvc/commit/a3ccb444acee35f6d4eea961d25225ff47bcd096>`_ Don't error a unprovision action if a pure disk fails to notifying the
| `2.1-1552-ga90a21053 <https://github.com/opensvc/opensvc/commit/a90a21053c16f1b21bd4a40ca1b104cfe92ada9a>`_ Silence pylint error on cryptography imports in the pure array driver
| `2.1-1551-g96cff5121 <https://github.com/opensvc/opensvc/commit/96cff5121af7a46cf85c35889c853d8ae5fd0228>`_ Bump the pure api items per page to 100
| `2.1-1550-ga1af47de0 <https://github.com/opensvc/opensvc/commit/a1af47de036e3743808f07da8ed2b660f0c73971>`_ Fix pure array driver pylint errors
| `2.1-1550-g67d78d1db <https://github.com/opensvc/opensvc/commit/67d78d1db6a222482c46d26bb3b262b4c054c789>`_ Merge pull request #590 from arnaudveron/fix-btrfs-snap-pattern
| `2.1-1549-gf4083fd38 <https://github.com/opensvc/opensvc/commit/f4083fd38380864a098f21fca63fd1d2927ba6bf>`_ Fix pure pool driver pylint errors
| `2.1-1549-gd1d2af2eb <https://github.com/opensvc/opensvc/commit/d1d2af2ebeaec99d3cfe5bf76126b94a8fdb38fa>`_ Fix btrfs snapshot matching pattern
| `2.1-1548-g750de4a3f <https://github.com/opensvc/opensvc/commit/750de4a3f84ad7580dd4eab67f899d1037845e8f>`_ Add the pure pool driver and array driver
| `2.1-1548-g81d10b4d3 <https://github.com/opensvc/opensvc/commit/81d10b4d3d435455353f6b84af94a6c874541da6>`_ Merge pull request #588 from cvaroqui/20220831-py-3-10-compat
| `2.1-1547-ge20359537 <https://github.com/opensvc/opensvc/commit/e2035953784bd7b26e5b04d977076efc10a0dd31>`_ [pylint2] Ignore no-member on _create_unverified_context
| `2.1-1547-g9bf59f518 <https://github.com/opensvc/opensvc/commit/9bf59f51844704de62a6ab968938af63f2c1a0de>`_ Add a 2s sleep after scanscsi in the disk.disk provision codepath
| `2.1-1546-g999b005e0 <https://github.com/opensvc/opensvc/commit/999b005e027877b35dec3f7ff3b00dca3acd388e>`_ Prepare for a future py >3.10 ssl deprecation
| `2.1-1546-g336d37121 <https://github.com/opensvc/opensvc/commit/336d371210409c63fe718457abb5b93dc6285353>`_ Add a 500ms sleep in the linux scanscsi function
| `2.1-1545-g94bc17db4 <https://github.com/opensvc/opensvc/commit/94bc17db401fe31e107836e904d76671aeecc000>`_ Allow the hcs array section name to be different than the array option value
| `2.1-1545-g1bb69e528 <https://github.com/opensvc/opensvc/commit/1bb69e5280dcb663da00938fcafd85b76aa8abd5>`_ Fix the set_npn_protocols() not-implemented error on py 3.10
| `2.1-1544-gbcdeae248 <https://github.com/opensvc/opensvc/commit/bcdeae2480b2e145716eb3c5f222339e212857e6>`_ Fix a daemon collector thread stack gathering some lxc container info
| `2.1-1544-g5e1403587 <https://github.com/opensvc/opensvc/commit/5e1403587c2d8394d668d36520b577d9e509f59f>`_ Fix hcs array driver stack on parallel close_session()
| `2.1-1543-gfe2b307d7 <https://github.com/opensvc/opensvc/commit/fe2b307d78afd9721adbf08bc93c0ccfccddd5f2>`_ Merge pull request #587 from cgalibern/fix-possible-om_node_drain_failure
| `2.1-1542-gb7f9ee3d5 <https://github.com/opensvc/opensvc/commit/b7f9ee3d5c3441e58738ebf57ea0fdde477be766>`_ [monitor] 'om node drain' may fail to shutdown objects (fix)
| `2.1-1541-g759805b1d <https://github.com/opensvc/opensvc/commit/759805b1d1a71ca6c158ef87f1fd506c7d522864>`_ Merge pull request #586 from cgalibern/fix-some-corrupted-config-after-crash
| `2.1-1540-g74fa16f02 <https://github.com/opensvc/opensvc/commit/74fa16f025011560f5375975c558a40c4de6184d>`_ [extconfig] Fix 'om <obj> set --kw ...' lost updates after os crash
| `2.1-1539-g85be01e04 <https://github.com/opensvc/opensvc/commit/85be01e047d38e7ead7ae9490d0edb5edda1386c>`_ [object,node] Fix edit config lost updates after os crash
| `2.1-1538-ge19f9034a <https://github.com/opensvc/opensvc/commit/e19f9034a1919c83c7f567aef31a97542175ec28>`_ [monitor] Fix fetched config lost after os crash
| `2.1-1537-g55f15641c <https://github.com/opensvc/opensvc/commit/55f15641c3b746cb996936e7539cb237c6b1eb39>`_ Implement move_config_file: shutil.move, fsync (os crash issue)
| `2.1-1536-g6f5a53373 <https://github.com/opensvc/opensvc/commit/6f5a53373cf843fb59fa9c907525ed7d509c4875>`_ [monitor] Fix possible object config deletion while remote node is booting opensvc
| `2.1-1535-g9d16a49da <https://github.com/opensvc/opensvc/commit/9d16a49dad0d72bc64a252d0ae9e4f28884e6bf8>`_ [test] Fix false positive on test_is_exe
| `2.1-1534-g8da48c0d7 <https://github.com/opensvc/opensvc/commit/8da48c0d7a971d9e1a9cfed34ab5b2126c03652e>`_ Merge pull request #585 from cgalibern/fix-pkg-with-pyc
| `2.1-1533-g8a4a15a93 <https://github.com/opensvc/opensvc/commit/8a4a15a9318d4c79e54190d2dc6f1aa89bf77886>`_ [pkg] Fix undue .pyc files added to opensvc pkg
| `2.1-1532-g12fdd2a17 <https://github.com/opensvc/opensvc/commit/12fdd2a17b62a914c409c275ad5f0910f2dfe8e8>`_ Merge pull request #581 from cgalibern/fix_cfg_sec_directories_created_out_of_place
| `2.1-1530-gd51c82789 <https://github.com/opensvc/opensvc/commit/d51c827892aa7468b91eb8ec43efce8bc4cda8bb>`_ Merge pull request #582 from cgalibern/diag-btrf-sync
| `2.1-1529-g2b9a168c8 <https://github.com/opensvc/opensvc/commit/2b9a168c8e7d8e64a2266a8d535f7dfe6b1ee311>`_ [object builder] Fix 'SyncBtrfssnap' object has no attribute 'src_subvol'
| `2.1-1528-g882ce1ddf <https://github.com/opensvc/opensvc/commit/882ce1ddf609373a0910a30277b831506d7e8524>`_ [cfg-sec] Fix directories created out of place
| `2.1-1528-g6d94b878a <https://github.com/opensvc/opensvc/commit/6d94b878a3cec5126e5157dcde4a923c295d3b37>`_ [btrfs] get_subvols update log with remote node when not local command
| `2.1-1527-g4583b791d <https://github.com/opensvc/opensvc/commit/4583b791d17c40b2536bac9d9c7d450803eda743>`_ Merge pull request #580 from cgalibern/upstream-b2.1-sync-btrfs
| `2.1-1525-g2856d07ba <https://github.com/opensvc/opensvc/commit/2856d07bac1447bcbac226b023e2813e2251e281>`_ Merge pull request #577 from cvaroqui/20220803-fix-undue-dirs-in-volumes
| `2.1-1523-g2e6fcecac <https://github.com/opensvc/opensvc/commit/2e6fcecacbeab7df03b903551509f251697eafa9>`_ [sync.btrfs] Fix invalid keyword converter
| `2.1-1522-g243e18c5c <https://github.com/opensvc/opensvc/commit/243e18c5c249a5a3d0bcd006256622c2270e345f>`_ Merge pull request #574 from cvaroqui/fix-podman-network-choice
| `2.1-1520-gf547a9114 <https://github.com/opensvc/opensvc/commit/f547a911451372445dbe5886abd9e96444e5ffdb>`_ Merge pull request #576 from cvaroqui/20220727-rm-docker-container-by-id
| `2.1-1518-gb526f8c51 <https://github.com/opensvc/opensvc/commit/b526f8c513034a04b45c13cfd070c4117bfe021e>`_ Merge pull request #579 from cvaroqui/20220805-enh-symm-array-drv-logs
| `2.1-1516-g672a0dd58 <https://github.com/opensvc/opensvc/commit/672a0dd580a6af3b5afc24be75bb0be28d3abbc7>`_ Merge pull request #578 from cvaroqui/20220805-fix-py2-lcall-logging
| `2.1-1516-g72dc9f0ff <https://github.com/opensvc/opensvc/commit/72dc9f0ff97fae061f43f11eb93d3247a45b89eb>`_ Prevent stack during install cfg or sec object
| `2.1-1515-gbe164ef9a <https://github.com/opensvc/opensvc/commit/be164ef9a76d85a43255cfa156425f2a075513a6>`_ Better symmetrix array driver logs
| `2.1-1515-gb896790ec <https://github.com/opensvc/opensvc/commit/b896790ec654f2a3b2619b14dd0c3839ab932907>`_ Fix py2 lcall logging with non utf-8 characters
| `2.1-1515-g6ba00239b <https://github.com/opensvc/opensvc/commit/6ba00239ba0f6c80368df3981fb21b5efa0259b7>`_ Delete docker container by id
| `2.1-1515-g0c20282aa <https://github.com/opensvc/opensvc/commit/0c20282aa3de634f6f9e00616408550766c34642>`_ Fix directories created out of place in the volumes from cfg and sec objs
| `2.1-1514-g1e87f1961 <https://github.com/opensvc/opensvc/commit/1e87f1961ee11c65c43ad74b630c628d230521b6>`_ Merge pull request #573 from arnaudveron/fix-cgroup-stack
| `2.1-1513-gb4018d37d <https://github.com/opensvc/opensvc/commit/b4018d37d1c29ececa0d58ec085720164b0da64f>`_ Fix cgroup stack
| `2.1-1512-gdb1baa213 <https://github.com/opensvc/opensvc/commit/db1baa213c342556be33989feaa657f9f9ae32cc>`_ Merge pull request #572 from arnaudveron/improve-mpathpersist-detection
| `2.1-1508-gcd720fe46 <https://github.com/opensvc/opensvc/commit/cd720fe4662cf7d66c7b3a00feb3e99ef3377ba9>`_ Improve mpathpersist configuration pattern detection
| `2.1-1508-g0e6eb7937 <https://github.com/opensvc/opensvc/commit/0e6eb7937ac81945279271fc2aee2c481ce2295c>`_ Merge pull request #571 from cvaroqui/fix-dequeue-actions-when-no-collector-set
| `2.1-1507-gcc2a22aac <https://github.com/opensvc/opensvc/commit/cc2a22aacc3a31aaca4eb665191cdf868877304e>`_ [pytest] Fix possible failure in assertion due to rid order on SunOS
| `2.1-1507-g887713fee <https://github.com/opensvc/opensvc/commit/887713fee4e0ae050689d3f931c576d98eccaf7f>`_ Fix regexp to match strings without quotes
| `2.1-1506-gdfd41b7d1 <https://github.com/opensvc/opensvc/commit/dfd41b7d13d9879e21f04d3ee3389969e11e4441>`_ Fix a stack in "node dequeue action" when dbopensvc is not set
| `2.1-1506-g966d93eb7 <https://github.com/opensvc/opensvc/commit/966d93eb7d290e45e6e013bcaa625f08ac513485>`_ Improve mpathpersist configuration pattern detection
| `2.1-1505-g492bf557b <https://github.com/opensvc/opensvc/commit/492bf557b5ac846c1ddf23e3a31b43f18121d326>`_ Merge pull request #568 from cgalibern/fix-lsnr-on-ipv6-disabled-linux-host
| `2.1-1501-gbcad14045 <https://github.com/opensvc/opensvc/commit/bcad14045352b5330d75d9a904828b80a53adda2>`_ Merge pull request #570 from cgalibern/fix-sg_persist_possible-register-failure
| `2.1-1500-g678a3bd92 <https://github.com/opensvc/opensvc/commit/678a3bd927d56b686c09fac844bfcbc12521ce2b>`_ [scsi reservation] Reduce ack unit attention maximum duration on a device (from 10s to 1s)
| `2.1-1499-gf94cec039 <https://github.com/opensvc/opensvc/commit/f94cec039658a6e1bcec48d42b53937e7f08ad6e>`_ [scsireservation] Fix start/restart possible failures (sg_persist register-ignore)
| `2.1-1499-g62d15f43d <https://github.com/opensvc/opensvc/commit/62d15f43d26743b27acec2c0331314c684d45070>`_ [hb.unicast] Fallback hb.rx listener addr from '::' to '0.0.0.0' no IPV6 support
| `2.1-1498-gf9ddd635c <https://github.com/opensvc/opensvc/commit/f9ddd635c964129c402d1b5bc41741d185e2b34c>`_ Merge pull request #569 from cgalibern/fix-regression-2.1-1491-g1d330a188-need-force
| `2.1-1498-gbf3786e38 <https://github.com/opensvc/opensvc/commit/bf3786e38bde1806bf421ff047d04b335656fbbc>`_ Fix comm error in the --node=<node> remote action codepath
| `2.1-1497-g0867b49aa <https://github.com/opensvc/opensvc/commit/0867b49aa5c03a055585f349b306d178e8407a76>`_ Fix the listener socket bind on ipv6-disabled hosts
| `2.1-1497-g2c97f2946 <https://github.com/opensvc/opensvc/commit/2c97f29461076ee077e73ea98b72628bdd88c43e>`_ [scsireservation] fix scsi reservation regression (undue --force need) since 2.1-1491
| `2.1-1496-gf96cd4e22 <https://github.com/opensvc/opensvc/commit/f96cd4e22c2272e886eaf5c0ac0540beaf927069>`_ Merge pull request #565 from cvaroqui/20220606-install-safety-net-earlier-in-prstart
| `2.1-1493-g7ed76c572 <https://github.com/opensvc/opensvc/commit/7ed76c5722f6f3887b1ff23251fc175954923d10>`_ Merge pull request #566 from cvaroqui/fix-wait-shutdown-exiting-too-early
| `2.1-1492-ge65b23b93 <https://github.com/opensvc/opensvc/commit/e65b23b93a07dd9c854a15864544a95c552c8b58>`_ Fix "daemon shutdown" and "node drain" (daemon stopped too early)
| `2.1-1492-g0639abbed <https://github.com/opensvc/opensvc/commit/0639abbedc39c6ddff54c139e4a0d4886a91bb07>`_ Fix the misnamed var in disk.scsireserv safety() func log message
| `2.1-1491-g24781c4aa <https://github.com/opensvc/opensvc/commit/24781c4aac004fb5aaccb8ad2baac7f14d681a20>`_ Fix "daemon shutdown" and "node drain" considering the svc shutdown is done
| `2.1-1491-g5ea3b080e <https://github.com/opensvc/opensvc/commit/5ea3b080e68c887b0a1e635dbbfd88a2098b8e79>`_ Don't choose "lo" network by default in container.podman start codepath
| `2.1-1491-g1d330a188 <https://github.com/opensvc/opensvc/commit/1d330a188a230103738c07f97137eac9fc3e627f>`_ Install the prstart safety net earlier
| `2.1-1490-g4164f29b1 <https://github.com/opensvc/opensvc/commit/4164f29b1aa8a521fd66de314ececdb6d4925107>`_ Merge pull request #562 from cvaroqui/20220601-sym-mv-error-when-no-pg
| `2.1-1488-gdb4cfbc2c <https://github.com/opensvc/opensvc/commit/db4cfbc2c599e7c49e13d633e5d253dae3ec9dc4>`_ Merge pull request #564 from opensvc/add-license-1
| `2.1-1487-g9fdc541b4 <https://github.com/opensvc/opensvc/commit/9fdc541b4ecc37caa99b94f3204abc287f8caea1>`_ Report an error when no PG was specified in a masking view create command
| `2.1-1487-g6c25fbf69 <https://github.com/opensvc/opensvc/commit/6c25fbf69e847c2e4492657c757c5578d2c27c3d>`_ Create LICENSE
| `2.1-1486-g59e02085a <https://github.com/opensvc/opensvc/commit/59e02085a3793e011fefd6821593c53afa069cc2>`_ Merge pull request #561 from cvaroqui/20220524-deprecated-keywords
| `2.1-1485-g9c84ee176 <https://github.com/opensvc/opensvc/commit/9c84ee176a32acec861b78eafbe3b70735e36d47>`_ Fix h2 collections import moved to collections.abc circa py3.10
| `2.1-1484-g52b0d8155 <https://github.com/opensvc/opensvc/commit/52b0d81559e6cf3c722f927cdb8cc912af4da3c6>`_ Fix a stack on encapnodes evaluation
| `2.1-1483-g201c0c632 <https://github.com/opensvc/opensvc/commit/201c0c63240f894f0164273bd3a3ff1f5fe346df>`_ Fix "print config --eval" error on unknown DEFAULT.start_timeout keyword
| `2.1-1482-gef6a88dbc <https://github.com/opensvc/opensvc/commit/ef6a88dbc2f4f87c239c9490a1e941c50cbddff7>`_ Remove duplicate tests from the scheduler tests file
| `2.1-1481-gac0f36ef3 <https://github.com/opensvc/opensvc/commit/ac0f36ef33bf0e30f0b5b04e51cc47747fde3536>`_ Merge pull request #560 from cvaroqui/20220520-scheduler-doc-enhancement
| `2.1-1480-ga5f770ac1 <https://github.com/opensvc/opensvc/commit/a5f770ac10eeb802b6cac552dfff6a7db82d6645>`_ Update the schedule documentation
| `2.1-1479-gb6501cd24 <https://github.com/opensvc/opensvc/commit/b6501cd249561dc467963e2bfb01fc25fe5a1272>`_ Merge pull request #559 from cgalibern/schedule-allow-dec-jan_53-2
| `2.1-1478-g1217f8325 <https://github.com/opensvc/opensvc/commit/1217f83259409647b3a6a83b58f727a841a8f344>`_ [scheduler] Allow non-ordered month and week interval
| `2.1-1477-g8ea421c36 <https://github.com/opensvc/opensvc/commit/8ea421c36c0aa106eb47068f2b5d01f9569280a6>`_ Merge pull request #558 from cgalibern/fix-sync#i0_warn
| `2.1-1476-gd9ab1a62d <https://github.com/opensvc/opensvc/commit/d9ab1a62dcea2ead5fa7eda4144f0bb1f5d3cb71>`_ [test] Disable color in TestFormatCluster.test_can_be_called_without_nodes
| `2.1-1475-gac17a7ddd <https://github.com/opensvc/opensvc/commit/ac17a7ddd37729b18a3e8f0f70d0e92c358c43d4>`_ [monitor] Update agg provisioned value on freshly created services (fix sync#i0 warn status)
| `2.1-1474-gc9fe7e94b <https://github.com/opensvc/opensvc/commit/c9fe7e94b11effff92c3ad9f605229ff49d6821e>`_ Merge pull request #556 from cgalibern/fix-get-confirmations
| `2.1-1472-g3176b67c2 <https://github.com/opensvc/opensvc/commit/3176b67c25c86cfda3f52ab110ebf1126d4ad5c0>`_ Merge pull request #557 from cgalibern/fix-schedule-long-day-value
| `2.1-1471-gfa7ce4e5d <https://github.com/opensvc/opensvc/commit/fa7ce4e5dd9c1afd29c63bc1ea05193c7aed74d4>`_ [scheduler] Allow day interval 'sun-fri' for 'sun,mon-fri'
| `2.1-1470-g27ae31532 <https://github.com/opensvc/opensvc/commit/27ae315325e6f7a35ece613fe39b04f1539d8c3d>`_ [scheduler] fix invalid schedule day (when day is non abbreviated)
| `2.1-1470-g3b46f50ca <https://github.com/opensvc/opensvc/commit/3b46f50caf3857febfb9f0ae903c8c5ae843dc73>`_ [api] Fix possible errors during GET /object/confirmations
| `2.1-1469-g5d8ef3d8e <https://github.com/opensvc/opensvc/commit/5d8ef3d8e840b113b5de3317718a0e60be93a804>`_ Merge pull request #555 from arnaudveron/add-kvm-unprovisioner
| `2.1-1468-g5737a14fc <https://github.com/opensvc/opensvc/commit/5737a14fc8024f2707d8b40cbfea0d941ea111b8>`_ Add kvm unprovisioner
| `2.1-1467-g192eb6109 <https://github.com/opensvc/opensvc/commit/192eb6109d9cd8ae9721dba80c130e64edb97d5b>`_ Merge pull request #554 from cvaroqui/fix-prstart-on-slave-linux-vg
| `2.1-1466-g6985e443b <https://github.com/opensvc/opensvc/commit/6985e443b6037d0d949486827d1c3d5bda55ea41>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into fix-prstart-on-slave-linux-vg
| `2.1-1464-gbd938887a <https://github.com/opensvc/opensvc/commit/bd938887ab0054f015ba2a8c6a50a991c3a6d786>`_ Merge pull request #553 from arnaudveron/fix-pvscan-cache
| `2.1-1463-g37d87b185 <https://github.com/opensvc/opensvc/commit/37d87b185357ca0eee9e793329028dd6e132b449>`_ Fix prstart not registering pvs of new vgs on linux
| `2.1-1462-g846367a82 <https://github.com/opensvc/opensvc/commit/846367a820eef4bcff3747e1538615c0cd037f3e>`_ Merge pull request #552 from cvaroqui/fix-disk-crypt-subdevs
| `2.1-1461-gd26b0d2ae <https://github.com/opensvc/opensvc/commit/d26b0d2aee03937f6195b86c5419799b1ee9aa8a>`_ Fix doubled print of capability labels on scan
| `2.1-1460-g4fafae251 <https://github.com/opensvc/opensvc/commit/4fafae25108fab142056907df635bdf414580edf>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into fix-disk-crypt-subdevs
| `2.1-1457-gdf1219191 <https://github.com/opensvc/opensvc/commit/df1219191f79bd9033a6f8ab36e67a8072313fd6>`_ Fix scsi_id capability
| `2.1-1457-gd041c2973 <https://github.com/opensvc/opensvc/commit/d041c297386f82734584b33a4f5d232c566b43e0>`_ Merge pull request #551 from arnaudveron/fix-pvscan-cache
| `2.1-1457-g7fe5e88d0 <https://github.com/opensvc/opensvc/commit/7fe5e88d0da4ad459fdb52c9625b4bb2101a74e4>`_ Add pvscan fallback
| `2.1-1456-gf62a3f614 <https://github.com/opensvc/opensvc/commit/f62a3f614aae4dcd6f2e281dbe2e1d8b6036372f>`_ Fix a stack in "om node pushdisks"
| `2.1-1456-g37c2cea8f <https://github.com/opensvc/opensvc/commit/37c2cea8fb8d6688b2b2b8411c35870c979f3316>`_ Remove lvmetad condition for pvscan --cache
| `2.1-1455-g248d35a41 <https://github.com/opensvc/opensvc/commit/248d35a4126948634d27f6a49d08e719d20a928a>`_ Merge pull request #550 from cvaroqui/fix-sol-11-4-zoneadm-list
| `2.1-1454-g29b538cc5 <https://github.com/opensvc/opensvc/commit/29b538cc50e9fb10d4a70ceb2781f85869bf5ec8>`_ Support sol 11.4 11th field in zoneadm list output
| `2.1-1453-g9feedece6 <https://github.com/opensvc/opensvc/commit/9feedece6e444413287d9d91ddb1a6247b267454>`_ Merge pull request #549 from cvaroqui/fix-caps-logging
| `2.1-1452-g9e4b7df2c <https://github.com/opensvc/opensvc/commit/9e4b7df2cf3db24b4d62158e8a95d7b57475554d>`_ Remove the node.x.lvs cap label trailing whitespaces
| `2.1-1451-g781e3458c <https://github.com/opensvc/opensvc/commit/781e3458c165986d3177b7f09557bdee0461b9b5>`_ Fix the capabilities logging at daemon startup
| `2.1-1450-g1231cde49 <https://github.com/opensvc/opensvc/commit/1231cde49f58e8adbf413b4975f71acb83b85dad>`_ Merge pull request #548 from arnaudveron/remove-ssh-fixed-key-size
| `2.1-1449-gef945611a <https://github.com/opensvc/opensvc/commit/ef945611a08478481f2ca5729edd34235d4c12c4>`_ Remove hardcoded ssh key size
| `2.1-1448-g8f20dbbb2 <https://github.com/opensvc/opensvc/commit/8f20dbbb25e451efba3f8a08521fe40bcf5a7548>`_ Merge pull request #547 from cvaroqui/fix-key-change-policies
| `2.1-1447-g1e8b98e02 <https://github.com/opensvc/opensvc/commit/1e8b98e02e706b02ef433bbb4c68c6efa4d59ee8>`_ [test] Add checks on cfg, sec change without value or from kw
| `2.1-1446-gf31f07472 <https://github.com/opensvc/opensvc/commit/f31f07472f22ccfdc53e5ea7cc9b71b8f896dc4d>`_ Don't return the changes list from Extconfig::set()
| `2.1-1445-g13c92319c <https://github.com/opensvc/opensvc/commit/13c92319c5534afc753bda1fbb8d5a8d3687311e>`_ Refuse to change a non existing key
| `2.1-1444-ge1052c1b9 <https://github.com/opensvc/opensvc/commit/e1052c1b94f473ebe3f4ae65d91f6a3f80639410>`_ Don't error on add existing key if no --value or --from was specified
| `2.1-1443-gb933b194a <https://github.com/opensvc/opensvc/commit/b933b194a7df5a5849453158324094c34c2c4a71>`_ Better key add/change logging
| `2.1-1442-gc363e5d61 <https://github.com/opensvc/opensvc/commit/c363e5d6156624c66b2fbaedfaa055f8548c95dc>`_ Make extconfig set_multi() and set_mono() return the commited changes
| `2.1-1441-gefc72fd97 <https://github.com/opensvc/opensvc/commit/efc72fd97c9822c9df48486d8b9bd0d54a361408>`_ Merge pull request #546 from cvaroqui/fix-restart-with-encap-task
| `2.1-1440-gc5c29ddd9 <https://github.com/opensvc/opensvc/commit/c5c29ddd9dc3072e798c457fe5e37bb503db1827>`_ Fix a stack building object with encap tasks and DEFAULT.restart set
| `2.1-1439-ga3cc06900 <https://github.com/opensvc/opensvc/commit/a3cc06900166b75ae36e33e40aefb690efe042fa>`_ Merge pull request #542 from cvaroqui/fix-switch-with-parents
| `2.1-1436-gcb2a3e148 <https://github.com/opensvc/opensvc/commit/cb2a3e1482ce7e29ed4cc24c932d4927f1ec5a5e>`_ Merge pull request #544 from cvaroqui/prevent-task-restart
| `2.1-1435-g216b8cc5d <https://github.com/opensvc/opensvc/commit/216b8cc5ddf2d97c4872eb0071dec68112c5cb88>`_ Add sync drv family to startable drivers
| `2.1-1434-g9c765e360 <https://github.com/opensvc/opensvc/commit/9c765e360bbac4442fcf6f2d127f4c94a45ba561>`_ Prevent task resource restart
| `2.1-1433-g5239c91d0 <https://github.com/opensvc/opensvc/commit/5239c91d0355050e4290cc4e193cc206ffe7232e>`_ Merge pull request #543 from cvaroqui/no-action-error-if-dblogger-fails
| `2.1-1432-g94d903ec6 <https://github.com/opensvc/opensvc/commit/94d903ec6b9650aee0c412eec88761fd09e63153>`_ Don't try end_action if the begin_action call failed
| `2.1-1432-g7b83dfa5d <https://github.com/opensvc/opensvc/commit/7b83dfa5dbdc972af9c104eab04728ee63baf186>`_ Switch orchestration enhancements
| `2.1-1431-gd6d9c5ee2 <https://github.com/opensvc/opensvc/commit/d6d9c5ee2bfd6fe4c7456dd6882ce52bab9f042b>`_ Don't error an action if the end_action rpc call fails
| `2.1-1431-g5a25cca71 <https://github.com/opensvc/opensvc/commit/5a25cca71dc96a9e04d3af186e4517cf80a499af>`_ Add implicit same namespace to services in the "parents" list
| `2.1-1430-g715161863 <https://github.com/opensvc/opensvc/commit/715161863d660851d9f3dc2f4c66da919a9069e1>`_ Merge pull request #540 from cvaroqui/fix-parallel-set-unset-delete
| `2.1-1428-gbf961425d <https://github.com/opensvc/opensvc/commit/bf961425d2e5119dff43f0d240b78a7e074e933f>`_ Merge pull request #539 from cvaroqui/fix-remove-key-with-uppercase
| `2.1-1427-g0f47baee7 <https://github.com/opensvc/opensvc/commit/0f47baee7ada57ad441e593ec3a48a2dfc2e4c20>`_ Fix 2 more pylint "unbound var" warnings in extconfig
| `2.1-1426-g9354013be <https://github.com/opensvc/opensvc/commit/9354013be815bbdab40e55abb61e3a2d7c28071c>`_ Fix a pylint false-positive case of "unbound var" in extconfig
| `2.1-1425-gc1eafed7a <https://github.com/opensvc/opensvc/commit/c1eafed7ab33ff590bd9e9c6c117a2e98aac23bd>`_ Fix the unbound var error introduced by the previous patch
| `2.1-1424-ga1c041d11 <https://github.com/opensvc/opensvc/commit/a1c041d112c8eb11435f0a8436469272997027de>`_ [test] Remove cfg or sec key with uppercases
| `2.1-1423-gf54b366e3 <https://github.com/opensvc/opensvc/commit/f54b366e347189774213244538be3cb36988569a>`_ Fix remove key with uppercase
| `2.1-1423-g0746d5850 <https://github.com/opensvc/opensvc/commit/0746d5850271e0ee8dd76b146167e2ba482984a1>`_ Fix parallel set/unset/delete keywords
| `2.1-1422-gb8b663cd0 <https://github.com/opensvc/opensvc/commit/b8b663cd03ada2dc3b4d9563925689fc69f89457>`_ Merge pull request #538 from cvaroqui/fix-double-eval-of-encap-monitored-resources
| `2.1-1421-g500a8eda8 <https://github.com/opensvc/opensvc/commit/500a8eda8b75bb0cb7e669317ce676e45e65ba1c>`_ Fix double eval of encap monitored resources
| `2.1-1420-g7ba44bdf5 <https://github.com/opensvc/opensvc/commit/7ba44bdf5106fb532c7eff1631573b919826a56e>`_ Merge pull request #537 from cvaroqui/b2.1
| `2.1-1418-gbcbb1ea44 <https://github.com/opensvc/opensvc/commit/bcbb1ea44bbdee0b11a096395efdbbf2505245fa>`_ Merge pull request #536 from cgalibern/site-drivers-syncable
| `2.1-1417-gd5fb8fa0d <https://github.com/opensvc/opensvc/commit/d5fb8fa0d0fd568d2a673bb761a0c2ccbad2d63d>`_ [sync actions] Allow drivers to implement sync_ methods for "om <svc> sync ..."
| `2.1-1416-gf1f45707b <https://github.com/opensvc/opensvc/commit/f1f45707b26c18a6d7f9ff2a18f387ed3d2dd5e2>`_ Fix a "symdg export" error on already existing dump file
| `2.1-1416-g519d5f1e5 <https://github.com/opensvc/opensvc/commit/519d5f1e55c05c5448d4e8d20367b73104b05cef>`_ [drivers] Implement rtypes_with_attr to retrieve rtypes of loaded drivers that implement function
| `2.1-1415-g9a8112189 <https://github.com/opensvc/opensvc/commit/9a8112189a54ab8c684594da4863f9a4a4336754>`_ Merge pull request #535 from arnaudveron/add-opensuse-leap-support
| `2.1-1413-g6c6066632 <https://github.com/opensvc/opensvc/commit/6c606663278ccdd0ba0a0a9c4d07368c55a8e8cd>`_ Merge pull request #534 from cvaroqui/object-create-no-local
| `2.1-1412-g60e0c3416 <https://github.com/opensvc/opensvc/commit/60e0c341634f50ad91a3cf8a26b4036e8503e029>`_ Add openSUSE Leap support
| `2.1-1411-g7878a00e9 <https://github.com/opensvc/opensvc/commit/7878a00e9833d5b1ce5cbc9ffe4d3f2fe4fd505c>`_ Merge pull request #533 from cvaroqui/allow-localtime-mount
| `2.1-1410-gf83ce7377 <https://github.com/opensvc/opensvc/commit/f83ce7377fdf38d661ac3745e6c5ce8d44f37edd>`_ Don't set --local on the "create" action
| `2.1-1410-g096cc8dcc <https://github.com/opensvc/opensvc/commit/096cc8dcc964add58e5cf77ef6cfc47246206bd5>`_ Allow non-root cluster user to use /etc/localtime and /etc/timezone
| `2.1-1409-g9c45157da <https://github.com/opensvc/opensvc/commit/9c45157da17f7235a16ac68eb86afb4943328c6c>`_ Merge pull request #531 from cvaroqui/luks-drv
| `2.1-1405-g5ae1e3afa <https://github.com/opensvc/opensvc/commit/5ae1e3afafe9530f931d838bb0e37693d576966b>`_ Remove characters that would prevent a disk.crypt passphrase copy/paste
| `2.1-1404-g8fd5a05e3 <https://github.com/opensvc/opensvc/commit/8fd5a05e370164f0b620ecd692a7aa655a1a3b83>`_ Tweak disk.crypt keywords settings and docstrings
| `2.1-1403-g2bae74d62 <https://github.com/opensvc/opensvc/commit/2bae74d62fe54bcc4638c93c7d7299774ac23802>`_ Make loop file mod 600 for root:root on provision
| `2.1-1402-g7b4be1e17 <https://github.com/opensvc/opensvc/commit/7b4be1e17d5947c1b15f0ce5a0e06826771472a5>`_ Add the "manage_passphrase" disk.crypt keyword
| `2.1-1401-g614ce8686 <https://github.com/opensvc/opensvc/commit/614ce86866f7ed6df35729de6cf11442e970b0c9>`_ Merge pull request #532 from cvaroqui/s18-fixes
| `2.1-1401-g0c1ceeb7e <https://github.com/opensvc/opensvc/commit/0c1ceeb7e7a7e894c64c037abcad48655f87b363>`_ Fix linesep detection in sec and cfg key content
| `2.1-1400-gb59b22e0f <https://github.com/opensvc/opensvc/commit/b59b22e0f3aa47950a9ff7bf8c8ffc6a71448c54>`_ Fix a possible stack on GET /node
| `2.1-1400-g65bd1de9d <https://github.com/opensvc/opensvc/commit/65bd1de9d7caba9050edc74066abf3fbcaeb0c81>`_ Add a "label" keyword to disk.crypt
| `2.1-1399-ga7bd2d7ab <https://github.com/opensvc/opensvc/commit/a7bd2d7aba3ff1d8ea26e64ea6f0d2974562ae39>`_ Fix the POST /object_create
| `2.1-1399-g5a39bf203 <https://github.com/opensvc/opensvc/commit/5a39bf20391a5c18dda4cd06b22bbe70fb02ea95>`_ Add the disk.crypt driver
| `2.1-1398-g7dccb1e29 <https://github.com/opensvc/opensvc/commit/7dccb1e29ccde6fcc3dc8955e49c4cfeba17c000>`_ Merge pull request #530 from cgalibern/fix-om-node-print-caps
| `2.1-1397-g4da19e395 <https://github.com/opensvc/opensvc/commit/4da19e3954e1e1a45247bd534001b44b993893a3>`_ [test] Add 'om node scan capabilities' checks
| `2.1-1396-g8910b7d45 <https://github.com/opensvc/opensvc/commit/8910b7d4585b39042ea7c6ee9009f6fae061f8bf>`_ Merge pull request #529 from cgalibern/fix-om-node-print-caps
| `2.1-1395-g725f6e8aa <https://github.com/opensvc/opensvc/commit/725f6e8aa40917e909bcfbd0220dea0102174476>`_ Reorder node.x. capabilities declaration
| `2.1-1394-g1b15dba6e <https://github.com/opensvc/opensvc/commit/1b15dba6eeb8e9407ea1e5135f725c9f26acc37e>`_ [Linux] Fix stack when lvs is not installed
| `2.1-1393-g5f9004b29 <https://github.com/opensvc/opensvc/commit/5f9004b296b45393d42ea78e385a6c979d2254ee>`_ Fix regressions from 'Support labels in capabilities'
| `2.1-1392-g1bf4b4f0e <https://github.com/opensvc/opensvc/commit/1bf4b4f0e117292737df7c9d5f7badbca08aabc2>`_ Merge pull request #527 from cvaroqui/fix-drvgroup-barrier-2
| `2.1-1390-gdb2bb1f70 <https://github.com/opensvc/opensvc/commit/db2bb1f70a740c63e6a298321e4139ac4105cc63>`_ Merge pull request #525 from cvaroqui/extended-caps
| `2.1-1389-g55bb9f4c4 <https://github.com/opensvc/opensvc/commit/55bb9f4c430a4cfd0965b3c6ab4da9c4bd6562f3>`_ Merge remote-tracking branch 'upstream/b2.1' into extended-caps
| `2.1-1386-gfe5b5fb41 <https://github.com/opensvc/opensvc/commit/fe5b5fb414de2aa9acd0dde088fd657383094245>`_ Merge pull request #528 from cvaroqui/drbd-max-peers
| `2.1-1385-gd0c8fe15a <https://github.com/opensvc/opensvc/commit/d0c8fe15a49e5335abad184166a92dbfe02f7cdd>`_ [test] Add checks on max_peers value
| `2.1-1384-g57b860985 <https://github.com/opensvc/opensvc/commit/57b860985d73d1b8797403fb00bb721819e26c71>`_ Add the max_peers kw to the drbd pool driver.
| `2.1-1383-gec68c9410 <https://github.com/opensvc/opensvc/commit/ec68c9410e0c06900ef9e85ce0e0fd31803ee020>`_ Change the min max_peers value from n_instances+1 to n_instances
| `2.1-1383-g1098b864a <https://github.com/opensvc/opensvc/commit/1098b864ae4e23bee18abb8f0a26cfa7261cadbf>`_ fix missed merge resolution
| `2.1-1382-g71ce1b455 <https://github.com/opensvc/opensvc/commit/71ce1b455cc9582fb8e4a9403463aa39a4e16cdc>`_ Add a max_peers provisioning keyword to disk.drbd
| `2.1-1382-g2e2743955 <https://github.com/opensvc/opensvc/commit/2e274395575afd10e71293f8c6f9ae758b1bccca>`_ Support labels in capabilities
| `2.1-1381-g559b5b6bb <https://github.com/opensvc/opensvc/commit/559b5b6bb8c31131128504af806af9167eef2a4b>`_ Merge pull request #524 from sghf/b2.1
| `2.1-1380-g1fde0c1e5 <https://github.com/opensvc/opensvc/commit/1fde0c1e5a97bf3955b37474a2d335de00705da1>`_ [Linux] Reduce which calls during DiskInfo.scsi_id()
| `2.1-1379-gdd358ab22 <https://github.com/opensvc/opensvc/commit/dd358ab22d010dcc22af463c98ebbe583a52d739>`_ Add /usr/lib/udev/ in searched pathes for scsi_id
| `2.1-1379-ga18e60638 <https://github.com/opensvc/opensvc/commit/a18e606382d3ae4770f521fdb26d57605fff8cf5>`_ Fix "start --upto fs" not enforcing barrier
| `2.1-1378-g6eea109f7 <https://github.com/opensvc/opensvc/commit/6eea109f730505648adc44db14003fa36936e73f>`_ Merge pull request #522 from cvaroqui/fix-mon-compat-19
| `2.1-1377-g857087a82 <https://github.com/opensvc/opensvc/commit/857087a821b715bd665472c66c4ae04f4bb4b570>`_ [test] Increase test repeat items
| `2.1-1376-ga68c4a15e <https://github.com/opensvc/opensvc/commit/a68c4a15ec929a7c99b78aefb0362b4f6ea0499d>`_ Fix wrong recursion limit accounting (continue)
| `2.1-1375-g67c022856 <https://github.com/opensvc/opensvc/commit/67c02285672e6c6c56d54cc5b0274b4a26b29469>`_ Replace deprecated xmltree getiterator() by iter()
| `2.1-1374-g067703346 <https://github.com/opensvc/opensvc/commit/067703346f3a611db4a95c50e9ef5e1cd1fb55d3>`_ Fix wrong recursion limit accounting
| `2.1-1373-g756170ed6 <https://github.com/opensvc/opensvc/commit/756170ed62d5073f0acbc65872e2630a657d9358>`_ Fix "om mon" renderer to handle missing flex_target information
| `2.1-1372-g3f215d9b8 <https://github.com/opensvc/opensvc/commit/3f215d9b8f76765aa22ecd9723d2885c3f24bdb7>`_ Merge pull request #521 from cgalibern/fix-possible-lost-toc
| `2.1-1371-g0587bde5c <https://github.com/opensvc/opensvc/commit/0587bde5c08ae46d397d70dbb598a6cd0aab3c31>`_ [monitor] Fix possible lost toc actions
| `2.1-1370-g294465984 <https://github.com/opensvc/opensvc/commit/294465984bc0321ef2d1558458d596f106c88717>`_ [monitor] Refactor transition_count() to reduce its cpu usage
| `2.1-1369-g98cb3f447 <https://github.com/opensvc/opensvc/commit/98cb3f44703492073733fdc046963abc16001fa5>`_ [monitor] Replace last remaining call to set_smon from outside monitor by defer_set_smon
| `2.1-1368-gb9617bf91 <https://github.com/opensvc/opensvc/commit/b9617bf91306112fd1d0f601974096ac43ecbefd>`_ [monitor] Fix possible error when local instance is deleted
| `2.1-1367-gd0277da49 <https://github.com/opensvc/opensvc/commit/d0277da49d349b9ddf3f41f1ef4d0ee3a2bcf18b>`_ Merge pull request #520 from cvaroqui/fix-parallel-subset-resource-status
| `2.1-1365-g0735c0c8c <https://github.com/opensvc/opensvc/commit/0735c0c8cb87b81fbe8a57d18bc91ae772251757>`_ Merge pull request #519 from cgalibern/_increase-listener-accept-queue
| `2.1-1364-g7a8c36d48 <https://github.com/opensvc/opensvc/commit/7a8c36d4862e68fd0420b9e5f3b11a8b5f2c037f>`_ [scheduler] Fix possible failure during first object task launch
| `2.1-1363-g279ee9410 <https://github.com/opensvc/opensvc/commit/279ee94104577964e2e0ed1439f7d4cad5305d7f>`_ Typo on log message during push_encap_config
| `2.1-1362-g2271e7a24 <https://github.com/opensvc/opensvc/commit/2271e7a24ea15528d83d6fc812bfee06641029db>`_ [listener] Increase unix socket listener queue from 1 to 128
| `2.1-1362-g34c95b0e3 <https://github.com/opensvc/opensvc/commit/34c95b0e32d7813a45616c7e98f7cdee7de1da1f>`_ Fix wrong resource status after start for resource in a // subset
| `2.1-1361-gd20d00fb1 <https://github.com/opensvc/opensvc/commit/d20d00fb19176abc7aaadde17df4bd698754e2a8>`_ Merge pull request #518 from cvaroqui/fix-vol-wait-children-lingering-after-node-drain
| `2.1-1360-gbcde803e5 <https://github.com/opensvc/opensvc/commit/bcde803e5166ba8c8c72f721e7d1d6da4573db4d>`_ Fix vol "wait children" state lingering after a node drain
| `2.1-1359-gdd59c0091 <https://github.com/opensvc/opensvc/commit/dd59c00911ca2c06c3c3e149fce35772ace886e2>`_ Merge pull request #517 from cgalibern/log-scheduler-cleanup
| `2.1-1358-g5eab7b247 <https://github.com/opensvc/opensvc/commit/5eab7b24755e16ab2104eda7cc98ce85e3667cd0>`_ [scheduler] Log lost task exit code
| `2.1-1357-ge24da272c <https://github.com/opensvc/opensvc/commit/e24da272ce035895b25434c44297927542a71c75>`_ [scheduler] Cleanup tracedir on scheduler start/stop
| `2.1-1356-g6f96354e9 <https://github.com/opensvc/opensvc/commit/6f96354e9c84a3acf4a879881e456303396cdbc3>`_ Merge pull request #516 from cgalibern/log-failed-scheduler-launch
| `2.1-1355-g4db60d4fd <https://github.com/opensvc/opensvc/commit/4db60d4fdec19ded4883ed71bf6f745d0d3c10da>`_ [scheduler] Detect action that have been lost (use dedicated log)
| `2.1-1354-g0c3f7113f <https://github.com/opensvc/opensvc/commit/0c3f7113f705cdb3f004bf427e996fc9f6ab10b2>`_ [scheduler] Detect action that have been lost
| `2.1-1353-g0a53625c5 <https://github.com/opensvc/opensvc/commit/0a53625c586c1140fcb7d3eaff8bcfba054cc2fc>`_ Merge pull request #515 from cvaroqui/scheduler-logging
| `2.1-1352-ge5c93bfa1 <https://github.com/opensvc/opensvc/commit/e5c93bfa113bf47149ca4be758a2840168d6f4fc>`_ Move the scheduler logs in their own node.scheduler.log file
| `2.1-1351-g16cb16f50 <https://github.com/opensvc/opensvc/commit/16cb16f50a11617b7473dd5be169b04055e941ca>`_ Merge pull request #514 from arnaudveron/fix-hp3par-driver
| `2.1-1350-g0e1d98737 <https://github.com/opensvc/opensvc/commit/0e1d987379a56f26fa0bb058233273471458b17a>`_ Fix HP 3PAR driver
| `2.1-1349-g49245985b <https://github.com/opensvc/opensvc/commit/49245985bbe3d429ce56733d370e6b2f0d813466>`_ Merge pull request #513 from cvaroqui/scheduler-fast-reconf
| `2.1-1347-g2ddbe03ae <https://github.com/opensvc/opensvc/commit/2ddbe03aef6f147b20bd45e628caaa6cf78253f9>`_ Merge pull request #512 from cgalibern/fix-possible-listener-error-during-reconf
| `2.1-1346-ge078516c9 <https://github.com/opensvc/opensvc/commit/e078516c9366ab1fc1a061c073fa478cbeaae6c9>`_ [listener] Fix possible corruption of listener sockmap
| `2.1-1345-ge446017f9 <https://github.com/opensvc/opensvc/commit/e446017f9d6aed59273f796cbdd2220f8a69aed8>`_ Merge pull request #511 from cgalibern/cleanup
| `2.1-1344-g9d24792cf <https://github.com/opensvc/opensvc/commit/9d24792cfb1513b9c8a8e2d854a53ea34bd838af>`_ [push_disks] Remove used variable
| `2.1-1343-g07e828036 <https://github.com/opensvc/opensvc/commit/07e828036d32c2396c964a953ee9b2b9f7ed9495>`_ Merge pull request #510 from cgalibern/fix-remaining-test-side-effects
| `2.1-1342-gf56b6db12 <https://github.com/opensvc/opensvc/commit/f56b6db12c569861e5de3fc6ac9005925d465fc2>`_ Wake up the scheduler thread for a run_scheduler() upon obj config file change
| `2.1-1342-gf37cc604e <https://github.com/opensvc/opensvc/commit/f37cc604e79547dfe72113d808e19f0fbafc58ec>`_ [test] Cleanup some remaining tests files
| `2.1-1341-g226b97975 <https://github.com/opensvc/opensvc/commit/226b97975b5076f0242395f65e456ba0fb00cf06>`_ Merge pull request #509 from cvaroqui/fix-pg-regression
| `2.1-1340-gb1a065841 <https://github.com/opensvc/opensvc/commit/b1a0658412dde22d951548bfb63de5bba0545059>`_ Fix a pg regression introduced by 91221a45aee9f68d45d4516c0d19eec82f405e05
| `2.1-1339-g30302f9ec <https://github.com/opensvc/opensvc/commit/30302f9ec6ec37e24a0b9647cb9042f7b05ac2d9>`_ Merge pull request #506 from cgalibern/fix-invalid-priority-value
| `2.1-1338-g77c7e892e <https://github.com/opensvc/opensvc/commit/77c7e892e19b865bfc96b0d18cd30303fa5424ee>`_ [priority] Don't detect invalid 'DEFAULT.priority' settings
| `2.1-1337-g50a2473c1 <https://github.com/opensvc/opensvc/commit/50a2473c1eec53d865dccc9f70580aa94d7174a7>`_ Validate config detect invalid 'DEFAULT.priority' settings
| `2.1-1336-g9f9b17359 <https://github.com/opensvc/opensvc/commit/9f9b17359a1d299a5e8e068ba2c3a39060f8b24d>`_ Merge pull request #508 from cgalibern/fix-Solaris-stats_meminfo-when-no-swap
| `2.1-1335-g8b8d61b07 <https://github.com/opensvc/opensvc/commit/8b8d61b07dde037093378cf03f0e3b5d3bbd9f51>`_ [test] Only run TestDriverShareNfsInstances when on HP-UX, Linux, SunOS
| `2.1-1334-gd4b49404f <https://github.com/opensvc/opensvc/commit/d4b49404f22f8e01ef211f4efaf2661d6387a562>`_ [lint] fix opensvc/core/node/sunos.py
| `2.1-1333-g4ad713a5a <https://github.com/opensvc/opensvc/commit/4ad713a5a5da8985a1291f10fcda22dfd3a2125e>`_ [SunOS] Fix daemon monitor crash loop when no swap configured and invalid swap_avail value
| `2.1-1332-g33446a93e <https://github.com/opensvc/opensvc/commit/33446a93e7cd872c15946069cc2b7e0c6cf8a64a>`_ [lint] Fix get_tid signature
| `2.1-1331-g50ecb4b06 <https://github.com/opensvc/opensvc/commit/50ecb4b066bce11e7f9058a852b2c019ef872f49>`_ Merge pull request #505 from cgalibern/mpathpersist-vs-multipath-config-reservation-key
| `2.1-1330-gfd2e85d71 <https://github.com/opensvc/opensvc/commit/fd2e85d71b1f62fbc206991c8497dfce78b2f47c>`_ [capabilities] Solaris can detect disk.scsireserv.sg_persist
| `2.1-1329-gfe604edd5 <https://github.com/opensvc/opensvc/commit/fe604edd5e1f1eec72f0caa827b6a19d8eecc540>`_ Merge pull request #504 from cgalibern/mpathpersist-vs-multipath-config-reservation-key
| `2.1-1328-gd3e788c8a <https://github.com/opensvc/opensvc/commit/d3e788c8a9d9cc205f40a2cdcb83de18e33e632d>`_ [lint] fix drivers/resources/disk/scsireserv/sg.py
| `2.1-1327-g72a01c911 <https://github.com/opensvc/opensvc/commit/72a01c91105648f6b2b277d06a79826f417bf8c3>`_ [capabilities] Enable mpathpersist only when 'reservation_key file' in multipath config
| `2.1-1326-g37532c145 <https://github.com/opensvc/opensvc/commit/37532c145f4ac9beb01ce167fbc7a1bf36d8835a>`_ Merge pull request #503 from cgalibern/postinstall-cleanup-rpc-methods-cache
| `2.1-1325-gb9acddb79 <https://github.com/opensvc/opensvc/commit/b9acddb79941b19cccc077fefaea039b10a9b09f>`_ [postinstall] Cleanup collector rpc methods cache during post install
| `2.1-1324-gc3ac94228 <https://github.com/opensvc/opensvc/commit/c3ac94228ccef8661876709b4cd25df6256536dd>`_ Merge pull request #502 from cgalibern/fixes
| `2.1-1323-g313ae82e2 <https://github.com/opensvc/opensvc/commit/313ae82e247b7e8f2751f837c2a53a7bb6d1ce88>`_ [log] Improve logging during dequeue actions retries
| `2.1-1322-gdb6873938 <https://github.com/opensvc/opensvc/commit/db68739384ad2c31c34ef49c59bfb4d3698ceb65>`_ Merge pull request #497 from arnaudveron/fix-base64-encodestring
| `2.1-1321-g17855000c <https://github.com/opensvc/opensvc/commit/17855000ceb9649c74bea61594ebe3059c8d1485>`_ [lint] utilities.string
| `2.1-1320-ge67130f5f <https://github.com/opensvc/opensvc/commit/e67130f5f601b5cd935739d79395097d3f621766>`_ Fix base64 encodestring error during register
| `2.1-1319-g83b500403 <https://github.com/opensvc/opensvc/commit/83b5004032a03afda94735c951d3ed1f1601cc47>`_ Merge pull request #501 from cgalibern/fix-regression-on-2.1-1285
| `2.1-1317-g06193a203 <https://github.com/opensvc/opensvc/commit/06193a2038128081c01070f1ea8d8b43de71ceaf>`_ Merge pull request #499 from cvaroqui/abort-or-force-unmet-hard-affinity
| `2.1-1313-g8aa504dc3 <https://github.com/opensvc/opensvc/commit/8aa504dc3c8c51f9382f79b4e6d19d1f107605fb>`_ Merge pull request #498 from cvaroqui/deb11-fixes
| `2.1-1312-gf90cfb6cb <https://github.com/opensvc/opensvc/commit/f90cfb6cb89ed7e7887aa0aa7dc9bc584d0e97f2>`_ Fix soft-[anti-]affinity orchestration
| `2.1-1312-g7f870e816 <https://github.com/opensvc/opensvc/commit/7f870e816e973ca1ac143692f3d4eb3360d8cb5c>`_ [monitor] fix regression in 'om <svc> clear' since '2.1-1285-gd33fee0cb'
| `2.1-1311-g3094614dd <https://github.com/opensvc/opensvc/commit/3094614dd37bba0b2bdc3f1d5a595f568fe0fd4d>`_ Merge pull request #500 from cgalibern/use-collector_update_action_queue_v2
| `2.1-1311-g15ca87866 <https://github.com/opensvc/opensvc/commit/15ca87866e12bbd2669d7fdeb7ff84c655f3b3c0>`_ Fix hard_anti_affinity orchestration in the daemon
| `2.1-1310-gd6176b647 <https://github.com/opensvc/opensvc/commit/d6176b647e96bf349d24853f8aab18770c43dcf6>`_ Add retries during fetch list of queued actions (fix lost action from action queue)
| `2.1-1310-g065749627 <https://github.com/opensvc/opensvc/commit/065749627aa0cf8b01ee0d21a4f56cfeb37a2d5e>`_ Abort CRM start actions on svc with unmet hard affinities
| `2.1-1310-g91221a45a <https://github.com/opensvc/opensvc/commit/91221a45aee9f68d45d4516c0d19eec82f405e05>`_ Support cgroup fs head path on distros where unified is default
| `2.1-1309-gcb1c03a81 <https://github.com/opensvc/opensvc/commit/cb1c03a81fddd352cd028a6854c9d6562e0107c6>`_ Merge pull request #496 from cgalibern/add-logs
| `2.1-1308-g9d98a1f1e <https://github.com/opensvc/opensvc/commit/9d98a1f1e9c63cbef67b092cf4aafc7fb91a24e8>`_ [listener] Log 'om dequeue actions' calls
| `2.1-1307-gbceb75f61 <https://github.com/opensvc/opensvc/commit/bceb75f613a8eded8817d8399bff07ea9148c134>`_ [log] Fix Solaris addr log during Handlers set smon changes
| `2.1-1306-g8745c00d4 <https://github.com/opensvc/opensvc/commit/8745c00d40b62b483d636996ac6115527fd21bff>`_ 'om node dequeue actions' log warning when unable to fetch actions scheduled by the collector
| `2.1-1305-g1336cc45e <https://github.com/opensvc/opensvc/commit/1336cc45eee1db8f070ef592fd9a6cc78257b0e7>`_ 'om node dequeue actions' log dequeue action calls
| `2.1-1304-gd9753b46c <https://github.com/opensvc/opensvc/commit/d9753b46c09cf7bb2712bf312a52a1e73a0d097c>`_ Handlers add details about user origin when they ask for set smon changes
| `2.1-1303-gcd78593af <https://github.com/opensvc/opensvc/commit/cd78593af55112c41222857dd06f882d2ab9374a>`_ Merge pull request #495 from cvaroqui/fix-edit-config-py2
| `2.1-1302-g5fbcfb398 <https://github.com/opensvc/opensvc/commit/5fbcfb3988f8b09672eaf7e7e0edc6902ecfbe0d>`_ Fix edit config on py2
| `2.1-1301-ge982ebfaa <https://github.com/opensvc/opensvc/commit/e982ebfaaf2ffebd166c27727b6d16827853fd19>`_ Merge pull request #494 from cgalibern/fix-om-format-compact
| `2.1-1300-gc11f9ff11 <https://github.com/opensvc/opensvc/commit/c11f9ff11402baf8e349a31b8def06fa95ad1dbb>`_ 'om mon' shows 2 daemon Threads entries (fix)
| `2.1-1299-g034525a72 <https://github.com/opensvc/opensvc/commit/034525a72b585045dcf7cec2528558b990836fb3>`_ Fix 'om mon --format compact' stack
| `2.1-1298-g1d1d09868 <https://github.com/opensvc/opensvc/commit/1d1d098686ed641986fa774d299436cda1b3d219>`_ Merge pull request #493
| `2.1-1297-g98a2c509e <https://github.com/opensvc/opensvc/commit/98a2c509e37ce294a5a8c380718a05739d313955>`_ Fix resources presync not executed on "sync --rid <sync rids>" actions
| `2.1-1296-gc2a7bfe14 <https://github.com/opensvc/opensvc/commit/c2a7bfe1407714f4532855b18feb4c072efd22f9>`_ Merge pull request #490 from cgalibern/fixes-2021-11-10
| `2.1-1295-g7e9082931 <https://github.com/opensvc/opensvc/commit/7e9082931493102f8eb37a689446e00842e1989f>`_ Fix a pylint false-positive error in the container.docker driver
| `2.1-1294-gcc67dbc1d <https://github.com/opensvc/opensvc/commit/cc67dbc1dbab6889053727ac37572f016feec896>`_ Adjust the rpc proxy socket timeout for large pushdisks datasets
| `2.1-1293-g73bedc240 <https://github.com/opensvc/opensvc/commit/73bedc240ca2eff4d5e77a5cce556c5a73e8ab77>`_ Fix the hcs array driver retry loop for async requests
| `2.1-1292-g6da53227d <https://github.com/opensvc/opensvc/commit/6da53227d00ae80ba70faddc62ab829dcfd49f57>`_ Fix the sync#i0 default values for the schedule and sync_max_delay keywords
| `2.1-1291-g0ab71e966 <https://github.com/opensvc/opensvc/commit/0ab71e966a1ae07a6e485d645b8378760c6f0fb4>`_ Fix the ip.netns "mode" keyword example in docs
| `2.1-1290-g56a7cafca <https://github.com/opensvc/opensvc/commit/56a7cafca7c2114b53b37af6586e2be058ebaff6>`_ Fix docker daemon alive test for recent docker versions
| `2.1-1289-g128bdc065 <https://github.com/opensvc/opensvc/commit/128bdc065e1323b4e675b56fc244ff9f8f11d9ca>`_ Merge pull request #491 from arnaudveron/fix-collector-purge
| `2.1-1287-g004c46dbe <https://github.com/opensvc/opensvc/commit/004c46dbe97cae57e9f5a21dada8f5749a1dfc8b>`_ Merge pull request #489 from cgalibern/b2.1-fixes-2
| `2.1-1286-g38218eea3 <https://github.com/opensvc/opensvc/commit/38218eea3c85645d8df60e33037cacd4fd85df09>`_ [env] Pep8 and lint
| `2.1-1285-gd33fee0cb <https://github.com/opensvc/opensvc/commit/d33fee0cbcc7c97e70f36b6f568846441fba049e>`_ [api] Serialize listener handlers set_smon changes
| `2.1-1284-g86684c020 <https://github.com/opensvc/opensvc/commit/86684c0200488f524a9c3f043d5253db31b6335b>`_ [SunOS] Change /var/tmp/opensvc to /var/lib/opensvc/tmp (conflict with /system/filesystem/minimal)
| `2.1-1283-gf2060f0ef <https://github.com/opensvc/opensvc/commit/f2060f0efe85643dfd9d14929c622487b6e5fbc0>`_ Fix om <svc> push config
| `2.1-1283-g5c7cf41c8 <https://github.com/opensvc/opensvc/commit/5c7cf41c8e970bc573153bb03cfb0ecc274b1e62>`_ Ensure purge tag is present when daemon_status is updated
| `2.1-1282-gf5adfbdf8 <https://github.com/opensvc/opensvc/commit/f5adfbdf8c3b12a28abb8ac16440dc11c7286430>`_ Merge pull request #487 from cgalibern/fix-invalid-purge-global-expect-during-collector-call
| `2.1-1281-gde2f6b9d7 <https://github.com/opensvc/opensvc/commit/de2f6b9d76a43fa9b290d8d6cee6591f9c2037c1>`_ Fix unattended loose of global expect during send config or containerinfo
| `2.1-1280-g42c8e425e <https://github.com/opensvc/opensvc/commit/42c8e425eeb42a1c6a643aa28c487e0cf5e1fb02>`_ [collector.rpc] Lint PEP8
| `2.1-1279-g2c1173f50 <https://github.com/opensvc/opensvc/commit/2c1173f50e30a8712b2c8ebfa68a5525167a537a>`_ [collector.rpc] Lint variable before assignment
| `2.1-1278-g7f1f46a7f <https://github.com/opensvc/opensvc/commit/7f1f46a7f91adb6880ec6410ce1e5e7934a084f6>`_ [collector.rpc] Lint
| `2.1-1277-g1ae0ca6f8 <https://github.com/opensvc/opensvc/commit/1ae0ca6f85158f4f341a4a533256298521af3c9e>`_ [collector.rpc] Cleanup dup 'import json'
| `2.1-1276-g687557e54 <https://github.com/opensvc/opensvc/commit/687557e54404e5a4ce388d2dbdf43a647bec6682>`_ [collector.rpc] Skip push config and push status when object is encap
| `2.1-1275-g505168f2b <https://github.com/opensvc/opensvc/commit/505168f2b18772fde5e99747cfd8a8ce08571693>`_ [drivers.sync] Fix false possible alerts (increase default sync_max_delay to 1d3h)
| `2.1-1274-g5c8634a91 <https://github.com/opensvc/opensvc/commit/5c8634a91eab23ea00e5cbb2b86269b89fafd754>`_ [monitor] Accept to forget peer data from stale nodes in init state
| `2.1-1273-gb0ef45844 <https://github.com/opensvc/opensvc/commit/b0ef458448f4f2dc1ddc321c9c5d1b0e473de2eb>`_ [scheduler] Allow run_scheduler when no cluster.conf exists
| `2.1-1272-g138ce3445 <https://github.com/opensvc/opensvc/commit/138ce3445d81ac69d7d87c85982a02c5b7157e8d>`_ Merge pull request #483 from cgalibern/regression-hb-disk-2.1-1235-g6bba973b7
| `2.1-1271-g3e09c6be1 <https://github.com/opensvc/opensvc/commit/3e09c6be1f3aa5f386a77390bd6673ddd247247c>`_ [hb.disk] Linux hb.disk may be incorrectly disabled (regression in 2.1-1235-g6bba973b7)
| `2.1-1270-ga1e7eb251 <https://github.com/opensvc/opensvc/commit/a1e7eb2518cf9f202d2cc8f5e18254e455317f61>`_ Merge pull request #481 from cgalibern/log-wich-object-does-not-exist-during-post-object-monitor
| `2.1-1269-gb777f26ea <https://github.com/opensvc/opensvc/commit/b777f26ea16594dd014ad3709043cae5c78cff36>`_ [scheduler] Log when run_scheduler is suspended because of absent /etc/opensvc/cluster.conf
| `2.1-1268-g53e764bf6 <https://github.com/opensvc/opensvc/commit/53e764bf66dfaff4eb1fa601f9e40e5f309ebc10>`_ [podman] Fix possible container invalid status, stop failure
| `2.1-1267-g3fd32c953 <https://github.com/opensvc/opensvc/commit/3fd32c953d62921e1088ccda832acdc6bf2777a0>`_ POST object_monitor tels which object does not exist (if any)
| `2.1-1266-gccd488370 <https://github.com/opensvc/opensvc/commit/ccd48837038a3ec09e32c47df76a284c171b0b66>`_ Merge pull request #480 from cgalibern/fix-share-nfs-sunos
| `2.1-1265-gba0733bee <https://github.com/opensvc/opensvc/commit/ba0733bee128467a32e4f1d39d8a9e006c1b59e1>`_ [share.nfs] Fix share.nfs status on Solaris
| `2.1-1264-g6a14a3ec5 <https://github.com/opensvc/opensvc/commit/6a14a3ec593dc89bd810afbe04af3a3bf54c56d7>`_ Merge pull request #476 from cgalibern/monitor-status-change-idle-ready-idle-loop-when-avail-is-warn
| `2.1-1263-g430a1077b <https://github.com/opensvc/opensvc/commit/430a1077bd7a733ae00e9177a2120bcb07cfb778>`_ [monitor] Avoid monitor status idle->ready->idle loop when deploy up everywhere object
| `2.1-1262-gabcdeff57 <https://github.com/opensvc/opensvc/commit/abcdeff57194f12cb3f9de2345793c76378c7310>`_ Merge pull request #479 from cgalibern/fix-regression-in-2.1-1258
| `2.1-1261-ged8835415 <https://github.com/opensvc/opensvc/commit/ed88354150542c65db022dbe78d518f4e28765b4>`_ [Linux] oom_score_adj ignore OSError when decrease value
| `2.1-1260-gf61136e5d <https://github.com/opensvc/opensvc/commit/f61136e5dc779a44c528d31fa26b3bcd20d7b3bc>`_ Merge pull request #478 from cgalibern/fix-regression-in-2.1-1258
| `2.1-1259-ga9bfc0850 <https://github.com/opensvc/opensvc/commit/a9bfc0850f6336607aad04046dc6211caa0c0580>`_ [Linux] oom_score_adj fail when user=, or group= is used
| `2.1-1258-g40bd10e95 <https://github.com/opensvc/opensvc/commit/40bd10e953b369c705e74afa28e5e58bc07fe08e>`_ Merge pull request #477 from cgalibern/hcs-KART30008-E
| `2.1-1257-gafeb1de48 <https://github.com/opensvc/opensvc/commit/afeb1de48ed62f9cdf86a4d244c75b397f52530b>`_ Increase timeout during --wait (from 11 to 20)
| `2.1-1256-gd1e390740 <https://github.com/opensvc/opensvc/commit/d1e390740cd68681a3af1d6b2708d4e36e4b3298>`_ [Linux] Fix oom_score_adj value for forked daemon forked processes
| `2.1-1255-g59ad993ee <https://github.com/opensvc/opensvc/commit/59ad993ee397d4286c14650fae4393be88077f04>`_ [test] Fix invalid os sysname mock
| `2.1-1254-gc3f609e10 <https://github.com/opensvc/opensvc/commit/c3f609e106e04e13457067841159d445e19992a0>`_ [array.hcs] Update RETRYABLE_LOCK_ERROR_MSG_IDS with KART30008-E
| `2.1-1253-g8c395af43 <https://github.com/opensvc/opensvc/commit/8c395af439813a7247f3c52adb2611c5d6a93d4f>`_ Merge pull request #475 from cgalibern/global_expect_unset_after_conf_consensus
| `2.1-1252-g07d2f638a <https://github.com/opensvc/opensvc/commit/07d2f638afc753a967e0bca6dfae2b13c46ed032>`_ [monitor] Move log "has not yet config consensus" to debug level
| `2.1-1251-gfb03f773c <https://github.com/opensvc/opensvc/commit/fb03f773c767f9c0291d4724b43514a96b4d40ab>`_ [monitor] Fix possible provision failure on freshly created services
| `2.1-1250-g010ecb74a <https://github.com/opensvc/opensvc/commit/010ecb74aa264709182c0b7903cfe99741a544f4>`_ Merge pull request #472 from cgalibern/b2.1
| `2.1-1249-g56f6f6647 <https://github.com/opensvc/opensvc/commit/56f6f664794f4d04f30c9ef529fa8abc92a79384>`_ [log] Change log level message from debug to info when delete daemon status info during update_node_data
| `2.1-1248-gfb2a08fbe <https://github.com/opensvc/opensvc/commit/fb2a08fbe5fe6d43a904d32c5612fc26f024c995>`_ Merge pull request #470 from cgalibern/Fix_undue_retry_counts_reset_for_all_instances_expect_the_one_updating_its_count
| `2.1-1247-g32b23dd8b <https://github.com/opensvc/opensvc/commit/32b23dd8bce8736d82a67eb6941d51027ff4c12f>`_ [test] Ensure no undue retry counts reset for all instances expect the one updating its count
| `2.1-1246-g5cc6af86b <https://github.com/opensvc/opensvc/commit/5cc6af86b560f09a098bf8bdbbd4aaf431c8b957>`_ Fix undue retry counts reset for all instances expect the one updating its count
| `2.1-1245-g22ca72ba2 <https://github.com/opensvc/opensvc/commit/22ca72ba22b6dacb5e5ce21c432c6130946a9d73>`_ Merge pull request #468 from cgalibern/disable-collector-xmlrpc-when-no-collector-config
| `2.1-1244-g98cab496f <https://github.com/opensvc/opensvc/commit/98cab496f95d7018cb655a6a0ffc4f57d4cc1165>`_ [daemon] Improve daemon stop time duration (collector thread will exit earlier) Now when collector thread has been marked for stop,
| `2.1-1243-gd7d48c778 <https://github.com/opensvc/opensvc/commit/d7d48c778e53c16978af10dacf87df1656511df7>`_ Merge pull request #467 from cgalibern/disable-collector-xmlrpc-when-no-collector-config
| `2.1-1242-g31b4e2fbf <https://github.com/opensvc/opensvc/commit/31b4e2fbf84d7def1c00f2cdae57d2a690cbcfd4>`_ Align default timeout for daemon_collector_xmlrpc to DEFAULT_DAEMON_TIMEOUT
| `2.1-1241-g575bc2f3d <https://github.com/opensvc/opensvc/commit/575bc2f3db41236a7705ccf5006fd02b8114ffdb>`_ Don't try to log action in collector when collector config is absent set
| `2.1-1240-g4c16ef371 <https://github.com/opensvc/opensvc/commit/4c16ef3719e1dd1f2d96f0680844a254874710ad>`_ Merge pull request #466 from cgalibern/fix-node-update-ssh-when-no-keys
| `2.1-1238-g2034bc29b <https://github.com/opensvc/opensvc/commit/2034bc29b34d295ad0745432eb191940cfb3a003>`_ Merge pull request #465 from cvaroqui/b2.1
| `2.1-1237-g1e5ffd063 <https://github.com/opensvc/opensvc/commit/1e5ffd0634616cdbcbd122a3da53e5de94763800>`_ Fix a log message in the daemon split handler
| `2.1-1236-g4add1911e <https://github.com/opensvc/opensvc/commit/4add1911e2eefe77e846bc0432082e8e80d2ce62>`_ Fix "pg update" on lxc
| `2.1-1235-g6bba973b7 <https://github.com/opensvc/opensvc/commit/6bba973b7dd59cca67bd91b8d26e9d3e28831ac7>`_ Refuse to configure a hb.disk with dev=/dev/dm-
| `2.1-1234-gd55ce635a <https://github.com/opensvc/opensvc/commit/d55ce635a8e171a567d3e1b84776b51e77be0cd2>`_ Don't use duplog() for the split handler logs
| `2.1-1234-g8cf72efd8 <https://github.com/opensvc/opensvc/commit/8cf72efd859ea817354ba71770819d4d5c5fc7a1>`_ Fix 'om node update ssh authorized keys' message when no keys
| `2.1-1233-g393a7da81 <https://github.com/opensvc/opensvc/commit/393a7da8121d140841292a775225a59f23462276>`_ Merge pull request #464 from cgalibern/fix-sync-symsrdf-for-se-8
| `2.1-1230-ge53195673 <https://github.com/opensvc/opensvc/commit/e531956736a294b9b2c291071e0b22760b4af1db>`_ [syncsrdf] Fix possible failure during promote_devs_rw (various sym dev_name length)
| `2.1-1230-g8866c0779 <https://github.com/opensvc/opensvc/commit/8866c077907758b88855e44aff2eb409da1f3fd5>`_ Merge pull request #461 from cgalibern/fix-opensvc-daemon-status-key
| `2.1-1229-gc6fb6d138 <https://github.com/opensvc/opensvc/commit/c6fb6d13891765f7081856e91ed56e00e592dc73>`_ [test] Add assertion tests for SyncSymsrdfs.list_pd() results
| `2.1-1229-ga70e6f532 <https://github.com/opensvc/opensvc/commit/a70e6f5323122cfe36deef84d60a270b42d293c3>`_ Update daemon status json with {"daemon": {"status": "running"}}
| `2.1-1228-gd00855750 <https://github.com/opensvc/opensvc/commit/d008557508235acf8a65068252b73d7d558f7e9f>`_ Merge pull request #462 from cgalibern/fix-provision-mon-output
| `2.1-1227-g21bc5f2ca <https://github.com/opensvc/opensvc/commit/21bc5f2caac63c73eee51ffbe5c2d528e4bcca60>`_ 'om mon' now highlight 'mixed' provisioned state in yellow
| `2.1-1226-g6277a18d0 <https://github.com/opensvc/opensvc/commit/6277a18d0f753e753b54f4500aa0bb91d4120132>`_ 'om <path> print status' now highlight 'mixed' provisioned state
| `2.1-1225-gf124e75e6 <https://github.com/opensvc/opensvc/commit/f124e75e62f683c3ac9322999ab648a8d7a720de>`_ Merge pull request #463 from cgalibern/fix-pytest-timeout
| `2.1-1224-g7216510fe <https://github.com/opensvc/opensvc/commit/7216510feb3aac28036ca0cb6d3317d56ab67ac2>`_ [test] Use pytest-timeout==1.4.2 for python2
| `2.1-1223-gc3f0cf3eb <https://github.com/opensvc/opensvc/commit/c3f0cf3eb55cbfd1b0b86af322d26736d7cb3bd4>`_ Merge pull request #459 from cgalibern/need-stop-collector-when-missing-settings
| `2.1-1222-g24401ccae <https://github.com/opensvc/opensvc/commit/24401ccaef5fd9ec13fbf446c11bde154205be10>`_ [collector] Don't start collector thread if no node.uuid
| `2.1-1221-gcff414ceb <https://github.com/opensvc/opensvc/commit/cff414cebc4b620e44df19e6febb1f9c5825fb7c>`_ Merge pull request #458 from cvaroqui/b2.1
| `2.1-1220-g8ff74caa3 <https://github.com/opensvc/opensvc/commit/8ff74caa3f09d85ee3dc172b1fc37797093ce9c5>`_ Avoid repeating push-to-collector errlogs
| `2.1-1219-g18c8bcc96 <https://github.com/opensvc/opensvc/commit/18c8bcc961518c8d6f9419f39799a13de4d8550d>`_ Merge pull request #457 from cvaroqui/b2.1
| `2.1-1218-g6453c09ba <https://github.com/opensvc/opensvc/commit/6453c09ba5d1a0f04ecf6c6f77a418dabe85c0a3>`_ Fix the drbd over vg usage algo
| `2.1-1217-g2d999a32a <https://github.com/opensvc/opensvc/commit/2d999a32a50644884e4acb39f446cffa5bd39d8e>`_ Merge pull request #454 from cgalibern/b2.1
| `2.1-1210-g4af59a28a <https://github.com/opensvc/opensvc/commit/4af59a28a760bfc9f88a9f1b9c486eb65aa22443>`_ Revert "Fix some six lint warning on node.py"
| `2.1-1209-gebd3ef3fa <https://github.com/opensvc/opensvc/commit/ebd3ef3faad59a51f00eb7864db73e7861f34e18>`_ Revert "[test] Assert Traceback during daemon restart checks"
| `2.1-1209-gb862d3ee7 <https://github.com/opensvc/opensvc/commit/b862d3ee717e9f9f96bc503eca84a4e2e84d390d>`_ Merge pull request #455 from cvaroqui/b2.1
| `2.1-1208-g953a6bd69 <https://github.com/opensvc/opensvc/commit/953a6bd69180502165c61c2a257d3f27e4b2e11d>`_ Fix some six lint warning on node.py
| `2.1-1207-ge657f6d5b <https://github.com/opensvc/opensvc/commit/e657f6d5b8fe9d5d2212a1ce48eefd24550aebb1>`_ Refactor node imports
| `2.1-1206-g431bd9a92 <https://github.com/opensvc/opensvc/commit/431bd9a925e51f6f2c9ec5495d4929b0d7e8a7e5>`_ Improve log when errors during 'om daemon stats'
| `2.1-1206-g0144a5116 <https://github.com/opensvc/opensvc/commit/0144a5116334003fcc7e5a80323df5e921e17e5f>`_ Revert the bogus fragment of the network#default.network=None support patch
| `2.1-1205-gc32f39eee <https://github.com/opensvc/opensvc/commit/c32f39eee706121d435fe7d2ebeac99be9c87e21>`_ Merge pull request #456 from cgalibern/fix-md-provision-confirmation
| `2.1-1205-g63d9b8765 <https://github.com/opensvc/opensvc/commit/63d9b8765950c95b8a023443c5b927b8e1a57483>`_ [test] Add 'om daemon stats' check
| `2.1-1205-g9bca540c2 <https://github.com/opensvc/opensvc/commit/9bca540c21323dddf5e7440bab2482b9af3e0e15>`_ Support network#<id>.network=none to disable a backend network
| `2.1-1204-g92d2af09c <https://github.com/opensvc/opensvc/commit/92d2af09c73682485c607b0b098a205165ca2bb5>`_ [md] Provisioner update mdadm create command with '--run'
| `2.1-1204-g9a97df921 <https://github.com/opensvc/opensvc/commit/9a97df92187e3e90c17d77c826b5d3203f63399d>`_ [test] Assert Traceback during daemon restart checks
| `2.1-1204-g0c00b87b9 <https://github.com/opensvc/opensvc/commit/0c00b87b904b720f12db904c25dbd203f19b01aa>`_ Fix a stack on disk.scsireserv stop when a mpath has no paths
| `2.1-1203-gc85ab9eac <https://github.com/opensvc/opensvc/commit/c85ab9eac18d2c4cfb14ed4329ed4197c73ba54e>`_ Merge pull request #453 from cvaroqui/b2.1
| `2.1-1202-g7ead7e5cf <https://github.com/opensvc/opensvc/commit/7ead7e5cfed1f3ba33f15b5bd57789a7e3327f8e>`_ Support Cryptodome as pycrypto alternative
| `2.1-1201-gb28903521 <https://github.com/opensvc/opensvc/commit/b28903521a63f83d9df2c1c75b42d469b82e3ba7>`_ Merge pull request #451 from cvaroqui/b2.1
| `2.1-1199-gc2c4786cf <https://github.com/opensvc/opensvc/commit/c2c4786cf37bbb8edaacfcce90ddf6ba48be8675>`_ Merge pull request #452 from cgalibern/b2.1
| `2.1-1198-g419254602 <https://github.com/opensvc/opensvc/commit/419254602b655f76a646bf53db40a441b1dc1158>`_ Fix the completion file make program
| `2.1-1198-g3d6ab95b6 <https://github.com/opensvc/opensvc/commit/3d6ab95b644b5c1019a79e7b4d498558b06a83be>`_ [monitor] Ignore absent nodes when trying to 'unset' global expect thawed/frozen
| `2.1-1197-gac9eddf78 <https://github.com/opensvc/opensvc/commit/ac9eddf78ace5cc01bdb82803e2888a70330fb92>`_ Merge pull request #449 from cgalibern/b2.1
| `2.1-1196-g6aa922248 <https://github.com/opensvc/opensvc/commit/6aa92224864ab926216bbb23ce977a62b8a65d31>`_ [monitor] Thread may crash during set_nmon_g_expect_from_status (fix)
| `2.1-1195-gf7776dca4 <https://github.com/opensvc/opensvc/commit/f7776dca48a7bbea6d24624b7f3e6878edacc4f4>`_ [lock] Create lockdir may fail
| `2.1-1194-gd69180a9f <https://github.com/opensvc/opensvc/commit/d69180a9f81748d5276cfa25f01c262efc9379b9>`_ [daemon] Monitor may crash during merge after node deleted
| `2.1-1193-gefb69a266 <https://github.com/opensvc/opensvc/commit/efb69a266359c77bd8945573ee4fd5fd91f80b6b>`_ Merge pull request #450 from cvaroqui/b2.1
| `2.1-1192-g6efe3debc <https://github.com/opensvc/opensvc/commit/6efe3debc567e5c2f66b583b9e31fd84e3178486>`_ Fix a stack in the "om mon --section nodes" codepath
| `2.1-1191-g9f85e3d10 <https://github.com/opensvc/opensvc/commit/9f85e3d1052b7e3c50ed0c037c88c54b7249622b>`_ Merge pull request #448 from cvaroqui/b2.1
| `2.1-1188-gc7226f4c9 <https://github.com/opensvc/opensvc/commit/c7226f4c993536676a00a411f5605faf8ea69476>`_ Merge pull request #446 from cgalibern/b2.1
| `2.1-1187-g457463157 <https://github.com/opensvc/opensvc/commit/457463157c9aaec151359905ed8e5ad9750bc2a9>`_ [api] Bump api version to 7 for .restart.rid data
| `2.1-1186-g61fd00059 <https://github.com/opensvc/opensvc/commit/61fd000598b61d27fadf84476ea8b865b14e9043>`_ [monitor] Allow "restart_delay" keyword on standby resources
| `2.1-1185-gadae0fe7f <https://github.com/opensvc/opensvc/commit/adae0fe7f6333e65f6288aacb0d251971eb66813>`_ Propagate "restart_delay" encap resource
| `2.1-1184-gd8ddec343 <https://github.com/opensvc/opensvc/commit/d8ddec3435b61359c2f92d4d90c9ba01e55eb562>`_ Propagate "restart_delay" to 'pr' scsireserv co-resource
| `2.1-1183-g0ae483604 <https://github.com/opensvc/opensvc/commit/0ae4836042b6011075247ed088d653c6637fd07e>`_ Update resource info with "restart_delay"
| `2.1-1182-g7dfc15951 <https://github.com/opensvc/opensvc/commit/7dfc15951ce1964ac0dabee4597db664055f18cd>`_ Update service renderer for new "restart" daemon data
| `2.1-1181-gd39c80f3d <https://github.com/opensvc/opensvc/commit/d39c80f3db84064da66a69457c3d6b8553bc7402>`_ Implement kw 'restart_delay' (minimum delay between 2 restarts of a resource)
| `2.1-1181-g930dfb4ba <https://github.com/opensvc/opensvc/commit/930dfb4bab17ba9fc3ab8869a92bd14c8884b41d>`_ Add a hcs array driver retry condition for ldev add request
| `2.1-1180-gf843965e4 <https://github.com/opensvc/opensvc/commit/f843965e4d2614c428f170e81894aebb0bd2ac57>`_ [test] Ensure monitor restart failed rid when rid define restart kw
| `2.1-1180-g28444adb6 <https://github.com/opensvc/opensvc/commit/28444adb62ec1890113eb70559bbc373dc86b420>`_ Implement a "multipath -f" retry loop
| `2.1-1179-gb21d23983 <https://github.com/opensvc/opensvc/commit/b21d23983389dbfc50755424d08c7beffc0a6493>`_ Merge pull request #445 from cgalibern/b2.1
| `2.1-1178-g1da22f60f <https://github.com/opensvc/opensvc/commit/1da22f60f9d9c3f992ac4d6a4231b21241c95a01>`_ GET /daemon_status may fail during join/init (fix)
| `2.1-1177-g54f2b3a4c <https://github.com/opensvc/opensvc/commit/54f2b3a4c7de20c0167ade7bb41a1c7be10ac7fa>`_ Merge pull request #444 from cgalibern/b2.1-alternate
| `2.1-1176-g7c1d4363d <https://github.com/opensvc/opensvc/commit/7c1d4363de8670135cbe68d39a78e1cf763f244e>`_ [monitor] Use most recent node global_expect value (fix unreachable consensus)
| `2.1-1175-g3aeb8a032 <https://github.com/opensvc/opensvc/commit/3aeb8a032bfb77b58ad22efb427810a998f0805d>`_ Update log message when thawed or frozen global_expect is reached
| `2.1-1174-ga2b042f78 <https://github.com/opensvc/opensvc/commit/a2b042f78cece4eb35fc08c4e74fbb21fea33228>`_ set_nmon don't need to update global_expect_updated when no global_expect changes
| `2.1-1173-g4ba74c7dd <https://github.com/opensvc/opensvc/commit/4ba74c7dda2782b007e7f0be3620e81b7fc9057d>`_ Merge pull request #440 from cgalibern/fix-daemon-shutdown-duration
| `2.1-1171-g285c9680c <https://github.com/opensvc/opensvc/commit/285c9680c8c84a92429e5ebc981f6fbd700c2736>`_ Merge pull request #441 from cvaroqui/b2.1
| `2.1-1168-ge24706964 <https://github.com/opensvc/opensvc/commit/e24706964afcd3cd3a5ccd62712d8bb2a780daea>`_ Don't break the hcs request retry loop on retryable errors
| `2.1-1167-gcde327598 <https://github.com/opensvc/opensvc/commit/cde327598b3df759562e5686b46970081add1bd8>`_ Fix hb.disk behaviour when the device node disappears
| `2.1-1166-ga48dfc506 <https://github.com/opensvc/opensvc/commit/a48dfc506dd792f8042bb05f639ad81e38f7f9dd>`_ Merge pull request #442 from arnaudveron/update-systemd-unit
| `2.1-1166-g14ed335fe <https://github.com/opensvc/opensvc/commit/14ed335feb554116272aac9b73fe7a784ac5b405>`_ Avoid setting the lxc custom cappings before the cgroups hierarchy cleanup-reset
| `2.1-1165-g69644562e <https://github.com/opensvc/opensvc/commit/69644562ea60ac09375b7e6bd600ad4f8aa56a74>`_ Improve duration of daemon stop
| `2.1-1165-g3c072ad69 <https://github.com/opensvc/opensvc/commit/3c072ad69e8eae53f859fbca0542ab5c12f876d3>`_ Update systemd unit file
| `2.1-1165-g0a96b8ec1 <https://github.com/opensvc/opensvc/commit/0a96b8ec1173d955e7300dc536abe97ce95a1575>`_ Add logging to the clone_children setting
| `2.1-1164-gcc08b748f <https://github.com/opensvc/opensvc/commit/cc08b748fc30edb0740cb71461007bc04f38e952>`_ Merge pull request #438 from cgalibern/b2.1
| `2.1-1163-gb99c89a2d <https://github.com/opensvc/opensvc/commit/b99c89a2d09097d11b44e28dbd2852064f801205>`_ [GET /events] Don't log traceback on OSError (for python2)
| `2.1-1162-g3881f786f <https://github.com/opensvc/opensvc/commit/3881f786f50e05358af4c958827e1f1f3bad66d4>`_ Listener client high cpu usage on invalid tls, or early closed connection (fix)
| `2.1-1161-gf8b9288d3 <https://github.com/opensvc/opensvc/commit/f8b9288d3cbc229c61a583b2ea152735bc175ed1>`_ Revert "Add delay after listener client ECONNRESET"
| `2.1-1160-ga22639c3e <https://github.com/opensvc/opensvc/commit/a22639c3e598337d0ef0157f463b70eccaf587a4>`_ [GET /events] Don't log traceback on BrokenPipeError and BlockingIOError
| `2.1-1159-gb4c7279de <https://github.com/opensvc/opensvc/commit/b4c7279de0bd573d9af237b085c83a457318c213>`_ [listener_local] Log progress during sendall errors
| `2.1-1158-g0703431d1 <https://github.com/opensvc/opensvc/commit/0703431d1c62f80a5c92477a6a9b573bf50d7d69>`_ Merge pull request #437 from cgalibern/b2.1
| `2.1-1157-gff97295d4 <https://github.com/opensvc/opensvc/commit/ff97295d4b597a965a3f79c6bca2cd0b29c37d5c>`_ [test] Fix mutex test !
| `2.1-1156-g7837fe260 <https://github.com/opensvc/opensvc/commit/7837fe2607f5c6f9d3fd404e5ec2a9bc1ebe9c7e>`_ Daemon hb may stay in full message mode after node removed from cluster (fix)
| `2.1-1155-ga85b4e339 <https://github.com/opensvc/opensvc/commit/a85b4e3395701f1f41d0a766d4eca32084fa7581>`_ Delay retry sock_recv when SSL_ERROR_WANT_READ
| `2.1-1154-g86fe4d47b <https://github.com/opensvc/opensvc/commit/86fe4d47b7eac9f6ebb77327e0c49ec6132228a1>`_ [test] Increase delay for slow CI
| `2.1-1153-g90565d397 <https://github.com/opensvc/opensvc/commit/90565d397470c9be9bac3fc6b7657dcc0c7042bd>`_ Add delay after listener client ECONNRESET
| `2.1-1152-gbc64940d7 <https://github.com/opensvc/opensvc/commit/bc64940d75e83ae593aba115096bfebf22e05ea8>`_ Only define daemon.ident when threading.get_ident is available
| `2.1-1151-gd8afb49b0 <https://github.com/opensvc/opensvc/commit/d8afb49b01744032d3ba5cb295830cef8f41a7ef>`_ [test] Fix mutex test
| `2.1-1150-gdfed3d435 <https://github.com/opensvc/opensvc/commit/dfed3d435f65b0e2b25d3d181a4396fdb07ad4d8>`_ Fix 'om daemon mutex status' log view for Solaris
| `2.1-1149-g518695dbd <https://github.com/opensvc/opensvc/commit/518695dbd50372444fcec5ee6c98f247d85fbfc6>`_ [cli] Allow stop listener client session ('om daemon stop --session-id xxx')
| `2.1-1148-gcfedc7866 <https://github.com/opensvc/opensvc/commit/cfedc7866a6061a763851822dc8bea0942577847>`_ [API] POST /daemon_stop can now use 'session_id' option to stop a listener client
| `2.1-1147-g9811011fa <https://github.com/opensvc/opensvc/commit/9811011fac40f3f4d1042199c64dbe275176d8b7>`_ define ClientHandler sid attribute during __init__
| `2.1-1146-g03bbb54e2 <https://github.com/opensvc/opensvc/commit/03bbb54e2ec2815b502c99af7446c00a4416960f>`_ Add listener.stats.sessions.alive.<session>.ident.<thread-ident> key
| `2.1-1145-g8a3658e03 <https://github.com/opensvc/opensvc/commit/8a3658e030300ff585652ba0c08ee4cb356980d8>`_ Add thread ident key to thread status
| `2.1-1144-gc73c61a89 <https://github.com/opensvc/opensvc/commit/c73c61a8977188c9a0564030f1304f264db9215b>`_ Implement 'om daemon mutex status' to retrieve daemon thread mutex
| `2.1-1143-gbf23ce038 <https://github.com/opensvc/opensvc/commit/bf23ce0383f35d183a24f183dd7edf6c56b86fe9>`_ Implement GET /daemon_mutex to retrieve thread mutexes
| `2.1-1142-g595baef64 <https://github.com/opensvc/opensvc/commit/595baef644286933bf2a879a2086686fbc1aa52d>`_ Implement daemon_mutex_status(log=None)
| `2.1-1141-g75de85143 <https://github.com/opensvc/opensvc/commit/75de851437097b245bfc787940c4899d070e2ab2>`_ [h2_router] Update stats sessions alive progress when not served by handlers
| `2.1-1140-g83f729c0e <https://github.com/opensvc/opensvc/commit/83f729c0e662dadcaf5d94f8cde7d8edf9cf6876>`_ Merge pull request #435 from cgalibern/b2.1
| `2.1-1139-ge98796413 <https://github.com/opensvc/opensvc/commit/e987964137d2ebba9d0dd7f617319f9ace2d38de>`_ Update validate name to accept foo.1bar RFC952 & RFC1123
| `2.1-1138-gb9d8852d8 <https://github.com/opensvc/opensvc/commit/b9d8852d87b9c89e272162da97f696683db9ff17>`_ Merge pull request #436 from cvaroqui/b2.1
| `2.1-1137-g2bdf72c37 <https://github.com/opensvc/opensvc/commit/2bdf72c37dd0cc4088672150d0b2752658363e10>`_ Support the lxc path=zfs:tank/ds1 notation (no leading /)
| `2.1-1136-ga56070864 <https://github.com/opensvc/opensvc/commit/a560708647e6d78fb79658d37973402448c16dfb>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1133-g5c0ff81e2 <https://github.com/opensvc/opensvc/commit/5c0ff81e2dfb0fe3a3b6b37efe86ab12794904ee>`_ Add the "name" parameter to GET /pools
| `2.1-1132-ge7f98b3c1 <https://github.com/opensvc/opensvc/commit/e7f98b3c12e3f919f57e57735866b996b8aebf64>`_ Save an api call in the GET /pools handler
| `2.1-1132-g1197f0cc4 <https://github.com/opensvc/opensvc/commit/1197f0cc42a8a2e4e10b9c168b102b68d4fffa66>`_ Merge pull request #434 from cgalibern/b2.1
| `2.1-1131-gf2a362e5d <https://github.com/opensvc/opensvc/commit/f2a362e5d7c8955d4d27a05faaf03624134bc7fd>`_ Don't preserve instance status if deleted (daemon init stage)
| `2.1-1131-g81d0bcab2 <https://github.com/opensvc/opensvc/commit/81d0bcab21f9e650590bef7b51aad81fbabdbf0a>`_ Use a thread pool executor instead of multiprocessing in pool_status_data()
| `2.1-1130-g241529b2a <https://github.com/opensvc/opensvc/commit/241529b2ac0b1c8416b3d96025386d9ee6beb31b>`_ Merge pull request #433 from cgalibern/b2.1
| `2.1-1129-gb22e26738 <https://github.com/opensvc/opensvc/commit/b22e26738d2221d136827ff055dd1ab2e71fea53>`_ [cache] Add ttl to cache decorator
| `2.1-1128-g0b9d34169 <https://github.com/opensvc/opensvc/commit/0b9d341694851f60e197ed81e5adf3c916e707ed>`_ Merge pull request #432 from cgalibern/b2.1
| `2.1-1127-g97e11eb0f <https://github.com/opensvc/opensvc/commit/97e11eb0f01bb61b82d1ebd5c4ab6e07dfe24cbb>`_ [test] Check start app exit code is 0 when start cmd succeed
| `2.1-1126-g16885ed7b <https://github.com/opensvc/opensvc/commit/16885ed7b7204b6aab298730f626f3190d5bb32f>`_ [test] Add non regression check on app resource start when no checker
| `2.1-1125-g6c01c6c9f <https://github.com/opensvc/opensvc/commit/6c01c6c9fe1c127360156afe14a46a45586b1aad>`_ Merge pull request #431 from cvaroqui/b2.1
| `2.1-1124-gec2ce5e0b <https://github.com/opensvc/opensvc/commit/ec2ce5e0b3b9f1951fba45329d1da8f312730c36>`_ Fix a scheduler stack
| `2.1-1123-g0ffbe2e5f <https://github.com/opensvc/opensvc/commit/0ffbe2e5fb42271b9f0734b1892857354c33c774>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1121-g51d9aa25e <https://github.com/opensvc/opensvc/commit/51d9aa25e4f7baa366462af913044ac5500dd671>`_ Merge pull request #430 from cgalibern/b2.1
| `2.1-1120-g20f3f1966 <https://github.com/opensvc/opensvc/commit/20f3f19661685354b3b67cda526a1a5e8094cce2>`_ fix use of the start_timeout keyword in the app resource drivers (when no checker)
| `2.1-1120-g5d5ca20d0 <https://github.com/opensvc/opensvc/commit/5d5ca20d063d438e63dda9574d1cfbf4746d3b51>`_ Fix a stack in the line fs.host device() codepath
| `2.1-1119-g359949f4c <https://github.com/opensvc/opensvc/commit/359949f4caa5d9dc01db22c3b493baa00bb88b2f>`_ Merge pull request #429 from cgalibern/b2.1
| `2.1-1118-g7db1fd971 <https://github.com/opensvc/opensvc/commit/7db1fd97162616d2722da7e01b38a5b4fec35d71>`_ Allow wait_for_fn calls with small delay
| `2.1-1117-g4a91ad4a4 <https://github.com/opensvc/opensvc/commit/4a91ad4a42ad88f8201f7a7dea8b345cdfd25fb1>`_ Merge pull request #427 from cgalibern/b2.1
| `2.1-1115-g5bfab64ce <https://github.com/opensvc/opensvc/commit/5bfab64ce10c493b7a15a9f8cb5e802efca65248>`_ [cache] Extend cache decorator for named cache
| `2.1-1115-g4fb3a40e9 <https://github.com/opensvc/opensvc/commit/4fb3a40e9836ae9e809d89b7894f9b2e205eac7f>`_ Merge pull request #426 from cvaroqui/b2.1
| `2.1-1114-gf70898edd <https://github.com/opensvc/opensvc/commit/f70898edd88bfd4044d0eedf414f5d13b99cb412>`_ print schedule show '-' for None [next|last]_run values (fix)
| `2.1-1113-g2ad9f7421 <https://github.com/opensvc/opensvc/commit/2ad9f7421e3d0489484868509472127a5e9681f0>`_ Remove an undue status log warning in the disk.md driver
| `2.1-1112-gbd5eb6c30 <https://github.com/opensvc/opensvc/commit/bd5eb6c30e381db68301fa619005870365fedc92>`_ Fix a scheduler last cache file user expecting a datetime
| `2.1-1111-gac7a28521 <https://github.com/opensvc/opensvc/commit/ac7a28521a227ff531fde090521da1fa4832f9d8>`_ Add the GET /schedules api handler
| `2.1-1110-ga83c3b30c <https://github.com/opensvc/opensvc/commit/a83c3b30c02e5306993a00f5c106291e1875ed60>`_ Merge pull request #425 from cgalibern/b2.1
| `2.1-1109-gfc439af50 <https://github.com/opensvc/opensvc/commit/fc439af50fe7d9b0f1841e9ea2c0b500b1f4a10d>`_ [monitor] Fix monitor crash (after hb::delete_peer_data]
| `2.1-1108-gdac5cd550 <https://github.com/opensvc/opensvc/commit/dac5cd550720f2450dacd266dc52df40404e6b16>`_ [api] fix 'GET /sync' stack during hb::delete_peer_data
| `2.1-1107-gc8b3e74f6 <https://github.com/opensvc/opensvc/commit/c8b3e74f6ef49dc2811c3ff789c1ee2e0dfa693a>`_ [hb] Fix hb stack during get_message() "dictionary changed size during iteration"
| `2.1-1106-g00aee5f74 <https://github.com/opensvc/opensvc/commit/00aee5f740787b6630ae08c44a8ff1a47247e95b>`_ [daemon] Fix infinite full<->patch heartbeat message after monitor thread crashed
| `2.1-1105-g72e478ba8 <https://github.com/opensvc/opensvc/commit/72e478ba85c79bafc2f13dc5f90c12a4f7adf77b>`_ Refactor naming of LOCAL_GEN_MERGED_ON_PEER & PEER_GEN_MERGED
| `2.1-1104-g323aae225 <https://github.com/opensvc/opensvc/commit/323aae22576ef91951239593bbf8949156d9f96c>`_ Merge pull request #422 from cvaroqui/b2.1
| `2.1-1103-gf786c8dab <https://github.com/opensvc/opensvc/commit/f786c8daba0f792f661202ad4f4e07c3d02ab89f>`_ Fix a stack on daemon shutdown when updating the state of a thread dropped data branch
| `2.1-1102-g46de96be4 <https://github.com/opensvc/opensvc/commit/46de96be47ffed615884dd1c6df09892b931394f>`_ Merge pull request #421 from cvaroqui/b2.1
| `2.1-1101-g0145b8702 <https://github.com/opensvc/opensvc/commit/0145b87029e14f6d3646a38be53f79e1b120a97c>`_ Fix a postinstall stack on older python
| `2.1-1100-g82837f68c <https://github.com/opensvc/opensvc/commit/82837f68cf7508743e3d413153017e2a775e1c7c>`_ Merge pull request #420 from arnaudveron/fix-relay-timeout
| `2.1-1099-g31ea15687 <https://github.com/opensvc/opensvc/commit/31ea1568755f946e791bb3944f9969c237218958>`_ Fix send/receive timeout on hb relay socket
| `2.1-1098-gcae0eb3c7 <https://github.com/opensvc/opensvc/commit/cae0eb3c78df0bb2fc0c25e3fc1310d3511c40e5>`_ Merge pull request #418 from cvaroqui/b2.1
| `2.1-1097-gb8bbf6de9 <https://github.com/opensvc/opensvc/commit/b8bbf6de932502d264c5f2e1b90e79d035da1404>`_ Update daemon thread_data state to "terminated" or "stopped" during exit
| `2.1-1096-g6c6809204 <https://github.com/opensvc/opensvc/commit/6c6809204695edc53c45066ed92c82538f20d5ed>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1094-gde8929e7a <https://github.com/opensvc/opensvc/commit/de8929e7a2c2cac3d0cd8e910e6de883a64eeb92>`_ Merge pull request #417 from sghf/b2.1
| `2.1-1093-gb0c09262b <https://github.com/opensvc/opensvc/commit/b0c09262b96c09d0ad8318f935423c56e7b8cd58>`_ HP DL380 G10 serial detection
| `2.1-1092-gf586c7336 <https://github.com/opensvc/opensvc/commit/f586c73364eff86511299d25ac3d0a8e9553b707>`_ Merge pull request #416 from cvaroqui/b2.1
| `2.1-1092-gc887192c2 <https://github.com/opensvc/opensvc/commit/c887192c2cc42b7a1b0bcb4f12f016a06418237d>`_ Fix a pylint error in the rpc method cache dump codepath
| `2.1-1091-g458299eef <https://github.com/opensvc/opensvc/commit/458299eef62f1cb932b046231ed1980781b2a96e>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1089-g12c35f56b <https://github.com/opensvc/opensvc/commit/12c35f56b27decc6b162b155c84b634b5cf3b04c>`_ Avoid doing on listMethods call per rpc call
| `2.1-1088-ga2630beea <https://github.com/opensvc/opensvc/commit/a2630beea64338013730f409347c4ac2549e7ef3>`_ Set a randomized default schedule to node "compliance auto" task
| `2.1-1087-g85989fc03 <https://github.com/opensvc/opensvc/commit/85989fc034669ce08e3dcd409ca8125985095e06>`_ Fix the "node updatecomp" command
| `2.1-1087-g519c488d8 <https://github.com/opensvc/opensvc/commit/519c488d838c2d0ec243e5ec0194358f3bf810fa>`_ Merge pull request #415 from cvaroqui/b2.1
| `2.1-1086-g9bbdab594 <https://github.com/opensvc/opensvc/commit/9bbdab594105f34b6b65c312806b22adec509d29>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1084-gc6808cf75 <https://github.com/opensvc/opensvc/commit/c6808cf752798065f557f815a57757d239296add>`_ Merge pull request #414 from cvaroqui/b2.1
| `2.1-1084-g6937a8f8b <https://github.com/opensvc/opensvc/commit/6937a8f8ba4ad9cafd9a3e143cadc21e350d06f7>`_ Fix postinstall stack when duplicate section are found on node.conf read
| `2.1-1083-g7ef428aa9 <https://github.com/opensvc/opensvc/commit/7ef428aa96e470fae756cb487670fd94e671b229>`_ Fix the "tar" compliance object on py3
| `2.1-1082-gf064ea97a <https://github.com/opensvc/opensvc/commit/f064ea97a88fdffc4b9dd0fec59805fbbfc69cfe>`_ Merge pull request #413 from cvaroqui/b2.1
| `2.1-1081-g47b9afaec <https://github.com/opensvc/opensvc/commit/47b9afaecec398a66c83030022b3bd76caa40ce2>`_ [test] Update scheduler test (drop invalid schedule definitions from data)
| `2.1-1080-gf53857879 <https://github.com/opensvc/opensvc/commit/f538578798d1bd33047ade7d9f6a659cdfa52571>`_ Fix a sanity check in comm parse_result()
| `2.1-1079-ged323774c <https://github.com/opensvc/opensvc/commit/ed323774c67b2d2cb91b59b717ba31f35d8d8b73>`_ Restore the exception raised on invalid schedule
| `2.1-1078-g9cd698584 <https://github.com/opensvc/opensvc/commit/9cd698584ce74395a55053a3854cb5276ed002fc>`_ Restore command options unduly removed
| `2.1-1077-g916cfb317 <https://github.com/opensvc/opensvc/commit/916cfb317e849256b8a5b87610a1c13d52cf7722>`_ Fix the b64 encoding of the user/pwd in the comp lib
| `2.1-1076-g0a76f9314 <https://github.com/opensvc/opensvc/commit/0a76f9314010d93c61a205fcd8c92462ece58906>`_ Merge branch 'b2.1' of https://github.com/cvaroqui/opensvc into b2.1
| `2.1-1070-ge40cd5058 <https://github.com/opensvc/opensvc/commit/e40cd50582b05ee3628b6706f719db772ee7408f>`_ Avoid breaking all scheduler data build on error on a single schedule
| `2.1-1070-gc2f6d07e1 <https://github.com/opensvc/opensvc/commit/c2f6d07e1649f1c1eade1501085f934f23680ad3>`_ [test] Use --local on print schedule delay related checks
| `2.1-1069-g3eadde0ec <https://github.com/opensvc/opensvc/commit/3eadde0ecb9718914a193da62cbf2a5fa3247d22>`_ Fix a stack on sync action when no fs resource is found to handle the snap
| `2.1-1069-g1c8123591 <https://github.com/opensvc/opensvc/commit/1c81235916a03e1607a6941b3f5473dc420f6eb0>`_ [test] Verify delay on some node default action schedule
| `2.1-1068-gebe452153 <https://github.com/opensvc/opensvc/commit/ebe45215375f25a860d7737122dc7689c7cfc797>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1068-gcc1b05fdc <https://github.com/opensvc/opensvc/commit/cc1b05fdc3e809c246111a8c6b3efcbde82c9c6f>`_ [test] Verify next_run is fixed when not a ~ schedule
| `2.1-1067-g9743bac9c <https://github.com/opensvc/opensvc/commit/9743bac9c9eb65ba131e8255ce6b7ae703a6a823>`_ [test] Verify next_run is random when ~ schedule
| `2.1-1066-gd8a0b3902 <https://github.com/opensvc/opensvc/commit/d8a0b390297b9b741725da668e8cf2e17c5aea6a>`_ [test] Add probabilistic schedule
| `2.1-1065-ge7616130f <https://github.com/opensvc/opensvc/commit/e7616130f38615f5150c2b59e8951e9548278c47>`_ Merge pull request #412 from arnaudveron/fix-container-img-resolution
| `2.1-1065-gc924c4c70 <https://github.com/opensvc/opensvc/commit/c924c4c70088238c6f924b48d924f4da006a14fc>`_ Fix the probabilistic schedules behaviour
| `2.1-1064-gcb1bae565 <https://github.com/opensvc/opensvc/commit/cb1bae5658f4b945e70b5f8b1ecc0dda325d899d>`_ Fix a stack in logging when multiple [syslog] sections are defined
| `2.1-1064-ga13a49dd2 <https://github.com/opensvc/opensvc/commit/a13a49dd271706d532c48b57031b3d33f08a7f5a>`_ Fix container image resolution function
| `2.1-1063-g92951ff20 <https://github.com/opensvc/opensvc/commit/92951ff20686a63788d45abc69c808e765057a5d>`_ Merge pull request #411
| `2.1-1062-g43561c4be <https://github.com/opensvc/opensvc/commit/43561c4be0d78a32df0fc7929215daf468e156fe>`_ Fix object config not sent by the collector thread on create
| `2.1-1061-ga0807bf0e <https://github.com/opensvc/opensvc/commit/a0807bf0e0b5adeaf1f8a3a581eeab0d02ce307e>`_ Merge pull request #409 from cgalibern/b2.1
| `2.1-1060-g39fdada95 <https://github.com/opensvc/opensvc/commit/39fdada9598c284a69aea8708fc0ad57872a7ccf>`_ Fix stack during shutdown daemon (#fabd94581b415c382dbf2a8b30142ddf58bf7e5a)
| `2.1-1059-ge5a4ec517 <https://github.com/opensvc/opensvc/commit/e5a4ec517f71c49201b6f93935b202857336bfbc>`_ Fix some app 'text'
| `2.1-1058-g58bbd98f8 <https://github.com/opensvc/opensvc/commit/58bbd98f8d446681ca6ac8d6a94ca194feee9cfd>`_ Merge pull request #408 from cvaroqui/b2.1
| `2.1-1057-g8092b2f86 <https://github.com/opensvc/opensvc/commit/8092b2f868a55760e1648059d872c7dd5a451616>`_ Fix disk.raw driver reporting a undue warnlog when devs is a glob pattern
| `2.1-1056-gfb0e2b6c8 <https://github.com/opensvc/opensvc/commit/fb0e2b6c8d30594e6d1c3a562c68a6b99165b72e>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1054-g27cec604e <https://github.com/opensvc/opensvc/commit/27cec604ea9d1a5f52cab562802e6d5bc2220087>`_ Merge pull request #410 from arnaudveron/fix-lvm-lv-autoactivation
| `2.1-1053-ga05ce17d6 <https://github.com/opensvc/opensvc/commit/a05ce17d62f09d3f1e217cdf1e06f65e1cb5652f>`_ Take care of the lxc.payload. cgroup when setting caps
| `2.1-1053-g35f0a655c <https://github.com/opensvc/opensvc/commit/35f0a655c8c9e9bea2344ab31f6418d822d7357c>`_ Add boot method for linux lv
| `2.1-1052-g86769de40 <https://github.com/opensvc/opensvc/commit/86769de40bd27fc0a77efab942ef6a788f839a56>`_ Merge pull request #407 from cgalibern/b2.1
| `2.1-1051-g3007ed9f2 <https://github.com/opensvc/opensvc/commit/3007ed9f225d6e843aa7453537f9b96d6656b792>`_ Automatically refresh status on local node during non 'svc' kind object creation
| `2.1-1050-g76f1f2044 <https://github.com/opensvc/opensvc/commit/76f1f20444f4088eb10d65b1a3996f216752d7d6>`_ Merge pull request #404 from cvaroqui/b2.1
| `2.1-1049-g118dbcc6f <https://github.com/opensvc/opensvc/commit/118dbcc6f58cbecf7381ea360534005459c6efd4>`_ Fix miss named fonction since add ipv6 support to the drbd driver provisioner
| `2.1-1048-g87d3e4a77 <https://github.com/opensvc/opensvc/commit/87d3e4a775790017ea01c681e8476ac42889bced>`_ Fix port format since add ipv6 support to the drbd driver provisioner
| `2.1-1047-g3b051430f <https://github.com/opensvc/opensvc/commit/3b051430f8ff16f515069fbab1a55a6ed44fb864>`_ [test] Update test since add ipv6 support to the drbd driver provisioner
| `2.1-1046-g1106bb456 <https://github.com/opensvc/opensvc/commit/1106bb45629223f4d5f4b725df62ecc5f4862e05>`_ Add ipv6 support to the drbd driver provisioner
| `2.1-1045-g71cb0facb <https://github.com/opensvc/opensvc/commit/71cb0facb16180510e8dee0dc66cc01c5492ede2>`_ Fix a stack in "om net setup" in the new conflicting tunnel detection code
| `2.1-1044-gfc0c5a3c9 <https://github.com/opensvc/opensvc/commit/fc0c5a3c9d123ac4d490f8917cb19f951fe935f8>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-1039-g65f2469e2 <https://github.com/opensvc/opensvc/commit/65f2469e2b6e37e53efa0c704cc53b7cad14db80>`_ Fix the provisioned aggregation algo wrt instances in provisioned=None state
| `2.1-1038-g42c2271f5 <https://github.com/opensvc/opensvc/commit/42c2271f5e5690b634e0fe5120a43a93d6c87c0e>`_ Use the EBADF var name instead of its numeric value in the listener code
| `2.1-1037-g91ba7d4ae <https://github.com/opensvc/opensvc/commit/91ba7d4aea476760ec9ba58d25bd5331ccebb518>`_ Fix a stack in the app resource driver when the start_timeout is not set
| `2.1-1036-ga589a14ae <https://github.com/opensvc/opensvc/commit/a589a14aebd60c4281912f582d53c7906f169cba>`_ Add routed_bridge tunnel support for ipv6
| `2.1-1035-g4056e6447 <https://github.com/opensvc/opensvc/commit/4056e6447715b328b54edbffd437ddd827428c0f>`_ Use the start_timeout keyword in the app resource drivers
| `2.1-1034-g34d7206b7 <https://github.com/opensvc/opensvc/commit/34d7206b7ae73fe7bdad30c071715bbd802c7632>`_ Use getres[ug]id() instead of set[ug]id() in the app resource driver demotion
| `2.1-1033-g3549cdecb <https://github.com/opensvc/opensvc/commit/3549cdecbc5bcead002d3e9050aa71ccdb9bdab5>`_ Fix the max_parallel pytest failure
| `2.1-1032-gb1404c7f9 <https://github.com/opensvc/opensvc/commit/b1404c7f96819fd4fa8833e383d06d74247b6282>`_ Merge pull request #405 from cgalibern/b2.1
| `2.1-1032-g7a8e1bcb0 <https://github.com/opensvc/opensvc/commit/7a8e1bcb04721bb35e76b3c3248393e830dc6257>`_ Fix misleading error message when using "enter" on a svc with no container
| `2.1-1031-gcc7de66c5 <https://github.com/opensvc/opensvc/commit/cc7de66c55c216fec116f006dfbe2c0f02a070ae>`_ [pool freenas] protect delete_disk with lock
| `2.1-1031-g81eeafe8c <https://github.com/opensvc/opensvc/commit/81eeafe8c997e6e5fb6099e1b564bf258bf0c586>`_ Catch another sock.connect() error requiring cleaning up the sock
| `2.1-1030-gf56d3fc7a <https://github.com/opensvc/opensvc/commit/f56d3fc7a36384a2e2629194af0f5bb12e4f94c9>`_ Fix provisioning unresolved reference on defer volume exposed_devs
| `2.1-1030-g40f7ee08c <https://github.com/opensvc/opensvc/commit/40f7ee08cd67b561c6df82430c8fb164cc3591d9>`_ Fix the monitor thread max_parallel off-by-one enforcement
| `2.1-1029-gd54472ee5 <https://github.com/opensvc/opensvc/commit/d54472ee5dced2a206aaf6bf3c6397e6079f7771>`_ Update freenas pool driver capabilities with 'rox' and 'rwx'
| `2.1-1029-g786354ff2 <https://github.com/opensvc/opensvc/commit/786354ff2df6c8ebcea72daa37ef3424c90655da>`_ Add the rwx, rox capabilities to the hcs pool driver
| `2.1-1028-g40ed2fe7e <https://github.com/opensvc/opensvc/commit/40ed2fe7ec118bcbf93b57f84182140ad0cab456>`_ Merge pull request #403 from arnaudveron/fix-tunnel-routing
| `2.1-1027-g4ed30f5a2 <https://github.com/opensvc/opensvc/commit/4ed30f5a264d1dfe4a81486fe24adb6e4d3de2eb>`_ Fix ip route command used in tunnel setup
| `2.1-1026-gf502e2ebb <https://github.com/opensvc/opensvc/commit/f502e2ebb6d7c4e7c3f6a64fe99ac65da536ac05>`_ Merge pull request #389
| `2.1-1025-gc340afea5 <https://github.com/opensvc/opensvc/commit/c340afea518ccd88f3237dc15ffa8bd019a5eafa>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-1018-gdd3e94c8e <https://github.com/opensvc/opensvc/commit/dd3e94c8eb6212e771162e5c67256342dad3bc8e>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-1015-gb0b332819 <https://github.com/opensvc/opensvc/commit/b0b332819e84924f008ce5f588dd74b2596a1b8d>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-1012-ga1085e3f0 <https://github.com/opensvc/opensvc/commit/a1085e3f0d8a291c551652d4c1615a292bede07d>`_ Fix stop error on service fs resource when zone is not present
| `2.1-1011-g65fb6d9c3 <https://github.com/opensvc/opensvc/commit/65fb6d9c34ca6dc831f9dc3061f71916425e3861>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-1005-g6be7b4ad8 <https://github.com/opensvc/opensvc/commit/6be7b4ad8dadae5a2b32ad947f06675f2c87a3a5>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-1002-g34f88b74d <https://github.com/opensvc/opensvc/commit/34f88b74d613dba7d695466981c16927208c6924>`_ Get daemon_status now remove non updated gens from its result
| `2.1-1001-ge83e4986e <https://github.com/opensvc/opensvc/commit/e83e4986e6fc4d53b7ef1d22c051794bd9b29eee>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-997-g6808da80c <https://github.com/opensvc/opensvc/commit/6808da80ca8c5666c31ac27788f95ae6289387dc>`_ Hb only update peers beating value when value is changed
| `2.1-996-g8a5e3628b <https://github.com/opensvc/opensvc/commit/8a5e3628b9aa83ac7cc3e91cb7492947a04da5c2>`_ Disable pg during crm command inside docker or podman
| `2.1-995-gd240f3b24 <https://github.com/opensvc/opensvc/commit/d240f3b24be35ef81b94fd6d76b360b477f11788>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-992-gfabd94581 <https://github.com/opensvc/opensvc/commit/fabd94581b415c382dbf2a8b30142ddf58bf7e5a>`_ Fix om daemon restart infinite loop
| `2.1-991-gc5e030597 <https://github.com/opensvc/opensvc/commit/c5e030597cf4676bb0c44a6ce61d578fdc84c18b>`_ [lint] remove function-redefined
| `2.1-990-ge690f2c57 <https://github.com/opensvc/opensvc/commit/e690f2c5732c6914fe6a25e155c5f5526d7b4d45>`_ Remove re-computed svc value during do_svcs_action_parallel()
| `2.1-989-g2fa56598e <https://github.com/opensvc/opensvc/commit/2fa56598e36aba89b177518dc80435065bba0e52>`_ Fix invalid function name during abort_start
| `2.1-988-gc2176ce71 <https://github.com/opensvc/opensvc/commit/c2176ce712ed0904e2d5fcd9426d703fee65cb6c>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-980-g627af3a2b <https://github.com/opensvc/opensvc/commit/627af3a2b426419306bc5b332155f6110b030510>`_ Rollback use concurrent_futures in parallel execution of pool_status() methods
| `2.1-979-g549ba8a11 <https://github.com/opensvc/opensvc/commit/549ba8a11c1cd841f60f34cf17329ecf5cc2de99>`_ Revert use concurrent.futures for subset action parallelization
| `2.1-978-gdb52084d6 <https://github.com/opensvc/opensvc/commit/db52084d6807f27a886794b7baa93d055a2925f8>`_ Revert use concurrent.futures for abort_start() methods parallelization
| `2.1-977-gc13ff62dd <https://github.com/opensvc/opensvc/commit/c13ff62ddf95e37b8fc7ebc6858a98213fef0acf>`_ Revert use of concurrent.futures for --parallel CRM action
| `2.1-976-g065ada060 <https://github.com/opensvc/opensvc/commit/065ada06020aeeea66ad61efab42493998e56f45>`_ Add helper to set process title
| `2.1-975-g6adf48033 <https://github.com/opensvc/opensvc/commit/6adf48033efca38723eedbef0f9ea8af8a7c9c66>`_ Update proctitle during service_action_worker
| `2.1-974-gf1e4280d0 <https://github.com/opensvc/opensvc/commit/f1e4280d080f82e44e512a4bc50031f8e66b7736>`_ Remove remaining multiprocessing
| `2.1-973-g53e1f04d3 <https://github.com/opensvc/opensvc/commit/53e1f04d35f98d237c9dd9d83eea8bb7664563ac>`_ [test] Fix orchestrator test
| `2.1-972-g6942ee3dc <https://github.com/opensvc/opensvc/commit/6942ee3dc7a5f931d526aae157118306a7c61b4d>`_ Revert use of multiprocess on scheduler tasks
| `2.1-971-gcc66714fd <https://github.com/opensvc/opensvc/commit/cc66714fd940a3622a3d2001d99596bb61773a7b>`_ Revert tests since Revert "Make the monitor thread use the same forkserver as the scheduler to post actions"
| `2.1-970-gb7d4a18bd <https://github.com/opensvc/opensvc/commit/b7d4a18bd92071293fa00eeee5773e897430dcba>`_ Revert "Make the monitor thread use the same forkserver as the scheduler to post actions"
| `2.1-969-g87660523b <https://github.com/opensvc/opensvc/commit/87660523b3c26e33157022769fdba0b567254a48>`_ Fix om command when 'export VAR=' is not possible
| `2.1-968-gf16321bbd <https://github.com/opensvc/opensvc/commit/f16321bbd7bc7b492ee578caabd628ed607b45f3>`_ Rollback use of forkserver on scheduler and monitor
| `2.1-967-gfdc6652be <https://github.com/opensvc/opensvc/commit/fdc6652bec1aa8c3b38ebcec8e7cf80db08638c6>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-961-g1efd52da9 <https://github.com/opensvc/opensvc/commit/1efd52da98ada3d7311b7ffdc4aa9843114316ed>`_ Merge pull request #29 from cgalibern/journaled_data
| `2.1-960-g211641c83 <https://github.com/opensvc/opensvc/commit/211641c834c84775328586a5b89ee3dfd40afcc7>`_ Fix invalid exception on python2 during forkserver
| `2.1-959-gde8125a70 <https://github.com/opensvc/opensvc/commit/de8125a7014b79a0f7c1c88557abcff44eed2d6b>`_ Merge pull request #28 from cgalibern/journaled_data
| `2.1-958-g1e3122a4b <https://github.com/opensvc/opensvc/commit/1e3122a4b1de95c4bda76f24d693964d13ebeca5>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-955-gdee5c4bfe <https://github.com/opensvc/opensvc/commit/dee5c4bfecc3700f5fce774fc4f9c44cf8ec4d8d>`_ Lost log on Solaris after: "om daemon restart --node ''"
| `2.1-954-gfcdebc8ec <https://github.com/opensvc/opensvc/commit/fcdebc8ece5f60290509f89776909fa84d05580c>`_ Daemon started during Solaris pkgadd postinstall can't use forkserver (fix)
| `2.1-953-g924bfc382 <https://github.com/opensvc/opensvc/commit/924bfc382c1529c34948b7cbb891afb76f1c9f59>`_ Remove unused import during postinstall
| `2.1-952-gf53432ade <https://github.com/opensvc/opensvc/commit/f53432aded5da6b95b5891c836f60b4810ebd392>`_ Fix error on encap commands launched from forkserver_action
| `2.1-951-gac5f1829d <https://github.com/opensvc/opensvc/commit/ac5f1829d28e33c6f8d685c89c430fae0cdedc18>`_ Fix collect error on Solaris
| `2.1-950-g18bae3d3d <https://github.com/opensvc/opensvc/commit/18bae3d3ddb883a6ed540c3b96cd010bdc3a8313>`_ Merge branch 'b2.1' into journaled_data
| `2.1-887-g14c2f6a64 <https://github.com/opensvc/opensvc/commit/14c2f6a64b0886aa8eaad77c4b3755be2dfb57a5>`_ Merge pull request #27 from cgalibern/journaled_data
| `2.1-886-g5e1d7d990 <https://github.com/opensvc/opensvc/commit/5e1d7d990cf0949490182c4bc6aa641f379ec9db>`_ Fix possible failure during POST object_create with provision
| `2.1-885-g016c69afa <https://github.com/opensvc/opensvc/commit/016c69afab39aa76720290975ca9384ed6a1d825>`_ PEP8 POST object_create
| `2.1-884-g9ed73fb2c <https://github.com/opensvc/opensvc/commit/9ed73fb2c5021515b355e34801b56a482cb3f166>`_ POST object_monitor now reports errors when it does nothing
| `2.1-883-g44583b510 <https://github.com/opensvc/opensvc/commit/44583b51046dda3cb3297d37502c6ddfbaac413c>`_ Create new service may not respect '--provision' (fix)
| `2.1-882-g4869bffa5 <https://github.com/opensvc/opensvc/commit/4869bffa5c250f4a9dcd40bc3f47d370e1f8d4ce>`_ janitor proc treat failed forkserver start() as cmd errors (fix)
| `2.1-881-g09041b05a <https://github.com/opensvc/opensvc/commit/09041b05a4f0b76e792da0bc9394bbfee4154d7d>`_ Ensure forkserver_action ends with sys.exit
| `2.1-880-g7a6fbb2a4 <https://github.com/opensvc/opensvc/commit/7a6fbb2a4a0e12139ec5ea05b8f5c7ea183db03b>`_ [test] improve test_orchestrator_start duration
| `2.1-879-g16ff6d67e <https://github.com/opensvc/opensvc/commit/16ff6d67ee098a829a1d34ad08b0a5ffab6d53ee>`_ Ensure monitor does not stay in init state during boot
| `2.1-878-gb2a2cc393 <https://github.com/opensvc/opensvc/commit/b2a2cc3930f826fbb9e99141abadc18acfbf452b>`_ Fix stack during 'om system/usr/username keys'
| `2.1-877-g0789084d5 <https://github.com/opensvc/opensvc/commit/0789084d5081d5adea4b59021232510884718650>`_ [test] Use container type oci instead of docker
| `2.1-876-gb5d6280d6 <https://github.com/opensvc/opensvc/commit/b5d6280d6d3a3f8b6adfee6d44bf52a56cae84f8>`_ Update message during container_rm when docker executable is not found
| `2.1-875-g39c58342b <https://github.com/opensvc/opensvc/commit/39c58342bbce30b33cc80f8a3d39443a22a840a7>`_ Fix print dev & exposed_devs on Solaris loop
| `2.1-874-g50fba4366 <https://github.com/opensvc/opensvc/commit/50fba4366f64255a5b0efcbc00fa37b331e2c9db>`_ [test] Ensure zfs on volume exposed_devs succeed
| `2.1-873-g1b61ca16c <https://github.com/opensvc/opensvc/commit/1b61ca16ce44bfe798377e34fb98f60790a7be0e>`_ Fix provision failure (when volume#xx.exposed_devs refer a pending volume#xx)
| `2.1-872-g6b4084187 <https://github.com/opensvc/opensvc/commit/6b4084187936057b3e46df32648f530659b8e122>`_ Fix a stack on non-leader provision in ip.route resource
| `2.1-871-g4aa8e4dfa <https://github.com/opensvc/opensvc/commit/4aa8e4dfaa56a91396d59fef43a3330870077177>`_ Fix the "restart --rid ip" stopping but not starting ip.netns resources
| `2.1-870-g98797c24d <https://github.com/opensvc/opensvc/commit/98797c24dc149378802614535d42da3d4175749f>`_ Fix an uncatched exception in ip.route status evaluation
| `2.1-869-gb8f7faaed <https://github.com/opensvc/opensvc/commit/b8f7faaeddf5f03896d2ab844310b1be91c3f5f4>`_ Rollback the static route implementation via a DataResource, add a ip.route drv
| `2.1-868-g91bea1966 <https://github.com/opensvc/opensvc/commit/91bea1966b5dd7614b9a9eff3ceb9737f1cc5056>`_ [test] Check ip host linux (stop)
| `2.1-867-gfc35d6b7a <https://github.com/opensvc/opensvc/commit/fc35d6b7a7b5bda3ea24ab0796470166da31b4f9>`_ [test] Check ip host linux (alias=true or false)
| `2.1-866-ga577a823d <https://github.com/opensvc/opensvc/commit/a577a823d3d31fa87229be0624ef427407ad5d57>`_ [test] Check monitor render add "#" to instance flags on "drp instances
| `2.1-865-gadc902f46 <https://github.com/opensvc/opensvc/commit/adc902f46ba1e5d311edeef540740182bcb278ef>`_ [test] Add checks on non for macvtap on ip host linux
| `2.1-864-g392225f94 <https://github.com/opensvc/opensvc/commit/392225f943ede8524ad3d310ec4c6fab70a29e9b>`_ [test] Add checks on for macvtap on ip host linux (when ipdev = name@dev)
| `2.1-863-gcb39cc524 <https://github.com/opensvc/opensvc/commit/cb39cc524d75b554b9838360697bd9f30a69df29>`_ Avoid dropping object configs on nodes having a drp instance
| `2.1-862-gca7f4c5e8 <https://github.com/opensvc/opensvc/commit/ca7f4c5e85d980444074f02dacc58400999e140c>`_ Render the drp instances using a "#" in the instance flags area of "om mon"
| `2.1-861-gf4ea51f34 <https://github.com/opensvc/opensvc/commit/f4ea51f34cb828d85c7fa102367f9d9191ad5edf>`_ Add support for static routes installation in the ip.netns driver
| `2.1-860-g9c3acdb5b <https://github.com/opensvc/opensvc/commit/9c3acdb5b241ff27b2c7b96a3e938740d33e0d70>`_ Use the "mode bridge" for macvtap
| `2.1-859-g419be37d1 <https://github.com/opensvc/opensvc/commit/419be37d1bb3d3bacd9270f6cab6d483fc4ddd6a>`_ [test] fix missed readouterr().err
| `2.1-858-g2ff145e2a <https://github.com/opensvc/opensvc/commit/2ff145e2a7ba50bdfc9bc9a6fc80ae423a1c42ea>`_ Fix error during validate_env_references
| `2.1-857-ge26b847da <https://github.com/opensvc/opensvc/commit/e26b847da2c8871806458f2d8ec734f3df9d7c2d>`_ [test] Ensure create, or set service with invalid keyword is refused
| `2.1-856-gac9a55e15 <https://github.com/opensvc/opensvc/commit/ac9a55e154c84252e55d624e320a853798b269fd>`_ Avoid reporting "interface not found" on macvtap ip resources
| `2.1-855-g331286742 <https://github.com/opensvc/opensvc/commit/331286742715b54b1127e100968e1829d3b9bedd>`_ Fixes for macvtap ip resources
| `2.1-854-g218986dc6 <https://github.com/opensvc/opensvc/commit/218986dc61c327df88b00ee8181e8927788369fc>`_ Fix the ipdev spliting in ip resources init
| `2.1-853-g5b10a3aef <https://github.com/opensvc/opensvc/commit/5b10a3aefe46ad7f45daff98bfccd94020d467c6>`_ Fix validate config missed errors, when recursion is detected, add tests
| `2.1-852-g8ebbfd197 <https://github.com/opensvc/opensvc/commit/8ebbfd197157469b8c7a31f91f318b3521a5da5e>`_ Fix the reference recursion detection method
| `2.1-851-g914c17075 <https://github.com/opensvc/opensvc/commit/914c1707501e8520f85f762a756b9813e07537ae>`_ Add support for fixed ip interface names on linux
| `2.1-850-gc894c07b6 <https://github.com/opensvc/opensvc/commit/c894c07b624c345c161090b78eabdfc76ebc3f9d>`_ Support ipdev=eth0:my_forced_alias in ip.host resources with alias=true
| `2.1-849-ge725397e9 <https://github.com/opensvc/opensvc/commit/e725397e92a677dd0335540684b21e8e87b3fa5e>`_ Fix a the recursion detection breaking the env.foo={unresoled} return value
| `2.1-848-gbb048caf5 <https://github.com/opensvc/opensvc/commit/bb048caf569765814f807d1537fa82f906f4c481>`_ Implement recursion protection in extconfig
| `2.1-847-g8fe51d4d9 <https://github.com/opensvc/opensvc/commit/8fe51d4d9bb31014c8d50a36858975138ac69898>`_ Remove a debug traceback stack print on obj config syntax errors
| `2.1-846-g2b0523f23 <https://github.com/opensvc/opensvc/commit/2b0523f233154682a9cbfc7afb4a9d74751c625d>`_ During daemon join, node.env may be removed from node.conf (fix)
| `2.1-845-gab9672128 <https://github.com/opensvc/opensvc/commit/ab96721282f360a599bbe8141610228efaee7451>`_ Fix a "zfs destroy" failed on "busy" zvol just after drbd unprov
| `2.1-844-gc9e38e3bb <https://github.com/opensvc/opensvc/commit/c9e38e3bbfbf4f295ebd268d2ff4622ff8a76e8c>`_ Fix a "provisioning failed" on vol declared by multiple svc
| `2.1-843-g930568064 <https://github.com/opensvc/opensvc/commit/930568064b94f2ee90406b62872a458003d8ef16>`_ Fix pg_mem_limit not set if pg_vmem_limit is set but swappaccount is not set
| `2.1-842-gdd4c024b1 <https://github.com/opensvc/opensvc/commit/dd4c024b1c567c02ffbd3f70fb0e2447a1d42e28>`_ Remove unused imports from monitor.py
| `2.1-841-g5bda5f67f <https://github.com/opensvc/opensvc/commit/5bda5f67ffcda4369fd10023663a372204dfd08f>`_ [PEP8] monitor.py
| `2.1-840-g836576b7a <https://github.com/opensvc/opensvc/commit/836576b7a6a87c9e02e73e95eef88293db81b48d>`_ [monitor] Fix invalid cmd string in push_proc
| `2.1-839-g55221c322 <https://github.com/opensvc/opensvc/commit/55221c322e728a054e28380a7f40433a43bd40fb>`_ [test] update orchestrator tests since monitor thread use forkserver
| `2.1-838-gd429b78b3 <https://github.com/opensvc/opensvc/commit/d429b78b39b36928afea1f82eb9d4dedcadfe2f1>`_ [test] Update test helper with ANY and call imports
| `2.1-837-g7c8861281 <https://github.com/opensvc/opensvc/commit/7c88612819e6c989f6fd5298175d290befe6baba>`_ Merge pull request #26 from cgalibern/journaled_data
| `2.1-836-g741104271 <https://github.com/opensvc/opensvc/commit/741104271f288ee1e28a6fd26a3e7bd9c32171c6>`_ Fix last commit missing '--disable_rollback' during orchestrate service_provision
| `2.1-835-ge34b795c4 <https://github.com/opensvc/opensvc/commit/e34b795c4a8dcaacf5e559f9f5374480386516c0>`_ Make the monitor thread use the same forkserver as the scheduler to post actions
| `2.1-834-g01d9bc2ab <https://github.com/opensvc/opensvc/commit/01d9bc2ab95c665cb97e082b6a1cb3dc48a7828e>`_ Merge pull request #21 from cgalibern/journaled_data
| `2.1-833-g4d0df5a69 <https://github.com/opensvc/opensvc/commit/4d0df5a69c30a97d6d3b3816415feaad98fb568d>`_ Fix possible failure of journal apply after full received
| `2.1-832-g4b2f6fa60 <https://github.com/opensvc/opensvc/commit/4b2f6fa601fd8bd33b97150f89e6ba5e3f794694>`_ Add log when merge_rx install cluster full dataset
| `2.1-831-g0fe93c6e2 <https://github.com/opensvc/opensvc/commit/0fe93c6e2cb8515fc608270c9eee23ef480f8b60>`_ Remove some dead code on journaled_data.py
| `2.1-830-g5aab36141 <https://github.com/opensvc/opensvc/commit/5aab36141758975b731651c9889cdd63fd0fbcd4>`_ [PEP8] Fix journaled_data.py
| `2.1-829-g497066b5f <https://github.com/opensvc/opensvc/commit/497066b5fd48d05d3870da8b079f8b0160a1b2a4>`_ Ensure safe JournaledData.dump_changes()
| `2.1-828-g97c6d9568 <https://github.com/opensvc/opensvc/commit/97c6d9568caffcca7911a228ee223873cee9c2e0>`_ Merge pull request #20 from cgalibern/journaled_data
| `2.1-827-gdf8ad818d <https://github.com/opensvc/opensvc/commit/df8ad818df935d12816a86c47cdaae22c0010389>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-821-g3b72b0a85 <https://github.com/opensvc/opensvc/commit/3b72b0a855914d3460e92120dfb092f69e50a4fc>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-817-ge4d529eb0 <https://github.com/opensvc/opensvc/commit/e4d529eb0a22d7dd52b247f21c316a47d4a3b4b9>`_ Merge pull request #19 from cgalibern/journaled_data
| `2.1-816-g4412be263 <https://github.com/opensvc/opensvc/commit/4412be263a347b4de0ee500893055f8712cd92b3>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-813-ga3ea220c1 <https://github.com/opensvc/opensvc/commit/a3ea220c1efae8accade53c90b6b178c2a4357b2>`_ Merge remote-tracking branch 'upstream/b2.1' into prepare-journaled_data
| `2.1-801-gb00c76cbf <https://github.com/opensvc/opensvc/commit/b00c76cbf2f3b72d29295cedd202358c000b8c62>`_ [test] Allow schedule next_run on new task from [0, 1s] to [0, 2s]
| `2.1-800-g2bcf693c8 <https://github.com/opensvc/opensvc/commit/2bcf693c8a8a4720ca28deb6d3595b2cf7768497>`_ [test] Use pytest random and fix tests with side effects
| `2.1-799-gfbc6f6198 <https://github.com/opensvc/opensvc/commit/fbc6f6198a86400e591a4a631a9c9d65b8cfa6f5>`_ [test] revert journaled_data consistent changes
| `2.1-798-g131ac03a0 <https://github.com/opensvc/opensvc/commit/131ac03a06a3f9c225f0f2ca2bc297863c6c8496>`_ Ensure journaled_data dump_change and events are not python version dependent
| `2.1-797-gdaf7cf780 <https://github.com/opensvc/opensvc/commit/daf7cf780cbe05b5814e2102457450933e562714>`_ Implement sort_keys() for JournaledDataView and JournaledData
| `2.1-796-gcd489646e <https://github.com/opensvc/opensvc/commit/cd489646e750bb3d0bb60bcd1e82b205d22c2b5b>`_ Merge pull request #18 from cgalibern/journaled_data
| `2.1-795-gc5a1ffc0b <https://github.com/opensvc/opensvc/commit/c5a1ffc0b61686806daae011b80f03b7033ab314>`_ [test] check zone_refresh reset_lazy zone info
| `2.1-794-g52d1e1b92 <https://github.com/opensvc/opensvc/commit/52d1e1b926838281610b35027d919484fc9c566e>`_ Detach zone may require 'zoneadm -z <z> detach -F'
| `2.1-793-gbb2722468 <https://github.com/opensvc/opensvc/commit/bb2722468b91a8462f59ca6252b2e56b5ef22d18>`_ Ensure Storage objects can be pickled
| `2.1-792-gc00023cd9 <https://github.com/opensvc/opensvc/commit/c00023cd9b4ff38dd7c26f0f71c0c7e4079375fe>`_ Fix remaining Can't pickle <class 'function'>
| `2.1-791-gc3ec562f2 <https://github.com/opensvc/opensvc/commit/c3ec562f2fcf85e031dd9360b4040e8cef51c693>`_ Post object_status now send response with status: 0
| `2.1-790-gf5daf1c0c <https://github.com/opensvc/opensvc/commit/f5daf1c0c43409d7cc9e0871f5ff656f6fb625e5>`_ Fix pickle error during resource_check_abort_job
| `2.1-789-gf0e5cd6af <https://github.com/opensvc/opensvc/commit/f0e5cd6af4f41685444605a798a09ae94cf9b5c8>`_ Use ProcessPoolExecutor instead of ThreadPoolExecutor (continue)
| `2.1-788-g034a07176 <https://github.com/opensvc/opensvc/commit/034a071761bd421f102240319425638e8aad4b0c>`_ Ignore or fix some pylint errors
| `2.1-787-gf537cdb3d <https://github.com/opensvc/opensvc/commit/f537cdb3d7dce7574a95e25bca65e8fad3b42065>`_ Merge branch 'b2.1' into journaled_data
| `2.1-773-ga79d78030 <https://github.com/opensvc/opensvc/commit/a79d78030fd0ee20cf3c1fbc620aaaa61c00aaec>`_ Fix the resourceset ProcessPoolExecutor worker
| `2.1-772-gebfa26429 <https://github.com/opensvc/opensvc/commit/ebfa26429bcaf0679a4697f23cceb71b100da079>`_ Use ProcessPoolExecutor instead of ThreadPoolExecutor
| `2.1-771-g3b4b92db7 <https://github.com/opensvc/opensvc/commit/3b4b92db79e5b1ecfb5d2e0a13d0ded7e6cc6745>`_ Tweak a merge_rx log message for clarity
| `2.1-770-g2e4007a36 <https://github.com/opensvc/opensvc/commit/2e4007a36251d4a6a125cd0c772d2a2efa747ac5>`_ Make the KeywordStore pickle compatible
| `2.1-769-geaf424437 <https://github.com/opensvc/opensvc/commit/eaf4244373d35df73b77c9f4fd3ae96ef020da80>`_ Change the resource status history file to json
| `2.1-768-g9e7168c84 <https://github.com/opensvc/opensvc/commit/9e7168c849c974b1bb566ec4daf6b874235e2f02>`_ Merge branch 'b2.1' into journaled_data
| `2.1-761-g32f2f186b <https://github.com/opensvc/opensvc/commit/32f2f186b2f75d9b7bd7666d103ee6dce0515717>`_ Merge pull request #14 from cgalibern/journaled_data
| `2.1-759-g12ec0a302 <https://github.com/opensvc/opensvc/commit/12ec0a302a17bda1e850a48bb468194ee011c59b>`_ [pylint] Disable python 2.7 false positive no-member
| `2.1-758-g36b6f3d6f <https://github.com/opensvc/opensvc/commit/36b6f3d6fa5234186f7fb36af151af0781dde5dc>`_ Fix ThreadPoolExecutor missing 1 required positional argument: 'max_workers'
| `2.1-757-gb6bdc3186 <https://github.com/opensvc/opensvc/commit/b6bdc3186510e7bc7191f356d70a0799a61cb4e8>`_ Use concurrent.futures backport for py2 compat
| `2.1-756-ge0fa725c6 <https://github.com/opensvc/opensvc/commit/e0fa725c69bfe4477d00415606d38d5dcffd0659>`_ Journaled miss initial value when journal_head is an array index
| `2.1-755-g2b58f45cf <https://github.com/opensvc/opensvc/commit/2b58f45cf7a1455aab893969869855f21f695622>`_ Small refacto of journaled_data _filter_diff()
| `2.1-754-g55439e6ba <https://github.com/opensvc/opensvc/commit/55439e6bafb74f99e58a295a780e78ae796fcda3>`_ Fix mutable default argument (journaled_data)
| `2.1-753-g54d6b6475 <https://github.com/opensvc/opensvc/commit/54d6b64755c2c0de5cc02ecc2a867182e11f7c80>`_ [tox] Fix pylint command for b2.1
| `2.1-752-g5bf229eb9 <https://github.com/opensvc/opensvc/commit/5bf229eb9411c4e94ef0436e5425e8fefae4a052>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-749-gc34b142df <https://github.com/opensvc/opensvc/commit/c34b142dfedebee6ecddbcf9c22768ebd459910a>`_ [ci] Separate pytest & pylint into 2 separate jobs
| `2.1-748-g95146d243 <https://github.com/opensvc/opensvc/commit/95146d2437e249c35242d08f22419f6da02fbbb2>`_ [test] fix python2 daemon start method
| `2.1-747-g8d906865d <https://github.com/opensvc/opensvc/commit/8d906865d80a7b9d224bdde37d9cecbeec3c71ff>`_ [test] fix transient python2 orchestrator failed test
| `2.1-746-gf9d44fb63 <https://github.com/opensvc/opensvc/commit/f9d44fb633b4a7ee3d5f879712c9fb082abd4e5e>`_ Fix possible error during linux disk_id(dev)
| `2.1-745-gafea5a58c <https://github.com/opensvc/opensvc/commit/afea5a58c243de624201110afbc718b2737287f2>`_ [lint] fix false positive on custom decorators
| `2.1-744-g28e522e81 <https://github.com/opensvc/opensvc/commit/28e522e8177a5fb580a907407bdba13ad9b069c9>`_ Merge remote-tracking branch 'cva/journaled_data' into journaled_data
| `2.1-742-g22496cff9 <https://github.com/opensvc/opensvc/commit/22496cff9cfa25e42b12833b51f0f152bda6129b>`_ s3 sync_update error during full (typo)
| `2.1-741-gf07294859 <https://github.com/opensvc/opensvc/commit/f0729485989b51acf82bc8ccfc9b303e9e9ec850>`_ Fix network find_node_ip() error when node is unresolvable
| `2.1-740-gfaf597c77 <https://github.com/opensvc/opensvc/commit/faf597c774b8b5fb5fe556d15431eebb1b5df124>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-735-g97e1268e4 <https://github.com/opensvc/opensvc/commit/97e1268e4504fbdac1ed954f7350bad02a8d26a2>`_ [test] update journaled_data tests for python2.7 (temporarily)
| `2.1-734-ge30296a2c <https://github.com/opensvc/opensvc/commit/e30296a2ce874aab7f182c48420c76d99005662f>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-730-g283049722 <https://github.com/opensvc/opensvc/commit/283049722fb7f2947cb5f9d52f5847468b9715a5>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-727-gc6ba5afe5 <https://github.com/opensvc/opensvc/commit/c6ba5afe5ded2c304510c366bcb12b1bb366e2e9>`_ Remove mock deps
| `2.1-726-ga21817b7d <https://github.com/opensvc/opensvc/commit/a21817b7d23a63d3997bf2b914e9c37c70cff4f4>`_ Daemon best effort for thread naming
| `2.1-725-g4bec651da <https://github.com/opensvc/opensvc/commit/4bec651da2759ed5a56f4f1ad79b2018f4d7b073>`_ [test] fix has_node_config fixture on python 2.7
| `2.1-724-g60623eb23 <https://github.com/opensvc/opensvc/commit/60623eb23afa5721a4f35cc2efafd17cbdc94e4a>`_ [test] fallback ANY from mock (python 2.7)
| `2.1-723-g71f4ed649 <https://github.com/opensvc/opensvc/commit/71f4ed649e4631c71351c5862af3ef1fad272223>`_ [ci] Disable fail-fast
| `2.1-722-gf10f1cdb1 <https://github.com/opensvc/opensvc/commit/f10f1cdb1edf66bd3e3be4d7da689dd6944190e4>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-713-gb7df8d940 <https://github.com/opensvc/opensvc/commit/b7df8d940415eb8dd29f99603b3a7132c1a9324e>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-710-g0ab3ca54f <https://github.com/opensvc/opensvc/commit/0ab3ca54f6cdf41ffe42c97fa73c1898de088895>`_ [test] Scheduler thread early update its status
| `2.1-709-gdaccff3cb <https://github.com/opensvc/opensvc/commit/daccff3cb59b156c2614f0a7ba37d86b7c057394>`_ [test] Fix fork method during test daemon startup
| `2.1-709-g3ebc32c66 <https://github.com/opensvc/opensvc/commit/3ebc32c6621c1dc1fb97930f1e74533993c81018>`_ Add a rolling restart orchestration
| `2.1-708-g788322871 <https://github.com/opensvc/opensvc/commit/788322871f716ec1920cd2fb38f04de8f713c11e>`_ Merge pull request #13 from cgalibern/journaled_data
| `2.1-708-g2840c2d72 <https://github.com/opensvc/opensvc/commit/2840c2d72a6af0890bc2c0167f48f1f30e7b43b1>`_ [test] Use non root directory for cni config
| `2.1-707-g1aa9dd97a <https://github.com/opensvc/opensvc/commit/1aa9dd97a0e6b98c1f77e446359111c61fe31afe>`_ Fix unexpected service creation after deletion.
| `2.1-706-g3e9a62f09 <https://github.com/opensvc/opensvc/commit/3e9a62f09c28bb23131edd28cf91924309b5bf6f>`_ [test] Allow test_provision_service_with_config called without privs
| `2.1-705-gf1800bb5b <https://github.com/opensvc/opensvc/commit/f1800bb5beb5e1521c3df9657003352c66e0ef72>`_ [test] Update test_orchestrator_start for journaled_data
| `2.1-704-gb7e23ff4e <https://github.com/opensvc/opensvc/commit/b7e23ff4ebd889c556dec4c2e45158c324ffd1dd>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-689-gc62b09abe <https://github.com/opensvc/opensvc/commit/c62b09abe1c87569cd485d787e95cf872f4286d3>`_ Merge branch 'b2.1' into journaled_data
| `2.1-681-g084b707f4 <https://github.com/opensvc/opensvc/commit/084b707f471b67244aa57d6f386cf5d9c7e8f8f4>`_ Merge pull request #401 from cgalibern/b2.1
| `2.1-680-g13d18ed0e <https://github.com/opensvc/opensvc/commit/13d18ed0eb06c682ce466e767828ed300c824a0b>`_ Kvm provision don't need to create floppy config during provision
| `2.1-679-g4de89afd8 <https://github.com/opensvc/opensvc/commit/4de89afd8682b3fae90a5c0dd90ad53294670038>`_ Merge pull request #399 from cgalibern/b2.1
| `2.1-678-g708fff2d5 <https://github.com/opensvc/opensvc/commit/708fff2d58f204317d27fb8d2f7ac326e9a79de1>`_ Kvm provision try to use invalid netmask for ip (fix)
| `2.1-677-g2021b2e68 <https://github.com/opensvc/opensvc/commit/2021b2e68c55e0bf48cd7f2b6d6df64158372716>`_ Allow Kvm provision use id_rsa.pub for hv_root_pubkey when no id_dsa.pub
| `2.1-676-g94080ceab <https://github.com/opensvc/opensvc/commit/94080ceab454ad0b433e3d465484aa6e4982f9f6>`_ Allow kvm provision without 'snapof' & 'snap' parameter
| `2.1-675-g0dcf3d632 <https://github.com/opensvc/opensvc/commit/0dcf3d6321b109f28591723f7857e02381166a04>`_ Merge pull request #398 from cgalibern/b2.1
| `2.1-674-g28b45b4ff <https://github.com/opensvc/opensvc/commit/28b45b4ffcbdf3219a7e374d78aafee259a60059>`_ Remove warning message during cluster delete --rid...
| `2.1-673-g77f6132c3 <https://github.com/opensvc/opensvc/commit/77f6132c354989f3e9d68af70ccdc95cc3999bf6>`_ Merge pull request #397 from cgalibern/b2.1
| `2.1-672-ga4c73ec71 <https://github.com/opensvc/opensvc/commit/a4c73ec71145822683dcf114ea4488110c8e07f6>`_ Fix stop error on service fs resource when zone is not present
| `2.1-671-ga0cede236 <https://github.com/opensvc/opensvc/commit/a0cede2363183477156a25701b9a7006054a9670>`_ Merge pull request #396 from cvaroqui/b2.1
| `2.1-670-gbe59a4ac2 <https://github.com/opensvc/opensvc/commit/be59a4ac24e6f65acf32410a33c264a42fa06d4d>`_ Merge branch 'b2.1' of https://github.com/opensvc/opensvc into b2.1
| `2.1-668-g9d6d9f8da <https://github.com/opensvc/opensvc/commit/9d6d9f8dad64bf744a598a6d703647454233639d>`_ Merge pull request #395 from arnaudveron/fix-log-msg
| `2.1-667-g4184af94d <https://github.com/opensvc/opensvc/commit/4184af94d907f4c31d575638789fb2c6c35809f2>`_ Fix error message
| `2.1-666-g545a12df0 <https://github.com/opensvc/opensvc/commit/545a12df0a2267c6eed6664b8847f0daddd65ff4>`_ Merge pull request #394 from cvaroqui/b2.1
| `2.1-666-g102ca1b9c <https://github.com/opensvc/opensvc/commit/102ca1b9c26e7792696d6857dfcb5f99e39fdd3a>`_ Fix a stack on sorting app resources with start=/path/to/command
| `2.1-665-gf7823c05c <https://github.com/opensvc/opensvc/commit/f7823c05c08b52f9967562832cea2048863aa3bb>`_ Move the push_encap ownership setting to the lxc driver
| `2.1-664-g0f3458efa <https://github.com/opensvc/opensvc/commit/0f3458efa11ade17295e2ace14cc4e0f7df55b23>`_ Merge pull request #393 from cvaroqui/b2.1
| `2.1-663-g76fa87483 <https://github.com/opensvc/opensvc/commit/76fa874833ae7e3535a9b513a3f2e2b3b14d7992>`_ Add the "relative" boolean option to the GET /daemon_status
| `2.1-662-gda22ea49a <https://github.com/opensvc/opensvc/commit/da22ea49a0e8a7c00396d06621c89982a2d71c6b>`_ Copy ownership of a container rootfs to the pushed config file
| `2.1-661-gfd5469064 <https://github.com/opensvc/opensvc/commit/fd54690644ed2ef177112799d9a316390536666b>`_ Merge pull request #392 from cvaroqui/b2.1
| `2.1-660-gc68dc683c <https://github.com/opensvc/opensvc/commit/c68dc683c2347513606ef6bb12f8a44dd6e8dc8f>`_ Allow scoping on DEFAULT.create_pg
| `2.1-659-g51f72fab6 <https://github.com/opensvc/opensvc/commit/51f72fab65981333f1a2d001a70721694c8b2852>`_ Merge pull request #390 from cgalibern/b2.1
| `2.1-658-gd6da7152d <https://github.com/opensvc/opensvc/commit/d6da7152d84b8b464ed57d6989392eb395c5ac80>`_ [lint] fix failing lint
| `2.1-657-gcb8faa757 <https://github.com/opensvc/opensvc/commit/cb8faa7573a787974291e84c5c5791829a0f3191>`_ [test] fix failing test on linux when no cmd ifconfig
| `2.1-656-gd13d3f92c <https://github.com/opensvc/opensvc/commit/d13d3f92c813924e7941b207aefcfd893d0b20e7>`_ Merge branch 'journaled_data' of github.com:cvaroqui/opensvc into journaled_data
| `2.1-656-g1893102c5 <https://github.com/opensvc/opensvc/commit/1893102c5e1985774555ea55d58e6b520fbcc4cc>`_ Fix om command when 'export VAR=' is not possible
| `2.1-655-g17a5248a6 <https://github.com/opensvc/opensvc/commit/17a5248a63357ced471606fc776f5bde16947883>`_ Stop ip dev macvtap may fail on centos (fix)
| `2.1-654-g5f485ca1d <https://github.com/opensvc/opensvc/commit/5f485ca1de72a3c540aa0f7f1727d79ff943fc1e>`_ app start ordering possible issue fix #387
| `2.1-653-gfe462c6a6 <https://github.com/opensvc/opensvc/commit/fe462c6a61faac8f96cc26b85acf7f71115567eb>`_ [fs.type=zfs] Allow keywords user,group and perm
| `2.1-652-gf304b1f20 <https://github.com/opensvc/opensvc/commit/f304b1f2012c2467dd7d1ab34ae2e0ccb0224821>`_ Merge pull request #388 from cgalibern/b2.1
| `2.1-651-gf4edec3a7 <https://github.com/opensvc/opensvc/commit/f4edec3a77764e1327811044ba630abac1e66b73>`_ [TEST] test_ip_alias_is_always_false_on_macvtap_regardless_ip_alias_kw_setting
| `2.1-650-gcb2e869d4 <https://github.com/opensvc/opensvc/commit/cb2e869d46d236a818d23889399113ac2c0544e6>`_ Merge pull request #386 from cvaroqui/b2.1
| `2.1-649-g520b9dcea <https://github.com/opensvc/opensvc/commit/520b9dcea92bf625fafe1913dcecdbe55af17c09>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-647-gb36f7275f <https://github.com/opensvc/opensvc/commit/b36f7275f1356d02aebfb055a080244fa9cf6243>`_ Merge pull request #385 from cgalibern/b2.1
| `2.1-646-gd00f69a84 <https://github.com/opensvc/opensvc/commit/d00f69a8484b5fdb6f9c7be33e4871e00c3e63ab>`_ Lost log on Solaris after: "om daemon restart --node ''"
| `2.1-646-g31bc3467a <https://github.com/opensvc/opensvc/commit/31bc3467a8db29b6f2fa69019b74ffdaa1ec17a0>`_ Fix "om <path> change --key foo --from bar"
| `2.1-645-gbbaadd0cd <https://github.com/opensvc/opensvc/commit/bbaadd0cd11c8aee2a27820aeee89ab6a0e028b9>`_ Merge pull request #384 from cvaroqui/b2.1
| `2.1-644-g160eeadb2 <https://github.com/opensvc/opensvc/commit/160eeadb2448f728404d2da38b871f551990c056>`_ Fix volume warning after a provision
| `2.1-643-gde644c19c <https://github.com/opensvc/opensvc/commit/de644c19c64f7da4547405961f368203dfcf9544>`_ Merge pull request #382 from cvaroqui/b2.1
| `2.1-642-g100a6b11a <https://github.com/opensvc/opensvc/commit/100a6b11af709a69565319ebfbe4626bd94fe3fc>`_ Avoid overwriting the collector-side node::connect_to attribute
| `2.1-641-ge37f07aed <https://github.com/opensvc/opensvc/commit/e37f07aed3bfa8fe0a0ad706c88e93c9556260df>`_ Fix the om script loading the opensvc module from PWD if present
| `2.1-641-g14ba7d2cb <https://github.com/opensvc/opensvc/commit/14ba7d2cb39e1fcd3a69421affa47854fa2da25e>`_ Merge branch 'b2.1' into journaled_data
| `2.1-640-g73de94026 <https://github.com/opensvc/opensvc/commit/73de9402643d7e6282103c6ccbcc6ad5c4b3e484>`_ Add QUAL and CERT to allowed "env" values
| `2.1-639-gb1e21e700 <https://github.com/opensvc/opensvc/commit/b1e21e7006c01ff2829f085a685da35d2ba2c0a8>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-635-g46e3c2adf <https://github.com/opensvc/opensvc/commit/46e3c2adf3189d819b97ffa2778d2871a7955e05>`_ Merge pull request #381 from cgalibern/b2.1
| `2.1-634-ge4a229b11 <https://github.com/opensvc/opensvc/commit/e4a229b1118a5d38026b476a14c84d736aa1ced6>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-634-g9a20b6193 <https://github.com/opensvc/opensvc/commit/9a20b619357f92942182662ab5fa20b84a7e79b8>`_ Merge pull request #11 from cgalibern/journaled_data
| `2.1-634-g5af2ff779 <https://github.com/opensvc/opensvc/commit/5af2ff7796281f9e85ff73feb18b7161e4a8f1eb>`_ Fix stack during 'om system/usr/username keys'
| `2.1-633-gec55d188b <https://github.com/opensvc/opensvc/commit/ec55d188b2a106b29800c1001ed6b32f70da712c>`_ Ensure ask full when we don't know last applied gen of remote
| `2.1-633-g1ff594965 <https://github.com/opensvc/opensvc/commit/1ff59496549d8b76c00b822039ca079064ef3ef6>`_ [test] Use container type oci instead of docker
| `2.1-632-gcc6c6e1f3 <https://github.com/opensvc/opensvc/commit/cc6c6e1f39f303563b8fa8befb29c821036fd6d5>`_ monitor remove dup log message
| `2.1-632-g8620165bc <https://github.com/opensvc/opensvc/commit/8620165bcde882d562ed625b65d08b3eceb7f868>`_ Update message during container_rm when docker executable is not found
| `2.1-631-gd52377d35 <https://github.com/opensvc/opensvc/commit/d52377d357529e06f99eb37ca269b2d79dd07ed5>`_ Merge pull request #380 from cgalibern/b2.1
| `2.1-631-g3c337bce0 <https://github.com/opensvc/opensvc/commit/3c337bce09e0033be08eb5734f4b89ac9c253196>`_ heartbeat tx log about it message type changes
| `2.1-630-gb2f20506e <https://github.com/opensvc/opensvc/commit/b2f20506ec6c16b92cadeaafd83ccb1f7b39d93e>`_ Add support for routed_brigde networks with custom gateways
| `2.1-630-ga2dbc6811 <https://github.com/opensvc/opensvc/commit/a2dbc6811a3c33f0173ae0b9b0cf1e35a23ee1d7>`_ Fix print dev & exposed_devs on Solaris loop
| `2.1-630-g7a9d42181 <https://github.com/opensvc/opensvc/commit/7a9d42181d2032f170125719d66c754b784b0b8f>`_ Hb still send patch message instead of full message (fix)
| `2.1-629-gc99401ec6 <https://github.com/opensvc/opensvc/commit/c99401ec663dc63c2594b46ad20b1bfc841e2e74>`_ Monitor cleanup dup update
| `2.1-629-g02028531f <https://github.com/opensvc/opensvc/commit/02028531f692d9aac49eb3d84b170ed744e971f6>`_ Don't let ip.cni do portmapping for envoy exposes
| `2.1-629-g0d60b6810 <https://github.com/opensvc/opensvc/commit/0d60b6810b7f4ecace5a0ee20ebd144dbaad44c5>`_ [test] Ensure zfs on volume exposed_devs succeed
| `2.1-628-gfdb009e66 <https://github.com/opensvc/opensvc/commit/fdb009e665d3ebd697ccfa127a3a42f1531a167e>`_ hb may send empty full data (fix)
| `2.1-628-gb992ee1ca <https://github.com/opensvc/opensvc/commit/b992ee1ca868b5ca137ef680b41f15a85fc35da7>`_ Merge pull request #379 from cvaroqui/b2.1
| `2.1-627-gadb857963 <https://github.com/opensvc/opensvc/commit/adb857963b5f30f911e36a26a5fc7639cdb9cd62>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-627-ga99d82130 <https://github.com/opensvc/opensvc/commit/a99d821300a24beec0651b840405258d35fd06fc>`_ Add logs during clusterlock
| `2.1-626-gff1423b37 <https://github.com/opensvc/opensvc/commit/ff1423b3788ff74fcf9cd5e1b5afc16b065abbd1>`_ [hb/ucast] Log exceptions raised during configure
| `2.1-625-gc8ad9683e <https://github.com/opensvc/opensvc/commit/c8ad9683ee47947edb2e90163ce3f80c5df967d2>`_ [hb/ucast] Ensure all HbUcastTx sent errors are logged
| `2.1-625-g85c443b29 <https://github.com/opensvc/opensvc/commit/85c443b2963e2f601cd697d7effb4250cec0c87c>`_ Merge pull request #378 from cgalibern/b2.1
| `2.1-624-gd25b307ce <https://github.com/opensvc/opensvc/commit/d25b307ce2e87ec793e16ed8c8c1e07a212ec842>`_ Ensure unset lazy 'sorted_cluster_nodes' after unset lazy cluster_nodes
| `2.1-624-g9359f7f7a <https://github.com/opensvc/opensvc/commit/9359f7f7af139a6cf0a00da15c87a4f1b75c873e>`_ Fix provision failure (when volume#xx.exposed_devs refer a pending volume#xx)
| `2.1-624-g268f888f0 <https://github.com/opensvc/opensvc/commit/268f888f0c17bc8b09f49d47b0cc9831ec8392ea>`_ Fix a stack on non-leader provision in ip.route resource
| `2.1-623-ge9d0920ef <https://github.com/opensvc/opensvc/commit/e9d0920ef0b8ee8ce1173cf62dac28be241a7e26>`_ Merge pull request #377 from cvaroqui/b2.1
| `2.1-623-g21e539d9d <https://github.com/opensvc/opensvc/commit/21e539d9dbdcbd7c5b06ebac2bec138a6953c476>`_ During monitor merge_hb_data_locks, only trust locks from requesters
| `2.1-622-g311a05fbe <https://github.com/opensvc/opensvc/commit/311a05fbe6f250bab17a485062988d359766cc16>`_ Fix the "restart --rid ip" stopping but not starting ip.netns resources
| `2.1-622-g34d18464f <https://github.com/opensvc/opensvc/commit/34d18464fc1ac37329f2eedf5fd47bbd3da1e7c2>`_ [hb] Log when detect hb_nodes list changes
| `2.1-621-gdd421f564 <https://github.com/opensvc/opensvc/commit/dd421f5649808f55977159804ced7067c246380c>`_ Fix an uncatched exception in ip.route status evaluation
| `2.1-621-g9caed6acf <https://github.com/opensvc/opensvc/commit/9caed6acf9d72b4ad6ff4bb1045af8429cde8a83>`_ Fix missed replaced shared lock
| `2.1-620-g50903c893 <https://github.com/opensvc/opensvc/commit/50903c8933ae6f3d4b95617e4302a3c61606661c>`_ Merge pull request #10 from cgalibern/journaled_data
| `2.1-620-g073dcdce0 <https://github.com/opensvc/opensvc/commit/073dcdce019a76d72d22c1e725e4cb92b69991ff>`_ Rollback the static route implementation via a DataResource, add a ip.route drv
| `2.1-619-gefd6b0dc0 <https://github.com/opensvc/opensvc/commit/efd6b0dc01cc4e82ff2e240cfbeeb21811e36346>`_ Merge pull request #25 from cgalibern/b2.1
| `2.1-619-g1bf51fa5a <https://github.com/opensvc/opensvc/commit/1bf51fa5aace8b34f4e360fdcd0f96d47fee79c9>`_ Fix journaled_data corruption
| `2.1-618-ga13696efe <https://github.com/opensvc/opensvc/commit/a13696efe80de9f996ae063b122c5b2e1ac9f2f8>`_ [test] Check ip host linux (stop)
| `2.1-618-g8f7dde678 <https://github.com/opensvc/opensvc/commit/8f7dde67828945007953f0bc1773a530165150f5>`_ Merge pull request #9 from cgalibern/journaled_data
| `2.1-617-gbecab3ba2 <https://github.com/opensvc/opensvc/commit/becab3ba21593292a82886f545e616d368883530>`_ [test] Check ip host linux (alias=true or false)
| `2.1-616-gc5cba9abe <https://github.com/opensvc/opensvc/commit/c5cba9abe38c431328cb80d119ba68da1be4a20a>`_ [test] Check monitor render add "#" to instance flags on "drp instances
| `2.1-616-g3825df862 <https://github.com/opensvc/opensvc/commit/3825df8625ada720a5bf7311aa1f45d1755ace17>`_ [test] Refacto and add shared_data fixture
| `2.1-615-ge8eb10a01 <https://github.com/opensvc/opensvc/commit/e8eb10a01557e0f505bb958d32ca08fb9bb723a2>`_ Improve cluster lock propagation time
| `2.1-615-gbdeebd839 <https://github.com/opensvc/opensvc/commit/bdeebd8392001bbdade3cadd235651a3c8aa7819>`_ [test] Add checks on non for macvtap on ip host linux
| `2.1-614-ga895e8b6d <https://github.com/opensvc/opensvc/commit/a895e8b6d52c6bf5239fbef83db2734288182073>`_ Merge pull request #24 from cgalibern/b2.1
| `2.1-614-g00ffa0af1 <https://github.com/opensvc/opensvc/commit/00ffa0af16d2389db609ab1024bd8722e551b9ae>`_ Protect shared.LOCKS updates
| `2.1-613-g58f914d45 <https://github.com/opensvc/opensvc/commit/58f914d45a2c938535b2ea7d03aa9b74d76c454c>`_ Monitor lock fix invalid log message during drop
| `2.1-612-g72e94e929 <https://github.com/opensvc/opensvc/commit/72e94e929f3049cd74fd20f7b100679dcee6f788>`_ [tests] Ensure POST /join respect lock join
| `2.1-612-g00e01bc91 <https://github.com/opensvc/opensvc/commit/00e01bc9163bfc02527ce16a5df22c8481055fb8>`_ Avoid dropping object configs on nodes having a drp instance
| `2.1-611-gb11669aae <https://github.com/opensvc/opensvc/commit/b11669aae887b709480382431f5ff9d5541a17fc>`_ Render the drp instances using a "#" in the instance flags area of "om mon"
| `2.1-611-g0969945e2 <https://github.com/opensvc/opensvc/commit/0969945e21cffc6d89313891236a7f22a59c8fd4>`_ Remove thread data after 'om daemon stop --thread-id xxx'
| `2.1-610-gb2bb056f8 <https://github.com/opensvc/opensvc/commit/b2bb056f8d7231d4c4d26150806b9f46ab5f94e1>`_ Merge pull request #376 from cvaroqui/b2.1
| `2.1-610-g852dc5d0b <https://github.com/opensvc/opensvc/commit/852dc5d0b0c15f1aff05ad70eda4f028ba2fc37d>`_ [test] Add checks on for macvtap on ip host linux (when ipdev = name@dev)
| `2.1-610-g701c63f3b <https://github.com/opensvc/opensvc/commit/701c63f3b63cc00d4a6eedab97991b4436b954d2>`_ Protect clusterlock lock_acquire
| `2.1-609-g45a3810fa <https://github.com/opensvc/opensvc/commit/45a3810fa28c3fed24426d582f4cb41bfab44dcc>`_ Improve log during thread reconfigure error
| `2.1-609-g4e9ca02a3 <https://github.com/opensvc/opensvc/commit/4e9ca02a30b0df892e0d14e22a0c4b7827f81e2a>`_ Add support for static routes installation in the ip.netns driver
| `2.1-608-gf15718ce9 <https://github.com/opensvc/opensvc/commit/f15718ce93b2cdc99ffb0016f9e88c9594468c63>`_ Fix possible heart beat crash during startup
| `2.1-608-ga6f85f9ae <https://github.com/opensvc/opensvc/commit/a6f85f9ae6f80d83033aa4e093dca943003154d6>`_ Use the "mode bridge" for macvtap
| `2.1-607-gff75af2d0 <https://github.com/opensvc/opensvc/commit/ff75af2d09f18cd33e67d2e17b60c98feaa67b8d>`_ Daemon join increase join time from 25s to 120s
| `2.1-607-gf3fbb7452 <https://github.com/opensvc/opensvc/commit/f3fbb7452234ad443d8ed519bb92db6b70ef89e2>`_ Merge pull request #375 from cvaroqui/b2.1
| `2.1-607-gdcb0f657c <https://github.com/opensvc/opensvc/commit/dcb0f657cac261735e2f510bd9b7948e7d47aad2>`_ Merge pull request #8 from cgalibern/journaled_data
| `2.1-606-gc30b2f194 <https://github.com/opensvc/opensvc/commit/c30b2f194b03e15d165360e0761d29643c5d9313>`_ Merge pull request #23 from cgalibern/b2.1
| `2.1-606-gb6ccc02aa <https://github.com/opensvc/opensvc/commit/b6ccc02aa69424e94752b7592d5bee639cf890bd>`_ Simple refacto hb.ucast (noop)
| `2.1-605-g2039e8224 <https://github.com/opensvc/opensvc/commit/2039e82243f5cd6aadc394eb6bdc6e988aa431d7>`_ Allow restart terminated threads during rejoin or draining
| `2.1-604-g927f6197a <https://github.com/opensvc/opensvc/commit/927f6197adeaf8b45ddf267484a4390fe71986bd>`_ Merge branch 'b2.1' into journaled_data
| `2.1-603-g87b535701 <https://github.com/opensvc/opensvc/commit/87b5357014e404af93b6bdd90160dcf6173d873e>`_ [test] fix missed readouterr().err
| `2.1-602-gd12dbc960 <https://github.com/opensvc/opensvc/commit/d12dbc960e3b4740ab992c9d616c8108f5cfa0ae>`_ Avoid reporting "interface not found" on macvtap ip resources
| `2.1-602-gc77fa6123 <https://github.com/opensvc/opensvc/commit/c77fa612347eb973d3785fe612c41e765f35dce5>`_ Fix error during validate_env_references
| `2.1-601-ge99ecb54c <https://github.com/opensvc/opensvc/commit/e99ecb54ca32115f655e8335546c3894acd03338>`_ Fixes for macvtap ip resources
| `2.1-601-g322a18ede <https://github.com/opensvc/opensvc/commit/322a18ede4d368d91514ade87b636dd4ad507846>`_ [test] Ensure create, or set service with invalid keyword is refused
| `2.1-600-geb8a4a9bb <https://github.com/opensvc/opensvc/commit/eb8a4a9bb71f3012dba66128f32f28270141d2d1>`_ Fix the ipdev spliting in ip resources init
| `2.1-599-g8a5546fb2 <https://github.com/opensvc/opensvc/commit/8a5546fb202b9d4c47bbf2630bafb15af7ee96e6>`_ Merge pull request #22 from cgalibern/b2.1
| `2.1-598-g342725fbb <https://github.com/opensvc/opensvc/commit/342725fbbdcff960913ae72910cb59c782c6ecaa>`_ Fix validate config missed errors, when recursion is detected, add tests
| `2.1-597-gf47a2d64a <https://github.com/opensvc/opensvc/commit/f47a2d64a102fe0ffa27877b66adde913dc6db23>`_ Fix the reference recursion detection method
| `2.1-596-gf51d0df2a <https://github.com/opensvc/opensvc/commit/f51d0df2ae3da05ac2d7dcb94961242c38431292>`_ Merge branch 'b2.1' into journaled_data
| `2.1-596-gf6e55ab3f <https://github.com/opensvc/opensvc/commit/f6e55ab3f1a05aaa6ae105c7c9463011941d13d3>`_ Add support for fixed ip interface names on linux
| `2.1-595-g7f689d443 <https://github.com/opensvc/opensvc/commit/7f689d4430ccaf390c99330542cdeea921a0985c>`_ Support ipdev=eth0:my_forced_alias in ip.host resources with alias=true
| `2.1-594-g1c53d1a8a <https://github.com/opensvc/opensvc/commit/1c53d1a8a8f597da7c7aa34470caf003ca3ecfb0>`_ Fix a the recursion detection breaking the env.foo={unresoled} return value
| `2.1-593-gabc006e47 <https://github.com/opensvc/opensvc/commit/abc006e4787d0bfe1e0ef093109e773fe17e6a0f>`_ Implement recursion protection in extconfig
| `2.1-592-gc2c40b28b <https://github.com/opensvc/opensvc/commit/c2c40b28b083f17df6efc4e0e86091363305c6f2>`_ Remove a debug traceback stack print on obj config syntax errors
| `2.1-592-g0ec24b628 <https://github.com/opensvc/opensvc/commit/0ec24b628db592204577deea1421a7a5a89fc25f>`_ Merge branch 'b2.1' into journaled_data
| `2.1-591-ge687dd7c3 <https://github.com/opensvc/opensvc/commit/e687dd7c33435c340ce03bcaa449506637372667>`_ Merge pull request #374 from cgalibern/b2.1
| `2.1-590-g79108e32a <https://github.com/opensvc/opensvc/commit/79108e32aa85e594cdf2c35004745b33cc39129b>`_ Merge branch 'b2.1' into journaled_data
| `2.1-590-g61b747a4f <https://github.com/opensvc/opensvc/commit/61b747a4fd6dadd26cf47847152f8194df732035>`_ During daemon join, node.env may be removed from node.conf (fix)
| `2.1-589-g273d319ac <https://github.com/opensvc/opensvc/commit/273d319ac1f58488dd06a06b5ef7f19fb8e89df6>`_ Merge pull request #373 from cvaroqui/b2.1
| `2.1-588-ga8344cf6c <https://github.com/opensvc/opensvc/commit/a8344cf6c2e63b7a4a4a64379b2729b0c77a6250>`_ Merge branch 'b2.1' into journaled_data
| `2.1-588-g98a809874 <https://github.com/opensvc/opensvc/commit/98a8098740925c43492fb20e4d76317070acd9cc>`_ Fix a "zfs destroy" failed on "busy" zvol just after drbd unprov
| `2.1-587-g483a85582 <https://github.com/opensvc/opensvc/commit/483a85582552923c0e0e29da366616798f26a372>`_ Fix a "provisioning failed" on vol declared by multiple svc
| `2.1-586-g51d2d8068 <https://github.com/opensvc/opensvc/commit/51d2d806801b172eb64be3de9395ea99b5d0bec3>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-583-ged5171f11 <https://github.com/opensvc/opensvc/commit/ed5171f11f1e0caab9da12a32efbdbb36c81664f>`_ Merge pull request #371 from cgalibern/b2.1
| `2.1-582-g4485d07a1 <https://github.com/opensvc/opensvc/commit/4485d07a140c7179c23fd74bfc238dc1e7056dad>`_ [test] Backport test fixture drivers.resource.app.preexec
| `2.1-581-g30558190e <https://github.com/opensvc/opensvc/commit/30558190e3ad56608424db72a8277a36c2955fa7>`_ [test] Allow test_provision_service_with_config called without privs
| `2.1-580-ge43ecfcff <https://github.com/opensvc/opensvc/commit/e43ecfcff031217ace5d492b3bd29e92e8f86e00>`_ Make sure the diffs emited by JournaledData are dereferenced
| `2.1-580-gb5d0be012 <https://github.com/opensvc/opensvc/commit/b5d0be012b32dd86930dde5ee24d774e0cf65983>`_ [test] add log during: 'om node [thaw|unfreeze|freeze] --local'
| `2.1-579-g9c0e21fc0 <https://github.com/opensvc/opensvc/commit/9c0e21fc050be36b99e318a9f6630abcbe7d8966>`_ [test] Add checks om node [thaw|unfreeze|freeze] --local'
| `2.1-579-g7dc971f12 <https://github.com/opensvc/opensvc/commit/7dc971f12263b650bf67d73a2061bd42be23dc33>`_ Add the "directories" keyword to volume resources
| `2.1-578-gb4c515686 <https://github.com/opensvc/opensvc/commit/b4c51568650811acbe4d552831ae545c3471b24e>`_ Merge branch 'b2.1' into journaled_data
| `2.1-578-g9960d6dc1 <https://github.com/opensvc/opensvc/commit/9960d6dc1c59f93312a7ef42e3ddd67c34d52f0a>`_ Merge pull request #370 from cgalibern/fix-test-b2.1
| `2.1-577-gb80648eba <https://github.com/opensvc/opensvc/commit/b80648eba723749d1dce3d318944c11c32c8e239>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-577-g5c333cfad <https://github.com/opensvc/opensvc/commit/5c333cfadaa715146a00a6a0176f79e70917339d>`_ [test] Fix mock error during test_orchestrator_start.py
| `2.1-576-g5eefcf99c <https://github.com/opensvc/opensvc/commit/5eefcf99c8f0f3db1c08d670df574f2d340f0e89>`_ [test] Fix side effect in test_get_lock.py
| `2.1-575-g5137e658f <https://github.com/opensvc/opensvc/commit/5137e658f6f3b22f34d286e424cd27f1494d5e5b>`_ Merge pull request #369 from cgalibern/b2.1
| `2.1-574-gbbc3ef66a <https://github.com/opensvc/opensvc/commit/bbc3ef66a59da422248a7c8b95fb3b1d53f2a7db>`_ Merge pull request #7 from cgalibern/journaled_data
| `2.1-574-ga46edb8bd <https://github.com/opensvc/opensvc/commit/a46edb8bd02b2cdab3b80f48882c329c5bcf94bb>`_ [test] Fix transient error on test_monitor_respect_priority_and_max_parallel
| `2.1-573-gb686a59ba <https://github.com/opensvc/opensvc/commit/b686a59bab752c9d4922b09c6c7e2331d9cee690>`_ Fix listener janitor_events corruption of journaled_data
| `2.1-573-g8568ffd97 <https://github.com/opensvc/opensvc/commit/8568ffd972bbbf58a9c9cbd0289dff77a60d68df>`_ Merge pull request #368 from cgalibern/fix-pytest-b2.1
| `2.1-572-gf95052cb7 <https://github.com/opensvc/opensvc/commit/f95052cb7a595ddccca5c97f5371773df050a922>`_ [test] Always mock asset.linux.is_container to False to allow pytest without root
| `2.1-572-g1b78083ba <https://github.com/opensvc/opensvc/commit/1b78083bac8118d611b98bc1cf07a300d864e989>`_ Unfreeze the volume instance created by a virtual pool
| `2.1-571-g4bcd6d1a9 <https://github.com/opensvc/opensvc/commit/4bcd6d1a956dbcd3e52172fe9a21c07c25a5c353>`_ [test] Disable pg.kill during tests
| `2.1-571-g3bdd3a4e6 <https://github.com/opensvc/opensvc/commit/3bdd3a4e6b1c0cdc57230638740296583a8be3b3>`_ Fix a scheduler stack when a referenced ca sec does not exist
| `2.1-570-gb5ec17113 <https://github.com/opensvc/opensvc/commit/b5ec17113e4d7eb4164e773d2c37a2f90aaeaaad>`_ Another fix for the b2.1 merge
| `2.1-570-ga41337636 <https://github.com/opensvc/opensvc/commit/a41337636b0f997161b708af5184cf3e963ed8d6>`_ [test] Disable create_pg during tests
| `2.1-569-g41cc77fd3 <https://github.com/opensvc/opensvc/commit/41cc77fd3fcd01fc34930a07d3eca09c8b1fda7f>`_ [test] Improve test time
| `2.1-569-g4fcf15399 <https://github.com/opensvc/opensvc/commit/4fcf153995b1553970bb198c713f66c83034fc62>`_ Fix b2.1 merge error
| `2.1-568-gca10f45c4 <https://github.com/opensvc/opensvc/commit/ca10f45c4f184638b1913e8a2a2dc836f6bf26f2>`_ [test] fix has_node_config fixture on python 2.7
| `2.1-568-g31e7e4700 <https://github.com/opensvc/opensvc/commit/31e7e47005d36f509ff6043b45542294930e4051>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-567-g4e4297756 <https://github.com/opensvc/opensvc/commit/4e42977560fb98304b11754176185d821655037e>`_ [test] Use non root directory for cni config
| `2.1-566-g27d86d7ba <https://github.com/opensvc/opensvc/commit/27d86d7ba3f83dea4a700b7b736866d43cfe42f1>`_ [test] Ensure test_colorize_status is run without colors
| `2.1-565-g11582b9cb <https://github.com/opensvc/opensvc/commit/11582b9cbed19f8fd71ce46f2fc9f979f60026ab>`_ [test] Ensure format_cluster tests is run without colors
| `2.1-565-g810cabc8f <https://github.com/opensvc/opensvc/commit/810cabc8f4cf7df1eced1a39239fefd178680ddf>`_ Fix pg_mem_limit not set if pg_vmem_limit is set but swappaccount is not set
| `2.1-564-g3c7868601 <https://github.com/opensvc/opensvc/commit/3c7868601fd23592fce08261cf5a2233a932614d>`_ Merge pull request #365 from cvaroqui/b2.1
| `2.1-563-g493404172 <https://github.com/opensvc/opensvc/commit/493404172a01e4da0ea6fa1f853cd2061ca06433>`_ Support implicit {secret,configs}_environment var names
| `2.1-562-g805821e3e <https://github.com/opensvc/opensvc/commit/805821e3e541244d60c234b6bbcd792a6248aa35>`_ Merge pull request #17 from cgalibern/add-refrerence-modifier-tests
| `2.1-561-gdc328d613 <https://github.com/opensvc/opensvc/commit/dc328d61376bd787ed92f1a3a84404f11a6d6e2f>`_ Ensure exposed_dev eval result is None when deferred value is not available
| `2.1-560-g64f1415f5 <https://github.com/opensvc/opensvc/commit/64f1415f5bb9708bf3bd60144a8acc6211cc94b5>`_ [test] Ensure exposed_dev eval is correct when not devs
| `2.1-559-g1ff77a129 <https://github.com/opensvc/opensvc/commit/1ff77a1290175d828d3ddc2ad4ef6beb997a3a66>`_ [test] Add print config (--eval) checks for references
| `2.1-558-g2573f7990 <https://github.com/opensvc/opensvc/commit/2573f79906c457007383e2cf035197e929af4b13>`_ fix kw references invalid eval when unresolved (fix)
| `2.1-557-geb099417e <https://github.com/opensvc/opensvc/commit/eb099417e9a935a5b3680ef971ad11c7fda1f6ef>`_ [test] check reference of simple modifiers
| `2.1-556-ga0478fe3d <https://github.com/opensvc/opensvc/commit/a0478fe3d0d87d1c0c36b9830254ce7a03501a58>`_ Fix undefined reference {initd}
| `2.1-555-gf15b0642a <https://github.com/opensvc/opensvc/commit/f15b0642a99f9b8508a49521b0fe5a7d2e956f88>`_ [test] Add reference check examples
| `2.1-554-gb82ba581f <https://github.com/opensvc/opensvc/commit/b82ba581fdb6c1c84e1eaad23dddbaa5b1d81df5>`_ Merge pull request #15 from cgalibern/b2.1
| `2.1-553-gebf868a0c <https://github.com/opensvc/opensvc/commit/ebf868a0c4f0fc9cb2d6141c9cf6d77fb4a88a4e>`_ [test] relocate reference file to commands/svcs/
| `2.1-552-g33d78aa80 <https://github.com/opensvc/opensvc/commit/33d78aa80f883974c85593c5bc967bc6a98709d6>`_ [test] Re-enable references checks and add new examples
| `2.1-551-g272b7be89 <https://github.com/opensvc/opensvc/commit/272b7be89b93ee1d75da8289bf67291477a509d6>`_ Fix an UnboundLocalError introduced by the previous commit
| `2.1-550-g21b31853b <https://github.com/opensvc/opensvc/commit/21b31853b982f4b95929c93be7f638ccfef6fd54>`_ Support podman version shipped with rhel8
| `2.1-549-g6dba7f1dc <https://github.com/opensvc/opensvc/commit/6dba7f1dcec2baf8b615a1ff937b2ec430668268>`_ Consider unkown references as literals
| `2.1-548-gdf524a11f <https://github.com/opensvc/opensvc/commit/df524a11fd9e16156069ccdafaf68691d8e1ef9c>`_ Merge pull request #364 from cvaroqui/b2.1
| `2.1-547-gd04260eff <https://github.com/opensvc/opensvc/commit/d04260effd829290dc36ad460159737be8aebbe1>`_ Don't run the slack msg github workflow step if the weburl secret is not set
| `2.1-546-gdb939ded2 <https://github.com/opensvc/opensvc/commit/db939ded2eeef41089e07f9b86a0ac504f39feda>`_ Avoid submitting unsupported global_expect on objects
| `2.1-545-gc06a711df <https://github.com/opensvc/opensvc/commit/c06a711df74a2059f22498f705deec0805ed13c5>`_ Add a state to disk.zvol resources
| `2.1-544-gc82c04c9e <https://github.com/opensvc/opensvc/commit/c82c04c9ef173dc46b7db59b3236a83910b6a99c>`_ Add a .gitattributes file
| `2.1-543-ge59747a63 <https://github.com/opensvc/opensvc/commit/e59747a6346a00ffeb16925e2792e68fede6497b>`_ Merge pull request #363 from cgalibern/fix-unprovision-failure
| `2.1-542-g6aee55576 <https://github.com/opensvc/opensvc/commit/6aee55576183c25a4d2a097e47ec1026b00b341f>`_ Fix zone detach failure on absent zones
| `2.1-541-gade7b89e9 <https://github.com/opensvc/opensvc/commit/ade7b89e91dd0fbb808f1d12e054168ae9a50e02>`_ Merge pull request #362 from cvaroqui/b2.1
| `2.1-539-ge329f52d1 <https://github.com/opensvc/opensvc/commit/e329f52d17eed9e72417a66ef604838364ac27e6>`_ Fix the "om <multi-object-selector> <orchestrated action> --wait" behaviour
| `2.1-539-g81a07edbe <https://github.com/opensvc/opensvc/commit/81a07edbe7af4b415e09b32be1fecc2407b7cbd9>`_ Merge pull request #361 from cvaroqui/b2.1
| `2.1-539-g10a001a2a <https://github.com/opensvc/opensvc/commit/10a001a2ac073cd48ef749ade2d4b1fbc969fe92>`_ Extent the POST /join request timeout to cover clusterlock acquire
| `2.1-538-gd2ba530cc <https://github.com/opensvc/opensvc/commit/d2ba530cc307da62bba11dafa4cfd3cf8a514910>`_ Only pre-pull the container images on non-leader instance if not present
| `2.1-538-gb1a05155a <https://github.com/opensvc/opensvc/commit/b1a05155a02dbaa527e8c9309758123eedcf4665>`_ Cleanup the GEN structures on leaving node
| `2.1-537-gbb0fdd700 <https://github.com/opensvc/opensvc/commit/bb0fdd7007a0e8bdbfa83a6b69e197d200027d33>`_ Merge pull request #360 from cvaroqui/b2.1
| `2.1-537-g095a3e776 <https://github.com/opensvc/opensvc/commit/095a3e77632cb209c3253830c6360750c6bd92c6>`_ Fix a possible clusterlock leak in the join codepath
| `2.1-536-gc7a2d051e <https://github.com/opensvc/opensvc/commit/c7a2d051ebb9186ca6a57f18490089ac86165344>`_ Merge pull request #6 from cgalibern/journaled_data
| `2.1-536-ga8cd00dfd <https://github.com/opensvc/opensvc/commit/a8cd00dfd5265cced8b364130267cf53eb5a83dc>`_ Merge branch 'b2.1' into b2.1
| `2.1-535-gad642caf2 <https://github.com/opensvc/opensvc/commit/ad642caf2b273cda7444f33f6722d17466065b0e>`_ Small refacto
| `2.1-534-gf4a4a031a <https://github.com/opensvc/opensvc/commit/f4a4a031a670d5472bfac6706e342d3e40971cbe>`_ Update ci.yml
| `2.1-534-g34e1b29dc <https://github.com/opensvc/opensvc/commit/34e1b29dc2a34e2a283a98215381f5863986bf2d>`_ [TEST] Update test orchestrator start for journaled_data
| `2.1-534-g7a2ef6a5b <https://github.com/opensvc/opensvc/commit/7a2ef6a5b0cb72cac5e7fcbd8bceefc0bf4eeb44>`_ Merge pull request #359 from cvaroqui/b2.1
| `2.1-533-g7319d1e25 <https://github.com/opensvc/opensvc/commit/7319d1e25d8408c16de13b74d7f41148fd80a1d9>`_ Fix a "dict changed size during iteration" in JournaledData::_set_lk(key, val)
| `2.1-533-g3dedca034 <https://github.com/opensvc/opensvc/commit/3dedca03423e7781ef268e2b7067904067a11e64>`_ Fix a "image not pulled yet" warning false positive in container.docker
| `2.1-532-g57114b8c4 <https://github.com/opensvc/opensvc/commit/57114b8c4afba88ccf3b48d7f3f800ca44f1ca94>`_ Fix service being put on "started" local expect unduely
| `2.1-532-g23efd06e8 <https://github.com/opensvc/opensvc/commit/23efd06e8f3f47a8f617e943288676a45c39cca8>`_ Merge pull request #358 from cvaroqui/b2.1
| `2.1-531-gdd11daf09 <https://github.com/opensvc/opensvc/commit/dd11daf09e549a0c39c41f6c49d25fc24c010537>`_ Update ci.yml
| `2.1-531-g18223e1f4 <https://github.com/opensvc/opensvc/commit/18223e1f4e1aee41a9d7ca9be63c5cfaced11b6c>`_ Merge pull request #5 from cgalibern/journaled_data
| `2.1-530-g61a8c735e <https://github.com/opensvc/opensvc/commit/61a8c735ef239d8a6d8a7f6c31d8d5303f3fc032>`_ Update README.md
| `2.1-530-g0cf61f82d <https://github.com/opensvc/opensvc/commit/0cf61f82df24b7d5838bf3b5d32a7f4fcc628a2d>`_ [test] Test the multi-delete in journaled_data
| `2.1-529-gd8145fee7 <https://github.com/opensvc/opensvc/commit/d8145fee7d00941f335f744b54216a9e84f1a931>`_ Fix the multi-delete in journaled_data lists stacking in patch()
| `2.1-529-g47c05467b <https://github.com/opensvc/opensvc/commit/47c05467b1d205f66eac818c0a0a59f14f2142de>`_ Update test requirements
| `2.1-528-g9705b050e <https://github.com/opensvc/opensvc/commit/9705b050eb31b6f9ae53d26f0a1eb70e2c7faeab>`_ Use parallel execution of pool_status() methods
| `2.1-528-g1f7707693 <https://github.com/opensvc/opensvc/commit/1f7707693573800a99dfb825553f07099ec9d758>`_ Update ci.yml
| `2.1-527-ga069a89a9 <https://github.com/opensvc/opensvc/commit/a069a89a9581770e6475d6ca0b0112f074d2e341>`_ Set thread name in ps output on linux, and the forkserver process name
| `2.1-527-g3780f37dd <https://github.com/opensvc/opensvc/commit/3780f37dd043808129679d7cae938d804bfcae7a>`_ Update ci.yml
| `2.1-526-gcfab01c86 <https://github.com/opensvc/opensvc/commit/cfab01c86f2f4e27a6ef6bbf1ed1a852b3b28328>`_ Update ci.yml
| `2.1-526-gb37ac9090 <https://github.com/opensvc/opensvc/commit/b37ac90904ff7da0abe391fb9dc0f1c3158897d3>`_ Merge pull request #4 from cgalibern/journaled_data
| `2.1-525-gc9253ac31 <https://github.com/opensvc/opensvc/commit/c9253ac313fdc688a15dcff26f0da73cbce7e040>`_ [test] Replace multiprocessing.Process by os.fork into tests
| `2.1-525-g7f1601ff0 <https://github.com/opensvc/opensvc/commit/7f1601ff0dd05e0022c6367827c2c4896622ad1f>`_ Move CI from travis to Github workflows
| `2.1-524-gc09a5eb52 <https://github.com/opensvc/opensvc/commit/c09a5eb52f4f80574598224b090021f059dd4fa3>`_ Merge pull request #356 from cvaroqui/b2.1
| `2.1-524-g9850a29da <https://github.com/opensvc/opensvc/commit/9850a29da7445f3819f16f4a219f0fe83b4cb31b>`_ Give the ClientHandler threads a "listener client" name
| `2.1-523-g406a61bf7 <https://github.com/opensvc/opensvc/commit/406a61bf786e9ed650c38bf416a7719381c8825a>`_ Don't clear the "start failed" state while an orchestration is in progress
| `2.1-523-g5cd215587 <https://github.com/opensvc/opensvc/commit/5cd215587fdd0a08b8e7c70b31a1c16bfaeecec6>`_ Name the scheduler task's forkserver process if setproctitle is available
| `2.1-522-g370f4dc03 <https://github.com/opensvc/opensvc/commit/370f4dc03c1fffff66399ba3c71098d8aec86202>`_ Merge pull request #355 from cgalibern/fix-freebsd-true-false
| `2.1-522-g42d6d71fa <https://github.com/opensvc/opensvc/commit/42d6d71fa88a8c07f08a9adb7268bfd3c4da28d6>`_ More scheduler thread optimizations
| `2.1-521-g43d765a5e <https://github.com/opensvc/opensvc/commit/43d765a5eea08277ba32e69d97d59e5d01477629>`_ Declare noop devtree for FreeBSD
| `2.1-521-g1f228b626 <https://github.com/opensvc/opensvc/commit/1f228b6267f30121a3970fcf30b627b439b9e74f>`_ Merge pull request #3 from cgalibern/journaled_data
| `2.1-520-ge65426b38 <https://github.com/opensvc/opensvc/commit/e65426b383edae8ee463fc295e58fc958c5f3fe3>`_ [test] Ensure respect of user, group and umask task keywords
| `2.1-520-gc3386e30c <https://github.com/opensvc/opensvc/commit/c3386e30c015d9fe1eeee0f6835d6dbf2066a4bd>`_ Enable fs flag tests on FreeBSD
| `2.1-519-g25fd31ee8 <https://github.com/opensvc/opensvc/commit/25fd31ee8f6f1d3ce97edbe6e420a44ddc48d693>`_ [test] Improve test time
| `2.1-519-g0a292313c <https://github.com/opensvc/opensvc/commit/0a292313cd104582d2b98df86a20cdd02aac8e54>`_ Update true & false location for FreeBSD
| `2.1-518-gbff6c7af6 <https://github.com/opensvc/opensvc/commit/bff6c7af6c336b2bc36b3d755d36e085272d0723>`_ Merge remote-tracking branch 'upstream/b2.1' into journaled_data
| `2.1-518-g24ce6fb74 <https://github.com/opensvc/opensvc/commit/24ce6fb740eaebd7d186bc2bd7c64a205297552a>`_ Fix the shm pool on freebsd
| `2.1-517-gd9868f7fb <https://github.com/opensvc/opensvc/commit/d9868f7fb7a5f17da31faed3fbaf90f475cfac3d>`_ Fix the mounts parser for freebsd
| `2.1-516-g946295082 <https://github.com/opensvc/opensvc/commit/946295082936970e24be23ab50bb5b2c820a36ed>`_ Add a fs.flag freebsd port
| `2.1-515-gc150c2b58 <https://github.com/opensvc/opensvc/commit/c150c2b58a7c6e5fe7a84bcf1ffc5dd46a54b4ad>`_ Add a dummy utilities.devices freebsd implementation
| `2.1-514-g6c2fe328f <https://github.com/opensvc/opensvc/commit/6c2fe328f2b71230fe3e4094b5e021c2a2207619>`_ Merge pull request #353 from cvaroqui/b2.1
| `2.1-512-g4115493bf <https://github.com/opensvc/opensvc/commit/4115493bfb7e293758f68c603c912571a620e746>`_ Merge pull request #2 from cgalibern/cva-journaled-data
| `2.1-511-g974a079c4 <https://github.com/opensvc/opensvc/commit/974a079c404158c889f5c10c3798aa6fc2c9de56>`_ Fix undetected detected invalid schedule syntax
| `2.1-510-g08a031528 <https://github.com/opensvc/opensvc/commit/08a031528f4c273647205b2b70b5284ca885641f>`_ [test] Update print schedule tests, since now is also show next_run
| `2.1-509-g580b5f6c3 <https://github.com/opensvc/opensvc/commit/580b5f6c39e6905c1ec1383e17671f2740c78659>`_ Merge pull request #1 from cgalibern/journaled-data
| `2.1-508-gc45b1ea11 <https://github.com/opensvc/opensvc/commit/c45b1ea11b1cb8fe7250c86c946e7114a4490930>`_ [test] Skip test orchestrator on journaled data
| `2.1-508-g2eb37a617 <https://github.com/opensvc/opensvc/commit/2eb37a6179cd85d6cb2d85fd67bc8798efbf76ae>`_ Destroy a fs.zfs dataset on unprovision even if the zpool is exported
| `2.1-507-gb9e4ed34a <https://github.com/opensvc/opensvc/commit/b9e4ed34a74c7770f36fad794261315f90725313>`_ Merge pull request #354 from cgalibern/test-priority
| `2.1-507-g0350127a7 <https://github.com/opensvc/opensvc/commit/0350127a7517d48037e6bc06f647d80879123b27>`_ [test] journaled_data
| `2.1-507-g3eb3b35c1 <https://github.com/opensvc/opensvc/commit/3eb3b35c1e9a93fc30270b4bd0c6b9a0035324b1>`_ Add a exposed_devs() method to disk.zpool
| `2.1-506-ge17efd9e4 <https://github.com/opensvc/opensvc/commit/e17efd9e442bbfa53eeab62052d4509aea8f9d31>`_ [test] Ensure respect of priority kw
| `2.1-506-g657a29f2b <https://github.com/opensvc/opensvc/commit/657a29f2be9879e1aca74e9953add73e4ed4a2ad>`_ Redirect the daemon forkserver processes stdin/stdout
| `2.1-506-g37fd015e5 <https://github.com/opensvc/opensvc/commit/37fd015e5bf7257027c09b1e09d5f37fdaf3cd7b>`_ Add a provisioned() method to the container.lxc driver
| `2.1-505-ga446941bb <https://github.com/opensvc/opensvc/commit/a446941bb0294e2a77a6e14653e69f873dca1148>`_ Ensure monitor ask for service status when status is unknown
| `2.1-505-g88e9abbaa <https://github.com/opensvc/opensvc/commit/88e9abbaadd03f6b315405928340131e80f36d07>`_ Honor the "zone" fs resource keyword in container.lxc
| `2.1-505-g9bd578e8d <https://github.com/opensvc/opensvc/commit/9bd578e8d42fb3e044e021d695e57abbb87c5277>`_ Support specifying which log handlers to activate on Node() instanciation
| `2.1-504-gf631ffe69 <https://github.com/opensvc/opensvc/commit/f631ffe69fc92535dd5fda25626dc477c86d724a>`_ Do not merge the provisioned resource state of resources with [un]provision=false
| `2.1-504-ge163c9e06 <https://github.com/opensvc/opensvc/commit/e163c9e0658e86dddfb1a7d9d73418b7f107d3f2>`_ Merge branch 'b2.1' into journaled_data
| `2.1-504-g3ae64959d <https://github.com/opensvc/opensvc/commit/3ae64959d2f0721252544d3fe13b805a943eb5c1>`_ [test] Ensure not extra commands launched when no service exists
| `2.1-503-ge0fb1f0bd <https://github.com/opensvc/opensvc/commit/e0fb1f0bd2684ecfecc13e95c7f2fda0672bf49d>`_ Fix the error log on "lxc-create -f <non existing cf>" in the provision codepath
| `2.1-503-g85fae790d <https://github.com/opensvc/opensvc/commit/85fae790d53b66fcaaf55da3a7f04e22f2782e46>`_ [test] Refacto before adding more orchestrator tests
| `2.1-502-g0735edb21 <https://github.com/opensvc/opensvc/commit/0735edb217b5dc417259f341cfcd82d622ef3af3>`_ Merge pull request #351 from cvaroqui/b2.1
| `2.1-501-ga51208396 <https://github.com/opensvc/opensvc/commit/a51208396601e0eb99a3456f5b864660d63ff8e1>`_ Merge pull request #12 from cgalibern/fix-om-mon-stack-after-daemon-startup
| `2.1-500-gf121a8358 <https://github.com/opensvc/opensvc/commit/f121a8358e78e67903cc6efdcf82b023acc626ec>`_ Fix 'om mon' stack, when called just after daemon startup
| `2.1-499-gf2cb0dfa9 <https://github.com/opensvc/opensvc/commit/f2cb0dfa9891e9d1c8701d0273356d87b3de74ef>`_ Fix undue provision error with undefined fs.zfs and size and refquota as multiplier
| `2.1-498-g94ebe03e5 <https://github.com/opensvc/opensvc/commit/94ebe03e50058f0bbc7f869d6b795f3268ccf279>`_ Allow "om <path> enter" without --rid when the svc has only one container
| `2.1-497-ge644c501f <https://github.com/opensvc/opensvc/commit/e644c501fa7d5223be63948f4423e254cb7d2072>`_ Add the 'create_{,secrets_,config_}environment' prov keywords to container.lxc
| `2.1-496-ga44bdfd21 <https://github.com/opensvc/opensvc/commit/a44bdfd2163d85065ecc4bbc44001c525b072613>`_ Ignore some rmtree error on lxc unprovision's cleanup of the rootfs
| `2.1-495-gc08f599a7 <https://github.com/opensvc/opensvc/commit/c08f599a700ac8c927ab059e184559e52c2aeb4c>`_ Fix the lxc-create error log caused by the '-f <not existing cf>' option
| `2.1-494-gfad58235a <https://github.com/opensvc/opensvc/commit/fad58235a6839b045fa3cbc55f0796fe902a922a>`_ Merge branch 'b2.1' of https://github.com/cvaroqui/opensvc into b2.1
| `2.1-492-gd19e38e08 <https://github.com/opensvc/opensvc/commit/d19e38e081015eba2443d13eb31199795b739aae>`_ [test] Ensure add cfg or sec fails when already exists
| `2.1-492-ga77883498 <https://github.com/opensvc/opensvc/commit/a7788349823ab3181166812a27a203207575372a>`_ Add the 'quota', 'refquota', 'reservation' and 'refreservation' kws to fs.zfs
| `2.1-491-g77c09d75e <https://github.com/opensvc/opensvc/commit/77c09d75e15b9b25b80fe59c4301868d6ffa382f>`_ Disable the fs.flag abort_start() routine if the resource is in a vol object
| `2.1-490-ge4b6fc08d <https://github.com/opensvc/opensvc/commit/e4b6fc08d888c7848513a8e4a8c038a3d88e9cd1>`_ Fix the force kwarg flag not declared in Volume::stop_vol_instance()
| `2.1-489-ge84a491a9 <https://github.com/opensvc/opensvc/commit/e84a491a984de9ebfaed8f17aafcdf6845f50028>`_ Multi-claims volume fixes
| `2.1-488-gbf7ab3f49 <https://github.com/opensvc/opensvc/commit/bf7ab3f49b4c33a2048f85686272030317f21196>`_ Fix missing hb.disk peers detection
| `2.1-487-ga9417fd6c <https://github.com/opensvc/opensvc/commit/a9417fd6c482dc274a95b1275a019a5fae002273>`_ Avoid a common volume access configuration error
| `2.1-486-g72cb802ba <https://github.com/opensvc/opensvc/commit/72cb802ba46f0db869bfd37e343b2342606bfedb>`_ Do a start on volume post provision only on leader instances
| `2.1-485-g3fc4310e4 <https://github.com/opensvc/opensvc/commit/3fc4310e4ae95bb9ded9ae0622b17af1eb539c6d>`_ Save a "start" action on the volume objects on svc "provision"
| `2.1-484-g0c247a978 <https://github.com/opensvc/opensvc/commit/0c247a9784bc874b1f259124e895924da0bc05f3>`_ Don't start the fs.flag resource on provision on the non-leader nodes
| `2.1-483-g68ce5208c <https://github.com/opensvc/opensvc/commit/68ce5208c17c06032313f1dbba8d441fc49eb06f>`_ Make the add action refuse to overwrite an existing key
| `2.1-482-g06f3de64e <https://github.com/opensvc/opensvc/commit/06f3de64edb8a6ac37415070bcf2dcc39eb53247>`_ Make sure the volumes created by the directory pool driver have a status
| `2.1-481-gb31bc09aa <https://github.com/opensvc/opensvc/commit/b31bc09aa168965cf9e7b984e62bf5f03960ab16>`_ Add a DEFAULT.priority keyword to the Svc objects configuration
| `2.1-480-gd13acee80 <https://github.com/opensvc/opensvc/commit/d13acee803504e3ebdb7c6f5501702ea217d9bb9>`_ Fix a listener stack on RBAC validation
| `2.1-479-g289cf650e <https://github.com/opensvc/opensvc/commit/289cf650ec8f03b2fa3361f5fde6adfadec7b1b6>`_ Add a "optional_volume_env" keyword to virtual pool definitions
| `2.1-478-g001eb095a <https://github.com/opensvc/opensvc/commit/001eb095a69df02eb9e91901e96b3bbcbe4c1413>`_ Merge pull request #350 from cgalibern/fix-transient-test-orchestrator-failure
| `2.1-477-g9b65d6cd4 <https://github.com/opensvc/opensvc/commit/9b65d6cd4918b396085c1d706d8983efa20308d5>`_ [Test] Fix transient failures during orchestrator do loop
| `2.1-476-gf7b3314bb <https://github.com/opensvc/opensvc/commit/f7b3314bbb5d2585ff8ebfae12051402a5880650>`_ Merge pull request #349 from cvaroqui/b2.1
| `2.1-475-g1e47d144a <https://github.com/opensvc/opensvc/commit/1e47d144aaa66da556a61ad704bf6489a742bd1f>`_ Fix a unprov orchestration loop situation
| `2.1-474-gf838f01f1 <https://github.com/opensvc/opensvc/commit/f838f01f1d7f18dc9d91c74b4d00213427ed9a80>`_ Merge pull request #348 from cvaroqui/b2.1
| `2.1-473-gbbbeb13f2 <https://github.com/opensvc/opensvc/commit/bbbeb13f2fae2a17a67f1e3b44a92a69ac5458fd>`_ janitor_crl() and fetch_crl() fixes and enhancements
| `2.1-472-gecaa08f34 <https://github.com/opensvc/opensvc/commit/ecaa08f343b3753ac2ce0f7a58a5445c4245b7e3>`_ Rollback the usr cert revoke if the new crl to load in the ca sec is not present
| `2.1-471-g08bf97119 <https://github.com/opensvc/opensvc/commit/08bf971197b3d6f21314d05d06c11e30ba9b4085>`_ Merge pull request #347 from cvaroqui/b2.1
| `2.1-470-g283775a09 <https://github.com/opensvc/opensvc/commit/283775a09d70d7ac1376ce31ad9a65c273fd949a>`_ Fallback on probe if asset override loading from node.conf fails
| `2.1-470-g2b9b10167 <https://github.com/opensvc/opensvc/commit/2b9b10167cd66df35b5abfed2c501731504f090e>`_ Skip instance monitor updates for objects with no monitor
| `2.1-469-g12372a7ec <https://github.com/opensvc/opensvc/commit/12372a7ecde4467a271f60790b12d24e0e317b98>`_ Always embed the frozen attribute in the status.json dataset
| `2.1-469-g57bbc4c43 <https://github.com/opensvc/opensvc/commit/57bbc4c4321c54ddf4b9e62b37dce0a9f3257217>`_ Fix the crl loading
| `2.1-468-ga8fa94fc1 <https://github.com/opensvc/opensvc/commit/a8fa94fc1ca2bf8131de6378b8f77b0ea11796ca>`_ Fix a use-before-set in the usr object codebase
| `2.1-468-g10808da8c <https://github.com/opensvc/opensvc/commit/10808da8cf13e64edfdb80575fdba22fc1cc6a2f>`_ Add the missing POST /object_status handler
| `2.1-467-g183727ef4 <https://github.com/opensvc/opensvc/commit/183727ef48bf9b7bcdd4e0e0ed9961a88ea238e0>`_ Push the status via a new handler POST /object_status
| `2.1-467-g69a4e1062 <https://github.com/opensvc/opensvc/commit/69a4e1062d438d0c65c9c679be4ffb61190b5168>`_ x509 fixes and enhancements
| `2.1-466-g491906907 <https://github.com/opensvc/opensvc/commit/4919069077cbdc9c34c053462b8008f205ca6176>`_ Better service account detection in the x509 auth codepath
| `2.1-466-g1c6afef43 <https://github.com/opensvc/opensvc/commit/1c6afef43c4fbfafcc91f885cae1b126d8ac724f>`_ Add ipv6 support to the listener and ucast hb
| `2.1-465-gbb63a0679 <https://github.com/opensvc/opensvc/commit/bb63a0679bb68a564fef21f50a25c0518ea8de2f>`_ Pass the node kwarg to more object instanciations
| `2.1-465-g7d9bd0a0a <https://github.com/opensvc/opensvc/commit/7d9bd0a0aa1fe160d99bbb9b126ce33df6d877a9>`_ Fix a non initialized variable access in the volume resource driver
| `2.1-464-g919140e81 <https://github.com/opensvc/opensvc/commit/919140e8134236d9cb37deb961af2bc5614960ee>`_ Prevent tasks with confirmation=true to be scheduled
| `2.1-464-g8a4fb5afc <https://github.com/opensvc/opensvc/commit/8a4fb5afc25262d983990a39c35757289dd3c865>`_ Disable logging of objects in the daemon SERVICES hash
| `2.1-463-g0457a29b1 <https://github.com/opensvc/opensvc/commit/0457a29b1818e594aa210eb41cfaee85900218fe>`_ Add commented out profiling functions to the monitor thread
| `2.1-463-g27b1dbd57 <https://github.com/opensvc/opensvc/commit/27b1dbd57e0bf1a18d4419af2aa2238c10fa31cc>`_ Fix pausable sync resource in n/a state after a 'stop --rid ...' action
| `2.1-462-g072605e61 <https://github.com/opensvc/opensvc/commit/072605e61770cbd2c0385df8af11e88a13a42d86>`_ Add a pull_timeout keyword to docker/podman resources
| `2.1-462-g82fc75541 <https://github.com/opensvc/opensvc/commit/82fc75541b17117cdea9cc3afe10df66e30ff67e>`_ Fix wrong documentation of the 'size' kw in the fs.zfs resource
| `2.1-461-g54bf50d3c <https://github.com/opensvc/opensvc/commit/54bf50d3c81a31de2aa29860f9d3ab4a8a3f2925>`_ Add a {uri_ip:...} reference modifier
| `2.1-461-g42d3f43b7 <https://github.com/opensvc/opensvc/commit/42d3f43b7da84df63a57ed0ad00fb57cd0187527>`_ Fix the schedule expression link in the kw docs
| `2.1-460-g0892d7f5e <https://github.com/opensvc/opensvc/commit/0892d7f5ea6d709cf0e395be769da8cb464a2b44>`_ Merge pull request #346 from cvaroqui/b2.1
| `2.1-460-g0c3bd3cf4 <https://github.com/opensvc/opensvc/commit/0c3bd3cf4e27c69a8ac02b219565b6d6b5e74c6c>`_ Add a utilities.render.listener.fmt_listener function
| `2.1-459-gb93266b72 <https://github.com/opensvc/opensvc/commit/b93266b729197ee25ebe1f0ed925fecfa0d401e2>`_ Honor node.secure_fetch in the data objects
| `2.1-459-g1454cf331 <https://github.com/opensvc/opensvc/commit/1454cf3317b3b12c32f111ceaf50c5bcaa1b9446>`_ Fix leak during get /node_checks
| `2.1-458-gda3e9879a <https://github.com/opensvc/opensvc/commit/da3e9879a6c4d0e38d0ef2105193eb92bdf728d9>`_ Cleanup unused imports on node_checks handler
| `2.1-458-gc8ff366f5 <https://github.com/opensvc/opensvc/commit/c8ff366f50f0acad9d7ff6999fe5d76f4ba957cc>`_ Fix a off-by-one schedule error in mon:last expressions
| `2.1-457-g477558595 <https://github.com/opensvc/opensvc/commit/4775585951945ef7bf3188f5a55f46f870ae1df8>`_ Add a node.secure_fetch boolean keyword
| `2.1-457-g01a3a7eb4 <https://github.com/opensvc/opensvc/commit/01a3a7eb490164bc6d55849c975abb09712031b3>`_ Fix leak during get /node_checks
| `2.1-456-g4bfb1fe0c <https://github.com/opensvc/opensvc/commit/4bfb1fe0c796c30495b41a24e53cf5dd3e5434d3>`_ Clear the docker image cache after a "docker run"
| `2.1-456-g1a6794d79 <https://github.com/opensvc/opensvc/commit/1a6794d793ccd7935b5527c2d34c680c91835d09>`_ Allow shared volumes from non shared-capable pool on mono-node clusters
| `2.1-455-g9f946d34e <https://github.com/opensvc/opensvc/commit/9f946d34ee08daa8dd0940d080a23c2df142b59b>`_ Fortify cluster data renderer against missing smon
| `2.1-455-g4d66b31c0 <https://github.com/opensvc/opensvc/commit/4d66b31c02fba0929589041a7bfd7be864b8ffd4>`_ Fix volume resource Error in start/stop/unprov codepaths when no pool found
| `2.1-454-g3362b3a6b <https://github.com/opensvc/opensvc/commit/3362b3a6b05f3c6fbc3c1ea2a1414e235da77a4c>`_ Don't initialize the stream log handler for objects created by the scheduler
| `2.1-454-g008aba5af <https://github.com/opensvc/opensvc/commit/008aba5afec3e505faa0749e1c7df6b5cf9ccd5d>`_ Fix the {volume#<n>.name} reference when name is not set
| `2.1-453-gf6f56cf9c <https://github.com/opensvc/opensvc/commit/f6f56cf9c88f9ec5f593df819b18f5a6fcee3b0f>`_ Fortify Svc::flex_{target,min,max} evaluation against non int castable value
| `2.1-453-gbbde0147a <https://github.com/opensvc/opensvc/commit/bbde0147a6ea13844a8828911818857145c2110a>`_ Avoid a recursive locking in JournaledData::pop_diff()
| `2.1-452-gc806ff8c2 <https://github.com/opensvc/opensvc/commit/c806ff8c290607d23b76e14a0ff2ab8c4f402a3a>`_ Fix a stack on add --key <k> --from <dir> when dir hosts a broken symlink
| `2.1-452-g2208e8a41 <https://github.com/opensvc/opensvc/commit/2208e8a416c8ac170ab99e13c9083cc7ac99305f>`_ Move the threading locks debugging class to utilities.dbglock
| `2.1-451-g87da7c59d <https://github.com/opensvc/opensvc/commit/87da7c59db0cb84974e31f222547e6d7b995a926>`_ Remove the LOCKS_LOCK RLock()
| `2.1-451-g6c4671086 <https://github.com/opensvc/opensvc/commit/6c46710860b10b7c525d1a0799b09cf6e5d6d24d>`_ Raise an error when add --key <k> --from <glob> does not resolves
| `2.1-450-gdf21ca2f0 <https://github.com/opensvc/opensvc/commit/df21ca2f07b37beed1abb09b65980b2684818372>`_ Fix a wrong variable name in a data object error codepath
| `2.1-450-g96206b0e6 <https://github.com/opensvc/opensvc/commit/96206b0e6276402570ef50d64f6dadaeb13f01a8>`_ Don't make the monitor loop refresh all threads status
| `2.1-449-ga45fe746e <https://github.com/opensvc/opensvc/commit/a45fe746e2bf558e2d164e881f0dc52c90cd63f2>`_ Consider "::" as "0.0.0.0" in peer endpoint lookup in core.comm
| `2.1-449-g2fb12489d <https://github.com/opensvc/opensvc/commit/2fb12489d67cbdb137b3f82334d5980a24d354d4>`_ Merge pull request #345 from cvaroqui/b2.1
| `2.1-448-gbf052ec40 <https://github.com/opensvc/opensvc/commit/bf052ec4029103271182c3c58541889a2d0027ad>`_ Fix a service_config_consensus() stack
| `2.1-448-gb2d829bc8 <https://github.com/opensvc/opensvc/commit/b2d829bc8aa65b108d6d21b07c1ebd2a15eaee14>`_ Fix py2 pylint error with the uri module importing utilities.os instead of os
| `2.1-447-g301041672 <https://github.com/opensvc/opensvc/commit/301041672af89bfc2bdfd25418c1f48ea6273fbe>`_ Fix a instances_busy() stack
| `2.1-447-g7191ad00d <https://github.com/opensvc/opensvc/commit/7191ad00dbe9d7a97eab61e65f3d27adecc11362>`_ Purge lingering files after a "apt purge opensvc"
| `2.1-446-ga1feea72f <https://github.com/opensvc/opensvc/commit/a1feea72f43840dc058b24526fa95fe9af530fec>`_ Fix the scheduler forked process not finding the object to call action() on
| `2.1-446-g17d558b1b <https://github.com/opensvc/opensvc/commit/17d558b1bc50f298bd565bec3498cc1e1e69f2d6>`_ Fix an invalid self.node access from the container.lxc driver
| `2.1-445-gcae70fe49 <https://github.com/opensvc/opensvc/commit/cae70fe49916305b29f611f47b358b830e6ff0b6>`_ Add the GET /node/checks api handler
| `2.1-445-g8d1201705 <https://github.com/opensvc/opensvc/commit/8d12017058e0e827ff7865718378dfbcf070d6af>`_ Fix and optimize the node labels and targets propagation
| `2.1-444-gbbfaa71af <https://github.com/opensvc/opensvc/commit/bbfaa71af92afca44317c9f04690f7b56ba06221>`_ Support connecting to the daemon listener via ipv6
| `2.1-444-g75d862a50 <https://github.com/opensvc/opensvc/commit/75d862a505c4aa23c6efc4d31f3c205c9b9e1fce>`_ Honor node.secure_fetch in the data objects
| `2.1-443-g1272574ba <https://github.com/opensvc/opensvc/commit/1272574ba6e162871ef71651ef857dd42a053528>`_ Fix a stack in the cluster lock handlers
| `2.1-443-g57210dbac <https://github.com/opensvc/opensvc/commit/57210dbac7255d129bc820d43ad243e97886a9d1>`_ Add a node.secure_fetch boolean keyword
| `2.1-442-gbac57ce55 <https://github.com/opensvc/opensvc/commit/bac57ce55c533e8e46c1e1d884f0a902d657bec8>`_ Add the "directories" keyword to volume resources
| `2.1-442-g738e4e107 <https://github.com/opensvc/opensvc/commit/738e4e10771eaf99489451851b61fb7cd04b75dc>`_ Fix a use before set situation in core.comm
| `2.1-441-gca605dc9c <https://github.com/opensvc/opensvc/commit/ca605dc9ccf7e34a2fda70acb348b3f703e0610a>`_ Add missing __init__.py in the raid checker
| `2.1-441-g8d0e55abd <https://github.com/opensvc/opensvc/commit/8d0e55abdd91fa5c1301fb2e90dcc0434f96672a>`_ Fix a stack on dns thread init while waiting for the monitor thread data
| `2.1-440-gf56364fa9 <https://github.com/opensvc/opensvc/commit/f56364fa9d329e38fbec6d60a0633860e601cf69>`_ Allow the eth checker to report on "en" interfaces
| `2.1-440-g2f2f53ecb <https://github.com/opensvc/opensvc/commit/2f2f53ecbb7c13e2a590600039ed606620f114f5>`_ Support ipv6 masquerading setup in the "om net setup" codepath
| `2.1-439-gbdb1f1c8a <https://github.com/opensvc/opensvc/commit/bdb1f1c8a5360f667756d84f9ef1aedcf5ffe93a>`_ Fix the gateway in the generated cni configuration for ipv6 networks
| `2.1-439-g64e37c6c3 <https://github.com/opensvc/opensvc/commit/64e37c6c3df50ec3e77c351ee5619da316fa94ee>`_ Support "om <sec> add --key <key> --from <uri>"
| `2.1-438-ga5f007589 <https://github.com/opensvc/opensvc/commit/a5f007589d29eafc7345f08896cd647980c7605d>`_ Implement a find_node_ip() Node method
| `2.1-438-g4336e8668 <https://github.com/opensvc/opensvc/commit/4336e866809833f0cbe5b00f074893e39b5183c0>`_ Fix listener janitor_events corruption of journaled_data
| `2.1-437-g6706e2a8e <https://github.com/opensvc/opensvc/commit/6706e2a8e0b666aa6bb99728254505622d967bdc>`_ Merge branch 'b2.1' of github.com:opensvc/opensvc into b2.1
| `2.1-437-g0400b2bad <https://github.com/opensvc/opensvc/commit/0400b2bad65a686af313cd475659c241285ec424>`_ Implement a bridge mac addr forging for ipv6 dedicated bridges
| `2.1-436-g5dd1a469e <https://github.com/opensvc/opensvc/commit/5dd1a469eda3beaca53143e725f0b34d48f194e3>`_ Switch between "ip" and "ip -6" commands as necessary in "om net setup" codepath
| `2.1-435-geb41c56b1 <https://github.com/opensvc/opensvc/commit/eb41c56b100b236d37fbcef64b39671fc72d4988>`_ Add full ipv6 support to the dns thread
| `2.1-435-g93c004299 <https://github.com/opensvc/opensvc/commit/93c0042994008f9b004aac83f008ad05e1010d66>`_ Unfreeze the volume instance created by a virtual pool
| `2.1-434-gf626c4bd6 <https://github.com/opensvc/opensvc/commit/f626c4bd6b552a79620cd8c0f02b1f90895d8c99>`_ hcs array driver fixes
| `2.1-434-ga4b1f61f0 <https://github.com/opensvc/opensvc/commit/a4b1f61f0f2453d387bf7f2e86ff2f3d84f4dd36>`_ Save the resource consuming part of on_nodes_info_change() when data unchanged
| `2.1-434-g3e999a4b7 <https://github.com/opensvc/opensvc/commit/3e999a4b73ddb726ca1afecf32d8505719ecb20f>`_ Merge pull request #344 from cvaroqui/b2.1
| `2.1-433-gc8ed372c5 <https://github.com/opensvc/opensvc/commit/c8ed372c51f84da5a9a55d845b557bc1e878d53d>`_ Fix a drbd pool driver use-before-set in the pool_status() method
| `2.1-433-g680a96a4e <https://github.com/opensvc/opensvc/commit/680a96a4ed88ecb660ae08906b0c9ce52ae45581>`_ Fix a py2 stack on print(..., end="") in the task resource driver
| `2.1-432-g782cf2b69 <https://github.com/opensvc/opensvc/commit/782cf2b69fafb6f99bf97a0d4055c9992abf6ab9>`_ Fix a possible scheduler stack
| `2.1-432-g2d6463458 <https://github.com/opensvc/opensvc/commit/2d6463458cc387a9ba76247e2a1c1d3bf6654067>`_ hcs array driver fixes
| `2.1-431-gc97de674c <https://github.com/opensvc/opensvc/commit/c97de674c40aaed89f022d7573214a34c18062ed>`_ Optimize a frequent monitor codepath using merge() instead of multiple set()
| `2.1-431-gbe5b5517f <https://github.com/opensvc/opensvc/commit/be5b5517fa53e1f63f96350ada71d19d4c2feb91>`_ Signal child processes with SIGINT instead of SIGTERM from mgr
| `2.1-430-g774ef07ef <https://github.com/opensvc/opensvc/commit/774ef07ef3abd80353e91ecd3a9e9f7a67f50d49>`_ Make sure the hcs pool driver drops the session after an array action
| `2.1-430-g3c4a2d91c <https://github.com/opensvc/opensvc/commit/3c4a2d91caea95e8418085a72e497887bce0433c>`_ Use a forkserver for py3
| `2.1-429-g574c85e13 <https://github.com/opensvc/opensvc/commit/574c85e1384917e7675f8362031fbea0cf399e04>`_ Avoid a deepcopy on journaled data merge() ops
| `2.1-429-g7b4eea0e5 <https://github.com/opensvc/opensvc/commit/7b4eea0e52dcd70c25b5b8416568910dbf834f9c>`_ Implement a post_provision_start() for disk.scsireserv
| `2.1-428-gf6b71a11d <https://github.com/opensvc/opensvc/commit/f6b71a11dd091a2f7e008fe74b379d08982f60ed>`_ Optimize the get_pool_status(usage=True) codepath
| `2.1-428-g76a744565 <https://github.com/opensvc/opensvc/commit/76a74456577b146c64697f2b2602cd91791c0dd4>`_ Support "om <sec> add --key <key> --from <uri>"
| `2.1-427-ga438aa2dd <https://github.com/opensvc/opensvc/commit/a438aa2dd82e34b67b62fe10289742ef5286c717>`_ Fix a volume configuration validate latency issue
| `2.1-427-g54d4d31c6 <https://github.com/opensvc/opensvc/commit/54d4d31c6342fe345d85b80aba8488a34b4c69d1>`_ Make the scheduler fork the object action
| `2.1-426-gcc269e842 <https://github.com/opensvc/opensvc/commit/cc269e84218c72bc30fc9c414a3ae0f72d5d58cb>`_ hcs array driver enhancements
| `2.1-426-gbca456de5 <https://github.com/opensvc/opensvc/commit/bca456de5f4fd0adfa13c9cf98752cd944c18656>`_ Remove uneeded puge_cache() call in the monitor loop
| `2.1-425-g38eaab35d <https://github.com/opensvc/opensvc/commit/38eaab35d76c1a8df80f495c4ff4a4f67b72dc03>`_ Implement a mpathpersist register retry loop
| `2.1-425-g0ce6beb4c <https://github.com/opensvc/opensvc/commit/0ce6beb4ce5ebe6814359fe85cd5862952d11113>`_ Catch signal handler set ValueError in Svc
| `2.1-424-g343ef2727 <https://github.com/opensvc/opensvc/commit/343ef27277618aaf399c41e2fa604aeb6945bc82>`_ Fix an undue conversion to minute in the Schedule::validate() codepath
| `2.1-424-g11e75e3fa <https://github.com/opensvc/opensvc/commit/11e75e3fa45c8e33e90c1351f0d0dacc167d9f78>`_ Fix the create volume lock unduly serializing the create of diff vols
| `2.1-423-g71b94fda5 <https://github.com/opensvc/opensvc/commit/71b94fda5a24095820d8a8867e9ac1f59a2dbefc>`_ Use a select.select() instead of threads to timeout task confirmation input()
| `2.1-423-g48e8f2a10 <https://github.com/opensvc/opensvc/commit/48e8f2a10b5f08917d3e4fd520530a5188be79c1>`_ Implement the request retry on hcs async actions
| `2.1-422-gd59546e37 <https://github.com/opensvc/opensvc/commit/d59546e37167c272452c3833e68e3d6f4accf34b>`_ Remove an undue scsi pr error log on unprovision
| `2.1-422-g69a0d4c21 <https://github.com/opensvc/opensvc/commit/69a0d4c2184edc7ae0ca6883a94e187ea07c9e84>`_ Prevent tasks with confirmation=true to be scheduled
| `2.1-421-gb1aecd4bd <https://github.com/opensvc/opensvc/commit/b1aecd4bdd7b5db5ec5482bbfdff5fb6297ea8f4>`_ Remove a lot of "service" word occurences from the monitor logs
| `2.1-421-g2eb810cfd <https://github.com/opensvc/opensvc/commit/2eb810cfd2534d86aca425cc50ebb7634fe9694b>`_ Detect the options to set with hcs delete ldevs request
| `2.1-420-ged7084403 <https://github.com/opensvc/opensvc/commit/ed7084403a270b46ff8a360d49c3c98170669738>`_ Try to dump hcs request data as indented json dump
| `2.1-420-g3a22d92a3 <https://github.com/opensvc/opensvc/commit/3a22d92a3d20b0620608c129eb13906082ed144d>`_ Add a csum_status_data() method docstring
| `2.1-419-g05164857f <https://github.com/opensvc/opensvc/commit/05164857f715482e3f8570b0f75b2932eabdbc91>`_ Use concurrent.futures for subset action parallelisation
| `2.1-419-g5f5e0e44c <https://github.com/opensvc/opensvc/commit/5f5e0e44c5d1470e42fc173496bf64cbecc5b580>`_ Fix a possible stack in the hcs driver naa sanity check code
| `2.1-418-ge03abbd9e <https://github.com/opensvc/opensvc/commit/e03abbd9eabec86befe38f91b67cdcaa7db3120d>`_ Use concurrent.futures for abort_start() methods parallelisation
| `2.1-418-g5ed311318 <https://github.com/opensvc/opensvc/commit/5ed3113187a5d3942916b84fe20077bdbbe69dd3>`_ Do not retry hcs get job status request when completed and failed
| `2.1-417-gd55e4839b <https://github.com/opensvc/opensvc/commit/d55e4839b37577fec8ff9f7f7ff6c6b0ca344a59>`_ Use concurrent.futures for --parallel CRM actions
| `2.1-417-g64ce5718f <https://github.com/opensvc/opensvc/commit/64ce5718fa3ccfe98257c00b8ade837409d0e9dd>`_ Add hcs api request response status classification
| `2.1-416-g6860221ff <https://github.com/opensvc/opensvc/commit/6860221fffbfb58da121cc762b592a712d99c210>`_ Merge pull request #343 from cgalibern/drbd-test
| `2.1-416-g4f99969ac <https://github.com/opensvc/opensvc/commit/4f99969ac3e24d5c1558facbac2377321091e2bb>`_ Remove unused signal import from the disk.zvol driver
| `2.1-415-gbe7cc3783 <https://github.com/opensvc/opensvc/commit/be7cc3783371c8e1c215e844855feb141f8e49e0>`_ Align the "rs" log tag for msg emitted from resources and resourcesets
| `2.1-415-g70fcb26aa <https://github.com/opensvc/opensvc/commit/70fcb26aa1a5933ab0eb61bc7d3b84a9a5c88eac>`_ [test] Fix drbd test since --discard-my-data not always used
| `2.1-414-ge820730b6 <https://github.com/opensvc/opensvc/commit/e820730b65838e033b4fc61d68fa81470b59af7b>`_ Remove a lot of "service" word occurrences from daemon logs
| `2.1-414-gcfc76c682 <https://github.com/opensvc/opensvc/commit/cfc76c682d69019d826d43357eba4ea14996519a>`_ Merge pull request #342 from arnaudveron/fix-drbd-prov
| `2.1-413-geb704221d <https://github.com/opensvc/opensvc/commit/eb704221dfc9c8d1885055f6438113ba04940bc1>`_ Fix drbd provisioner
| `2.1-413-g53d8ffab8 <https://github.com/opensvc/opensvc/commit/53d8ffab814c80b65f1b754f7865551d1cf1a699>`_ Remove the is_up_clear_cache() call from Resource::try_status()
| `2.1-412-g55904eb63 <https://github.com/opensvc/opensvc/commit/55904eb63862d8c4e105ab6c0b6dca64d09a9673>`_ Merge pull request #341 from cvaroqui/b2.1
| `2.1-412-g6a47aa072 <https://github.com/opensvc/opensvc/commit/6a47aa072a8e4e447ee1da3aec4e02ac8f4ec518>`_ Convert signal use in container.docker driver to concurrent.futures
| `2.1-411-gc5dae98dd <https://github.com/opensvc/opensvc/commit/c5dae98dd5fd20828ba781a67f42a3cc724f6c83>`_ Remove a rsync_version() call from the sync.rsync driver
| `2.1-411-g6f1f753de <https://github.com/opensvc/opensvc/commit/6f1f753de56fdadac2c0d0e7508bacba441caab9>`_ Fix wrong "do <action> <option>" log
| `2.1-410-gfcd3ca02d <https://github.com/opensvc/opensvc/commit/fcd3ca02d26fd867c3c316b6b193b9af98b713f3>`_ Convert signal use in task base driver to concurrent.futures
| `2.1-410-g689305f93 <https://github.com/opensvc/opensvc/commit/689305f9364b02e2ff0e9a2223ff58c9b09d17f3>`_ Merge pull request #340 from cvaroqui/b2.1
| `2.1-409-gf3f80c8f0 <https://github.com/opensvc/opensvc/commit/f3f80c8f0338de31f46cdeae471b93bd1ad339a3>`_ Fix the volume provision action logs non written to file on the leader node
| `2.1-409-g89e6ff486 <https://github.com/opensvc/opensvc/commit/89e6ff486446ae502bfc339c0282c6eb9617f25d>`_ Use the threadsafe lazy decorator for ContainerLib
| `2.1-408-gb5baa86cb <https://github.com/opensvc/opensvc/commit/b5baa86cb884a16018fbd9e725a934c14c533672>`_ Merge pull request #339 from agrimal/patch-1
| `2.1-408-g57fec71f2 <https://github.com/opensvc/opensvc/commit/57fec71f2ae0cfcc4403495c85e39624460df7ff>`_ Add a threadsafe implementation of lazy
| `2.1-407-g8550d572c <https://github.com/opensvc/opensvc/commit/8550d572c284eb3d3c418f2ae35c81d6cccc0d3e>`_ Add a concurrent.futures backport for py2 compat
| `2.1-407-g18cbfe549 <https://github.com/opensvc/opensvc/commit/18cbfe549cba17d15271e009916190ec432ff0b9>`_ Fix "list host groups" action
| `2.1-406-gac1531e5d <https://github.com/opensvc/opensvc/commit/ac1531e5d71b4f378e4f60446732d011cb62ecc6>`_ Merge pull request #338 from cvaroqui/b2.1
| `2.1-406-g43f2cf06b <https://github.com/opensvc/opensvc/commit/43f2cf06b88d2c0646e7dbe086c24f16d178fa39>`_ Revert "Optimize hyper module load time using a lazy re.compile for rfc3986 regexps"
| `2.1-405-g6a088d4a1 <https://github.com/opensvc/opensvc/commit/6a088d4a1f3b1e67a16f616955ead0cefa8aa065>`_ Add support for group, cwd and umask to the task.host driver
| `2.1-405-g4f7ef2fa5 <https://github.com/opensvc/opensvc/commit/4f7ef2fa5f9ff9985baae14ca8f92671732bc341>`_ Factorize the SERVICES key value load in a add_service() method
| `2.1-404-g62b6ef91a <https://github.com/opensvc/opensvc/commit/62b6ef91a3dab06dd9985afe9ccae7ec49770456>`_ Optimize hyper module load time using a lazy re.compile for rfc3986 regexps
| `2.1-404-g32a0b6d22 <https://github.com/opensvc/opensvc/commit/32a0b6d22e3ba7193fc7628df85fc29926631762>`_ Add GET /daemon_stats filtering via new "selector" and "namespace" options
| `2.1-403-gea5a8bdb1 <https://github.com/opensvc/opensvc/commit/ea5a8bdb1d7ff3b49b853eb75069afc0a8658eb6>`_ Add the utilities.cache.purge_cache_session() function
| `2.1-403-g6230b2be1 <https://github.com/opensvc/opensvc/commit/6230b2be1c02cb728e917a5dbba09e29ef2d7d2b>`_ Add support for the "umask" keyword in app resources
| `2.1-402-gf8f10e615 <https://github.com/opensvc/opensvc/commit/f8f10e615ebf21c5fd298f07fca9c6baed2dce8e>`_ Fix a pushdisks error with zfs templates on linux
| `2.1-402-g9b8dbc0fe <https://github.com/opensvc/opensvc/commit/9b8dbc0fe690653c5455142f3800c26366fae1de>`_ Save the monitor wake-up on run action startup for high freq tasks
| `2.1-401-gcf85c5f13 <https://github.com/opensvc/opensvc/commit/cf85c5f1352dcc8f5b5944824ac616c89d83b9d7>`_ Replace the @cache'd rsync_version with a faster capabalities pair
| `2.1-401-gb56ead86d <https://github.com/opensvc/opensvc/commit/b56ead86d4b46f16be5596c7163fbbe87b03e6e4>`_ Merge pull request #335 from cvaroqui/hcs-v2
| `2.1-400-ge39a01eb1 <https://github.com/opensvc/opensvc/commit/e39a01eb1c62981bc0d69111dbd333d8adb22ec1>`_ Don't create the virtual pool volume on referencing volume resource status()
| `2.1-400-g0cb8dd5d1 <https://github.com/opensvc/opensvc/commit/0cb8dd5d1d6a377a4e693e76cdf573f0b2226d2f>`_ Display seconds in "print schedule" output
| `2.1-399-ge39256d02 <https://github.com/opensvc/opensvc/commit/e39256d0206944a166610eea5da098ebe4d7ec35>`_ Reset the dataset GEN on monitor thread crash/restart
| `2.1-399-g1dafdb77e <https://github.com/opensvc/opensvc/commit/1dafdb77e805d0bb13b8ea05cc886afd262a76d4>`_ Fix a stack in virtual pool vol provision
| `2.1-398-gc21a1f235 <https://github.com/opensvc/opensvc/commit/c21a1f2359f8ea68dde4f577093c7c3a5d573a5f>`_ Adapt the daemon.scheduler to new core.scheduler method names
| `2.1-398-ga9589c7b1 <https://github.com/opensvc/opensvc/commit/a9589c7b1529319c7b00eb384f8878d7f092c5c0>`_ Set volume.pool inheritance to leaf
| `2.1-397-gbfa0f554e <https://github.com/opensvc/opensvc/commit/bfa0f554e16a0a65a50eafa75962d56a13bf8af1>`_ Don't schedule tasks requiring the collector being setup
| `2.1-397-g1b6240544 <https://github.com/opensvc/opensvc/commit/1b62405448ec66f6df3b14f14d53090150b075c7>`_ Merge branch 'b2.1' into hcs-v2
| `2.1-396-gb403d8e02 <https://github.com/opensvc/opensvc/commit/b403d8e0261cfd77b9bdea11a1d6d4a5c7ea3582>`_ core.scheduler fixes and cleanups
| `2.1-395-g7be63f551 <https://github.com/opensvc/opensvc/commit/7be63f551d5b1145649a4f090235c7531a8d0a94>`_ Remove all schedule check from sync driver
| `2.1-394-g9cda2bf0b <https://github.com/opensvc/opensvc/commit/9cda2bf0b0a841ba1813914e73ed956582cce5ea>`_ Teach janitor_procs() to work with Process or Popen objects
| `2.1-394-g4b96a4e17 <https://github.com/opensvc/opensvc/commit/4b96a4e176ef493f1144b5b4273766e5da14f109>`_ Fix the vol provision action logs not written to the file handler
| `2.1-393-ga71c30caf <https://github.com/opensvc/opensvc/commit/a71c30caf740faed918d608358645166fdf79499>`_ hcs driver cleanup, fixes and enhancements
| `2.1-393-g8d1f33cf0 <https://github.com/opensvc/opensvc/commit/8d1f33cf005af75efa74ec075dbe7a2fc2a60b66>`_ Remove "auto reboot status" dependency on deprecated scheduler method
| `2.1-392-g783f6f47d <https://github.com/opensvc/opensvc/commit/783f6f47dc5ca089a2de8a0d059db13c71c0e338>`_ Reorganize the __main__ file so main() accept a argv argument
| `2.1-392-g0699b8e61 <https://github.com/opensvc/opensvc/commit/0699b8e619f5ff40b9d942c6df7d120aa220faa0>`_ Discard fc port in "Not Present" state from initiator-targets node info
| `2.1-391-gafe4c8c95 <https://github.com/opensvc/opensvc/commit/afe4c8c958c714a2b6757cb238372da3fdb194ac>`_ Support brocade inventory via ssh using password authentication
| `2.1-391-g0c7d67348 <https://github.com/opensvc/opensvc/commit/0c7d673480db22b6931aad234d16ae2f4926bd5d>`_ Move a RLock allocation closer to where its needed
| `2.1-390-g439366f54 <https://github.com/opensvc/opensvc/commit/439366f54ad8e8f28c3c57f66caa28dc0a021415>`_ Remove the core.comm blacklist lock
| `2.1-390-g77e4484c9 <https://github.com/opensvc/opensvc/commit/77e4484c9d1fefcfba42e2cf988d5bd52404d883>`_ Add support for brocade sanswitch password storage in a secret object
| `2.1-389-g4712b82ee <https://github.com/opensvc/opensvc/commit/4712b82ee61fa72b1018def0730550f32ab4fee7>`_ Fix a hcs driver lazy called as a method instead of a property
| `2.1-389-g3a8038d20 <https://github.com/opensvc/opensvc/commit/3a8038d207f4bad830f9ce3e5a985a31ef2dc3bf>`_ Fix a wrong variable name in the resource monitor codepath
| `2.1-388-gaf5482fed <https://github.com/opensvc/opensvc/commit/af5482fed67831441e026d680207fdf450b4e5a8>`_ Don't queue collector-requiring tasks in the scheduler
| `2.1-388-g211beead8 <https://github.com/opensvc/opensvc/commit/211beead8f199e41b4a175bc323ef32fc6af470a>`_ Fix the apirequest decorator of the hcs array driver
| `2.1-387-geaf280605 <https://github.com/opensvc/opensvc/commit/eaf280605f46dc1cf7500e53755bb86777311608>`_ Add a naaId field in every dict returned by Hcs::get_ldevs()
| `2.1-387-gab101b75b <https://github.com/opensvc/opensvc/commit/ab101b75be9ed0b9a4cc6317e382b5552f383341>`_ Move the collector daemon thread to using journaled daemon_status_data
| `2.1-386-g7391c8169 <https://github.com/opensvc/opensvc/commit/7391c8169a2ba8d5d3c3ebab948b0695c3f78870>`_ Fix wrong list_node() method location in opensvc.daemon.clusterlock
| `2.1-386-g03b5009de <https://github.com/opensvc/opensvc/commit/03b5009de189ea474d9f27fb306ba49e53bcc375>`_ Add the "list virtual storage" hcs array driver command
| `2.1-385-g92c42396e <https://github.com/opensvc/opensvc/commit/92c42396e86da6699b6cfae73c434c0f5b8feb55>`_ Fix a misnamed variable in core.scheduler
| `2.1-385-g81cd05b36 <https://github.com/opensvc/opensvc/commit/81cd05b36b36aed3b28422457eb4ff601b2e8f53>`_ Add the "discard zero page" action to the hcs array driver
| `2.1-384-gf34b3f2fb <https://github.com/opensvc/opensvc/commit/f34b3f2fb2ce1d7d1ad72c8c68a7f05e712dcf5c>`_ Move daemon.data to utilities.journaled_data and drop json_delta
| `2.1-384-g1620d7b30 <https://github.com/opensvc/opensvc/commit/1620d7b30f6b52af82a308b254c096e92b43493d>`_ Implement standard api requests retryable conditions in the hcs array driver
| `2.1-383-g37fb8f1f4 <https://github.com/opensvc/opensvc/commit/37fb8f1f446e3e3a2a45c093472992d986d3231b>`_ Fix the hostgroup by hba lookup method of the hcs array driver
| `2.1-383-g4aa9b57bc <https://github.com/opensvc/opensvc/commit/4aa9b57bc6c6c4da4596ccf2d194125420215556>`_ Fix list append in JournaledData._set(["a", 3], "foo")
| `2.1-382-g9cb97a91b <https://github.com/opensvc/opensvc/commit/9cb97a91bcb5c838cb94278b9972b20cacff7f44>`_ Add second-granularity scheduling
| `2.1-382-g3d3f09ebb <https://github.com/opensvc/opensvc/commit/3d3f09ebbe50a9122384669c3c2ceb873a6b61c9>`_ Fix a misnamed variable in the hcs array driver
| `2.1-381-gc97686b35 <https://github.com/opensvc/opensvc/commit/c97686b351b4abcd906ccf14a81f2adba0e3d8d5>`_ Implement a requests retry decorator for the hcs array driver
| `2.1-381-g228d89673 <https://github.com/opensvc/opensvc/commit/228d89673f76c75a24d60e8059da8453aa0aad07>`_ Merge pull request #336 from cgalibern/add-orchestrator-tests
| `2.1-381-g3a81bffa1 <https://github.com/opensvc/opensvc/commit/3a81bffa14caf193fd4a55c3df6064a59160756d>`_ Use the node_data view instead of the full daemon status dataset
| `2.1-380-gc9224342a <https://github.com/opensvc/opensvc/commit/c9224342acac4d5bec28803c6d4d205ff683eca2>`_ Initial version of the hitachi command suite restapi pool and array drivers
| `2.1-380-gafe5d5a09 <https://github.com/opensvc/opensvc/commit/afe5d5a092e88ebc0b5aeb4bbcaacb97dfffc9bc>`_ Add more tests on monitor do()
| `2.1-380-g09ef20752 <https://github.com/opensvc/opensvc/commit/09ef20752b68432d88df7d7e84d7f4f18f3c1964>`_ Fix cluster data path in the resource restart code paths
| `2.1-379-g3299f1926 <https://github.com/opensvc/opensvc/commit/3299f19266b2e6feed9f9923f5523cb37cb78ac9>`_ Merge pull request #334 from cgalibern/test-orchestrator
| `2.1-379-g784a90054 <https://github.com/opensvc/opensvc/commit/784a90054cc8084ff3dad6e894c237c4a9772db7>`_ Use a copy of the daemon status dataset in daemon_status()
| `2.1-378-g8a848fb4b <https://github.com/opensvc/opensvc/commit/8a848fb4bb2021b531e7ce66bc4f7e0ef98784a9>`_ Add support of fs.type=flag resources to Darwin
| `2.1-378-g3da0a32c0 <https://github.com/opensvc/opensvc/commit/3da0a32c081054741e12d8f39e7b52768b955044>`_ Fix a possible stack in on_nodes_info_change()
| `2.1-377-gcd04db28d <https://github.com/opensvc/opensvc/commit/cd04db28dd04e9975b66df8ab6fa3cfcf0dc8883>`_ Add a OsvcJournaledData class
| `2.1-377-gb6a529c9a <https://github.com/opensvc/opensvc/commit/b6a529c9a0139b80ad79b50c2e9239e87ce482b9>`_ Fix non respect of parent@{nodename}
| `2.1-376-gd9e0b9684 <https://github.com/opensvc/opensvc/commit/d9e0b968417aa234796046703a4aa71099b35b47>`_ Add monitor orchestrator tests for start
| `2.1-376-g71c20ee1a <https://github.com/opensvc/opensvc/commit/71c20ee1a88f0700ce883bca54b33c0c3ea927bd>`_ Add the node data "config.csum" key
| `2.1-375-gbbac6d5f3 <https://github.com/opensvc/opensvc/commit/bbac6d5f31fd91521f07713e0417909ba7866c4b>`_ Fix possible monitor crash during daemon startup
| `2.1-375-g2a46d0a75 <https://github.com/opensvc/opensvc/commit/2a46d0a75eab7dcb97b96beca95965098bb4aa18>`_ Remove json_delta dependency from journaled_data
| `2.1-374-g5fe74a3a8 <https://github.com/opensvc/opensvc/commit/5fe74a3a84c2d1c5a76537bc1fb9a6996a3bfa95>`_ Misc monitor fixes
| `2.1-374-g2de674381 <https://github.com/opensvc/opensvc/commit/2de6743812744ecc84a890b045d7b7d7c3ff4da3>`_ Merge pull request #333 from cvaroqui/b2.1
| `2.1-373-gee7218cf8 <https://github.com/opensvc/opensvc/commit/ee7218cf8cdbf6d3dd518e2879adcfbcbfbab3b0>`_ Fix the JournaledData diff produced when creating a non-empty list
| `2.1-373-g03b3b947b <https://github.com/opensvc/opensvc/commit/03b3b947b464d742b04c27ee4192f6e4bdccb258>`_ Add a non-leader provisioner to docker/podman resources
| `2.1-372-gbb08a547b <https://github.com/opensvc/opensvc/commit/bb08a547b47b85b5606fa644711a35abb6e75ba6>`_ Port the daemon to JournaledData()
| `2.1-372-g33a41592f <https://github.com/opensvc/opensvc/commit/33a41592f20036615c233254a9071c422fc5f1b0>`_ Merge pull request #332 from cgalibern/fix-wait-parents
| `2.1-371-g6611196cd <https://github.com/opensvc/opensvc/commit/6611196cd52c580413750554d4529a5291020dc9>`_ Fix "om <remote obj path> edit" creating a local instance
| `2.1-371-g391ecfc67 <https://github.com/opensvc/opensvc/commit/391ecfc67a6a06a14e4a2c0a2058d90889555073>`_ Fix blocking wait_parent status during start
| `2.1-370-ga8f339521 <https://github.com/opensvc/opensvc/commit/a8f33952143bc8d9bd153a25afd677408fa988a7>`_ Don't use the GET /object_selector handler from Node if origin is daemon
| `2.1-370-g441bf4711 <https://github.com/opensvc/opensvc/commit/441bf471186a38b9a4dd4e463460c34582ec1ab3>`_ Merge pull request #330 from arnaudveron/fix-sunos-which-in-postinstall
| `2.1-369-gc84f8321b <https://github.com/opensvc/opensvc/commit/c84f8321b2a336f110c2e6c3dfaacc0686bfabce>`_ Fix Solaris10 which command bad behaviour
| `2.1-369-gaadbd0617 <https://github.com/opensvc/opensvc/commit/aadbd06171fa37f20152bf52084e57977b8b8cfa>`_ Add the JournaledData class
| `2.1-368-g9d78b36c4 <https://github.com/opensvc/opensvc/commit/9d78b36c433da4843bead3f3031a07a7b555d4e5>`_ Merge pull request #328 from arnaudveron/fix-docker-capabilities
| `2.1-366-g96768d137 <https://github.com/opensvc/opensvc/commit/96768d1372ec0436976cadcb0099b610bb010ad4>`_ Merge pull request #329 from cvaroqui/b2.1
| `2.1-365-g2ff21fd0a <https://github.com/opensvc/opensvc/commit/2ff21fd0a3cdc5f3323809fcb9b119aa1a8698b6>`_ Improve docker capabilities detection method
| `2.1-365-g0a15ec239 <https://github.com/opensvc/opensvc/commit/0a15ec2398cc0a420a6c9ac74259ec51d1c0caed>`_ Fix a stack on non json parsable "docker inspect" output
| `2.1-364-g3bfba8a9f <https://github.com/opensvc/opensvc/commit/3bfba8a9fd18ea84f17197d9a1a4abfb6d373927>`_ Merge pull request #326 from cgalibern/b2.1-cp-master
| `2.1-363-g93cc5104e <https://github.com/opensvc/opensvc/commit/93cc5104e6ac24cff5f820ef50ea2b70be402ca6>`_ [test] Add utf8 scenario during edit cfg or secret values
| `2.1-362-g9013f4c0d <https://github.com/opensvc/opensvc/commit/9013f4c0d64d1a7e1ff6c6306ae50ad3820352fe>`_ [test] Ensure string secret created from files can be edited
| `2.1-361-gbe4fb8a45 <https://github.com/opensvc/opensvc/commit/be4fb8a459afda48eda05b8b7c66a62cfaebb2d2>`_ [test] Add spec for edit cfg or secrets
| `2.1-360-g6b15c3e65 <https://github.com/opensvc/opensvc/commit/6b15c3e655e27babefcd691f9629f5fa8a05d2d8>`_ Fix resource preserved option
| `2.1-359-gef6173f07 <https://github.com/opensvc/opensvc/commit/ef6173f0770f2855ac1be55312ebbce1677353a0>`_ Disable '--dry-run' for config actions (deploy, create, update, delete, eval, set, get, unset)
| `2.1-358-g53fbe9a86 <https://github.com/opensvc/opensvc/commit/53fbe9a86c4490f64cc7e8dec91cc44b3e6de295>`_ 'om <svc> stop --dry-run' should not freeze service (fix)
| `2.1-357-g68a7e88d3 <https://github.com/opensvc/opensvc/commit/68a7e88d31c8294a8d5ef1b4c0d6946577616732>`_ [test] Test service default and custom status_schedule
| `2.1-356-g7f8aec6cb <https://github.com/opensvc/opensvc/commit/7f8aec6cbb27b24f04ae68bec0deb34967593dae>`_ [test] Test service print schedule is correct when tasks
| `2.1-355-gb75d87218 <https://github.com/opensvc/opensvc/commit/b75d872188a3c0fdaf1bbdea618b495386579070>`_ Update README.md
| `2.1-354-gaa85c4560 <https://github.com/opensvc/opensvc/commit/aa85c4560218bbadb2718384a1e3295eceffe550>`_ Merge pull request #324 from cgalibern/fix-daemon-start-after-os-crash
| `2.1-353-g2e07f1162 <https://github.com/opensvc/opensvc/commit/2e07f1162e7aaceb93799aff0380305f9effbe5d>`_ Fix daemon start failure (after node crash, when new pid is same a previous one)
| `2.1-352-g351c8e7cc <https://github.com/opensvc/opensvc/commit/351c8e7ccba384d6025ac5a9a2346c9e6d6f84b2>`_ Merge pull request #314 from cgalibern/Fix-invalid-drbd-mesh-capability
| `2.1-351-gad8282d20 <https://github.com/opensvc/opensvc/commit/ad8282d20b1c330215aa9680a66f35a5537637a7>`_ Fix some lint warning on drbd driver
| `2.1-350-g8db831ea2 <https://github.com/opensvc/opensvc/commit/8db831ea29c17c54279aa2f67ba662615a6aa2ed>`_ Fix invalid disk.drbd.mesh capability when module use version 8
| `2.1-349-ge263aa1d3 <https://github.com/opensvc/opensvc/commit/e263aa1d37d4fbb4dfbc318772a505833a05fd4c>`_ Merge pull request #313 from cgalibern/fix-shared-volume-restriction-and-nfs-hang
| `2.1-348-gf953d0d4b <https://github.com/opensvc/opensvc/commit/f953d0d4becba803b5886a93856e76b3329863f7>`_ PEP8 drivers.resource.volume
| `2.1-347-gcb002d2fc <https://github.com/opensvc/opensvc/commit/cb002d2fc9eb02d26cb9b07c2088348c919518cc>`_ Cleanup dead code since #33fc4e4fb74d80412d45157d436a6d737aa49855
| `2.1-346-g0b320dff2 <https://github.com/opensvc/opensvc/commit/0b320dff2ba1fa55ab2c88eb5dbfc1c1cb1df888>`_ Fix a share.nfs hang on Linux on showmount
| `2.1-345-g33fc4e4fb <https://github.com/opensvc/opensvc/commit/33fc4e4fb74d80412d45157d436a6d737aa49855>`_ Relax shared volumes claim restrictions
| `2.1-344-gf8f4bb7c5 <https://github.com/opensvc/opensvc/commit/f8f4bb7c56018f0506035538bd5813a8741ce440>`_ Merge pull request #310 from cgalibern/fix-convert-size-B
| `2.1-343-g91f593a56 <https://github.com/opensvc/opensvc/commit/91f593a5609d713f10bd27c6cfb8460e459f9a4e>`_ Accept 'B' unit during convert_size
| `2.1-342-gfb2e1356d <https://github.com/opensvc/opensvc/commit/fb2e1356d62221d9dcded722214b2ff9ee24e5ab>`_ Merge pull request #312 from cgalibern/fix-swap-sol11-4
| `2.1-341-g02eda1f4f <https://github.com/opensvc/opensvc/commit/02eda1f4fa121c1e32d161076aefae97bbc2a0b8>`_ Fix stats_meminfo error on Solaris 11.4
| `2.1-340-g39d7f503e <https://github.com/opensvc/opensvc/commit/39d7f503e4035211fdf0144c6d8b3e05d2025b0c>`_ Merge pull request #308 from cvaroqui/b2.1
| `2.1-339-g1e7cf4bae <https://github.com/opensvc/opensvc/commit/1e7cf4bae86068d96c0e5f63aa6b1236c47c068a>`_ Don't alert on missing prov kw on section_kwargs() if provision=false
| `2.1-338-gee674d14f <https://github.com/opensvc/opensvc/commit/ee674d14ff7e68769d14b0dfa20c3153f63632b8>`_ Fix the provision and unprovision boolean keyword
| `2.1-337-gd01c60eb6 <https://github.com/opensvc/opensvc/commit/d01c60eb6cd6c9144980ad87a7cbe5c0e10ad31a>`_ Fix resources staying in P state even we up
| `2.1-336-gdc8704635 <https://github.com/opensvc/opensvc/commit/dc87046350bbd41e7b8e4b12767f890705818b1d>`_ Merge pull request #307 from cvaroqui/b2.1
| `2.1-335-g470dbe204 <https://github.com/opensvc/opensvc/commit/470dbe20455e4ea16d29f2e1900857c6e89d6c82>`_ Support more uptime format in the parser called from pushasset
| `2.1-334-gba8105bb3 <https://github.com/opensvc/opensvc/commit/ba8105bb3d6a5f2b7b69f1432f00b5ac31033dbb>`_ Remove a f"" use from the volume resource driver
| `2.1-333-gd357b949b <https://github.com/opensvc/opensvc/commit/d357b949b976bac8f4386112897ba414a28a1c70>`_ Fix undue volume instance stop on user instance's stop
| `2.1-332-g6a2053910 <https://github.com/opensvc/opensvc/commit/6a20539106b0af962fbe052249f90c45ddd2d88a>`_ Merge pull request #306 from cvaroqui/b2.1
| `2.1-331-g1f13b004f <https://github.com/opensvc/opensvc/commit/1f13b004f0a423101f8f7811879931e14ce056e8>`_ Fix missing resource status "info" key for data-derived resources
| `2.1-330-g6a78e9dec <https://github.com/opensvc/opensvc/commit/6a78e9dec3cb21995d9fdcff35420b7f49b18623>`_ Add the <name>.svc.<nodename>.node.<clustername> A records to the cluster DNS
| `2.1-329-g2936fb1f6 <https://github.com/opensvc/opensvc/commit/2936fb1f6e188c01e78427f9d60150ffe7cab3d1>`_ Fix a potential stack in daemon.dns
| `2.1-328-g2befdb657 <https://github.com/opensvc/opensvc/commit/2befdb65799bd9b4e97bb8a07f3d7ab294b9eb66>`_ Remove trailing whitespaces from daemon.dns
| `2.1-327-g8d88c9f60 <https://github.com/opensvc/opensvc/commit/8d88c9f60a1b5f0be56ba78abd569527fd141435>`_ Merge pull request #304 from cgalibern/for-integration
| `2.1-326-g5f6b8ffea <https://github.com/opensvc/opensvc/commit/5f6b8ffea3e5df8876f0c02d251d71d40bba6e10>`_ Fix declaration for auth, kv_store and requester for python 2
| `2.1-325-gec1399ab3 <https://github.com/opensvc/opensvc/commit/ec1399ab3315b76a50fedef6f90566be5f36b0ee>`_ Fix resource selector using --tags
| `2.1-324-g376446bc8 <https://github.com/opensvc/opensvc/commit/376446bc8b851a3ede2cb6121422271d6d77849b>`_ Add noop_log
| `2.1-323-g9cfa6b2bb <https://github.com/opensvc/opensvc/commit/9cfa6b2bb22fdbc87c130b3b8812876649ba1b91>`_ Make site drivers as importable module
| `2.1-322-g18423b9ab <https://github.com/opensvc/opensvc/commit/18423b9ab588a4e0e26fd6742b921afa66480558>`_ Add the 'log_handlers' kwarg to all BaseSvc derived classes
| `2.1-321-g042e15abf <https://github.com/opensvc/opensvc/commit/042e15abf5e5ed63cdd93c405f91ba9c33a19f76>`_ Fix api client for python2
| `2.1-320-g4b9576818 <https://github.com/opensvc/opensvc/commit/4b9576818f68459c269d4a5e259eff23cd89330b>`_ Log unexpected stacks from resource set actions
| `2.1-319-gaecbc67ba <https://github.com/opensvc/opensvc/commit/aecbc67bafd0e4bfae711dd7ca15d9a5472aa417>`_ AuthFactory use now auth_provider.data_to_header() to construct header
| `2.1-318-g251778cf1 <https://github.com/opensvc/opensvc/commit/251778cf13b9d0e31a2d2f8204e2873144773232>`_ Fix KvSec.create (simply serialize value to sec key object)
| `2.1-317-g362333560 <https://github.com/opensvc/opensvc/commit/36233356074431d1329bab8a37a9d908caf769c2>`_ Add requester utilities for site drivers
| `2.1-316-g136b7bb2d <https://github.com/opensvc/opensvc/commit/136b7bb2d80f804109712971cf1aff4955cfd446>`_ Create an authorization header factory that use a kv_store
| `2.1-315-g2393e70ff <https://github.com/opensvc/opensvc/commit/2393e70ffb13403c39e39b7ffc3f78bae8aadbf4>`_ Add kv_store utilities
| `2.1-314-g3bc3f41f0 <https://github.com/opensvc/opensvc/commit/3bc3f41f08d77e472120181d1aa85958a43c6a44>`_ Add public method to retrieve sec or cfg object
| `2.1-313-gc0ca65c88 <https://github.com/opensvc/opensvc/commit/c0ca65c888b9f248ee8886b5b49b16278a08fe67>`_ Allow {node.labels.l} and {node.env.v} references
| `2.1-312-gd10c06879 <https://github.com/opensvc/opensvc/commit/d10c0687923df5ae0208c2159008f62d2bb9f363>`_ Fix a stack when fs user or group name does not exist
| `2.1-311-gcebfdf1a7 <https://github.com/opensvc/opensvc/commit/cebfdf1a77aee93f1a475f87b5fc1d9ff499903b>`_ Add user/group/perm keywords to the BaseFs driver
| `2.1-310-g09f2f025d <https://github.com/opensvc/opensvc/commit/09f2f025dfda8bd355da17bbe7f67e49b703174b>`_ Support "_" in drivers base name
| `2.1-309-g1a4307765 <https://github.com/opensvc/opensvc/commit/1a43077652601c6dbb362b84eda103c1a1b815fa>`_ Merge pull request #303 from arnaudveron/fix-dns-ptr
| `2.1-308-g05ee9130a <https://github.com/opensvc/opensvc/commit/05ee9130a1b661ac07e515870480a7e3612ea68d>`_ Fix PTR records
| `2.1-307-g7b866b0ba <https://github.com/opensvc/opensvc/commit/7b866b0ba4e757789aa03abf7c681a7502600e9e>`_ Merge pull request #298 from cgalibern/site-driver-import-fix
| `2.1-306-gda439f1a0 <https://github.com/opensvc/opensvc/commit/da439f1a0a1d143ed0b8ad24cac7c11adb2fab53>`_ Update driver import search order for site-opensvc drivers
| `2.1-305-g4a9db7e13 <https://github.com/opensvc/opensvc/commit/4a9db7e13326c8fdbed6edbe09544fc3a9420d9a>`_ Merge pull request #259 from cgalibern/remove-unused-import-on-object-action-handler
| `2.1-304-gad20e3915 <https://github.com/opensvc/opensvc/commit/ad20e3915dd2c47533b0e56d7dcde8babb74bcd5>`_ Remove unused import from action handler
| `2.1-303-g20be2563c <https://github.com/opensvc/opensvc/commit/20be2563c24c9fca9d57f996d0483a5707de645f>`_ Merge pull request #296 from cvaroqui/b2.1
| `2.1-302-g4bb095d99 <https://github.com/opensvc/opensvc/commit/4bb095d99c42f75ad4bb108c34fe22ee283ca537>`_ Fix the current value parser for the pg_oom_control keyword
| `2.1-301-gaf973a3df <https://github.com/opensvc/opensvc/commit/af973a3df55f3c9db7be02e0bfa76c88e46be9f9>`_ Merge pull request #295 from cvaroqui/b2.1
| `2.1-300-gdb261184d <https://github.com/opensvc/opensvc/commit/db261184d9fc0046c896da4af84c6ee138043f91>`_ Fix undue pg update on sibbling services
| `2.1-299-g2e3c68b30 <https://github.com/opensvc/opensvc/commit/2e3c68b30ba1023bc0f5f171b258d40e4090a44a>`_ Fix the "next run" attr of "print schedule" not empty when schedule is empty
| `2.1-298-g9c7fe6ac2 <https://github.com/opensvc/opensvc/commit/9c7fe6ac25e027878ab9a7625ca3b3368aff27e6>`_ Sort the "print schedule" output by configuration parameter name
| `2.1-297-gc3d8f6cc9 <https://github.com/opensvc/opensvc/commit/c3d8f6cc9496d97b3b05612c0c348d101a5ea036>`_ Fix a resource info clear issue at the begining of tasks run action
| `2.1-296-g4c4d8a08e <https://github.com/opensvc/opensvc/commit/4c4d8a08e43e8a4169656b11df5a2ebc8edc8cec>`_ Merge pull request #294 from cgalibern/fix-test-daemon-transient-failure
| `2.1-295-g2f62fa86e <https://github.com/opensvc/opensvc/commit/2f62fa86ed96e4e353c1b49a1fdad987a285cd9d>`_ [test-gitlab] Ensure /usr/bin/true and /usr/bin/false exists during tests
| `2.1-294-g19a65be6e <https://github.com/opensvc/opensvc/commit/19a65be6e2e36dc6c0ec428969e6741ef466d4de>`_ [test] Add more small time to mock daemon_start_native
| `2.1-293-g69d6b60dc <https://github.com/opensvc/opensvc/commit/69d6b60dc8dc9716bcab6790ba2cf28c9594a37d>`_ Pep8 extconfig.py
| `2.1-292-gf4c50178c <https://github.com/opensvc/opensvc/commit/f4c50178cd3fd0462dc70fa4d33a2555ad10aa68>`_ Merge pull request #291 from cgalibern/fix-auto-shutdown-trigger
| `2.1-291-g7af2b3bf0 <https://github.com/opensvc/opensvc/commit/7af2b3bf022e569ac0345c866504294ac7156cd0>`_ Fix encap action failure (regression in 20cfc94ff39f6f774e4600a9e30a6f242612e644)
| `2.1-290-g6dad56dbd <https://github.com/opensvc/opensvc/commit/6dad56dbd46ab1909673aa90d9f41b248190dc80>`_ [test] Reduce test time for ip
| `2.1-289-g039cfe44c <https://github.com/opensvc/opensvc/commit/039cfe44c7596eff727e802ff894bb7b635c11ad>`_ [test] Ensure service default hook is called only once even if multiple resource
| `2.1-288-g40bb52bf3 <https://github.com/opensvc/opensvc/commit/40bb52bf3e098e238b36a9fcc00d4138c6e5c44c>`_ Add service hooks for startstandby action
| `2.1-287-gbe3d96e30 <https://github.com/opensvc/opensvc/commit/be3d96e308c4699c23f3f8b26873e80b8576f34a>`_ [travis] Only report coverage for python3
| `2.1-286-g8c8150664 <https://github.com/opensvc/opensvc/commit/8c8150664b3678d2bfddd2c2747b8a7d08c30979>`_ Remove dead code from action_triggers
| `2.1-285-g5f5035f19 <https://github.com/opensvc/opensvc/commit/5f5035f19deb3937e9395c53aecb32f57978ebaa>`_ [test] fix run task with ' ; ' in command (python2)
| `2.1-284-g75aef98af <https://github.com/opensvc/opensvc/commit/75aef98afed263a7b48f6a8dedecb71c082cb4cc>`_ Re-factorize action_triggers
| `2.1-283-g4c3d854ea <https://github.com/opensvc/opensvc/commit/4c3d854eaf15c437ce23c1741a526dfb15587426>`_ [test] Add run task tests
| `2.1-282-g85ba2e6ae <https://github.com/opensvc/opensvc/commit/85ba2e6ae6441e1173bfc404beba67f2da1ff5da>`_ [test] Ensure tasks are optional by default
| `2.1-281-gd029341ea <https://github.com/opensvc/opensvc/commit/d029341ead609e56027779f6bfac590d0b6d3e09>`_ [test] Remove invalid sections DEFAULT from node.conf fixture
| `2.1-280-gf86b1e6f0 <https://github.com/opensvc/opensvc/commit/f86b1e6f00887747cbd28aa211ea69a3872d2ff8>`_ Allow complex pre or blocking_pre commands for node auto reboot
| `2.1-279-g994e7fc21 <https://github.com/opensvc/opensvc/commit/994e7fc213bd34507c2ee66a3033706a8eef781e>`_ [Test] Allow mixed use of has_cluster_config & has_node_config fixtures
| `2.1-278-ge39b65434 <https://github.com/opensvc/opensvc/commit/e39b654349ad6203a6795a2efb1f92efe8e09ca4>`_ [test] Ensure auto_reboot respect node reboot.once setting
| `2.1-277-g53ede9c5a <https://github.com/opensvc/opensvc/commit/53ede9c5afd4f244a5d046fe0381472e89fc3d93>`_ Fix auto_reboot failure when reboot.blocking_pre, or reboot.pre defined
| `2.1-276-gd43a5cc89 <https://github.com/opensvc/opensvc/commit/d43a5cc89cbba500dd78120585a09f0419919227>`_ Merge pull request #292 from cvaroqui/b2.1
| `2.1-275-gb21ef9ae7 <https://github.com/opensvc/opensvc/commit/b21ef9ae77e29a2d393c72c55c556b7d8798691d>`_ Factorize more selector functions in utilities.selector
| `2.1-274-ga9c945fe6 <https://github.com/opensvc/opensvc/commit/a9c945fe6ee202dbf3bdb0a54eb631b99fbaed58>`_ Factorize selector fragment splitting code in utilities.selector
| `2.1-273-g97a5aaf83 <https://github.com/opensvc/opensvc/commit/97a5aaf83d97fc28eb6439e52a6da3270b1d2872>`_ Factorize the matching() funtion in selectors in a new utilities.selector module
| `2.1-272-g6337224ed <https://github.com/opensvc/opensvc/commit/6337224ed4dcfc4e0dd1c771b30edf50ae6861aa>`_ Move the PgMixin in its own submodule core.objects.pg
| `2.1-271-ga2b26bf39 <https://github.com/opensvc/opensvc/commit/a2b26bf3924f13724df9860c47e49a5ee63acdd1>`_ Factorize object path globing algorithm in utilities.naming
| `2.1-270-g1b9bce85a <https://github.com/opensvc/opensvc/commit/1b9bce85ac9e946d452890dc61cadabd43771610>`_ Use a walk()-based implementation of pids() in drivers.pg.linux
| `2.1-269-g33f716b6e <https://github.com/opensvc/opensvc/commit/33f716b6e45c54322a1d26c2523ef9cf6cbdec9d>`_ Add the the "nscfg" subsystem to the "om" command
| `2.1-268-gd0828448e <https://github.com/opensvc/opensvc/commit/d0828448e52f87176ec86eda0008a7f22ad9d626>`_ Fix missing s/cluster/nscfg/ in the nscfg command parser
| `2.1-267-gc02802d36 <https://github.com/opensvc/opensvc/commit/c02802d369a692b16ece5b2247e6078242d99c46>`_ Fix a print message in bin/pkg/make_doc
| `2.1-266-ga7c4a31f0 <https://github.com/opensvc/opensvc/commit/a7c4a31f098f8def9eac2f484c92c89d2f0bd43b>`_ Add the RBAC rule allowing squatter only to create/update nscfg objects
| `2.1-265-g614ac38f7 <https://github.com/opensvc/opensvc/commit/614ac38f7ca241d49a4e9a327952e0b47e2fff08>`_ Object selector policy changes
| `2.1-264-g3bf4a22e5 <https://github.com/opensvc/opensvc/commit/3bf4a22e50425ccde89c6ca786166b802f118835>`_ Change the "no service selected" message to "no object selected"
| `2.1-263-ga42954d7f <https://github.com/opensvc/opensvc/commit/a42954d7f6c5f035c5f9adaa5a233e1a04ed15a1>`_ Add self.pg test before using its methods
| `2.1-262-gaf9d23b60 <https://github.com/opensvc/opensvc/commit/af9d23b60aa351f614fa538f1de969862da0c43e>`_ Add nscfg kind objects
| `2.1-261-ge81a97f7e <https://github.com/opensvc/opensvc/commit/e81a97f7eea06efb6de384e9c9aa34face93f1ad>`_ Fix the [DEFAULT#rindex] instead of [DEFAULT] in doc templates
| `2.1-260-gfd1f4b3a0 <https://github.com/opensvc/opensvc/commit/fd1f4b3a06fa32e86f3b2293fd931a4b00fa1a8e>`_ Merge pull request #290 from cvaroqui/b2.1
| `2.1-259-gff618651a <https://github.com/opensvc/opensvc/commit/ff618651af6e54ef1eb9a29b5ea767262af8ecd4>`_ Add the "interval" option to all heartbeat drivers configuration syntax
| `2.1-258-gab628e90b <https://github.com/opensvc/opensvc/commit/ab628e90b19f8524db8f563d56c05e703bc75fef>`_ Merge pull request #288 from cvaroqui/b2.1
| `2.1-257-ga80dca736 <https://github.com/opensvc/opensvc/commit/a80dca736e3963f3ae2f96ecd6b3316b1cca8a21>`_ Log the reason of find_pool() not returning a pool
| `2.1-256-g25dbca40a <https://github.com/opensvc/opensvc/commit/25dbca40a06786898c48f8ace207ea46aaf44cfb>`_ Add the "pg update" svc action
| `2.1-255-g409093867 <https://github.com/opensvc/opensvc/commit/4090938677ca37c5628e737e00df35a3c53bc86a>`_ Merge pull request #286 from cvaroqui/b2.1
| `2.1-254-g20cfc94ff <https://github.com/opensvc/opensvc/commit/20cfc94ff39f6f774e4600a9e30a6f242612e644>`_ Log finer origin of service action in encap nodes
| `2.1-253-g49fadf71d <https://github.com/opensvc/opensvc/commit/49fadf71da97ab7be9b415a21160530d1b379f95>`_ Add "DEFAULT.stat_timeout" to the svc dictionnary
| `2.1-252-g920f8fbb1 <https://github.com/opensvc/opensvc/commit/920f8fbb11064963ae9c8740d0c5d9feda094133>`_ Fix the broken references check in "validate config" code path
| `2.1-251-g0fc2284e5 <https://github.com/opensvc/opensvc/commit/0fc2284e5d5a525739316fbf5141a869f3cf2102>`_ Merge pull request #285 from cvaroqui/b2.1
| `2.1-250-g150710541 <https://github.com/opensvc/opensvc/commit/1507105411448b53cb8ad9baf4f1a7a6867baf5b>`_ Fix the freenas pool driver
| `2.1-249-gac7fbfbcb <https://github.com/opensvc/opensvc/commit/ac7fbfbcb3649263cff2f20885ca3b36273ad80c>`_ Merge pull request #284 from cvaroqui/b2.1
| `2.1-248-gb5ee1334b <https://github.com/opensvc/opensvc/commit/b5ee1334b423402c8221951c6de2e3b0cd1e20a1>`_ Fix a warning stack on svc action when args contain a "%"
| `2.1-247-gdc18cc86e <https://github.com/opensvc/opensvc/commit/dc18cc86eebad2f2ce1a16c7f622d55c6916b638>`_ Merge pull request #283 from cvaroqui/b2.1
| `2.1-246-gd111600c7 <https://github.com/opensvc/opensvc/commit/d111600c73d1964ec9e82acbaad34b663419f00c>`_ Add the comment keyword in all data sections
| `2.1-245-g805295a3e <https://github.com/opensvc/opensvc/commit/805295a3e3e60672b53c966203fd90abb42b4435>`_ Merge pull request #282 from cvaroqui/b2.1
| `2.1-244-gf876023fc <https://github.com/opensvc/opensvc/commit/f876023fc49a619e467905f4c6e930d96316a79b>`_ Fix sync.srdfs promote_devs_rw() when syminq does not report /dev/mapper/ devs
| `2.1-243-g80dc7a375 <https://github.com/opensvc/opensvc/commit/80dc7a3753e840f2e3c09706fd653c06227fb56a>`_ Merge pull request #279 from cvaroqui/b2.1
| `2.1-242-g1cbccfb48 <https://github.com/opensvc/opensvc/commit/1cbccfb48430dc51463cecd7f5d8759c4a19b465>`_ Adapt the "resize zvol" freenas array driver command to v2.0 api
| `2.1-241-g75aced6d4 <https://github.com/opensvc/opensvc/commit/75aced6d418b8f1e4af35451f29172c216ad0d83>`_ Fix the unmap command of the freenas array driver
| `2.1-240-g15fe6aa2d <https://github.com/opensvc/opensvc/commit/15fe6aa2df80daeb01020898f645d65b6b07160b>`_ Merge pull request #278 from cvaroqui/b2.1
| `2.1-239-g09afa2f23 <https://github.com/opensvc/opensvc/commit/09afa2f2375d2e55a26065e3ad4d04ffceff3c98>`_ Fix the "iscsi add targetgroup" command of the freenas driver
| `2.1-238-g57b32cbd3 <https://github.com/opensvc/opensvc/commit/57b32cbd3a372e8b4718ca566dd425284b4245bb>`_ Merge pull request #277 from cvaroqui/b2.1
| `2.1-237-gc81e5b5c4 <https://github.com/opensvc/opensvc/commit/c81e5b5c4a50654031b1ec211dfe4c6495c12d4f>`_ Add a per-instance "preserved" attribute in the status structure
| `2.1-236-gbc813fc7f <https://github.com/opensvc/opensvc/commit/bc813fc7f1320aa3d7b6ce8c6ddc5c21d4b44b62>`_ Merge pull request #275 from cvaroqui/b2.1
| `2.1-235-g39d589950 <https://github.com/opensvc/opensvc/commit/39d5899500c1906a189799391c2c4e849ff533c1>`_ Use (ns0, ns1, ...) as the nameserver names in the dns records
| `2.1-234-gacc037e4e <https://github.com/opensvc/opensvc/commit/acc037e4e771bd136fd945997023194168b3a811>`_ Merge pull request #273 from cvaroqui/b2.1
| `2.1-233-g8033067d6 <https://github.com/opensvc/opensvc/commit/8033067d6c1f6cd7f6a25d17f86e5a2f83e53672>`_ Align the POST /node_action result with POST /object_action
| `2.1-232-g5461a57af <https://github.com/opensvc/opensvc/commit/5461a57af9603b3ab90f4d2ba346eb045fa3323f>`_ Merge pull request #272 from arnaudveron/b2.1
| `2.1-231-g8f3ef828e <https://github.com/opensvc/opensvc/commit/8f3ef828e37efa5eb85154e09655bc91cf6ae6ed>`_ Add a GET /daemon_actions handler
| `2.1-230-g53675dc06 <https://github.com/opensvc/opensvc/commit/53675dc06d73bf9e65c180eaa129355d3b931a34>`_ Update status.json when starting to run a task
| `2.1-229-ge5a960a0c <https://github.com/opensvc/opensvc/commit/e5a960a0c01c6b863214217826ac4c2c1cab2327>`_ Merge pull request #270 from arnaudveron/fix-sync-api
| `2.1-228-gfff065c5c <https://github.com/opensvc/opensvc/commit/fff065c5cf5c9a4e28a1b07e9edfaa4515ba44a4>`_ Handle exception raised when only one node remains in the cluster
| `2.1-227-g93f97c255 <https://github.com/opensvc/opensvc/commit/93f97c255e89a9ba28e54c8fc34c7e7d676aef70>`_ Merge pull request #267 from cvaroqui/b2.1
| `2.1-226-gd53ba9e25 <https://github.com/opensvc/opensvc/commit/d53ba9e25f4ac11c15deaa388abe412098aff755>`_ Document env section override via 'data' option in POST /object_create
| `2.1-225-g2b6cdde4a <https://github.com/opensvc/opensvc/commit/2b6cdde4ae0460285a4de2ded0033c086f02f4f6>`_ Merge pull request #266 from cvaroqui/b2.1
| `2.1-224-gacd5a4c9a <https://github.com/opensvc/opensvc/commit/acd5a4c9ab096c9497e034b4e0742403c1e46e3f>`_ Fix the "daemon_join" action via the POST /node_action handler
| `2.1-223-gf2b117c1c <https://github.com/opensvc/opensvc/commit/f2b117c1cff8929dc622c988c5880e82839d3f19>`_ Merge pull request #265 from cgalibern/add-split-handlers-rename
| `2.1-222-gc92a9e2da <https://github.com/opensvc/opensvc/commit/c92a9e2da41145b0e698eae31d31abf2eae6d42e>`_ Move cluster.split_action to node.split_action
| `2.1-221-g3b77bcc5f <https://github.com/opensvc/opensvc/commit/3b77bcc5fceea47b56702f7038bc36640775b48d>`_ Merge pull request #263 from cgalibern/add-split-handlers
| `2.1-220-g3c51e0190 <https://github.com/opensvc/opensvc/commit/3c51e0190904d101acf3de608256161647184159>`_ Add alternate 'reboot' split action when split brain cluster node has no quorum
| `2.1-219-gf72070566 <https://github.com/opensvc/opensvc/commit/f7207056610e3d45c9a10bd5edba83172bcbb805>`_ Merge pull request #262 from cvaroqui/b2.1
| `2.1-218-g9b5ca2cb5 <https://github.com/opensvc/opensvc/commit/9b5ca2cb51053da833acb2317f88c0fee4164e13>`_ Add "GET /daemon_relay_status" as a valid route to the relay_status handler
| `2.1-217-g105597da2 <https://github.com/opensvc/opensvc/commit/105597da206f1270ec61a7537ebbc4c5fe31fe93>`_ Merge pull request #260 from cvaroqui/b2.1
| `2.1-216-g89ac45624 <https://github.com/opensvc/opensvc/commit/89ac456243e5c89459392de9bb597d06dcc9f346>`_ Add the limit_ keywords in the task.host resources
| `2.1-215-g004351eb5 <https://github.com/opensvc/opensvc/commit/004351eb515d00f49df12ae434a0f36d52416658>`_ Add session_id and pid to async POST /object_action result data
| `2.1-214-g5f109edcf <https://github.com/opensvc/opensvc/commit/5f109edcf291626bbe178644c1ccb46dbf3f0f96>`_ Fix a use before set bug in the DEFER fallback codepath of extconfig
| `2.1-213-g2abdd51b6 <https://github.com/opensvc/opensvc/commit/2abdd51b62007a393a36a11139f978cb5062b495>`_ Add the DEFAULT.registry_creds kw to the svc dictionnary
| `2.1-212-g9e0c0bf6c <https://github.com/opensvc/opensvc/commit/9e0c0bf6c0c5a6d0e8f6c7330c280c904a00d6ef>`_ Merge pull request #246 from arnaudveron/b2.1
| `2.1-211-gfeff11ad0 <https://github.com/opensvc/opensvc/commit/feff11ad0b1bc14b08916ea3a1353675b5c132d9>`_ Merge remote-tracking branch 'upstream/b2.1' into averon-pr-246
| `2.1-209-ged85ed861 <https://github.com/opensvc/opensvc/commit/ed85ed861b5966ba16a9e44a400c8cbb5c9b51b1>`_ Merge pull request #254 from cgalibern/fix-handler-daemon-restart
| `2.1-208-gc9ce9f04d <https://github.com/opensvc/opensvc/commit/c9ce9f04d2d22335d203358af6fb91d3c5d03a5b>`_ Fix om daemon restart --node 'xxx' systemd opensvc-agent desynchronization
| `2.1-207-gf9361128f <https://github.com/opensvc/opensvc/commit/f9361128f8e33a0957f2ff73b60e832fba58e030>`_ Merge pull request #257 from cvaroqui/b2.1
| `2.1-206-ga41586468 <https://github.com/opensvc/opensvc/commit/a41586468d42b63bea8ea09564757e519088c15f>`_ Prefer setfattr for the fs writable test instead of open-write <mnt>/.opensvc
| `2.1-205-g2e60c8ce2 <https://github.com/opensvc/opensvc/commit/2e60c8ce2beb6ad95388a7e7c1a4db04947e95f7>`_ Merge pull request #253 from cvaroqui/b2.1
| `2.1-204-g5dd83142d <https://github.com/opensvc/opensvc/commit/5dd83142d5404648e516ba07122dda88a793f458>`_ Update the svcmon help message to reflect the stdby symbols changes
| `2.1-203-g6132de6bc <https://github.com/opensvc/opensvc/commit/6132de6bce37c6ef6f301ab7db1c4340bfdf614f>`_ Merge pull request #252 from cvaroqui/b2.1
| `2.1-202-gfd0750ae3 <https://github.com/opensvc/opensvc/commit/fd0750ae3fbae9a84b599d37907273c5ede7af8e>`_ Fix a potential stack on api result parsing
| `2.1-201-gce490f6ca <https://github.com/opensvc/opensvc/commit/ce490f6ca6d14db369191ca5c616326fe30753d4>`_ Fix a stack in monitor reconfigure
| `2.1-200-g35c6baa1a <https://github.com/opensvc/opensvc/commit/35c6baa1a45ec706a3527198bd3d183184d18cc1>`_ Move volume_env_data() from Pool to Volume resource
| `2.1-199-gcde4b6147 <https://github.com/opensvc/opensvc/commit/cde4b61470cc4d9208680796cbd9dde59916fb7c>`_ Move pool volume_env parsing from volume resource to the base pool class
| `2.1-198-g6675596a8 <https://github.com/opensvc/opensvc/commit/6675596a822fbe1801b8427a52d0e1427b4734ab>`_ Don't confuse a no-cf volatile object with a remote object in print_config_data()
| `2.1-197-gb02c8fff6 <https://github.com/opensvc/opensvc/commit/b02c8fff6c761569a2f7695d5a993deaef917d64>`_ Don't clear BaseSvc::cd on BaseSvc::unset_all_lazy() for volatile objects
| `2.1-196-g694b44426 <https://github.com/opensvc/opensvc/commit/694b4442662355bfff5161cea7aa40120b7c01c8>`_ Don't log an error on every action when a drbd res file does not exist
| `2.1-195-gb7eb3e29f <https://github.com/opensvc/opensvc/commit/b7eb3e29f42929e4a343fc352f2bba7f81d9a5ee>`_ Don't log from BaseSvc::_update()
| `2.1-194-g53b742ccb <https://github.com/opensvc/opensvc/commit/53b742ccb61f21f351f9801c529d251058b90f34>`_ Merge pull request #251 from cvaroqui/b2.1
| `2.1-193-g4ceefa301 <https://github.com/opensvc/opensvc/commit/4ceefa3018fdad8455f20e3c95d2c432bf11b4ed>`_ Fix image pulling when no registry_creds is specified
| `2.1-192-g2297fdde6 <https://github.com/opensvc/opensvc/commit/2297fdde63458f08f6931f57e53a1ce5c960704d>`_ Merge pull request #250 from cvaroqui/b2.1
| `2.1-191-g17e4d7d88 <https://github.com/opensvc/opensvc/commit/17e4d7d8887102f190d50bb347b6e6c89efedf22>`_ Avoid starting per-object status refresh while initial status commands still run
| `2.1-190-g262cb8c1e <https://github.com/opensvc/opensvc/commit/262cb8c1eacb482997ea497077304b7db470e91b>`_ Merge pull request #249 from cvaroqui/b2.1
| `2.1-189-g741eadbbc <https://github.com/opensvc/opensvc/commit/741eadbbc6d94a05d8eb58072d64fea4eb8b212e>`_ Fix tcp ~15s hangs in containers tcp connections
| `2.1-188-gaee727e53 <https://github.com/opensvc/opensvc/commit/aee727e5320ed48c0c295822520d2eac628c1c07>`_ Merge pull request #248 from cvaroqui/b2.1
| `2.1-187-gd2f7472ba <https://github.com/opensvc/opensvc/commit/d2f7472ba4d8d19ca69f09af4a34fa749c7ee05d>`_ Fix fs#1.mnt reference
| `2.1-186-g7433b9fb5 <https://github.com/opensvc/opensvc/commit/7433b9fb5a226d9979faf3463711eec468ca31be>`_ Merge pull request #247 from cvaroqui/b2.1
| `2.1-185-gfa2ec5941 <https://github.com/opensvc/opensvc/commit/fa2ec59415ad73e5863feb69eaa71aae73bcd226>`_ Add the {volume#<n>.mnt} reference
| `2.1-184-g613353da0 <https://github.com/opensvc/opensvc/commit/613353da06cb229d61737975f99531d1df644348>`_ Fix a pylint3 error in the freenas array driver
| `2.1-183-g29690a81e <https://github.com/opensvc/opensvc/commit/29690a81e5add63c93233af6e27fbbc13945519c>`_ Settle udev before running a "multipath -f <dev>" to avoid the "in use" error
| `2.1-182-g518b36f29 <https://github.com/opensvc/opensvc/commit/518b36f2957eb06f94950cd33b740ba6134516d0>`_ Move the freenas array driver to v2 rest api
| `2.1-181-g8252576fe <https://github.com/opensvc/opensvc/commit/8252576fe038aa4b8aaecdb22ffcf6aaa3db33be>`_ Don't use comma as a mapping separator in pool logs
| `2.1-181-g63b38fb86 <https://github.com/opensvc/opensvc/commit/63b38fb86cf94f3fc3907092abbbafe2b9290e40>`_ Fix exception raised when tag is not found
| `2.1-180-gf50d43e01 <https://github.com/opensvc/opensvc/commit/f50d43e010d156561b618fb763858b1593546f7f>`_ Merge pull request #244 from cgalibern/b2.1-cp-master
| `2.1-179-g7ff996107 <https://github.com/opensvc/opensvc/commit/7ff996107dc8e8f1a2ca7ea14345eb118c307115>`_ Update listener stats session alive with thead id
| `2.1-178-gd7e32fa2d <https://github.com/opensvc/opensvc/commit/d7e32fa2d9536110a5549eaba32a9eca4b04eae2>`_ Implement Node().get_tid() for Solaris
| `2.1-177-g563038f94 <https://github.com/opensvc/opensvc/commit/563038f94fd0874eeba2dc325336b97446b453c4>`_ Merge pull request #241 from cgalibern/fix-daemon-start-when-already-started
| `2.1-176-gbe59fec21 <https://github.com/opensvc/opensvc/commit/be59fec215d8b5f410e5311ef9dbbe3a11c3d0fb>`_ [test] Fix missing assert on daemon lock show has correct output
| `2.1-175-g28b4d757a <https://github.com/opensvc/opensvc/commit/28b4d757a0bd9987deb41d6a59dcee14f99ec599>`_ [test] Fix missing assert on daemon lock show has correct output
| `2.1-174-g5919d9185 <https://github.com/opensvc/opensvc/commit/5919d9185df07de1ccb9ca8208af1f579849b73d>`_ Fix 'om daemon start' restart running daemon
| `2.1-173-g90ff4deab <https://github.com/opensvc/opensvc/commit/90ff4deab3bcd2015781227567399a0c95204e8e>`_ Lint & PEP8 daemon command
| `2.1-172-g2bfc1fb79 <https://github.com/opensvc/opensvc/commit/2bfc1fb791bbc52d3189eb59f54c0a74d1f80073>`_ Merge pull request #240 from cvaroqui/b2.1
| `2.1-170-gf340c7ae9 <https://github.com/opensvc/opensvc/commit/f340c7ae96a6368cbdfc4aff726869ef2782b146>`_ Merge pull request #237 from cvaroqui/b2.1
| `2.1-170-g682280263 <https://github.com/opensvc/opensvc/commit/68228026388cdb5344eafc9c804c7b9b22b56401>`_ Make sure the linux vg resource removes tags even when the vg is already down
| `2.1-169-gf61a90154 <https://github.com/opensvc/opensvc/commit/f61a9015443ebe724ce16e936278e1010e2125d4>`_ Restore encap config initial push
| `2.1-168-g222a08c3a <https://github.com/opensvc/opensvc/commit/222a08c3a3b4a6cba4d237ff5d9564cf9eddaf12>`_ Avoid short-looping GET /sync when the handler reports a problem
| `2.1-167-g28287ccb2 <https://github.com/opensvc/opensvc/commit/28287ccb2e3726017a74ddf3bd0a589530ff2e68>`_ Fix Ip::wait_dns_record() GET /sync request payload
| `2.1-166-g70c8f5c7a <https://github.com/opensvc/opensvc/commit/70c8f5c7aad8c42499a778805b5d29ffd16cd96d>`_ Log handlers exceptions for clients using the raw protocol
| `2.1-165-g732464d36 <https://github.com/opensvc/opensvc/commit/732464d3609162e051cd6749939cfb306a2764d1>`_ Don't install empty svc config from encap into the global
| `2.1-164-g169854883 <https://github.com/opensvc/opensvc/commit/1698548839598cbfee64c4f8d94250194faf807d>`_ Merge pull request #236 from cgalibern/fix-om-node-drain-stack
| `2.1-163-g651bd9357 <https://github.com/opensvc/opensvc/commit/651bd9357d7fcf0d2b09f41356cd5686b7e204da>`_ Fix 'om node drain --wait' error
| `2.1-162-g2258edfea <https://github.com/opensvc/opensvc/commit/2258edfea2b198e81c976a081425469461a13edd>`_ Merge pull request #234 from cvaroqui/b2.1
| `2.1-161-gf40965ec5 <https://github.com/opensvc/opensvc/commit/f40965ec5fd132fdb24852f1abed90c83f014779>`_ Handle two ip.cni driver corner cases
| `2.1-160-gdf2d0a3aa <https://github.com/opensvc/opensvc/commit/df2d0a3aae69da517d457157bbd2949f82070d1e>`_ Merge pull request #233 from cgalibern/b2.1-cherry-pick-master
| `2.1-159-g1daa651d1 <https://github.com/opensvc/opensvc/commit/1daa651d184d76a17810d4ae356a70032e148d02>`_ Fix stack from crm when daemon is restarting
| `2.1-158-ga6b7b7205 <https://github.com/opensvc/opensvc/commit/a6b7b720564ffd6d8691b233589d61426e6d6ea3>`_ [test] Move test_scheduler.py
| `2.1-157-g77a4463d5 <https://github.com/opensvc/opensvc/commit/77a4463d5c012f83b0a011a422fc6e5d360064fe>`_ [test] Add deselected core.scheduler
| `2.1-156-g2becc90c4 <https://github.com/opensvc/opensvc/commit/2becc90c409f2c6efdf24c32334f106e15c583b5>`_ [test] Add deselected utilities.proc.check_privs
| `2.1-155-g2cbd6aee6 <https://github.com/opensvc/opensvc/commit/2cbd6aee6cb7fdee2038ab33ef15d71ae0c2f86a>`_ [test] Add deselected core.extconfig.eval_expr
| `2.1-154-g5535509fc <https://github.com/opensvc/opensvc/commit/5535509fce33f2b03b34abc9a45f143308d81f3a>`_ Merge pull request #231 from cvaroqui/b2.1
| `2.1-153-gd0acc2e7e <https://github.com/opensvc/opensvc/commit/d0acc2e7e02e1a0f030400bbca554b56ae3b193c>`_ Fix a pylint error on missing import in the dns thread codebase
| `2.1-152-g70c44940b <https://github.com/opensvc/opensvc/commit/70c44940ba495037fd1e4704f20e7a74e71e5d48>`_ Simplify the GET /sync handler
| `2.1-151-g40f29316d <https://github.com/opensvc/opensvc/commit/40f29316dbcc631fae9c326d779ad5a5672432ba>`_ Don't listen on the dns socket until the monitor has left 'init' status
| `2.1-150-gd4709b69f <https://github.com/opensvc/opensvc/commit/d4709b69fc0f2d126d3cf57d609aa6af0984ff15>`_ dns thread enhancements
| `2.1-149-g109a0d0c0 <https://github.com/opensvc/opensvc/commit/109a0d0c03bbb8ca906786ffa878916f52dd44da>`_ Merge pull request #229 from cvaroqui/b2.1
| `2.1-148-g2203fc3f8 <https://github.com/opensvc/opensvc/commit/2203fc3f80d97bd61d26412de03f33776087d836>`_ Fix a "gen_cert > _fullpem" infinite recursion
| `2.1-147-g7039277ce <https://github.com/opensvc/opensvc/commit/7039277ce1c2cdacf61c886abf3ed9825bb6a673>`_ Add signal capabilities to docker and podman containers
| `2.1-146-g3b8f6788a <https://github.com/opensvc/opensvc/commit/3b8f6788a021ef7f060cd2a81a7f3174ad3273a2>`_ Make gen_cert use a single sec configuration commit.
| `2.1-145-g62152686d <https://github.com/opensvc/opensvc/commit/62152686dc1230a91ab1c16d803e9e5dd51fec34>`_ Don't try send signal to not-up containers
| `2.1-144-g140d0bc6b <https://github.com/opensvc/opensvc/commit/140d0bc6b8f5f219f2d944738ba41964e5d26789>`_ Accept a timeout in Node::_daemon_unlock() and use a 120s timeout in disk.drbd
| `2.1-143-gcb10d91c4 <https://github.com/opensvc/opensvc/commit/cb10d91c497f6c56d01e3cdefea721ed3c15262b>`_ Fix volume.signal honored only on the first volume resource found
| `2.1-142-ge4ffd4407 <https://github.com/opensvc/opensvc/commit/e4ffd4407c23a51f1f23d79010a323b5d8f26bea>`_ Merge pull request #228 from cvaroqui/b2.1
| `2.1-141-gaae03818b <https://github.com/opensvc/opensvc/commit/aae03818b939270392d9eb41787aa9a4a7140925>`_ Remove a cluster data lock acquire in the PTR record formatter of the dns thread
| `2.1-140-g514e74245 <https://github.com/opensvc/opensvc/commit/514e7424580e339d604b4917a82b065feaf38450>`_ Fix a stack in daemon_backlogs() when the response contains an error
| `2.1-139-g461d08657 <https://github.com/opensvc/opensvc/commit/461d086572a9c2a99a0b6c6051ee029743bc07d9>`_ Merge pull request #224 from cgalibern/api-get-locks-1
| `2.1-138-g6e1e28104 <https://github.com/opensvc/opensvc/commit/6e1e28104e643dd222999543a2359995e4718d46>`_ [test] Speed up test with avoid computation of version from git
| `2.1-137-g6955769ba <https://github.com/opensvc/opensvc/commit/6955769ba02ec059b83ff03a89396dade4640016>`_ Implement "om daemon lock show" to show cluster locks
| `2.1-136-g1bf5a6775 <https://github.com/opensvc/opensvc/commit/1bf5a67756c1659122723ee85fee8fb6202c3847>`_ [api] Implement get /cluster/locks to retreive cluster lock
| `2.1-135-g2778eadf6 <https://github.com/opensvc/opensvc/commit/2778eadf6f153bd2f23d5f835ccb756133ee2978>`_ Merge pull request #225 from cvaroqui/b2.1
| `2.1-134-gb57ccc218 <https://github.com/opensvc/opensvc/commit/b57ccc2186fb1f82293fee2c6f2a7c87dd6e1b37>`_ Fix the rsync on snap codepath
| `2.1-133-gc0c76df06 <https://github.com/opensvc/opensvc/commit/c0c76df0628f6123cc291c1595f5dac667d95a4c>`_ Add more labels to containers
| `2.1-132-gab0ff3055 <https://github.com/opensvc/opensvc/commit/ab0ff305579258a4702f27d646b053ecbe40010e>`_ Merge pull request #223 from cvaroqui/b2.1
| `2.1-131-ga3637a1a5 <https://github.com/opensvc/opensvc/commit/a3637a1a53bf8bc0e83372769d68f1a003b0ff37>`_ Fix a wait dns stack on cluster sync request
| `2.1-130-g773e583ef <https://github.com/opensvc/opensvc/commit/773e583ef2b455d879038836556b3ac6cf341f2b>`_ Expose a resource cache clear method from the Resource class
| `2.1-129-g7a02dc70f <https://github.com/opensvc/opensvc/commit/7a02dc70f4a12f646ce07acc5bc8d52c4eacde09>`_ Add the "signal" keyword to the volume driver
| `2.1-128-g67198ca3e <https://github.com/opensvc/opensvc/commit/67198ca3ed4bb3fb326de2815eb55d28231c7717>`_ Merge pull request #220 from cgalibern/b2.1-fix-add_cluster_node
| `2.1-127-g7d15d2486 <https://github.com/opensvc/opensvc/commit/7d15d2486615c62e089ece526c8ca547493b8fbc>`_ Fix listener crash during invalid daemon join call
| `2.1-126-g364e3701b <https://github.com/opensvc/opensvc/commit/364e3701b77920517f17ffbc2161f69b884be853>`_ Merge pull request #219 from cgalibern/b2.1-cp-master
| `2.1-125-g092abbfd9 <https://github.com/opensvc/opensvc/commit/092abbfd90bf35dfcccf4dc5740f1758fbc30e06>`_ Ensure --node arg is present during 'om daemon join/rejoin'
| `2.1-124-g3f6c1a517 <https://github.com/opensvc/opensvc/commit/3f6c1a5175a504ada658b634682dc949f30a8933>`_ Merge pull request #216 from cgalibern/b2.1-cherry-pick-master
| `2.1-123-g1a2035087 <https://github.com/opensvc/opensvc/commit/1a2035087a481b63f2d5997fb0a52e0d6126921c>`_ [test] Add handler tests for POST /join & /leave
| `2.1-122-g3dcda84ca <https://github.com/opensvc/opensvc/commit/3dcda84ca6fdc9fb2b836f27924fbd5c1b24f6ea>`_ [test] Ensure add_cluster_node update cluster config nodes
| `2.1-121-g50580b2ae <https://github.com/opensvc/opensvc/commit/50580b2aeb1d60d1c0eb0a97a32a644aaa21095c>`_ [test] Ensure fresh install define cluster_nodes with nodename
| `2.1-120-g2b7ac4431 <https://github.com/opensvc/opensvc/commit/2b7ac4431bea7d4552ece33e5b82fff8f863e036>`_ Fix error message in make_deb
| `2.1-119-g806bcd0fc <https://github.com/opensvc/opensvc/commit/806bcd0fc32b15d130f96e07f56bd18e54daf944>`_ Merge pull request #214 from cvaroqui/b2.1
| `2.1-118-g9e0343545 <https://github.com/opensvc/opensvc/commit/9e0343545653cad4a234c9230e1472a78311c0af>`_ Fix flex_target not updated on node labels change
| `2.1-117-ga384c1e73 <https://github.com/opensvc/opensvc/commit/a384c1e73982cb9fc584825fc222785c8e2c574e>`_ Merge pull request #212 from cvaroqui/b2.1
| `2.1-116-g6f0d117d8 <https://github.com/opensvc/opensvc/commit/6f0d117d81ea3fdc073ccf0212ea2c2784b9d757>`_ Fix "wait parents" lingering smon status on switch actions
| `2.1-115-g74c8e7660 <https://github.com/opensvc/opensvc/commit/74c8e7660e68259dd8afaba884e030f91323d8b0>`_ Fix wait_dns occasional failures
| `2.1-114-g18569f643 <https://github.com/opensvc/opensvc/commit/18569f643116b38785957253db84bf3f8695a3f5>`_ Merge pull request #211 from cgalibern/b2.1-cherry-pick-master
| `2.1-113-g8d9fab19b <https://github.com/opensvc/opensvc/commit/8d9fab19befd4d8b22d67c547133dbb989d0d3a4>`_ [test] fix assert call_count == 1 vs assert_called_once
| `2.1-112-gfb68d441d <https://github.com/opensvc/opensvc/commit/fb68d441d5e0df2dd18e7cfc5b9805b061cf7424>`_ [container.oci] Fix podman location
| `2.1-111-gf508e8616 <https://github.com/opensvc/opensvc/commit/f508e861625c965042a713b7ba270a0cfcc0a5de>`_ [test] Add tests om drbd provisioner
| `2.1-110-g708c6262c <https://github.com/opensvc/opensvc/commit/708c6262c016ded8528156accd909f6b5f7e0888>`_ [test] klass_has_capability fixture into conftest.py
| `2.1-109-g718b1b861 <https://github.com/opensvc/opensvc/commit/718b1b861f61f823f95ff2055da14d81997c6279>`_ disk.drbd driver enhancements
| `2.1-108-gcbec030c3 <https://github.com/opensvc/opensvc/commit/cbec030c342f10c1ccf5089e873586b2c91ce12a>`_ Fix early detection of local_expect started
| `2.1-107-g60741c6ba <https://github.com/opensvc/opensvc/commit/60741c6ba63d7e2b330fa44e66a17b01e30e0832>`_ Lint & PEP8 svc.py
| `2.1-106-gb482ecde4 <https://github.com/opensvc/opensvc/commit/b482ecde476d54ce012cf23138fb4fce9f514619>`_ Lint & PEP8 node.py
| `2.1-105-g96855cc49 <https://github.com/opensvc/opensvc/commit/96855cc496cfa9a084c2cc9b82e63d246abfed31>`_ Always use DEFAULT_DAEMON_TIMEOUT from core/comm.py
| `2.1-104-ge14e5e77f <https://github.com/opensvc/opensvc/commit/e14e5e77f3365ac358dee1b917d9be9a62f7edab>`_ Respect drain wait time on a pending node drain
| `2.1-103-ged06114aa <https://github.com/opensvc/opensvc/commit/ed06114aa8ff0f818f17fa7474b0c6ea901a5cee>`_ Use timeout=5 during disk/drbd replicated_config daemon_post
| `2.1-102-g21cc26468 <https://github.com/opensvc/opensvc/commit/21cc264682f612204a9f3a0e78c42393c4cab2cc>`_ Refacto data.py with DEFAULT_DAEMON_TIMEOUT=5
| `2.1-101-gd210e2137 <https://github.com/opensvc/opensvc/commit/d210e213753f8849b9b713eb7e6134894e0525f0>`_ Align daemon_post timeout from 2->5 during svc wake_monitor
| `2.1-100-g63de7e797 <https://github.com/opensvc/opensvc/commit/63de7e79770650f1a5ce9ea60a7df6568983d1d6>`_ Add timeout to node daemon_post calls
| `2.1-99-g36d340e8f <https://github.com/opensvc/opensvc/commit/36d340e8ff5e59632fa28e56f61f072bc9f5d352>`_ Update _daemon_lock error when timeout is None
| `2.1-98-g4f820dd23 <https://github.com/opensvc/opensvc/commit/4f820dd23fa511021aa5e52d58fb49c9179c1b2d>`_ Merge pull request #208 from cgalibern/fix-release-cluster-lock
| `2.1-97-g0522078cd <https://github.com/opensvc/opensvc/commit/0522078cd2d5a9608ff06b7bb562881e01986bab>`_ Ensure lock_release returns when lock released in shared.CLUSTER_DATA
| `2.1-96-g11e38d4eb <https://github.com/opensvc/opensvc/commit/11e38d4eba615390b66f245e12a7440bafa62ac9>`_ Merge pull request #209 from cvaroqui/b2.1
| `2.1-95-g39630a739 <https://github.com/opensvc/opensvc/commit/39630a739cf4674910bb67c0f4eef28a84764f60>`_ Don't set registry creds option on docker/podman start commands
| `2.1-94-gaf5602676 <https://github.com/opensvc/opensvc/commit/af5602676ea6b18667e361cc4abbf0c8c8657e39>`_ Merge pull request #207 from cvaroqui/b2.1
| `2.1-93-gd302ad253 <https://github.com/opensvc/opensvc/commit/d302ad253e872b7d2567e0fcab297c9f6c489cfa>`_ Fix missing templates in usr/share/doc
| `2.1-92-gee106b253 <https://github.com/opensvc/opensvc/commit/ee106b2533572080fdfb1527abd46f955674f1a2>`_ Merge pull request #205 from cvaroqui/b2.1
| `2.1-90-g6abc54e6f <https://github.com/opensvc/opensvc/commit/6abc54e6ff4b0be1d61d8019b3ce58148a0ac91d>`_ Fix provision orchestration issue with parents=foo@node1
| `2.1-90-g3b5084876 <https://github.com/opensvc/opensvc/commit/3b5084876b077532ded0769ed11ecb7b0dcaa24a>`_ Merge pull request #204 from cvaroqui/b2.1
| `2.1-89-g4ea0297b8 <https://github.com/opensvc/opensvc/commit/4ea0297b84a954143843fa0ab8ac693f9fd3440d>`_ Fix a stack in docker and podman resource drivers
| `2.1-88-g912a8a03a <https://github.com/opensvc/opensvc/commit/912a8a03a97539f5999b7779c28fba21b8635675>`_ Add a capability to drivers supporting regisrty_creds
| `2.1-87-g5052458ca <https://github.com/opensvc/opensvc/commit/5052458cac0a7531714ea13f78d891ca5a4183b9>`_ Make "kind" a required option of the GET /keywords handlers
| `2.1-86-g05e95b10d <https://github.com/opensvc/opensvc/commit/05e95b10db9562af6404bea4314c56dd226fa12e>`_ Merge pull request #203 from cvaroqui/b2.1
| `2.1-85-g12405fb8c <https://github.com/opensvc/opensvc/commit/12405fb8cd018cdf55c98f9e85bd75199764850f>`_ Support registry creds config as secrets
| `2.1-84-g7fbfb762f <https://github.com/opensvc/opensvc/commit/7fbfb762fbf119d03f34d73171cacf083a90a34a>`_ Merge pull request #202 from cvaroqui/b2.1
| `2.1-83-g297d8a1b4 <https://github.com/opensvc/opensvc/commit/297d8a1b42eae1a35ac06e289b0097807f5f2424>`_ Fix postintall() on daemon monitor fetch_service_config()
| `2.1-82-g99248c95a <https://github.com/opensvc/opensvc/commit/99248c95a4d9ace02cc89f073675acee299b2ba6>`_ Fix "om <sec> install"
| `2.1-81-g17a02d9c8 <https://github.com/opensvc/opensvc/commit/17a02d9c88f3a08ab5f643e12592d29f3a6daa89>`_ Merge pull request #201 from cvaroqui/b2.1
| `2.1-80-g8cd9e59b6 <https://github.com/opensvc/opensvc/commit/8cd9e59b695eb2c6435b0083ec46733e24a488fb>`_ Don't run docker and podman task on provision
| `2.1-79-g4a622a11c <https://github.com/opensvc/opensvc/commit/4a622a11ca0048df2607cb706cf472a9f95f7729>`_ Merge pull request #200 from cvaroqui/b2.1
| `2.1-78-gad966c014 <https://github.com/opensvc/opensvc/commit/ad966c0141bd008d80a85f310475c056d2263930>`_ Fix a log message typo in Node::find_pool()
| `2.1-77-ge2aa18fe1 <https://github.com/opensvc/opensvc/commit/e2aa18fe1124e98c2ad14382c1244e855d4afaa0>`_ Discard volatile pool from candidates if pool type not requested
| `2.1-76-g6790e5168 <https://github.com/opensvc/opensvc/commit/6790e51680f630f8f9f8a44826fad55eda7602bb>`_ Merge pull request #199 from cvaroqui/b2.1
| `2.1-75-gab78aae9e <https://github.com/opensvc/opensvc/commit/ab78aae9e10e1cb9ab301c64e22d5e5d7b6d2fa7>`_ Fix case of resource status_info not updated
| `2.1-74-gdf7b17681 <https://github.com/opensvc/opensvc/commit/df7b1768140f234403e89ef90034f22c4e128531>`_ Fix a typo in the status_info resource lazy load from cache
| `2.1-73-g0675258f1 <https://github.com/opensvc/opensvc/commit/0675258f12c3c379a4ade65b37c4104687920f75>`_ Fix a resource info corruption on peer node labels change
| `2.1-72-gc018f71f0 <https://github.com/opensvc/opensvc/commit/c018f71f026b3f976a3c599283747674b36745c0>`_ Merge pull request #197 from cvaroqui/b2.1
| `2.1-71-ge41b406db <https://github.com/opensvc/opensvc/commit/e41b406db384cf573798d95cc1e4f5a866b08fa6>`_ Fix two potential dns db desync situation
| `2.1-70-g1c295a4e7 <https://github.com/opensvc/opensvc/commit/1c295a4e7d9d75821bd787d2fde0fd2fa870aa29>`_ Merge pull request #196 from cvaroqui/b2.1
| `2.1-69-gf6b329e2a <https://github.com/opensvc/opensvc/commit/f6b329e2a19cf5a51b904a4d154c24b9c8177831>`_ Set use-vc in resolv.conf options for containers using backend ipaddr
| `2.1-68-g5aac751d4 <https://github.com/opensvc/opensvc/commit/5aac751d404925be4dd89c62a1065401cb080ab4>`_ Merge pull request #193 from cgalibern/move-travis-to-focal
| `2.1-67-g397639813 <https://github.com/opensvc/opensvc/commit/397639813aa2190b6841d7f95795df9aaf9372fe>`_ [travis] Move to focal to avoid pytest error
| `2.1-66-g52b9f267e <https://github.com/opensvc/opensvc/commit/52b9f267e08285904a7b4e3bd0e264f7b6727c90>`_ Merge pull request #191 from cvaroqui/b2.1
| `2.1-65-gb6c91a0f3 <https://github.com/opensvc/opensvc/commit/b6c91a0f37400b38de753379e313bf8a736df791>`_ Allow disable/freeze/thaw on PRD objects deployed on DEV nodes
| `2.1-64-gda97f0913 <https://github.com/opensvc/opensvc/commit/da97f091392525eac0426fface7322ade54bc490>`_ Merge pull request #190 from cvaroqui/b2.1
| `2.1-63-g889b2364a <https://github.com/opensvc/opensvc/commit/889b2364a6cd83c50d4375a1af61506e9cc6e0d5>`_ Fix a stack with task.docker and task.podman when no timeout is set
| `2.1-62-g5b89e9003 <https://github.com/opensvc/opensvc/commit/5b89e90030081ba4aa2825a28cd207d2fd9a15f8>`_ Merge pull request #189 from cvaroqui/b2.1
| `2.1-61-g322d69ad4 <https://github.com/opensvc/opensvc/commit/322d69ad4491b3aa20872304cf09287b3a6046a3>`_ Add a pool "status_schedule" keyword
| `2.1-60-gf8b4fa984 <https://github.com/opensvc/opensvc/commit/f8b4fa9841da2a3f03c47b6933e63ef9688d10f4>`_ Merge pull request #188 from cvaroqui/b2.1
| `2.1-59-g9f029b497 <https://github.com/opensvc/opensvc/commit/9f029b49733fd109e5b424c347c815a4bb516869>`_ disk.drbd driver enhancements
| `2.1-58-g54554119b <https://github.com/opensvc/opensvc/commit/54554119bdb955695a912e32982d8e265f5bf0c9>`_ Merge pull request #185 from cvaroqui/b2.1
| `2.1-57-g3bfcbf36d <https://github.com/opensvc/opensvc/commit/3bfcbf36d0a63ed09d11da933a3410dd48bf6148>`_ Give preference to non shared pools to allocate a non shared volume
| `2.1-56-gb212af284 <https://github.com/opensvc/opensvc/commit/b212af284b2946ea1602ddcff6fccfaa4670b4a4>`_ Merge pull request #184 from cvaroqui/b2.1
| `2.1-55-ga53679cbf <https://github.com/opensvc/opensvc/commit/a53679cbff84bb23c7679026ebe45cc3384c852a>`_ Merge branch 'b2.1' into b2.1
| `2.1-53-gfd35baf8d <https://github.com/opensvc/opensvc/commit/fd35baf8de01d3fc96aba12e4114935503ef0072>`_ Define a pre_provision_stop() method in the volume resource driver
| `2.1-52-g61c8d9b85 <https://github.com/opensvc/opensvc/commit/61c8d9b85efe159127abce57ebb68d019a707d6a>`_ Report vol obj avail warn at warn-level volume resource status log message
| `2.1-51-gdab36d931 <https://github.com/opensvc/opensvc/commit/dab36d9312d96a4e63c81a47e6c30ae3353c0f72>`_ Report vol obj overall=warn as volume resource warn log
| `2.1-50-gd5075212d <https://github.com/opensvc/opensvc/commit/d5075212d70c1b20d8cab4000c74de722c9eb954>`_ Merge pull request #183 from cvaroqui/b2.1
| `2.1-50-g02b932a48 <https://github.com/opensvc/opensvc/commit/02b932a480d38dc122bc9bd682864eedee1f6d2c>`_ Allow the "status" action on invalid nodes to not loop on status in daemon init
| `2.1-49-ge0eb3be1e <https://github.com/opensvc/opensvc/commit/e0eb3be1effddf574d2336ae6d96f034af50728d>`_ Merge branch 'b2.1' into b2.1
| `2.1-45-ge4ba19eb8 <https://github.com/opensvc/opensvc/commit/e4ba19eb8176ddc15c41ee4a059c8bae156dde25>`_ Update support & sysreport proc for cluster secrets
| `2.1-44-g95cb0ac27 <https://github.com/opensvc/opensvc/commit/95cb0ac27758661b259575374fc8ebcf26f32b6d>`_ Fix the cluster lock acquire request timeout
| `2.1-43-g44d0d8d5d <https://github.com/opensvc/opensvc/commit/44d0d8d5de7b609060870466343a0533d6881f9a>`_ Fix resource restarting before provisioned
| `2.1-42-g366cfbbce <https://github.com/opensvc/opensvc/commit/366cfbbcea91f5283f147c90df44903ca7a8dee9>`_ Honor the parents relations during a multi-object switch
| `2.1-42-g15d45ec00 <https://github.com/opensvc/opensvc/commit/15d45ec001eaef74a72f6b49de5a827f4384f479>`_ Update support & sysreport proc for cluster secrets
| `2.1-41-geb53b5737 <https://github.com/opensvc/opensvc/commit/eb53b5737bc141beac44c2564528ceebc05c6f64>`_ Merge pull request #181 from cvaroqui/b2.1
| `2.1-41-g4efce66f2 <https://github.com/opensvc/opensvc/commit/4efce66f23e862dcff6fec06bf6ef7ca71a7af22>`_ Force create-md in the drbd provisioner codepath
| `2.1-40-ga29110340 <https://github.com/opensvc/opensvc/commit/a291103409ca9e61a14224b9e8256af02662135e>`_ Test containerized tasks always use timeout kw value
| `2.1-40-g756a5dfe0 <https://github.com/opensvc/opensvc/commit/756a5dfe0a4874cd077781053e0467f8d5ff5934>`_ Test containerized tasks always use timeout kw value
| `2.1-39-gd81fbad65 <https://github.com/opensvc/opensvc/commit/d81fbad656b021b3a6b34cbaa12ec9080fcef5e3>`_ Fix a variable name error in task.podman
| `2.1-38-g3fca485b2 <https://github.com/opensvc/opensvc/commit/3fca485b215f6cc0cb3ca45c93ca12be3437a62e>`_ Don't import "start_timeout" in the task.docker and task.podman keywords
| `2.1-37-gf89b90cf8 <https://github.com/opensvc/opensvc/commit/f89b90cf82f2c74a4b3c7254ac963d766ed3ea3f>`_ Rename the core.node.ACTIONS_WAIT_RESULT to ACTIONS_NOWAIT_RESULT
| `2.1-36-g9e1c1ca58 <https://github.com/opensvc/opensvc/commit/9e1c1ca58f6b812d5bebe98cc37fb680af577b0e>`_ Make POST /node_action accept again action for daemon, network and pool subsystems
| `2.1-35-gf777a6563 <https://github.com/opensvc/opensvc/commit/f777a65637fdec455ac4c7a54dada8c5833ff81a>`_ Fix ha svc with hard affinity not started when they could
| `2.1-34-g404893862 <https://github.com/opensvc/opensvc/commit/404893862738de1a642a8721b1b95962fe910ad2>`_ Merge pull request #180 from cgalibern/set-sysidcfg-unconfig-when-no-ip-resources
| `2.1-33-g8f2e61871 <https://github.com/opensvc/opensvc/commit/8f2e61871ee6b0e0642caf463c64dce7410beb45>`_ [drivers.zone.provision] Fix generated sysidcfg
| `2.1-32-g31d26dcb4 <https://github.com/opensvc/opensvc/commit/31d26dcb4222f413ede2a1e899319d61fa2ea726>`_ [drivers.zone.provision] Allow provision without ip resources
| `2.1-31-ge716a4a61 <https://github.com/opensvc/opensvc/commit/e716a4a61cad5a366d9c734ed474907f1389f3f9>`_ Fix containerized tasks always using the default 5s start_timeout
| `2.1-30-g946c97d18 <https://github.com/opensvc/opensvc/commit/946c97d1819ad3b5ec344239a8527889a613459b>`_ Merge pull request #179 from cvaroqui/b2.1
| `2.1-29-g70429bbf2 <https://github.com/opensvc/opensvc/commit/70429bbf22f5ecc1c3ae9ff9760f5dd5844b6920>`_ Fix and optimize daemon monitor get_local_paths()
| `2.1-28-gce57234b6 <https://github.com/opensvc/opensvc/commit/ce57234b6830d07828f374856fdc0e5bcbf53329>`_ Merge pull request #177 from cvaroqui/b2.1
| `2.1-27-g9b4355e06 <https://github.com/opensvc/opensvc/commit/9b4355e06c0b59609e88cb2fcee4c62a18b13752>`_ Add the GET /object_confirmations handlers
| `2.1-26-gac2a2555e <https://github.com/opensvc/opensvc/commit/ac2a2555e073f1cab4b09c9efbcc6f6efe740283>`_ Merge pull request #175 from cgalibern/diag-travis
| `2.1-25-g466ef5dd7 <https://github.com/opensvc/opensvc/commit/466ef5dd7ed93b4c1bb21a59e74bc8b172cd28e8>`_ [coverage] Exclude virtualenv and new foreign path from coverage
| `2.1-24-gde1a95d20 <https://github.com/opensvc/opensvc/commit/de1a95d208834484c2f18b4ae5154094a63abb60>`_ [travis] Diag failing test
| `2.1-23-g937b3a759 <https://github.com/opensvc/opensvc/commit/937b3a759b91941096db1693aa848fca8d995a01>`_ [travis] cleanup not anymore required sudo
| `2.1-22-g26e8a8ef6 <https://github.com/opensvc/opensvc/commit/26e8a8ef688b1fbb71bc4df1773f29a15104874f>`_ Merge pull request #174 from cvaroqui/b2.1
| `2.1-21-g8e2e33980 <https://github.com/opensvc/opensvc/commit/8e2e33980b214008236c762bbe3d483c27e5695e>`_ Fix a stack on task run when stdin is closed
| `2.1-20-g02b6b7a8f <https://github.com/opensvc/opensvc/commit/02b6b7a8f630e5594919377e5f27f0a4b69ff71b>`_ Honor "stop --force" in the drbd driver
| `2.1-19-gaa723236a <https://github.com/opensvc/opensvc/commit/aa723236af98586ed8d70f57e18ff5264330959c>`_ Merge pull request #168 from cgalibern/update-brand-zones
| `2.1-18-gcb6b22dcf <https://github.com/opensvc/opensvc/commit/cb6b22dcfc7911cc821194ba261021c91e74c5cb>`_ [driver.container.zone] Update for solaris10 brand zones
| `2.1-17-g804eb92b7 <https://github.com/opensvc/opensvc/commit/804eb92b7c4543495ee5cbbffafb47896ee62647>`_ [driver.container.zone] Ensure mock capabilities
| `2.1-16-gf9b482410 <https://github.com/opensvc/opensvc/commit/f9b482410eef30db994988a55afc189caea712d8>`_ [driver.container.zone] Add container.zone.brand-solaris10 capability
| `2.1-15-gcff4d0528 <https://github.com/opensvc/opensvc/commit/cff4d052865e872ec367d9086a1cadca8d6ad31b>`_ Fix om node print devs stack when FAULTY zpool exists (Solaris)
| `2.1-14-g7a4f3dd5d <https://github.com/opensvc/opensvc/commit/7a4f3dd5d7f6df2d06efcd7a3e271338d6c4b811>`_ Merge pull request #166 from cvaroqui/b2.1
| `2.1-13-g7d29a4e7b <https://github.com/opensvc/opensvc/commit/7d29a4e7b1cd4f5dc684127f773bf9a176c24dbb>`_ Fix another drbd driver regexp declared binary instead of raw
| `2.1-12-ga7a5e5a3e <https://github.com/opensvc/opensvc/commit/a7a5e5a3eb595e77fe7c58a06558d1dbc3e9ecfe>`_ Merge pull request #164 from cvaroqui/b2.1
| `2.1-11-g9f0eca4a6 <https://github.com/opensvc/opensvc/commit/9f0eca4a6875c98e59ac058e551bee6c5db06edb>`_ Fix utilities.subsystems.docker container_by_label() for podman
| `2.1-10-gedfd990fb <https://github.com/opensvc/opensvc/commit/edfd990fb4a43b5da24d759d3705c3e1ebea6665>`_ Fix 'handler GET resource/disk/drbd/allocations is not supported'
| `2.1-9-g3930cbc2c <https://github.com/opensvc/opensvc/commit/3930cbc2c53cf6ae213aef65172263d6b3bf0763>`_ Fix zone brands[solaris10 & native] provisioning (#161) (#162)
| `2.1-8-gd49b3d8f6 <https://github.com/opensvc/opensvc/commit/d49b3d8f6b04410fdf277a099f322b9b07b2b360>`_ [packaging] Fix solaris daemon restart during package relocate operations (#160)
| `2.1-7-gf5fb36f06 <https://github.com/opensvc/opensvc/commit/f5fb36f065b7124a1017c265c1e6934218764151>`_ Merge pull request #157 from arnaudveron/backport-fix-drbd-regexp
| `2.1-6-gea05a04d8 <https://github.com/opensvc/opensvc/commit/ea05a04d8b34a3de894c7cc972de45e706fd1b45>`_ Fix regexp declaration in drbd driver
| `2.1-5-gf80718235 <https://github.com/opensvc/opensvc/commit/f80718235294116044dcc7fc481f89e17897fa14>`_ Merge pull request #154 from cvaroqui/b2.1
| `2.1-3-gef594d291 <https://github.com/opensvc/opensvc/commit/ef594d291a4645026fa6e787542d84174d3e2f70>`_ Merge pull request #149 from cvaroqui/b2.1
| `2.1-3-g62daabe87 <https://github.com/opensvc/opensvc/commit/62daabe877974bd26cdf4378d49762feddf05867>`_ Fix a stack on provision in disk.drbd when the listener reports unsupported handler
| `2.1-2-gcfb8d53df <https://github.com/opensvc/opensvc/commit/cfb8d53dfe55c61a1cb50fa25fab027d75cc72a6>`_ Avoid using version for release when the git head commit is tagged
| `2.1-1-g10a6e8ca3 <https://github.com/opensvc/opensvc/commit/10a6e8ca3704c1df966f41d4cfe3099c1e3fef77>`_ Fix a stack in utilies.version
