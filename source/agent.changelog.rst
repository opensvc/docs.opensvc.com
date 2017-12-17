Changelog
=========


| `1.9-881 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1694229b7fb54ccb698761a70572356573fd51e>`_ python[23] compat fix for the relay heartbeat driver
| `1.9-880 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=100ee1a42cf545b39e58268823fcf85714463501>`_ Fix mixed indent in osvcd_mon
| `1.9-879 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=339c03ad462d82c4b63ad5bcc402301d567626ac>`_ Care for arbitrator sections in "daemon join/leave" actions
| `1.9-878 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=de090e8df2198c19880597103e33b330687d8621>`_ Add the relay hb driver
| `1.9-877 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=18b284e95e97e2acdd97295a833427d0653f48b0>`_ Freeze the node at the end of the rejoin_grace_period if the cluster is incomplete
| `1.9-876 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=019f837f08fc83c46b76332022ab2ef09858219c>`_ Fix svcmon without --watch
| `1.9-875 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4915c25fe432a21b9bf8d1eac647b1eeb4f05d11>`_ Add --watch and --interval to svcmon
| `1.9-874 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bfe048b7c6849563390eaa2df5e4283f0271ba17>`_ Add the ip.cni doc
| `1.9-873 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=845cf238fb8fd37bbbcc3f3bf84abd0c38c3c549>`_ Add docker container support to the ip.cni driver
| `1.9-872 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b2fb615c6007242ffb8d347283e5d65d29af1b48>`_ Implement an arbitrators-based quorum
| `1.9-871 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=75747e22dd6a7fdc4e9dc23a04f50ecf46ff7fa5>`_ Stop recursing at multipath level in devtree get_top_devs_chain()
| `1.9-870 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d276ff0cd51ebfbf60977b3c8768745e73e468f2>`_ Refresh the zpool sub_dev cache on disklist if the instance is up
| `1.9-869 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=70e4a25e1bba9476f95918d9efc3686f37032909>`_ Switch the ip.docker from using 'ip netns exec' to using 'nsenter'
| `1.9-868 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8e4b2e424ce4461220505a63d5fa15aca21661fe>`_ Execute the resourcesets pre/post action at their expected step
| `1.9-867 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27f715fafccbbd293a6b0d92f3805d25fb4619b9>`_ Stop dockerd after the last container is stopped on rollback too
| `1.9-866 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8554a55065fbb66396dc9c1b3bdbc0532ac8d5a>`_ Fix a rare lxc start issue
| `1.9-865 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dd8f9286e94dd916c142ab70e0fde7ed0df68265>`_ Make the dockerd start lock file service-private
| `1.9-864 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1a1262783124262b058d9e6f4f8bf4c110facd3d>`_ Do the 'nodemgr pushasset' after starting the deamon
| `1.9-863 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5cb134869382c3540c7f4e86e5496af66615a85>`_ Fix the hole in linux stats at midnight
| `1.9-862 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f86d3c37ad808d1906ebe114a3dbf2926be26057>`_ Restore the probabilistic schedule feature in collaboration with osvcd
| `1.9-861 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71978c0a815a39676593a4701a5b98f6f16d36bc>`_ Fix a KeyError regression in the scheduler
| `1.9-860 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=20d39d591fc2dc62b505ac99bfe1bd73938aa18c>`_ Remove a debug trace left-over in rcScheduler
| `1.9-859 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f480dc200887307e0fcd0bbb55fc407888225653>`_ Create a last_<action>.success in var/ to track last sched task succesful run
| `1.9-858 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=172b25d16d3fc385c732cf792edeb20cfcf29814>`_ Also bar [/var]/run/user/<uid> from the fs_u stats collection
| `1.9-857 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4725c57858cba2de5bef2cf405d7e53db6685259>`_ Add a fs_u collect blacklist on Linux
| `1.9-856 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ee0f6f560c1701a299113ea6baee9feea59128a>`_ Compliance comp lib fixes
| `1.9-855 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a4ee591c54fb4889c78affbb3d713f6053696cf1>`_ Enhance rule merging error message
| `1.9-854 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4926d9bc22cdcf1e91b94fc87518b622361e5a06>`_ Fix a potential xmlrpc stack if key or val is None in push resinfo
| `1.9-853 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e7d19bae41f5f17dc8673f27a5cb681f13cf3b2>`_ Fix the pushasset xmlrpc, not treating hardware data as expected
| `1.9-852 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43180ec57c9bf53e7453e45369937e4125dcb4ed>`_ Add pci and mem inventories to pushasset
| `1.9-851 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=abebbc2dfe63e66304dcb75d8a43a39b895733aa>`_ Fix the sudo auto-prefixing for commands passed through the service link
| `1.9-850 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=373bf4c7dfa64c684853cc256be982ac1e7fc7b3>`_ Add the manufacturer field to pushasset
| `1.9-849 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cdcf7e15c4fed5bda5ac9d299bcd6aed8e73f740>`_ Fix the model parsing on pushasset, on Linux
| `1.9-848 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b58332a26c73f1eaf60365a3bf0b169bac4d911>`_ Add a ip.cni driver
| `1.9-847 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=56dbf82f9fa86d7c5d815f4b4bc3f70551cba9c2>`_ Fix python3 compat of the os.umask call in lxc cmds preexec_fn
| `1.9-846 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1ed90640bd7bc8cb335b094a5c51005a5ecde398>`_ Fix tasks run
| `1.9-845 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b87794a633aea7c9a6e1399484626b8adfe5605d>`_ Fix 'collector cli' stack when no TERM is set
| `1.9-844 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ac1aa8be953aedfd93eb7286ca3b4b583bd578d>`_ Auto-replace the process using execvpe() if euid!=0 and sudo or pfexec is found
| `1.9-843 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=104d34b93121fd8c800218a3097f8a92b6742e4e>`_ Align 'print resinfo' tree columns
| `1.9-842 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d9c3fb5901cc9563b7af8a68e45bd288a1810f2>`_ Add env section keys to the resinfo keys
| `1.9-841 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4fe71ea807961029859592744568335037ca9ac0>`_ Streamline the 'push resinfo' action
| `1.9-840 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e85299f742da62277fe488f63afb59a04a92a78c>`_ Workaround for python issue19884
| `1.9-839 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=353c673d252bc6dd6f45aba71c755416261ac22e>`_ Fix sync.rsync option parsing when type is not specified
| `1.9-838 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=139a64e04657c4c6be8557bb6207626d1c9b09da>`_ Fix "<svcname> <action>" syntax
| `1.9-837 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c28d1bf97d9f61f2241840348223a505852138a6>`_ Fix a potential stack on fs unprovision
| `1.9-836 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5cf1bb6c92ef1a7cddd9ab08f96ed6c0f5121b79>`_ Workaround the /dev wrong perms in container with some lxc versions
| `1.9-835 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=60712f0285881960bedcab0b417d45b2d524d719>`_ Disallow implicit selection of all services through svcmgr
| `1.9-834 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=79524fa4870e2518a3c95614c46a9546567a9fdf>`_ Fix env leak between services in "svcmgr compliance <act>" actions
| `1.9-833 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bfd9bfbabb04d0e672fdeaacc404fd6100e2624c>`_ Add a info method to the container drivers parent class
| `1.9-832 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=41f3bc340e988720bb724ced4f8437d2795277d0>`_ Allow automodule to use rules in contextual ruleset at 1st depth level
| `1.9-831 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5d5a241812e4494094228860d18bdb3d82b456d>`_ Add GET/POST/DELETE/PUT handler support for api paths reported by nodemgr cli
| `1.9-830 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bb4efffb15ca9ca5b8fe6a02844ee7c1acf9a14e>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-829 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f71a124e6d6f9f13fa95e68dac42ce00e41d0d78>`_ Add disk.md check and fix for disabling auto-assembling
| `1.9-828 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b9a10a93cb2daecfa0b9368f5a73baf980d7213>`_ Fix incomplete line reported by "svcmgr logs"
| `1.9-827 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cbae22768202dd3226909582875b730c43c6a0b0>`_ Allow the switch action without --to on 2-nodes clusters
| `1.9-826 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85171b6ccff37a7b12011f5ddba32a55fd749382>`_ Reinstate the smon status handling in the daemon
| `1.9-825 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3e716e7574e9afd6d356a99c49153c0499a85e72>`_ Move the instance monitor status handling to the CRM
| `1.9-824 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45bcf70a815c6649075a9d2f91fce12f2ef33cc7>`_ Notify the daemon of the sync actions begin and end
| `1.9-823 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a817d643161e7ee76e1787334c1c78815facbf11>`_ Notify the daemon of local actions begin and end
| `1.9-822 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=58ac71c4bb5cfe6bd852123fd44704578f548a2b>`_ Enhance the "svcmgr get" response when the --param is not set
| `1.9-821 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=15907216f55d3c4ae2da66c68b759ee604c662a4>`_ Fix a wrong indentation in the keyval_parser comp obj lib
| `1.9-820 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87da6be58e8a5dde14d03dcaaf4e298df5d17238>`_ Don't try to unprovision lv from the fs unprovisioner when not opportune
| `1.9-819 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=29606c241292151bdb66b9c1030bf9889ce299cc>`_ Refresh the doc, man and completions
| `1.9-818 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fee5a7f2e8a1ea1e3eb0d2de1f7a4456e3a304b4>`_ Set a shlex converter to the mkfs_opt keyword
| `1.9-817 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b4402ee9370723acdf16f6852b4e75e1ab92d982>`_ pylint fixes for the zfs provisioner
| `1.9-816 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f23995ecd70f610f75e82adb7786b5921c3b1d1>`_ Honor the mkfs_opt in the fs.zfs provisioner
| `1.9-815 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64eb06a02bea48e9ee3073f3bbaf5ca45e9c8776>`_ Move the sync.zfssnap purge from postsync to status eval
| `1.9-814 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=73a86fd4648b5b9c55eac4ee0b5f2b0aeb27aa28>`_ Fix a rare monitor thread stack in the delete situation
| `1.9-813 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0bf062d6721f7e7d91312cb83b1d1cbe0f4d4324>`_ Remove all UNDEF from the resource drivers
| `1.9-812 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11c53a80ee86e017e8005e2ad5cfbc1767762340>`_ Merge the encap service avail status with its parent
| `1.9-811 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d156a6b0ca42eaab8a62d209d113fef0742979f6>`_ Fix rare deleted service instances lingering in the daemon status
| `1.9-810 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16b3afa7c26ec30df50e5a255737fe0ccdd9b3c0>`_ Fix the undef resource status after cache purge
| `1.9-809 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=18394c751566bd992cdc0ef5de07050babea470c>`_ Service instance delete fixes
| `1.9-808 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ceea1aa9b29996c140408ed462a3b10f6c2f0ab>`_ Fix the table formatter on python3
| `1.9-807 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2d1823d89e4877abf7288b47a53a84024d0c6e9>`_ python 2.6- fix for the osvcd monitor thread
| `1.9-806 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af59fd652309d567913cbf44e88599b9224644f7>`_ Fallback to a full zfs send/recv when the remote pivot snap is not present
| `1.9-805 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0aba12994df9bb105c57d41a258907f3c3363c69>`_ Fix the resource transition logging
| `1.9-804 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af0ce74f0693423a675cd9fa035f059ca61efaf7>`_ Remove empty keys in the deb manifest
| `1.9-803 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5a70717fa9800535bc0452062a572dbec7ab5142>`_ Don't eval sync.zfssnap on not up services
| `1.9-802 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b8bd26a78c86a859f0e49faba96c48470b1296df>`_ Fix sync.zfssnap/sync.zfs coexistance issues
| `1.9-801 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e065c2a160807674f4cac0050437cfb0eac6602>`_ Preserve lines not in <key><sep><val> format in the keyval_parser
| `1.9-800 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc0037e849f707385f862761ddc189c550c1aacc>`_ Don't skip zfs snapshot purge on passive nodes
| `1.9-799 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7fc303dff3da505b12c59141b6588d5937e305b2>`_ Make sync.zfs and sync.zfssnap coexist peacefully
| `1.9-798 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=302e3f7eeeede45a1ed8dcdff5dcace852f48b10>`_ Fix sync.docker driver
| `1.9-797 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4b3bff6e93f36e07c151e212f28c4429488b9245>`_ Fix the print status not displaying the encap resource
| `1.9-796 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f9212e81ba656e0bd727319e9fae329c61b4cab4>`_ Forge a better version string on agents installed through git
| `1.9-795 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bf20998b62a977664405b83fddbda4a11eff982>`_ Add duration convertion of --time in daemon_service_action()
| `1.9-794 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b0440a95f867259e1448cc9e94fa19e017315a9>`_ Refresh the daemon status before deciding to abort an async action
| `1.9-793 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bebffc692dbfce2a11de445d82c57842f2eb1ad7>`_ Fix "lxc exec" hangs when executed by the daemon
| `1.9-792 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=44b394d8fcfc6c3c0f72015166f286a8dac06447>`_ Support "svcmon -s <selector>"
| `1.9-791 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ff0abecc6b217ca6799f1261e6fc824e02ee297>`_ Honor timeout=0 as a no timeout condition in daemon_send()
| `1.9-790 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=457398c5c8e717c1d709b2ed3c90e962cfe17b40>`_ Add missing janitor_procs() in the listener thread loop
| `1.9-789 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ac46784e98961615dd6db2612325d3a20885b97>`_ Fix another case of PIPE in Popen() pushed to the janitored queue
| `1.9-788 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cc73d210f2c348927e1169c9703d915e8ad6c36e>`_ Don't pipe stdout/stderr in Popen() from the svc actions via lsnr
| `1.9-787 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=486f230cdfea026fdad22945992e816a87b8a25e>`_ Fix container.lxd container_info() stack
| `1.9-786 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e9e6a19e42ad2a2341f0e7527fc91651e138dc08>`_ Fix the duration computation in the end_action xmlrpc
| `1.9-785 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86b63af5598fa6873db07567a7633d139b913ff1>`_ Do async xmlrpc via the collector thread
| `1.9-784 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e31ab52829389a53043174c723194901639b69a0>`_ Fix a time variable conflicting with the time module in comm.py
| `1.9-783 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d858fbb7506ad73829917410d9bef5c641d292cb>`_ Add a refresh kwarg to Node::_daemon_status()
| `1.9-782 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c684fdb9ff90234d1bbb9dd3979e36ac5940539>`_ Force synchronous end action log shipping if --cron is set
| `1.9-781 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0e18a5c3042fe240b3a426f3de9bef8da2f89713>`_ Reinitialize the Node::collector::proxy if its uri is 127.0.0.1
| `1.9-780 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=76c67be11e8fa94d87f14ac82558c18f5eda1872>`_ python 3.2- fix
| `1.9-779 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e1fedbeff4b26fca54e1b26f9ed3dd51cccb8cf>`_ Initialize Monitor::compat
| `1.9-778 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f813d6c2f504f91ffc9c5521f33c5377a00fdf10>`_ Fix "nodemgr pushasset" hba section data preparation
| `1.9-777 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae743e9e11a86309bfaea5d242dea6f198f086d0>`_ Fix the schedule examples in node.conf
| `1.9-776 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=69a5c5899292b48acc704f8d9423d27ec87ed864>`_ Add missing sync.zfssnap resources in the print status output
| `1.9-775 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e29b793a30161d7bf5a6bc3d03054dc58fd12af>`_ Fix the deb preinst not running
| `1.9-774 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b68745015415f743b4659572c6c8614124ededf9>`_ More verbose preinstall and micro-optimization
| `1.9-773 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fcb48c148ca2683144f056a45a3c105443d5ca2e>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-772 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6149515b7b50231b1bee715c2b1af24b16a082fe>`_ Update bash completions
| `1.9-771 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2e7fdb4ea28a08aba72341d907a350c3fa6a5cc5>`_ Add a per-task run lock to avoid double runs
| `1.9-770 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6ff8508e6546e2000d2c879e37fd33035c6fba6b>`_ Python3 daemon fix
| `1.9-769 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8dfbfda08c41553dedeff4eb12c4e4b11fb4fba5>`_ Verify the monitor thread is alive in the collector thread loop
| `1.9-768 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2dd3a1323ecee67e6cd3cf96af451f9aa35e5ba5>`_ osvcd optimizations
| `1.9-767 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8d260ad9672cfd9f997b08191ddb57e126a08450>`_ Fix "nodemgr daemon stop --thread-id <thread-id>"
| `1.9-766 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a9c2f07048988962a781a76ebc20bfcf44ba5c29>`_ Fix the delete/stop/shutdown not being treated asynchronously
| `1.9-765 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac0c8917d1df6bc9131f18e6eb42375bb237e35a>`_ Fix a daemon deadlock
| `1.9-764 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8fbc5fc60d50a6effc8bd18327450028828c5d4>`_ Fix a stack in the collector daemon thread
| `1.9-763 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3a7b76c36e6405e9b1267bd9614598f9a976ad3>`_ Missing part of the previous commit
| `1.9-762 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dbea108943dc24ddc3d8abddabfcde57ece6577e>`_ Fix the sync status codepath
| `1.9-761 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64efcd7beb740bff7974a0e401d45c967da50e24>`_ Evaluate a sync status to n/a if the service is not avail-up cluster-wide
| `1.9-760 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d10935bb90eb65b219ee97aead27070b96a24e7a>`_ Remove the nodemgr schedulers cron job in postinstall
| `1.9-759 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2aab45d476b6551be6736b3576a5ae6b16a7c5fb>`_ Don't display encap instance notices if the container is down
| `1.9-758 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a5698e9a88cf3a7b3ae79334d1773739f45715f>`_ Remove the svcmgr push nose test
| `1.9-757 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5c9f6a177b997c662a6efdc2bf08725a0bfda5c1>`_ Create the directory hosting the 'last' status cache file upon update
| `1.9-756 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=251490409d6af3896ca41af320626766ae1c397a>`_ Remove the nosetest scheduler fork test
| `1.9-755 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e562bcfed2edc0714bc1b624e1584a50cc276066>`_ Task run scheduler tasks fixes
| `1.9-754 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=93c35a8389d29b99005f42c6935a4c71c43e17bd>`_ Fix collector speaker election
| `1.9-753 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b41232edf85d281e24d6a63b5d82af16f74ed8e3>`_ Fix print status keyerror with containers
| `1.9-752 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e6314fbfab215b68e795a46fc1843541525707bd>`_ don't print encap service notices in print status if the container is down
| `1.9-751 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3cba42f629ea2e5de17c0e67b010925d534cd7de>`_ Allow the --slave --slaves and --master with freeze and thaw actions
| `1.9-750 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42fc9782674c0eb3c94fe591d17d0ef4e44da1ac>`_ Encap enhancements
| `1.9-749 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab94d7ae8c22fdb9e9b2e37f28cb84e7bf06cbb5>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-748 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4c3e40e9f05f3a81c01d25114d2ada6bfa7f5ee6>`_ Fix the cgroup capability test
| `1.9-747 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a8044589b88f8b1ff32f9524a27628fc9f0979a6>`_ Restore the frozen per-container notice in print status output
| `1.9-746 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=067ed695790a588aee6abe7999faf92bc94b3963>`_ Fix encap resource group status merging with its master's
| `1.9-745 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=255b9da14e504bc43f5a4a5182b276bf539002f4>`_ Fix encap service refresh through the status task on master
| `1.9-744 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4404bb9add2338ab07fd44fb33c7cb42ed1e1842>`_ Fix the encap services purge in the collector thread
| `1.9-743 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ca294d728122d1f74dba05563e868cc21d03f68>`_ Don't include encap services in the data send to the collector
| `1.9-742 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7dd61cac34443c9a3c37b820f64cf970ab3d70e>`_ Don't add resource monitor and status tasks for encap services
| `1.9-741 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=faf83c895b23f87c618e4f3677d092c8941e34f3>`_ Fix encap status refresh through the status task
| `1.9-740 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7eab34406733d448a78add0422ce96c2a1931c44>`_ Fix "svcmgr set --kw <rid>.<key>=<val>"
| `1.9-739 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bea48e82732d7d718b6df0c0be8ab418921fab18>`_ Fix encap=True resource keyword
| `1.9-738 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eaad1666b4f22719cb53763b7174bd7c4628bfd9>`_ svcmgr abort fixes
| `1.9-737 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=15d13673ac35636755cae3eefdc4bebae6dfd349>`_ Fix the branch support
| `1.9-736 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=96bc1cccd5905189735bd16febf55928578426bf>`_ Add node.conf node.branch keyword
| `1.9-735 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc2bada0f426a3b341fd353699d304135a5c7362>`_ Avoid submitting async actions that the daemons can not honor
| `1.9-734 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2dc8430b5057a060da151a007d20948a050875a1>`_ Add the "svcmgr abort" action
| `1.9-733 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dfacb53871d41918999b91fdb87679ed94321137>`_ Fix a monitor thread stack on delete service
| `1.9-732 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=766f1f58b6e56687f89c77c5ca73c7853a54c8c9>`_ Set a low wait lock timeout to svcmgr commands executed by the scheduler
| `1.9-731 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a1518cb581a4db7014e057e4c922120f6c90bd99>`_ More pg fixes
| `1.9-730 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b4e7352a9d358f91056ae0926ea6b72ecf38497>`_ Declare the pg_ keywords valid in all resources
| `1.9-729 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a48660791273183eb16bc91a4637a97c25481e3>`_ Fix typo in debug messages
| `1.9-728 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2c4d7b7c1ef127da0c0cbb7f50966293a00e7f01>`_ Deprecate the DEFAULT.cluster_type keyword in favor of DEFAULT.topology
| `1.9-727 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=517dc9f315414233286e61664cc999910e783a47>`_ Add the "encap" global keyword
| `1.9-726 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6af8afbdedc57f80ab7f6ba85c4b2250fbfe9d36>`_ Restore the push encap config streamlog suppression
| `1.9-725 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5cb6c0101eb4baaaf6b86b5f05b3d4f659402e61>`_ Add the collector daemon thread code
| `1.9-724 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=338f035e3a4ef76a64deec16eaf4ad412405d4e8>`_ Move status and config push to collector into a new daemon thread
| `1.9-723 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5d7d13134f7304f4f563721c969e4b2cd8a5dc6>`_ Catch a stack in fs.zfs unprovisioner
| `1.9-722 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7bf93aee88f1dbfa7a2b6c5901ab4beb3fea221e>`_ Fix a log message in the scheduler
| `1.9-721 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=db7fdc581335212fe41ce9f3292a3ee898cb4e6b>`_ Support the osvc_root_path kw in lxd
| `1.9-720 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=58222546c24472a86065ea1f8b51593ec6f7bad9>`_ Fix the lxc files push/pull commands
| `1.9-719 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bd3c5b461bd7a8ce0d3a32bffc18c3820a253267>`_ Fix status evaluation caching
| `1.9-718 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e83b6b4f4fbdfc40e5e47ab6b04a2a898604e2fb>`_ Use daemon listeners for --cluster instead of ssh
| `1.9-717 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6af7eaa0afbd63bab8cdfeadec4f0d12dac4b2a>`_ Fix service print actions
| `1.9-716 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=33ec7e26fb7c9b2cb8ab9872d707ddff45059f4e>`_ Avoid unwanted takeover on long-dead node rejoin
| `1.9-715 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c1579afeb771af340537160eacbc9ba5eb44cd0a>`_ Fix the deprecated action translation algo
| `1.9-714 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a37b65280d9ce2367add155bc020cf7774b5c6e2>`_ Fix a reversed logic status check in sync.symclone
| `1.9-713 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac07d3e470f83f44a873d8f7ffc0cde2da619ed2>`_ Fix the Resource::status() refresh through self.svc.options.refresh
| `1.9-712 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=536938df27e78da7846ca5fa32152856535d28de>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-711 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a63805dc70a23ed59655bd35dc94c7aa69a91af0>`_ Normalize the quote/double quote usage in the nodemgr parser
| `1.9-710 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98ccfeb387bd1c6575709691616e606bbc038aaf>`_ Honor --node <nodename> and support --local in the "svcmgr logs" action
| `1.9-709 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=91f77cd6494b2d79564fa2aaa398375c896bd3d2>`_ Display parents too in the "print status" output
| `1.9-708 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e5fa724a2479894a78356fb3f6836b36d4c1843>`_ Fix the "print status" not displaying anything when a peer is not joignable
| `1.9-707 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bbc1666962caefe7a17d054c67e1bfa0197124db>`_ Aggregate enslaved children avail status with their master's
| `1.9-706 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bd7e9194ae4bea924a3fff342735e4e66571c1fd>`_ Allow the giveback action on orchestrate=no services
| `1.9-705 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5775b41cc7ab049eed175d3fde7cb4d76b06c643>`_ Fix and simplify the shared resource prov/unprov
| `1.9-704 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=55d56af85ad90ea8dbd3a725298a5b1034240ae3>`_ Fix typo in docs
| `1.9-703 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0de2f7c638e2e29e3004df28a2aa7bbbe6a19611>`_ Move the peer instances up the leafs in the print status output
| `1.9-702 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d07c379a5b7d6ce7b531fe6827c7d414a4c28a9b>`_ Enhancements to svcmgr print status
| `1.9-701 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30caad478487e9fcb1c09ecea78d7bf1ee68aa43>`_ Add the DEFAULT.enslave_children keyword
| `1.9-700 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3c4b3938651033055ec44678b6e3411a7563a957>`_ Shared container.lxd unprovision fix
| `1.9-699 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98a3277d4c801149847024e3d6088cb55b37d3f5>`_ Cluster-wide provisioning fix
| `1.9-698 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f0fa84c1431e44ac8584b462b2b9a8af03b3230>`_ Cluster-wide provisioning fix
| `1.9-697 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52b8340b7740250d27beb346b771845eb2944e30>`_ Don't merge resource provisioned flag from ourselves
| `1.9-696 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7bc3f010129e3886ba51be7df5e53d1adf9e0c3a>`_ Honor --disable-rollback in the "provision" codepath
| `1.9-695 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=40d74c185c537dcddb188b0b1825f06581b37e17>`_ Don't run "lxc import" in the provision codepath
| `1.9-694 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9168bd018c1f82f6c4f2e59bd0fa18a42874ccd1>`_ Don't rollback on provision for placement leaders
| `1.9-693 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0e254ed4a40b72061ee655bf41e4fd2b39e5ad61>`_ sync.zfs fixes
| `1.9-692 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=46bf1524e254e6be0be95fe211f9cec02e4209a8>`_ Fix "push config" being called on every command
| `1.9-691 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d41288830d6d0c9246b89691a0d38329d98bd1bf>`_ Avoid looping over remote resource provisioned flag merge
| `1.9-690 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a8dc628518ddae7dab8698664649709cc573c96c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-689 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5160e7929417ab222b8caef3735403186ca8ab61>`_ Add flush and fsync after writes
| `1.9-688 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=44110802db17c30617d1e3a0007a0a018ab2a497>`_ Aggregate placement computation enhancement
| `1.9-687 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=feb961ceb54e563447cb670989349ee15f896663>`_ Import the container in container.lxd postsync
| `1.9-686 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2a93908e7879fd2cd412def95adb78d6883c033>`_ Fix a stack in the monitor thread
| `1.9-685 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d02cde7004c6e2fa35b650c45a8499cbd8f8755>`_ Rename the auto_rotate_root_pw scheduler task to rotate_root_pw
| `1.9-684 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4d389946cbfaaa33312b015416c575501be810b4>`_ Fix the sysreport scheduler task
| `1.9-683 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1713152a53043f233739f1cf57b865e829982e58>`_ Rewire the schedulers
| `1.9-682 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b3f851dd1ab7ddfcb0d1322f6bd0bd524b032aa8>`_ Remove undue existing remote snap on initial zfs send/recv
| `1.9-681 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64d67ec1b3d24a658869820217d7fa68edb9ec50>`_ Copy the attributes with sync.zfs "sync full" action
| `1.9-680 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=25b2742c48077d1e9338454b35db7aec7ebcb480>`_ Fix to methods flags as static, though they now use "self"
| `1.9-679 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5fa04751546fa91774d355c66145252f68cb2382>`_ Stop playing tricks with the lxd handled zpool
| `1.9-678 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eda8947cc5fae72ce76af20326622266a77c2ec8>`_ Add preemptive remove of the remote @tosend snap in the sync.zfs drv
| `1.9-677 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3ec73667f64d1930b2ff2d664909d447793f0cea>`_ Fix a possible daemon monitor stack
| `1.9-676 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d3e630840b142b19f4b5367601352cd96ef4ea81>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-675 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34b5d4b50c2b1b383713b6855f08db62fd0baa25>`_ container.lxd enhancements
| `1.9-674 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b86e396a1a7520a1740120f97ed869e7611bf068>`_ Don't trust the provisioned flag if --force is set
| `1.9-673 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fd857336fb941185c94a02036d97fdfa5710d9b3>`_ Allow custom stdin kwarg in call() utility functions
| `1.9-672 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc1d56ff3e733c49239e120a71c7cec0c6f2ba9e>`_ Remove the "a stack has been saved to the rpc log" message print
| `1.9-671 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2dcf1d306e38079cd37913ec6cf620367fc16e87>`_ Add a 'lxd import' on start if the container has never been imported
| `1.9-670 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dc02d5bd60b791192fb534ecd5f2c64754807696>`_ container.lxc enhancements
| `1.9-669 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45f516018fdb05eea51578951bcff68d0cc12f44>`_ Fix rcMounts::get_src_dir_dev() on Linux
| `1.9-668 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a041b67aef202d5019903e22ef63951f604645dc>`_ Support all document bv os types in sync.necismsnap
| `1.9-667 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80dc3eece11c5a16fc36c5527315292f061b63c9>`_ Accept SV information entries with no type in the sync.necism driver
| `1.9-666 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3c6967a90ce89782bc959d1bee7e0c482eafa195>`_ Fix the sync.necismsnap check on the data returned by sc_query_ld
| `1.9-665 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d35229f8ee3a4a3703f85b08f9dde5849d75f930>`_ Track the new disk.lv resource template
| `1.9-664 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3af24d2b1c18b660c029ac48fb4f79db9419cd00>`_ Add the lxd provisioner and unprovisioner
| `1.9-663 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f89642acdea79f1bc6750ec8441ed7a090f8723>`_ Plug the container.lxd driver in the service builder
| `1.9-662 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e4bdbde21e2e01fa0bfb93e3d3b99ce3885cad78>`_ Add the container.lxd driver module
| `1.9-661 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7fd6b2703ab4c612e954abac407c884887698e07>`_ Add the container.lxd driver
| `1.9-660 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d3a00d45fd555536c1ff449bd46d2d2b387e3591>`_ Fix a typo in container parent class
| `1.9-659 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9289bb00bf53c0ee71c92ce5f7fa8dc7b2cde6b1>`_ Catch a stack in sync.necismsnap when a sv in devs does not exist
| `1.9-658 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=74247500b392d07bda06c266d23f9bed17ea3287>`_ Start the daemon on first package installation
| `1.9-657 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86f16e0f265e1aa53001a06a0ee67b03520c17cc>`_ systemd integration fixes
| `1.9-656 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b44fa6990cbb0acca5a003480fd7381373ad962>`_ python3 compatibility fix for the 'spread' placement policy
| `1.9-655 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86c854c4a6d6c7c32d3b38023cf758de97be6e6f>`_ Fix the provision action resource ordering
| `1.9-654 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=413f00da0b6d48492555a78565ae41c0a231e307>`_ Add 'svcmgr start --upto <drvgrp>' and 'svcmgr stop --downto <drvgrp>' action
| `1.9-653 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1cee6dae46189a30dad03747becbdc18c0f6a829>`_ Fix stack on svcmon when the daemon is down
| `1.9-652 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7c93b910eeb32f48c0cf056ba11e6f260b2d29ad>`_ Propagate the --time option to daemon_send() in the remote service action helper
| `1.9-651 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c3484ad5c3a314feabb13877a9be72d80123e14>`_ Update the nodemgr commands and options help text
| `1.9-650 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=81d53fa404f878a874c6e0249f53a5bc2f08461f>`_ Fix tab/ws mix in rcAssetLinux
| `1.9-649 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a0b48eedb8a8a32246da7ae82c4da115f6a3987>`_ Fix an svcmgr action help text
| `1.9-648 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=40fe4f94be0ecf883e2a98daf3c4b61a4ea941ff>`_ Update svcmgr actions help text
| `1.9-647 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45c17c974d15d538f783d3ad56ae7fd5ccc3b78d>`_ Some more tweaks to svcmgr options help text
| `1.9-646 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=74f0d808b10784353ce141bcb8150e0a7692a39e>`_ Complete update of svcmgr options help text
| `1.9-645 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dabb7dbd0bbb22245d6742572eccf5dc49d7e445>`_ Remove redundant actions
| `1.9-644 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b15bf53cdf28cb387e900487ac90f334a9fd487e>`_ Fix the svcmgr create action unduly freezing the node
| `1.9-643 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85d83d211bb028786cc0fc18685f6a927892b265>`_ Update some svcmgr options help texts
| `1.9-642 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b74292f2f9ae927f44acf69ddc9fbce9f945661a>`_ Support set/unset on all resources of a group
| `1.9-641 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f80babe88384ab2f386c28c02b9bad490ffdf26>`_ Sort options and action alphabetically in make_man_rst
| `1.9-640 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2356ba7d7ef4ec6ff99421db178cf9507916c585>`_ Propage the --force option to encap commands
| `1.9-639 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=650fb80070925be5f0052660bbda5c92a16ce78d>`_ Edit config and daemon monitor instance status reload enhancements
| `1.9-638 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0f54541b8af6aec83c5509b666313a221f477c5e>`_ Change maxdepth of the rst section docs to 1
| `1.9-637 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a772de1d70f4695ad63abc4678356efe024bf68>`_ Fix the spread placement policy algo
| `1.9-636 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c16024d78cee947c86bc60f8af960edc76ce9848>`_ Add the "spread" placement policy
| `1.9-635 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d71282fa34019e631be35fc07e29a8805957454a>`_ Fix the method used to determine a service is globally shutdown
| `1.9-634 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=09542ef51736743f91166b485324002614d7ff73>`_ Ensure the monitor method get_last_svc_status_mtime() can not return None
| `1.9-633 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ad9803c4b11f5d70efe95ef6d0e3e51f20ebb634>`_ Allow --wait and --node with svcmgr shutdown
| `1.9-632 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d1663855a453c96b6a223f2b39ef811510cbe7b7>`_ Make svcmgr shutdown async
| `1.9-631 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e54d885a15a6d74c0ce0d04926e9c74e285618a0>`_ Refactor the rst commands docs generator
| `1.9-630 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb5327e1122c0789172b7843edf712c33c31f672>`_ Fix a monitor stack on provision
| `1.9-629 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e98fe64c3b29a2e9239f4076fbbbe74f52e04e57>`_ Add the fs.create_options keyword
| `1.9-628 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83874237f11eab899dcfecedfabc4f3c2f6716fd>`_ Fix a syntax error introduced by the last patch
| `1.9-627 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2d204aeee407397d9928b15161a515ab6d845463>`_ Fix instance json status being loaded from file too often
| `1.9-626 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d58a339b8009f37481b5cc10abb3fb385b950d7e>`_ Fix reversed logic in 099c94c1270322916d8457dce1bd607f67e9a72f
| `1.9-625 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98dacb50ee6f68d0e7f69f6366aeeb0f0770decc>`_ Disable osvcd.py oom killer through systemd unit file
| `1.9-624 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9d2063ab7c951d91229ced76e5a752a7adb18302>`_ Add dependency on systemd time-sync target
| `1.9-623 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ba361027805fdce73b98980195dcb87ea1b2355>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-622 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=128e7d7c5e2fba4e20943102d804cd1ab0179501>`_ Enable systemd restart on failure
| `1.9-621 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=099c94c1270322916d8457dce1bd607f67e9a72f>`_ Don't orchestrate start if the instance is local_expect=="started"
| `1.9-620 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9a76dcadb4daa72fc370327f0e91ea059c40b7b2>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-619 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ee3d1c9961bfc1493b5644dc1d01e5e1a9a575ee>`_ Discard "start failed" instances from the placement ranking
| `1.9-618 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1e7822b6837296594803e9a638efff6e88f77b54>`_ Fix make.lib to ensure git commands are executed inside the git repository
| `1.9-617 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=50783a93fe2e0a636ac6207e35f4e0384d28d4b5>`_ Add app.<action>_timeout keywords
| `1.9-616 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c2e7a01e35b7af3c0b4028d679c346bafc273e4>`_ Remove the boot action
| `1.9-615 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=02be57abc9deed8bfaa766c76aeed6bf8b54d951>`_ Remove the command rst help references on sections
| `1.9-614 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b62ab05f6bdc7b2d563f7934f01207699ba796f8>`_ Add a rst commands help formatter
| `1.9-613 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71b56cb85da6b25df73e82be8a0ce957604c63c9>`_ Update the svcmon manpage description
| `1.9-612 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f37586ca96eb0448faf9a19cd082836be1bfb2e1>`_ Remove the DEFAULT.cluster svc cfg kw and node.clusters node cfg kw
| `1.9-611 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63acc39c54a2f2c14539bb5c8be305fcbd68e2c3>`_ Fetch the stonith configuration on nodemgr daemon join
| `1.9-610 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d4edb6a712706bb1bded0cf97c43cec890fc699>`_ node compat check fixes
| `1.9-609 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b70d6a956360b745a855b6771d1a1e2e8afab478>`_ Add daemon compat check
| `1.9-608 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05174eab04cae411f77d8f3c17fb1cc0b3aae107>`_ Fix disk.md.shared keyword appearing twice
| `1.9-607 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f54b8dd96adade4403c1e8e9efc1a6ce053ef77>`_ Fix the disable kw being included twice in DEFAULT
| `1.9-606 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11e90d01fd90b358e3f63da9ac3ee57b9edbc1e5>`_ Fix the "wait parents" state not being reset when parents comes up
| `1.9-605 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1c011ca3bce16c155df68ddc25993810d150458>`_ Fix app resource timeout with python3, and use the duration converter
| `1.9-604 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e411fe16edd72a9b72ef4680502477fb178de4a5>`_ Deprecate the always_on keyword, add the standby keyword
| `1.9-603 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dfe4c8f435cca96e0885e154dcf22cdf94cef88a>`_ Add warn to the resources status causing a restart and TOC
| `1.9-602 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ace6215800a396999ebb9b77a134d0c43a42f141>`_ Fix run_requires keyword unduly autorized in sync resources
| `1.9-601 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=38607df86a0d9c41557950c33f74053d87032cfa>`_ Add a detailled, multiline constraint keyword desc
| `1.9-600 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=03a889be93f468e717f22d5f63de513c8bd1bc9a>`_ Replace set([]) with set()
| `1.9-599 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=614b5d0a68d02000ce31f69cf12f4cbd5c2b3c51>`_ Deprecate DEFAULT.mode
| `1.9-598 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=136ab2653964a57a7b536f0f0a6c3463d0b68762>`_ Remove the sudo execution of svcdict in make_rst
| `1.9-597 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3e0f6384bdfbf078f67603d72ae98738b9a131f>`_ Add bin/pkg/make_rst
| `1.9-596 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af7c533616f6ad757aac321c5881ef4f27bfe550>`_ Implement the TOC decision in the daemon monitor thread
| `1.9-595 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=429249b8e5ada0175f7015831a323f03ee4fa2c1>`_ Fix another syntax error in the print status codepath
| `1.9-594 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e76390b4d79d711e5d9bb18ed7dd05ae236cf249>`_ Fix syntax error in the print status code path
| `1.9-593 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eba5ccf14e960d97d84ddb56b871d1096a04a4e7>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-592 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f49fc9ea23a98a0ca6e65cbcae6c9d2f646663d0>`_ Add "nodemgr stonith --node <nodename>"
| `1.9-591 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=db6d98ccd8743aab8d43d46fc022a3b593a4051b>`_ Improve build environment cleanup
| `1.9-590 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d85313840e3070a0321c0571bfc55c419d2e998>`_ Do not try to freeze/stop the node when daemon is stopped
| `1.9-589 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=858af39bf11d2f5147d661b2bac0af66cf6dcc6b>`_ Restore monitored ip resource TOC on unresolvable ip name
| `1.9-588 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=55f7f8f3ce98288c42441b19027e0fa46f8ddaf3>`_ Drop the stonith drivers and "svcmgr stonith" action
| `1.9-587 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d157a3802021d143d10476dcdf3aacbd6ae71830>`_ Create the var/stats/ dir if it does not exist yet in the postinstall
| `1.9-586 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8ee739187d4aea747094375ee144437565619b9>`_ Add the Linux disk.lv resource driver
| `1.9-585 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22c7787afc24ad3ba5e69c4c10ef2bac9acccd07>`_ Fix tab/whitespace mix issue reported by python -tt
| `1.9-584 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1b7412825c2c8ed797ce59e8b44fc5492171964>`_ Add .pyo the gitignore
| `1.9-583 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cae62d95c7dceca1a8dee2053a84e7811372ab0a>`_ Fix raw resource using devlist references non starting
| `1.9-582 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7863fc15aa2c4d87c19a8c883dfdae88dae5bad6>`_ Fix warnings reported by python -3
| `1.9-581 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b4cfb53d25fc7121d4affcd4eb6d39a0fb7aa00e>`_ Fix the stop request monitor code path
| `1.9-580 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=afaf35b4e3fa6e2141bd0aa607ff21ca4ce9d5b3>`_ Use all duplog msg kwargs to produce a signature
| `1.9-579 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fea2b38ef31cc0e1c99a617f7feb15646b8743b6>`_ Set the "wait parents" and "wait children" smon status
| `1.9-578 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f988bf77b20359392f58d2f929b60fa67e7ffeb>`_ Fix stack when attaching/detaching modset/rset if no collector uri is set
| `1.9-577 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f00566e538cfa7419d37496c331a0f5d46aee62c>`_ fix regressions noticed by nosetests
| `1.9-576 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9689203f1044af5bde4906ae46c5e41c5c8e1fa3>`_ Add stats and frozen flags migration in postinstall
| `1.9-575 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4da2e03b806a5da52082af258f10bd950133ff9d>`_ Finish the var/ unclutering
| `1.9-574 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f4a910b550c447a90effcff5f0ce1eb7f1dc57d>`_ Add DEFAULT.children
| `1.9-573 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=792e8d8ee284cc481244120669950ff5b4be062a>`_ stdby+monitor resource fixes
| `1.9-572 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a93e24b69df6dba596d82ed7870860273dda41e7>`_ More var/ uncluterring
| `1.9-571 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=55a6b3aebe93ee53edb5d7057e4116dd4cf18e06>`_ Fix the root to app resource script owner demotion
| `1.9-570 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=76c58b583afe9225165b0466a96f73126abe475c>`_ Update keyval doc to fix the 'reset' key usage
| `1.9-569 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4d2eaf245b5d4f5260e33e3aaece37ccec2e6c06>`_ Don't raise on linux.lvm vgs pvs and lvs commands error
| `1.9-568 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d472ec7d689e644088252bfc0ef7f171874638a7>`_ Move the fs_u stats under var/stats/
| `1.9-567 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b96a2d17d81da16a40432ab3cb80bb0159cc7ca>`_ linux.vg provisioner fixes
| `1.9-566 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a25e3dc85f9be8cd43c02527adfe1e9f11cbbb14>`_ Fix a stack in the linux.vg provisioner
| `1.9-565 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bacb7f91ac9845077ff79314808c4df9cea52aa0>`_ Fix colorization of scope in print config <kw>@<scope>
| `1.9-564 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=31f83d0c443f6c016ebbfd0ed07c5b0cb8e0bf24>`_ Fix the parents handling in the orchestration algo
| `1.9-563 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19c5f6395f9a34144fbf988be2d7eeedb9d5bcc9>`_ Typo in the daemon code
| `1.9-562 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9a20bf6c20375c76590efba8c664fb981dca808e>`_ Add the DEFAULT.parents keyword
| `1.9-561 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62c772246ff4ccb289faa88ba1b9387fff0b6cae>`_ Force a resource restart to 1 for standby resources in the daemon resmon
| `1.9-560 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a26ca361711902e453f758c5580edfbcc222f3a5>`_ Don't print the "start the local instance (unorchestrated)" when scoped
| `1.9-559 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed240d60bb98a633ddcebe88fe45d7f27f155a62>`_ Fix the CompObject generic backup codepaths
| `1.9-558 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=467ae3730353e4ac1dea91d938fb7fd12b1cf7af>`_ Set --local automatically on start action on orchestrate=no services
| `1.9-557 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf5d212096bacc02a4e3c47c0147c13a531aac60>`_ Fix the keyval comp object json example structure
| `1.9-556 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2734f00798f3b672e3ca139f6ff49e5bd605d1b9>`_ Remove the shortcuts for orchestrate=no in the placement methods
| `1.9-555 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2454463f5c7a758e07f6509a7fea7fbb656d217>`_ Switch the orchestrate default value to "no"
| `1.9-554 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=50d3d34fc8381f953180bee91efd4e150627b6a7>`_ Show a proper "reset" op usage in the keyval example
| `1.9-553 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bcfade250d68ff7865ee6830830361950e944269>`_ Document the IN operator of the keyval compliance object
| `1.9-552 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e34f2de3ddb9af7d4949636f66c6506620c2a8cf>`_ Support integer target value in the keyval inputs
| `1.9-551 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2b9a0e16d94526faf4ed39ec43748731cbe9a0e>`_ Update templates and bash completion
| `1.9-550 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7c149cc0a71d9b256696fd15a5d6a97de2615344>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-549 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8297fc222d8f9d1c2d9830231c885f60b20dac72>`_ Add the 'node.rejoin_grace_period keyword' to the node configuration
| `1.9-548 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf267f679980845530ae5a1dfb30b1bd984b19c1>`_ Support 'orchestrate' keyword scoping
| `1.9-547 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8155b1413cf72ba98f3221cfe40ea7296aae8b1b>`_ orchestrate=false policy fix
| `1.9-546 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6ec856ad99c3f0aec29bc3c3977b95fa2d10caa4>`_ Switch from orchestrate=true|false to no|start|ha
| `1.9-545 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d71c1c7e9fb2b7a25bbda7f33f24e7755493399>`_ Fix the "keyval info" command
| `1.9-544 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4516c4e9f66d1edba8b03f1ae67846c8a82915d0>`_ Better keyval documentation
| `1.9-543 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=483dca8007b3189a803a64cd2c804915873864e8>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-542 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b4cc0b952fdea14171ed1515058292258bef0ec>`_ Add a target size < current size sanity check to symmetrix "array resize"
| `1.9-541 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8310f8cfbab2e9ed503144a4296d2444e9de8bcb>`_ Display "drp" in svcmon output for services the node is drpnode of
| `1.9-540 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae194c8d754c263f97dce194424ff69e5e9e3d51>`_ Fix the "reboot" monitor action
| `1.9-539 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f33e9b5d68023d7dd38039596e31e6031e957eb>`_ Add --node/--local support to the toc action
| `1.9-538 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=84cc1390115923659efa44c82b35fc9ce53f3dbd>`_ Allow a PRD node to be drpnode for a PRD service.
| `1.9-537 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea2bd7019a73f4568a222d4d359672bea6b59af2>`_ Honor DEFAULT.orchestrate=false on flex
| `1.9-536 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e0f5f4746a952492d95635245353afc79e34ee05>`_ Honor the shared flag in the md provisioner/unprovisioner
| `1.9-535 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e09bac7ab9ff0509128dcea4b9b23c3e49a97e57>`_ Catch more svc conf validation errors in the fetch codepath
| `1.9-534 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d90cca355e5f30f650bd8a2dc3dbb6449e57a43e>`_ Fix unorchestrated failover monitor codepath
| `1.9-533 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c44f99d531210a26fdc89c08c82ed84b0f2eae34>`_ Provisioners enhancements
| `1.9-532 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1ca4725480abef729592bd89985f4cd421f1199c>`_ Fix line overflow glitch in the forest module
| `1.9-531 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6eee13471fe42e3915537e68062b01353089ca49>`_ Avoid logging the same information twice for the same service
| `1.9-530 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=afd84b33f3fc1e29d11b93475afb3bdde2c07d66>`_ Make the smfcfgs comp object class a child of the autodocumenting CompObject
| `1.9-529 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a37ef0d0cadf6a862d0120d6642d266122ec092f>`_ Reserve colors in the 256color range to terminals supporting it
| `1.9-528 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ee9da81569c646029b7223f50bc38b877704600b>`_ Change the resource monitor scheduler task condiftion
| `1.9-527 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2983433b38f5a3891715071e07a550ef58b29a1>`_ Fix data reported by svcmgr push
| `1.9-526 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4af4993e9df37949ddb981ad1f593212db2b5d59>`_ Don't load the json status data cache if cf mtime > dump mtime
| `1.9-525 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dc0a27e39c5f39c1025e0eb76e3ea32be6abf4da>`_ Add exception catching and logging around every thread run() loop
| `1.9-524 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f84b6290f2df8c265bc8816c8fc9e159308211d5>`_ Fix overrestrictive remote svc config fetch validation
| `1.9-523 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3ea3186441307b4f79ec6f9c538c25001386246>`_ prov/unprov/delete/purge actions enhancements
| `1.9-522 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8423d0c6042d1b46cfe789c0512463ecc20e120>`_ Fix a stack in the instance delete codepath
| `1.9-521 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f4a5c3ffe185a3e223337b4c214dc91716a792a>`_ Add missing kwarg in Freezer dummy method
| `1.9-520 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc4598a6dba20cb9f5fc1adbf2a6c0e4c577f7e9>`_ Linux disk.vg unprovisioner enhancement
| `1.9-519 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eb776448f51eeda00b407dc454a8e52113508295>`_ Implement prov/unprov/purge sequencing
| `1.9-518 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8dc626052ca8bf53a987448852de67fa1a5b13a5>`_ Don't wipefs a non existing device in the disk.lv linux unprovisioner
| `1.9-517 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4b30051943f59dd5d18d09133ce8306c0c475297>`_ Honor the provisioned on-disk cache in provision/unprovision actions
| `1.9-516 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ad80051312da365e978de5659d6cefe4b8cd3a2a>`_ Linux disk.vg provisioner enhancement
| `1.9-515 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b3c27ea7f84a8d61b7cf3f650b0264b1e16e592f>`_ Flag a linux disk.vg resource as can_rollback after vgcreate
| `1.9-514 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be173de5cc0c59efb0fb20888a03a5e4c66b9b9a>`_ Fix service config fetching
| `1.9-513 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a81ac22d9826c4e9f4d4ea589b32f39269d6d95>`_ Fix validate codepath wrt references
| `1.9-512 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30d9a1ce63a1109a647c4209e577ff19a658210f>`_ Avoid undue status eval and transient resource status changes
| `1.9-511 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=75044169f4daa39ae24fb9087b8d4947b55dd8b2>`_ Fix a case of json dumping group status as integer instead of str
| `1.9-510 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=99bd4994c0d928af4216b3be576e59e0686bb55a>`_ Avoid feeding None to convert_duration()
| `1.9-509 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80234019c3efb2f3dab7b191fc0948233117e9fa>`_ Remove the "run scheduler" log entry
| `1.9-508 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=549c1baa24568323b2baa0810af5fd328f600cb0>`_ Move the service instance monitor status at the tail in svcmon
| `1.9-507 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea5a1bddad15c18b5334db0d5050885cd023adc6>`_ Support delete --provision in async mode too
| `1.9-506 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7a26bab4b26d5e576b60c5f3f668d4619fd6cc9c>`_ Implement delete action through the daemon
| `1.9-505 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1cc226232b008dbdbb5bf64a26832fdeb3d044b9>`_ Factorize some code in the daemon monitor
| `1.9-504 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80b47fc6b01bec8a06dc054d2516c22c7f1bbd5c>`_ Allow --wait and --time with provision and unprovision actions
| `1.9-503 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=66ba97c319bf3ae5e4d4e32f3a60506a5b53a8da>`_ Fix "svcmgr freeze" from frozen node
| `1.9-502 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d328415131094805f00c18b326506c579d298362>`_ Fix the service-level provisioned attribute aggregation algo
| `1.9-501 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b8bd263192d940ca10953db5d637cfb8b728033>`_ Implement cluster-aware provision/unprovision actions
| `1.9-500 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=440daad67b98af02e38906a0c2993b22f446d131>`_ daemon enhancements
| `1.9-499 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=efeef2d9d91b26cc124b0ec749241d6ba0021d59>`_ Don't try to stop an app resource if the stopper script does not exist
| `1.9-498 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72a83ef7e50c84e399792949f34f0ebf07455298>`_ provision action behaviour change
| `1.9-497 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d81ca28233b9f899221ce981a9fd67f773311f99>`_ Don't restart unprovisioned resources
| `1.9-496 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=912ac1be51e9e1fca8b6ac227febdaf1733d9a67>`_ return to standby instance status after a provision action
| `1.9-495 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43aa82ee27e3835d2d55eb0e67caa5b9d5a92069>`_ Fix a resource provisioned flag non updated case
| `1.9-494 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0b36cc8565e500d314f53899613540cdfaaeaa41>`_ Clear @cache in the disk.vg linux unprovision code path
| `1.9-493 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11108fe927b87dbe1deac7e0f9750e419bc5b86b>`_ Rollback to n/a for normal fs.dir status
| `1.9-492 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=99b4c55d70e4ccf7f69b1dd2c95cc0e9f9baab64>`_ Don't apply a padding to the forest last column
| `1.9-491 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e5cf8d49568dcd3a2650867623973419627fc7d1>`_ Discard non provisioned service instances from placement candidates
| `1.9-490 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0bbfea96bff470c6d263abfc034b2e1e4d797ecd>`_ Purge @cache files in the monitor service status eval loop
| `1.9-489 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43ab130122352ca2a54bbd86607800a0163a755b>`_ fs.dir status enhancement
| `1.9-488 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9844ccc209eaf007c8637043859dfacc00f9eee2>`_ Move the "up=>stdby up" and "down=>stdby down" promotion in the Resource class
| `1.9-487 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f3a40b23c4a40a02bcbcfbd5998e3b6f5d4d034>`_ Allow service freeze action when its monitor state is already set
| `1.9-486 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fb2f5cefb0c10ea21bdcf9e6b3192ab6cd00227a>`_ Implement remote node actions and fix cluster-wide thaw from thawed node
| `1.9-485 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42136857172e167a1b8056d6687715b4253e3729>`_ Add clustered provision infrastructure
| `1.9-484 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=84f07c26b9bae74e6cc2193dcaaeebabf5abff60>`_ python[23] compatibiliy fixes for bin/postinstall
| `1.9-483 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f64cfa3e9c7c0ab6cc16e863b184515dc6c4ed11>`_ Change the "n/a" status color, so ansi2html recognize the ansi code
| `1.9-482 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fa011770c4b8ac154e9251701c1c36ea03b64853>`_ Add the pervasive provision keyword
| `1.9-481 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85abff8784e344966f936e33dbf0cd49d622aa0f>`_ Fixes for the provContainerZone
| `1.9-480 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=062e353a09053326d2f1eb276c79e32a03b17ec8>`_ Don't run delegate action to the daemon if --slave(s) or --master is set
| `1.9-479 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a6e4a5c5e5e682274353559a1634abe4de1685b>`_ Revert the bogus compliance objects rollbacks
| `1.9-478 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2edcc9a1cb27f6b1212573cd74f33c61d1df6fa>`_ Display encap subsets in print status output
| `1.9-477 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6679a334f7edce13ec8eb8471a47d3c964ad0941>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-476 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71637915c924fb132f47d69b49caef9ea6cdde8a>`_ Fix the container#<n>.osvc_root_path evaluation
| `1.9-475 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7c1bc3fa79e82c8317887af0352aaa6b0d60d767>`_ Round loadavg to 1 digit after dot
| `1.9-474 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d7260732b5e5fab891ed8f44db1ae2190af9d1d7>`_ Fix sync resource status aggregation
| `1.9-473 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ffd647586c4e1897fa67507a0d029486a7d88b5>`_ Materialize subsets in print status
| `1.9-472 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=196d9131be613bc27626b58f293e28aa86f69830>`_ app resource changes and enhancements
| `1.9-471 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab78823124de6b9ad19b27fca34e9c0cb2d1e98b>`_ Don't log resources as disabled for resources skipped by --rid --subsets --tags
| `1.9-470 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=03cf8133f97c23b3078ffee8d135398f75596287>`_ Add a simple method to define a custom resource sort key
| `1.9-469 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f72e2fb75243893ebb16325c183cb5351f506583>`_ Fix the preinstall exec on fresh deb install
| `1.9-468 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5dd3f0d6cb6a461e51a0f974046d1d8cbb868c28>`_ Remove useless action == "fs" test in the resourceset sort method
| `1.9-467 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e2de8bdf1cc576683aa736d589bc652d31223fe0>`_ Remove useless __init__ in RsetApps
| `1.9-466 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa47d6d776c5edccee75e29158423e1622d71a7f>`_ Remove 1/2 RsetApp customization over the ResourceSet class
| `1.9-465 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c56a08e24e8d5114bf2e671b859dc56067c67dd6>`_ Flatten the print status representation tree
| `1.9-464 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1c5060f32613fb4e6229be3f972a08afac08f60>`_ Flex giveback enhancement
| `1.9-463 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3194c48248fddff6b8960aa9eb51d83c081fa8ed>`_ More provisiner streamlining
| `1.9-462 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fd3b9f62b8855036630ae11143d234c4223ca5e1>`_ Fix a nosetest detected issue
| `1.9-461 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1094f345999464b7cec397409759f07f30b19f61>`_ Provisioners code factorization
| `1.9-460 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=673eb4565a28eeb5ca0d31285e10789a54ff368c>`_ Fix Svc::_set() codepath, stacking in provisioners changing the config file
| `1.9-459 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba1beb66fe5e600b1ecda7c375c8e528433df436>`_ s/provisionned/provisioned/
| `1.9-458 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab191326faf753fff7899b8d46c729eec5ddee45>`_ Block submit of new async svc action while the last is still in progress
| `1.9-457 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c22b62dfa1a4e97c0aa5f923572d8b294f56e8d9>`_ Stop hardcoding the accessory resource list
| `1.9-456 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c80b80fd2bf018263eeffa73a0d521ac8c04a0f>`_ Don't use signal() in service status codepath
| `1.9-455 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d728fcef23bbbbf0f87e8c9021d26404afa7362d>`_ Make svcmgr delete cluster aware
| `1.9-454 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f8099c76aea60a91e4fd83c90d3d8d5da12e2ebc>`_ Add node.max_parallel node.conf parameter
| `1.9-453 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0267f997b24607cc84ab582cf999c2fc2965be2b>`_ Catch locking errors in the disk.loop Linux driver
| `1.9-452 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ca7af13ffc11efbc9d41d0cf6b237ed14007550>`_ Wait 2 seconds for a loop device to become ready
| `1.9-451 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e4df3258b6e17307447080a227152179d6aec342>`_ Fix parallel disk.loop linux resources provisioning
| `1.9-450 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5ce7a1b390a7b8fcd56a2689badf6c0901942f8>`_ Style clean up in rcLoopLinux
| `1.9-449 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dcd681d63a489e71cccf167fc2974fd2eebdb84f>`_ Fix stack in a disk.vg linux provisionner error codepath
| `1.9-448 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c3d24c2a8a4dfab716affae14888e25317149c7f>`_ Fix stack on nodemgr get --param DEFAULTS.azerty
| `1.9-447 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=38a3df7dbe9313567416f93b08a30d50a092591a>`_ Fix make_deb deb file name after deb-pkgname exec
| `1.9-446 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a8d7dd339aaa674cb4c5fd73375938f47dd1c580>`_ Don't use color.GRAY in svcmon output
| `1.9-445 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c3fd92c0743d0d495aed93aaad1290da921cf8b>`_ Remove 1m 5m load avg metrics from svcmon output
| `1.9-444 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=46f285379c47c5d343d5b2c42962453194004f04>`_ svcmgr giveback enhancement
| `1.9-443 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=639b9f4b7264f89f26fd1d81e121f0003fc0a1ce>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-442 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ac7bdbd7b65fff0e65e87829d69d28009dd829e>`_ Fix debian package build
| `1.9-441 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7169ee0e393d16d5e8584df38996a0bce765c907>`_ Make svcmgr clear honor cluster flags
| `1.9-440 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5bb5b98debdf0444e5b38909f2effaca11af6c60>`_ Fix specfile for rpm and srpm build
| `1.9-439 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c6430f30eff3360802854f9e1b88282443abf12>`_ Fix the long-standing issue with sync.rsync warn state after switch
| `1.9-438 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0d11ceeabaa402b9b48ac1e7acd0d5bfed95fdee>`_ Fix a typo in var name in a log code path of osvcd
| `1.9-437 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eb9030baa719cac9a5ef874a313e6aa7df23c480>`_ Add a non-optimal placement marker at svc-level in svcmon output
| `1.9-436 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c743c265cb55fdc506d7f367525ff09ceee8b420>`_ Fix ip driver start lock timeout
| `1.9-435 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1f7f99b09708d78cbb3f52465040090cc20e72d7>`_ Report placement attributes for flex service and instances too
| `1.9-434 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71813caf2b096a8f6b6777a65ee643032e17cb22>`_ Avoid placement algo logging in the update heartbeat payload codepath
| `1.9-433 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f69bf622022f2db8f801621d9c0d53b2e173a5e8>`_ Use a "!" marker in svcmon to highlight svc-level warning
| `1.9-432 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4c2a0e6a81c2a3fd89129def1509dc83c3194668>`_ Implement a proper overall status aggregation in the daemon
| `1.9-431 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=18e2f4b225f584eff543b61eb3a7a8770fb7c540>`_ Add placement information to the service and instance cluster data
| `1.9-430 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83f33b034331cce2b1da5a5671d75a17cef16f75>`_ Update man pages and bash completions
| `1.9-429 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba63f786e0ec3eea146ab32e278ef0e026abb08f>`_ Add "svcmgr set --kw <expr> [--kw <expr> ...]"
| `1.9-428 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2067761704f426f4fdf4597b46b21059060aa838>`_ Add monitor information to svcmgr print status
| `1.9-427 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f3d9b75885d747ec94a37c684a52ba02ede3e0a>`_ Fix a placement codepath stack
| `1.9-426 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9dd3888376397844a8f8ade45640adf8c4cbc1d3>`_ Silence daemon_send() errors in "nodemgr daemon status" codepath
| `1.9-425 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b4f52ca7d0c60f7c176429efbe5cacf666b7ac1>`_ Fix service status purge on daemon startup and new service discovery
| `1.9-424 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4444ff839f2aac210ec5b896e4ad46659b04b248>`_ Support soft_affinity and soft_anti_affinity
| `1.9-423 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9cf9263c98eed9d3dca0ee36600a50a992165151>`_ Return with error and a "service not found" message on "svcmgr -s foo"
| `1.9-422 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c2e5c1d2d539b6967b8e23c123415ea65cd5c14>`_ Return False in Svc::frozen() if the instance is thawed by the node frozen
| `1.9-421 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=206d3dec26b66e7c3519877f40e2451c9636a294>`_ Create new services in frozen state
| `1.9-420 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2cfe2f2f5758be3bb1dd651cb628939c7e622d81>`_ Purge services status cache upon daemon start
| `1.9-419 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fd7ec719fce4cec72cc377f273b60359678ac3e4>`_ svcmon output enhancements
| `1.9-418 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2ba85a5bc1760496286e90b36408b4d71ca28f5a>`_ Remove the daemon_send() target node in cluster nodes check
| `1.9-417 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=127edd3d64fa44df34c9f031051f2ded37895aca>`_ Don't exit svcmgr with error if no selector was set and no service is installed
| `1.9-416 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3533b48004e43b3b2722958a70114a8b3f6ebfb4>`_ Don't stack in devtree get_used() code if dev child is None
| `1.9-415 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ba91fcb5f8bbe03cc33a7c52e9610f6241c6256>`_ Fix a stack in the forest module
| `1.9-414 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e32de91a017e1c4c1245943b8cb0856cfe83febe>`_ Support "nodemgr unset --param <section>"
| `1.9-413 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f473c78777c5566ac03d0e5dbb9e8fe0e7b13a35>`_ Remove a node from the blacklist when it send a valid packet
| `1.9-412 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b75e288db32b0af38394df4f598fbe0dfc228d7d>`_ Remove obsolete hb resource templates
| `1.9-411 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=13c4f5a5d1cff7db3eb9a1f1b017aeda70da1f00>`_ Daemon join fixes
| `1.9-410 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=50fe726b8a1a9af8d2edb2f87201ced62429f744>`_ Add intf hb keyword to the node.conf template
| `1.9-409 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc12d478bedfeeca7c17937adcd899ac9068aac0>`_ Fix a typo
| `1.9-408 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80e571875e11db55dacadeffed560f3537a11281>`_ Fix sync.symclone resource status not refreshed after actions
| `1.9-407 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc2a38a99b27f8d6ee4fb4eea92a68bcf9be39c1>`_ Document node.conf keywords used by osvcd in the template
| `1.9-406 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22b10d50f7b1325b70efe69acce02a9c5d40386b>`_ Fix empty encap resource group being reported as "down" for down containers
| `1.9-405 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=12430fe05ecb112e35af5c454b6fcf8c08b548d9>`_ Remove cron references in svcdict
| `1.9-404 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a18b2f57e0e37522171dd5d0ae6c94772aee130b>`_ Fix a svcmgr stack when --format is not supported by the action
| `1.9-403 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=544244ddb5efc65cc1ed5b28dc464f6b48b85f62>`_ More detailled description of the constraints keyword
| `1.9-402 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=319c9b5eb105ffac4fecd0f8896268f1bdaf7a2b>`_ Discard nodes not meeting constraints from the placement leader computation
| `1.9-401 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=499a72b3f326f678abcaccf79c3d52828c19d403>`_ Store the constraints service instance attribute as a bool
| `1.9-400 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=466697d81134de2c5fb896a32cb0ef37a9b6484e>`_ constraints fixes
| `1.9-399 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e0ff5cd4795148223933d2e3e5311c8f7746d8f3>`_ Add node.maintenance_grace_period
| `1.9-398 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=da3ee6aa8e69c70b8d64e0158fce0ae1687c1619>`_ Skip the "ready" state when orchestrating a single node service
| `1.9-397 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c8303880070b3be2cdbebd7651d4ebefc07c1b0>`_ Handle keyboardInterrupt in svcmon
| `1.9-396 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c85328da3c781bb6fb2f071a8fecca9d375ee42>`_ Merge branch 'master' of git+ssh://git.opensvc.com/home/opensvc/opensvc
| `1.9-395 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ce8537835c0dc8c42234510655c2fc3088541db>`_ Align the sync.rsync "no nodes to sync" messages
| `1.9-394 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e73c27b82152197bc5d2ac8c4d969a27ee385f8f>`_ Properly skip action on resourcesets aborted by pre_action
| `1.9-393 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cc0c969febcac501d82dbcd66a5884384e191a66>`_ Don't stack the osvcd mon when a service does not pass cfg validation
| `1.9-392 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=733590748c4a99725609d8f0abaccb79b512cc6f>`_ Fix ASYNC_NO_ACTIONS type
| `1.9-391 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a68ac1a89b7871410fb5da7451ab3d18dd94ae90>`_ Seek(0) the mmap buffers before writing in the hb disk tx thread
| `1.9-390 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e999c8fd61baec06a31aa4d1a7c89d21819e238>`_ Wait for daemon stop after submitting the stop request to the listener
| `1.9-389 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9692238f3e93d77ea0b8a1bf9274f35c3bf70dfb>`_ Fix systemd restart opensvc-agent
| `1.9-388 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1f41fa540d9250af446ba8e1741016843d54b8cd>`_ Add missing justcall() import in the ip.crossbow driver
| `1.9-387 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2452a7349f6ad9387b1e9114ef37864db6200364>`_ Don't use mmap on the hb disk
| `1.9-386 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a97fe5a5cd2dde45799b995dfa25c214b966561>`_ Switch svcmgr enable/disable to Svc::_set and _unset codepaths
| `1.9-385 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3a7ea7107ffd8617f82c2921033c7151202e973>`_ Remove a reference to sync#i1 in the sync.rsync driver
| `1.9-384 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4186f9bf11485436f71ccd7d7a7a0a70243a9038>`_ Don't stack on sync all action because sync_all triggers are not in the kw dict
| `1.9-383 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a1d0d8193b612b711056c7f963e290927096e799>`_ Switch unicast hb default listen addr from <nodename> to 0.0.0.0
| `1.9-382 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f09c160aa8ef1b3a51f11ecd6222c3ab6cdd1b57>`_ Fix wrong variable names in the push disks codepath
| `1.9-381 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=411afd82dc9f44e46662e41ee0ed4b4170967294>`_ Fix daemon_send(..., node="")
| `1.9-380 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c177de18426143ee6f50621e1d308dc4fa8f168e>`_ Implement a ipadm-based is_up() method for ip.crossbow resources
| `1.9-379 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=564d612f8bb21ce574a9070f73ca965b5b1accb7>`_ Use a dedicated netns name
| `1.9-378 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86ffc3d65807b769d5e5f4c4b0470248aa5effda>`_ Support NFS share resources on SunOS
| `1.9-377 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=15aeca3b7431a5d4b1dfcef7435252722d60f202>`_ Update resource templates
| `1.9-376 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=432053d4698e5b21644e6536d3fa623696607862>`_ Add support for app resource rlimits
| `1.9-375 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2746f16047f93effac07a9b987118f53570337dd>`_ Raise the nofile hard limit if the agent nofile exceeds the current limit
| `1.9-374 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3743a67e8aadce68af90e7210aa174ebd07e20b9>`_ Fix lcall() trimming the executed command outputs
| `1.9-373 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed255a191e9e2a88dd38408ba0865df3274c7edc>`_ Fix some keyword converters
| `1.9-372 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bb43ee24c5bfe59144cf0761874a20351d0ea50d>`_ Add "speed" and "speed_kps" converters
| `1.9-371 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=17830bace3495f280ca00cca528eaf16131c57fa>`_ Remove the unused Keyword validator arg
| `1.9-370 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c87f8e79e830e18385e3eaa2b72d2f453e10244>`_ Free symmetrix tdev in the wait loop
| `1.9-369 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c284761e658a227381921ba0d96dfa2fcd826bbd>`_ Add -i -and -c args to symcli commands supporting them
| `1.9-368 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d3bead15c8d11c05145a4f3e80082b37bb9ee594>`_ Order changelog based on commit date instead of authoring date
| `1.9-367 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=139ab5315d899a1f57b95f67a5b02ffb6e1e91bd>`_ Start the vg after provision
| `1.9-366 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=51a242ad649ac0a8c4e2786dbaf06fcca3465fb3>`_ Add a contextmanager locking wrapper
| `1.9-365 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a295ae0f626bbaa3f399881230a247a017c790c4>`_ Remove unused monlock/monunlock from the lock module
| `1.9-364 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4c72bb5939e5e2a11a8b901242207e10d6de52b>`_ Add a Svc::conf_get() relay method in the Resource object
| `1.9-363 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=50ed17930962fd4798b909c7d4789d3d8c16ae09>`_ Fix sync.symsrdf postsync always recreating the dg
| `1.9-362 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e0a9c5a2e9bd21ff4cddece0681a8fcc7512f59>`_ Remove provisioning=False from keyword definitions
| `1.9-361 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bb0bf9cf2b2c823bac9dcd00612e82b1b267cd8>`_ Set the Svc::node attribute earlier and support the {clusternodes} ref
| `1.9-360 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fae24ad235a485fe2bacf0c61d4beaa189c47835>`_ Fix a stack in service configuration syntax validation
| `1.9-359 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9da51581087c287f7c09a55564b913e767a64402>`_ Don't stack on vg provision when the pvs lazy reference is not valid
| `1.9-358 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=241f0d8009b515183fb7babb09f8785c3f72120a>`_ Fix docker ip resource for peer container not docker services
| `1.9-357 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=59cd3f49b8118cff7ec3d84cd5ac8ac30fb499bd>`_ Add headers to most forest renderings
| `1.9-356 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=009e38adab541bb344b6be8a33bc2c5aab91c21f>`_ Fix "svcmgr --status <status>"
| `1.9-355 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c4ef2ea53de5a0663248dfc981636ea63437696>`_ Fix the permission denied error code path in svcmgr.py
| `1.9-354 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e730120519d2ebfd91816b39598522ed60a89ec>`_ Use a forest tree to display node and service scheduling tables
| `1.9-353 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfadbe96bc2fe2f25eee7479abad861a073b252c>`_ nodemgr pushdisks enhancements
| `1.9-352 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b61dbb4cbdbbc241e5f539b3ed916b5f55700607>`_ Fix pushdisks reported usage
| `1.9-351 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d1f01e4482ba25f7e11213085ea6195e168e9da1>`_ Fix the loop to hosting device relation inventoring in the Linux devtree
| `1.9-350 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c773922b51eca0d884cf1990fe293fe65993a2b>`_ Add the hba and ip count, and source to the "nodemgr pushasset" tree output
| `1.9-349 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=95d8ef39292f1b32477347dded0020dd9bbd519a>`_ Save some space in "nodemgr pushasset" using "config" as the source name
| `1.9-348 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=344bd6c41476ddbdfd645f98ce4a4a23c9eb4160>`_ Use the print_size() formatter to render mem in "nodemgr pushasset" tree
| `1.9-347 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8d400ceaff33dc044573f8ce41c3d0414590a0ee>`_ Add a size formatter
| `1.9-346 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af088237a859c669859c3e853a1a494ee18af510>`_ Fix the targets reporting in nodemgr pushasset
| `1.9-345 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=636ad0b0d23381b23f04ed58a6cc2e58ba1e970a>`_ "nodemgr pushasset" enhancements
| `1.9-344 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d8f94aeb3e46ba0c601f3c7df57a9e2d40776d5>`_ Checkers enhancements
| `1.9-343 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d498b1473cc94725f3e6da57829432318a47aadc>`_ If osvd is handled by systemd, "node daemon restart" should use systemctl
| `1.9-342 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=46b6fc334665236875c42f30f122eee3855ce8ff>`_ Fix svcmgr streamlog column alignment
| `1.9-341 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b9f34f53a37c432da6eaf0886df0e0f7f645b88>`_ Wipe all signatures on lv unprovision
| `1.9-340 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b8d2254305eaf9467155ed0d3cbc531a0d99de2>`_ Linux lv provisioner logging enhancements
| `1.9-339 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1d1d99a60ad9149dc68306371b32f3a461ec629a>`_ Disable ip resource dns update if node.dbopensvc is not set
| `1.9-338 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6e87f94c411ccd48b77741b1a1da1d12717628eb>`_ Disable ip release/allocate if node.dbopensvc is not set
| `1.9-337 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b0e32d0d45ea2cced2daa1add614b27dce9bbda>`_ Remove support for node.conf node.dbopensvc=None
| `1.9-336 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42a6c0cf527e2b678d7cae50c9a7106e7d3ea727>`_ Wipe md superblock on unprovision
| `1.9-335 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4f60b30a229a001801de2aaacde9647bf7b8f9b>`_ Fix the scsi persistant reservation assignment to a subset
| `1.9-334 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27628ae0bd7a4990b9714b4651c05c5aae07cb32>`_ Remove the undue "filtered" kwarg in a Svc::sub_devs() call
| `1.9-333 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=74f86d38a35c27edf3ccda41b4cc94c9a4a750c2>`_ Scsi persistance reservation fix
| `1.9-332 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ae3e6fe66a139b130d195c9db26c3cb31077ec4>`_ Add missing Svc::exposed_devs() method
| `1.9-331 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa56f0eca19cc5a0f1ba451e11a87b5bad6863c3>`_ Don't unprovision a md without its uuid set
| `1.9-330 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a77d2f1f573476c587e0f1efc7aca20712364fc6>`_ Create the node.conf "node" section in the prkey init codepath
| `1.9-329 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1df7b502653d07435008bded59245d2ada148e99>`_ Delay the rcCommandWorker module import
| `1.9-328 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=00728f1af75b8a530fa63b8ee7e392103b99a9ce>`_ Don't play with pipes in mdadm
| `1.9-327 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f7dab5a623476acb3b71b71a6f34e52ac7135fc>`_ Reset the uuid disk.md resource keyword on unprovision
| `1.9-326 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2cbce38a3b59f88b048cd55fce7d261c021e187e>`_ Add a simple "stop" unprovisionner to the disk.md driver
| `1.9-325 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eddc612ce039aa9a00577ecfe890299fb6bf1b6a>`_ Move the pooling/non-pooling fs type lists to rcEnv
| `1.9-324 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=15aeaab75d2ba4eec7a35fabc2e0f30521a0a7f5>`_ Simplify and fix the zpool checker instances attribution to services
| `1.9-323 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e64c14fd780fcfd1a7556394d82359fa08d51f47>`_ Simplify and enhance Svc::get_resources()
| `1.9-322 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a2f6f1442f4c4e156e9ee640d5c7786d87f6b33b>`_ Fix the Linux disk.zpool sub devs
| `1.9-321 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8bb0b08ff891a5127afede54720e4733a3c5fc3e>`_ Ignore IndexError on lazy reference evaluation
| `1.9-320 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c0a263545d30db87363629c918e0996c2537e2a0>`_ Fix the disk.md driver
| `1.9-319 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6007534f593bcf6d153b0500a442b747de0897a4>`_ Use the peer resource sub devs instead of base devs for scsi reservation
| `1.9-318 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f24b8347783b6d5cd4749dfca0d91df57e677de7>`_ Add "nodemgr print devs" action
| `1.9-317 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=88c9703f34bb17342d8f416ee8a02f1b2a225624>`_ Fix a forest prefix markers glitch
| `1.9-316 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5aad0a702c13514be0e177d0e54c600b0ea8a7ee>`_ Document the service selector syntax in the optparser -s option
| `1.9-315 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff7451523606382b51f9b84d14bb4af2250f93fd>`_ Support linefeeds in optparser options help and man
| `1.9-314 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=253eb966db0d455c2712d44b44ad47a16a4794e6>`_ Port the "print status" action to the forest module
| `1.9-313 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7a4c5bddd313b50e34b5d1fe1279476a3646ff27>`_ Add widths and separator to the Forest class init
| `1.9-312 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8c955d8257ae080a1365bf4ccbaf898b06d4b78d>`_ Fix line continuation prefix in the forest renderer
| `1.9-311 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6adaa216b1d3cb0661dce8e259e5e22afd210afe>`_ Fix scope of the forest data
| `1.9-310 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=25dca4350ee759211ee32944fc4af8f45abb92ed>`_ Fix a stack in the forest renderer
| `1.9-309 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=848b9a4074471ab7e7097d43a8513f30c0546a82>`_ Use the forest pythonic interface in the "print devs" codepath
| `1.9-308 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf0f90efe557ff7d3bba07571201b641a62a240b>`_ Add a pythonic interface to the forest module
| `1.9-307 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b60c529cdde9bb94b6f9144953357cd1199735d>`_ Add an assert on the fs status eval after start in the svc fs nose tests
| `1.9-306 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1e3a68b83079995478aaf3505eb6c2a76e44dedc>`_ Degrade a log info to debug in the linux disk.vg status() codepath
| `1.9-305 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e4b51466e451515cafa843a9ae753f529308e08e>`_ Fix the is_up() test for Linux bind mounts with newer kernels
| `1.9-304 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=297cf0e31291f3346c5625ad46e7432a1b8eb81f>`_ Fix a syntax error in the disk.advfs driver
| `1.9-303 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab31c3fc0e8b470eeb1ea67d35a94fec90f053e4>`_ Add a Svc::sub_devs() method
| `1.9-302 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98388a6c381e9ba1982640ec9e72fca62b71668e>`_ Fix zfs disks sub_devs()
| `1.9-301 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4261713e337d24157a5e3bdfe2a1cd73dbab64ca>`_ Fix bind mounts not mounted upon provision
| `1.9-300 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45e1e861979cc19b481ae6f12531b8d9f14b9111>`_ Split the zfs size keyword from other fs size
| `1.9-299 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4aaeba920c3c35997e43dcddc808d2094da68452>`_ Support none and negative value in the size converter
| `1.9-298 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bbe6fbb8fb2e801043134cb2b5976e08f48050b2>`_ Clarify a long-standing ambiguity with devs/disks meaning
| `1.9-297 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87a75f6cdf953778ae65c8def6345a166b31a912>`_ Add a "get_devs_by_devpaths" method to the device tree class
| `1.9-296 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=109b698ba0af52f80789f8cc33fb30867ee80e08>`_ Add a "fcache" decorator
| `1.9-295 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11a4a01285836827a9cf443c7ccd0a0fb767e330>`_ Support a simplified data format as forest input
| `1.9-294 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dca511d7de70a0993609f45b3fc999457537b0ef>`_ Detect and display from Node the Svc print functions errors
| `1.9-293 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a614b0c73f9c999261178142a546753e00949a6d>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-292 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19b3581f7033241d889bd95e84ef87c8e5d201ca>`_ Add a generic forest representation module
| `1.9-291 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ffec171d2ef0f5f5ba729d41935f509409cbea3f>`_ fix disk hb slot allocation codepath
| `1.9-290 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8df1a52c32121e36d4c0e47f82ff3fbb81b19989>`_ Fix the nodename displayed on daemon join and leave actions
| `1.9-289 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=241c6180f5ac086c826a860a4dd354e36b9bb96e>`_ Add support for deferred references
| `1.9-288 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1eeaa01e1ab252c52bd36d3c394c90762711d619>`_ Consider the md is not present if uuid is set empty
| `1.9-287 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=47fa873017c9d643bfc28a63e91a88930e250801>`_ Use Svc::_set() instead of write_config() in the md provisioner
| `1.9-286 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4420302da0582c4d24f92915fadcf372a92da450>`_ Revert to exclude tx and rx peer status on the local node
| `1.9-285 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=35633215c0240affaf09ff4a573dff11550315e2>`_ Display the local heartbeat status in svcmon
| `1.9-284 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=def6092e30bee5227811d4dc3764a8eb67dfc6dd>`_ Fix read-cache effect in disk heartbeat rx thread
| `1.9-283 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3a22689cda856ab66444031c4e8c3e42db160ab>`_ Reconfigure the heartbeats upon config change
| `1.9-282 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed3b1bc1703690f7f59e87d2d8d07d35452b1b2d>`_ Use the cluster.nodes list to compute hb peers
| `1.9-281 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9f0262788de81af165fb9dda6fa8b1614c7e8f83>`_ osvcd fixes
| `1.9-280 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72b25836aeb211518e194a71836d81fd913d53d2>`_ Remove unused code in ucast heartbeats
| `1.9-279 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=950284231035e76208798e9ddd0fd6f41425751d>`_ Fix "nodemgr daemon join"
| `1.9-278 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2c769f9d0de6660c3ae9fb4d9a145d70e3a3856a>`_ create the cluster.nodes and cluster.name keys in node.conf
| `1.9-277 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0af4406619d653d0d0a834c75c172599fd4d1f3d>`_ Port the set --add/--remove/--index to nodemgr
| `1.9-276 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d3f92d8b164bf009eef231e6240695ac83f6cc24>`_ Move the md 'shared' property default algo out of the builder
| `1.9-275 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=59166e7fb32ccd0d4a8c743358569972988223a1>`_ Add a devlist method to the linux loop driver
| `1.9-274 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=282a6b4cf50041ce9a2868093dd859989f405a6b>`_ Don't stack in md provisionner when mdadm is not installed
| `1.9-273 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=60b1da2ac0ddc807a642be6ef547b186ef75676e>`_ Don't stack on "nodemgr daemon stop" if the daemon is not running
| `1.9-272 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=062a1fe621b1c68fd1ffcc9a83dd9c9f035a6cda>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-271 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b2bf28cdc822bd631ad20e0779ffa72fa273c674>`_ Remove the sync.rsync target keyword value mangling in the builder
| `1.9-270 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=58592160cf6b02adfba3ebeb3f71d369e1a30eeb>`_ Fix a stack in service build
| `1.9-269 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52f2c1bfe0066499d9c2e35ca5afbcc2ae46d938>`_ Replace the script preinstall by his content into %pre section of rpm spec file. The script preinstall is not available before the installation of files.
| `1.9-268 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b00146fb5e3f44dd7cd45db07dbe477ab685a8a0>`_ osvcd bootstrap fixes
| `1.9-267 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cdff79f65d5c1c9b5ec33746f769dfe0425cc1b5>`_ Disable flag management enhancements
| `1.9-266 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=023ab269de99ed235b1077f3cd17e56faf8824d1>`_ Fix a stack in the hp3par driver in can_sync()
| `1.9-265 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=314278a2a19dd27884db71bbff6aeb61fe5a7cf6>`_ pylint fixes for svcBuilder
| `1.9-264 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac1782abafc80028cbf7b7723910996ba18775f6>`_ Rename svcDict to svcdict
| `1.9-263 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9a3175fa23a698cc8aa644429b5bdb18edc143b7>`_ Rename svc_keys to SVCKEYS
| `1.9-262 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1f5cae6704189d0eea6a0f2cb7b4b0e9274c72c>`_ Fix inverted "nodemgr frozen" returcode
| `1.9-261 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cd272ff1ff922557421f60828e9096ad2b177691>`_ Move add_scsireserv() from the builder to the Svc::__iadd__()
| `1.9-260 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b7c5457a03f20c2b61e56a9c19b423d7d1cb0df>`_ Move add_requires() from the builder to the Svc::__iadd__()
| `1.9-259 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6d994cf0797f7fe0450301d144aa00af9883208>`_ Fix {container#<n>} command line substitution for docker services
| `1.9-258 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cbff681d5b903428ea42fc57e4c9fb931ac35a1b>`_ docker.ip fixes for swarm worker nodes
| `1.9-257 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cc54852150e4d87bef8f331d9f226c5a59f6f223>`_ Fix "the docker service ls" parser
| `1.9-256 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bd6e14dad0bff857df845878b3f1e13b68712cb3>`_ Don't stack on permission denied error in svcmgr
| `1.9-255 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0205262f41e644471c0402d66a5d7106f1a192d9>`_ Fix ip resource tags corruption when ip and ip.docker drivers are used
| `1.9-254 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b7d28b8bd60d39bdd66f5c24bf185f447bf310a>`_ Fix resource log lines not being displayed in print status
| `1.9-253 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b682055f7622124138bfbe6efdf6f5dc774042a9>`_ Fix the docker swarm token/addr parser
| `1.9-252 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83f182e7fc073f29df8e8991718929ecd43af0b6>`_ docker swarm fixes
| `1.9-251 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52c1ddfc8edebbd97084358c663aa293bf66e9d1>`_ Don't stack on permission error if a svcmgr print action is executed non-root
| `1.9-250 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=347d6c5769528f6e7d8641a91417bd8b039ca6f7>`_ Fix svcmgr 'edit config'
| `1.9-249 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=28a8cdf1be111e8bf38f0ca042f40269e25897b2>`_ Restore support for deprecated sections like drbd, ...
| `1.9-248 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=590b413e636afc702f74eb5419305ec5cdb0e3ac>`_ commit the forgotten converters module
| `1.9-247 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2d81e0522f1f3bc1f37d6f741a9cd441ff353d43>`_ builder/svcDict integration enhancements
| `1.9-246 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6b2737acf472e2c3191cc1b9ffcf7b1efba204e>`_ svcDict fixes
| `1.9-245 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6529d1dc500163d9744e5c1005797f216521599d>`_ Fix 'svcmgr set' on an empty file
| `1.9-244 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=138a1b920172bfb14604056fd030dca3e5b1e180>`_ Move converters to their own module
| `1.9-243 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2bf95fd2a8e4064379f91552f82ad443ec238e0b>`_ converters enhancements
| `1.9-242 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c64d9e1ffcdd7e9e18b88b91e2a1ad396b34912c>`_ Fix service status for services with containers with no agent
| `1.9-241 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f88d34d7f2cda1498318fddbf85a46033ce33fe>`_ Add a diff to the 'svcmgr edit config' error message
| `1.9-240 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1e526a4659b89a2af6b1802f57e21d7192cdf255>`_ Remove the MonitorAction exception
| `1.9-239 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b8a00b7fc00698e11fa82204ec496032ab2da5f7>`_ Builder/svcDict coherency enhancement
| `1.9-238 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=94908e9940c4ac0f050ef6cf9ea5be84ece7221b>`_ Display errors on service print actions, but don't stop looping over services
| `1.9-237 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b62cb8abae3466c0d5b50f2e4bba201e42746387>`_ Fix service print actions returning 1 instead of 0
| `1.9-236 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0531acc4302bf228dfd1aa4e16e8610a73302885>`_ Rebuild the Svc() object after fetching a service config from a peer
| `1.9-235 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3d8efacec6016443d9687bce28545fceb8317da>`_ Fix the app check skip condition
| `1.9-234 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=982053d6ae906820e97d6c788967cd0dc6016d81>`_ Abort start if a container hostname is not resolvable
| `1.9-233 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2cf788a45cded59ed1e6391effd29bbb5f7cc1cd>`_ Use the keyword dictionary to determine scope and conversion
| `1.9-232 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=222cd42ea913f96909f084cacbc18cbd4dc79058>`_ Fix the VLAN tagging interface name parser
| `1.9-231 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a74f88a4e5b34ee1e6c7ab991a8c2d9d426987d>`_ Support duration expression in --time option
| `1.9-230 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=82fe265d92ca156c4fe15507f89045f5390689f6>`_ Support duration expressions in --waitlock
| `1.9-229 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c47b4fa6a321896e43d6af6d8f0e89fbfce1c0d>`_ Support duration expression in more commands
| `1.9-228 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=37820c02b9b79b786a84c2daf2878c3238ee96db>`_ Add a target unit keyword arg to convert_duration()
| `1.9-227 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b14daa824321a093796ae26faf964b3ea44d951>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-226 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f72541a18352b35ed78adde0b7e383382152e147>`_ Add a convert_duration function to utilities
| `1.9-225 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=865b5c975a84f2c2acae713ceacb323fcde6624b>`_ Ensure PATH export is Bourne shell compliant
| `1.9-224 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7131917a1faa903dbaa25b2793bcad3f4807bcd4>`_ Fix Solaris preinstall script content
| `1.9-223 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4146f1aefaa99bc02b77b9fea341a8666437cde5>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-222 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27404fba8ac3fcd0a0e37f60f5997058dc1d4c63>`_ Revert "Fix create_pkg call to deal with preinstall script"
| `1.9-221 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dfd4bd507a3dfff5bbeecd5209d4e969a57bb00e>`_ Fix create_pkg call to deal with preinstall script
| `1.9-220 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2182d88f4da79fe93f46d9f3ad1f1f88210daf0b>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-219 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5bdd275146f99bc4002f89978d8a6e2904cd4b71>`_ Add the preinstall to the list of rpm files
| `1.9-218 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1e8ab5c92a5b15f80d34d596a77c015eddaaf5f>`_ Log the disabled resources on action that would have applied to them
| `1.9-217 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=897600567ca0e7ded0009abe4a0940b896620f42>`_ Fix missing restore_timeout entry from svcBuilder
| `1.9-216 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f496495bfa5593c42d803326fec9975e6ebc5059>`_ Implement a wait loop to wait for array backend restore
| `1.9-215 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f495ab139a60103377dee8139d62559b0a7c401>`_ Add sync restore triggers
| `1.9-214 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=326c42772db7087026db5641deb3673a8e7953fb>`_ Cancel the task confirmation timer on valied confirmation
| `1.9-213 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c0638f9d91e1235bb8ecf62ef5a3c8a174d1b46b>`_ Fix an option help text
| `1.9-212 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f8cc73c7bb4a40678dfc5772a1161c898f230fa8>`_ Properly exit the log follow listener threads when the client breaks
| `1.9-211 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=061f875213657f07c40d852cfefb4c8e7aa2dc2e>`_ Add "--backlog <size>" option to the 'logs' action
| `1.9-210 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a050f19710689aa99044a8ee848afb78219c4e28>`_ Implement cluster wide 'svcmgr logs'
| `1.9-209 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=04bf3c8a550a1e2a729c6872436493793ef7e31d>`_ Update doc, man, completions
| `1.9-208 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f36ebeb81b08c39aef70ee6095b1750da76dfec7>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-207 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3b16e7b47efd19716c68ceb720c5b0578216150>`_ Fix the disk rx hb last beat logic
| `1.9-206 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b007c376af5e376de2195e5684773fb3f2d407b>`_ Fix the disk heartbeat thread start
| `1.9-205 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6edee5233c1b3c90be296a6845351458670cffe8>`_ Log the sender information when reported a discarded message
| `1.9-204 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ef6fb92637c721a22569729e1172eb083252f7f3>`_ Add the sender id information when reported a misformatted message
| `1.9-203 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eed5513f3f00e02f1e4cac5d038ebbe9bb9c0260>`_ Fix nosetests --local usage
| `1.9-202 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a2afd872bb769ae863249bfa79b12b643e743494>`_ Replace --crm with --local
| `1.9-201 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86129020a3bc7b6876cfb44878112255df8c6bd6>`_ Implement the "nodemgr daemon leave"
| `1.9-200 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a39371b0c6c88f4f7ff52d0a2f78bec9c517c67a>`_ Join enhancements
| `1.9-199 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=622e758da4225b0ad73425994f3d2ade892df5d1>`_ Re-join is a valid action, don't log a warning
| `1.9-198 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e620bb8da1968a66678c90fa1073df65741ab11>`_ Remove obsolete heartbeat configurations upon join
| `1.9-197 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e629bd3c1d6642be62ef375657b25064777c20dc>`_ Fix a stack on hot-removing a heartbeat configuration
| `1.9-196 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3db9fccec0cb0298aa2edecd6e33aed6721c7db6>`_ New service orchestrator rules
| `1.9-195 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c1b2bdd2aaf08deed10b14d0478b158775a14336>`_ osvcd enhancements
| `1.9-194 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4c5f3e5fc39706833a63e9620382cbd84b516cb7>`_ Add the 'impossible' <action>_requires special value
| `1.9-193 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ef82a45c390af6c03aac62a43ac4543d52027bba>`_ Add a complete ast expression test
| `1.9-192 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1709c2b78c3496b73b096b5a4425742ea36e821e>`_ Do not fail the test_import nose test for modules raising ImportError on missing module
| `1.9-191 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=edaac26c0ca0f5bd16b4b915f25ba93e203a2575>`_ Fix the test_svc_fs nose tests
| `1.9-190 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9a09cf36000b79cbe8a85f026e09577048c6d667>`_ Make daemon_send() behave when called from a non-built service
| `1.9-189 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=919e6306f13702207f9fc14cfdf909b2cda3fa7a>`_ Move flex parameters from the builder to lazy props
| `1.9-188 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d58c5f3348e2230457edc73decfc25cdb58ae0ad>`_ Add --no-pager to the 'logs' actions nose tests
| `1.9-187 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6736cb5b66a33dad58ec9e914aaba357f66faeb3>`_ Add the --no-pager option for the logs nodemgr and svcmgr commands
| `1.9-186 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=48ab374d4cc580faf1432a2aa000d970b30f4951>`_ Increment the total and per client tx bytes count in the listener thread
| `1.9-185 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=60cd31df37d6571f8eb0b8ef721d3873165c2450>`_ Remove the svcmon nose tests
| `1.9-184 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=68f24da82e37c07e3faf415fe323a0716aa36434>`_ Fix nodemgr command return code in some case
| `1.9-183 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc4c70490ac0fb7b47c8ab2140866aed1e6f0112>`_ Fix the test_svcmgr nose tests
| `1.9-182 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9fa0651c9f487df210f2c13fd24889bf1ee808c8>`_ Fix "svcmgr -s foo create"
| `1.9-181 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=44f52479a5f7785487c09d9e710646e9df053277>`_ Remove the test_svc_restart nose test
| `1.9-180 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=89030bf098184f7ae9cda6f0eea00d871b5dc907>`_ Output aggregating multi-service commands fix
| `1.9-179 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=14f65488aacc5ce60c24269cc64ae83cbf826798>`_ Allow "import svc"
| `1.9-178 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0293677d864570b45b85e4c0e6e00b4ad9087668>`_ Implement the 'giveback' service action
| `1.9-177 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=989887e3070f898b744d9bf43f19518eb46885e5>`_ Implement the 'takeover' service action
| `1.9-176 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a2d5441c40133863da53c1d7ff659f3994c8c5d>`_ Tweak daemon sockets timeouts
| `1.9-175 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=14f2fc15c404c7dc5327697a260af2cd7381140c>`_ Move DEFAULT_HB_PERIOD definition to the hb class
| `1.9-174 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d8d0d3336d7ee85fb13c70969119f623d2d6e4e1>`_ Compute message length only once per message
| `1.9-173 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a2c244900697027d7263082dbd3546e373c9f61>`_ Don't display json data on thread stop/start if no error is reported
| `1.9-172 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d198b89af3fb82d1c4f502e54079d1e0cfd02a92>`_ Optimize the osvcd daemon loop
| `1.9-171 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4d4bfc2723deab857bf910a9523abe49dae9886>`_ Handle 1.8 to 1.9 in the preinstall
| `1.9-170 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=82b897909bbabcccbe4c31173298f0b79869bce1>`_ Remove the nodename from the action logs "action" sent to the collector
| `1.9-169 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=88bebb55d57e629b7a4510d73a8994db96804282>`_ Fix action log reporting to the collector
| `1.9-168 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=933b5eb8f3ec3d1aa128e29dade6a8e9009ee045>`_ Remove hostid from svcactions and services
| `1.9-167 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5294a056be4095e286c69f66384e367ad41f13ac>`_ Replace the stream log formatter 'level' with a single char abbreviation
| `1.9-166 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa417b118ef944edd124961de7dabe52d20f5d74>`_ Add gc collect in the daemon loop
| `1.9-165 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ddb6508735acfbce97474f4108f2dd0f4a07507a>`_ Silence the schedulers when running the daemon in foreground
| `1.9-164 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1a825b43c3efbfbe984e6d674a9ea66b323d8f0c>`_ Logging changes
| `1.9-163 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c7b772ffb061f1b9dcdd41b138de7c0af963f3ea>`_ Allow posting daemon service actions on the local daemon
| `1.9-162 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ef917cbdbdf8245b6296d68e40bc05bf273c0138>`_ Port Svc::migrate() to the daemon_service_action() facility
| `1.9-161 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62bc4ce07ea9f2d22897fd5e338d2eff8d13d898>`_ Add an async mode to Svc::daemon_service_action()
| `1.9-160 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a28423e7872ad4ad03bbb261ca6f4f1f06937418>`_ Drop the --service option from remote actions
| `1.9-159 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b18e90469d4e2bb32b6656d43c0c9c695eda362>`_ Implement remove crm commands through daemon listener
| `1.9-158 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1eb43a7114ed2eae5894183b239bdce9125c2ccd>`_ Remove unused exports from the template /etc/default/opensvc
| `1.9-157 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e4036d14f534371e15d58b6d658b4fad8277013>`_ Forget peer node data when all rx threads no longer beat
| `1.9-156 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e6e61af120e04d63c3a5174884a9052ae0c4e2d>`_ Add destination nodename and addr:port to the ucast hb timeout warning
| `1.9-155 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=501c0b2ad298e8db3d6257dfbc667c255e84bc52>`_ Enhance the service selector
| `1.9-154 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64304f5ea53a848a6c734e958f4faf2c7e423897>`_ Split osvcd_mon out of the osvcd module
| `1.9-153 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87cb5a5402c50eb3cb9cbfd08b87afce8425deba>`_ Split osvcd_scheduler out of the osvcd module
| `1.9-152 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87d5a86698b90b63c27a44f92b5914f1dfab8b83>`_ Split osvcd_lsnr out of the osvcd module
| `1.9-151 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cd372ddc49071062cbc3588c6c65ca0a7e565406>`_ Split osvcd code file
| `1.9-150 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=effe7c1cc2af2dcb6565f877bc2c10e6b61753ac>`_ Add addr:port to the daemon error log
| `1.9-149 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bfdf86630be0153ae0ce6deb2f951e5931df951e>`_ Remove the frozen flag on service delete
| `1.9-148 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=58415100350f7792272e5aade050b5931ced14e4>`_ Use node_env from rcEnv where it is already defined
| `1.9-147 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e0564bd513133f9824b9e2a8563d8493e1f7ad3>`_ Make the daemon behave when receiving payloads from an outdated daemon
| `1.9-146 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=77c6e48c9fcf265d35c29b4152d426fce751880d>`_ Fix Svc::action() not returning data
| `1.9-145 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ceef920753f280a13b919d2e7ca7987d3b27924>`_ Fix hb# colorization in daemon status json
| `1.9-144 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3ed47c26046e3594d30d3986cd2922e5fecd9b29>`_ Add the node env to the heartbeat payload
| `1.9-143 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3fcc8d78c6ddc16b5523a723935888a512afe5e1>`_ Add 0 to the list of valid returncode from Node::action() getattr()
| `1.9-142 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4ca65a1aea7aa36977b3703353bf60abc321abec>`_ Round of pytlint fixes on the comm module
| `1.9-141 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8d94381abbc1a7a6c3333c736ac5657d49b866cd>`_ Split the Crypt class out of osvcd
| `1.9-140 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8947f0d65fced73df373c2099de485bb9507756b>`_ Plug the preinstall in the OSF1 upgrade method
| `1.9-139 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f20a20efb1b9fe4d8c53e05cf425e23ab9aabb79>`_ Plug the preinstall in the packaging scripts
| `1.9-138 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16de3b07349fcf2c351eeb156b474c6f9bde3c1b>`_ A cluster-wide "nodemgr freeze"
| `1.9-137 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2afe92016b9f94afd662d6fd8378af83cd58d95>`_ Fix confirmation unduely prompted on actions other than "run"
| `1.9-136 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a0d75a7bc8e822b085db1645996747c4c17e0e38>`_ Fix the hds array driver mapping translation
| `1.9-135 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f19ffef66cf985f595e21921f823973844180d55>`_ Add "nodemgr frozen" action
| `1.9-134 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d1ef1de37addcdf962a57b2347274023e1f2f03>`_ Add "nodemgr freeze" and "nodemgr thaw" commands
| `1.9-133 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=450cb395f70dc3f892ce4d8b7c98998136e7f308>`_ Add "nodemgr daemon running"
| `1.9-132 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ee715f1161ee6d95d6073be3ba4e07db63e1ee6b>`_ Add the restart handling in launchers
| `1.9-131 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80b640b4777e3d50e8c41c910fcec3bb1c8023fb>`_ Implement "nodemgr daemon restart"
| `1.9-130 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ce9a8b4d623cb958430118395088f7c037121a05>`_ Fetch service configs advertized by peers
| `1.9-129 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=88d0ae69adbb668f2371d09736a6355aac87db0e>`_ Remove sync#i1
| `1.9-128 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4537cdeae20f1df1ab6d44ce7a845cd044e37044>`_ Fix a KeyError stack in the daemon status command codepath
| `1.9-127 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87f0344523125deada0f378ade1ed7f22da97cd3>`_ Add add/remove from list in a service configuration
| `1.9-126 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0262b0fe40b8fe452e07fb75344b339d7d3c8b63>`_ Fix a stack in the confirm handler for resources without confirm()
| `1.9-125 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=67df3408f21e5f5cbe30da874926de67488fc908>`_ Move the task confirm before the triggers
| `1.9-124 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f259caa0581c8c8b8698459b841aa4969467b65>`_ Fix task run triggers
| `1.9-123 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cdded75b260119e6f2953960ffc69468866d6d27>`_ Return standby drbd resource to secondary state on rollback
| `1.9-122 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7514e329c4c78da850ca8abee967a2485047a1c9>`_ Flush lvm command caches on vg resource start
| `1.9-121 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff3c7e4a0366d676d7ef151ccf0f416f438a8066>`_ Fix svcmgr update --resource ... when values are not strings
| `1.9-120 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7bfcc800605466bad862c7f473d43d91eb4ead1c>`_ Don't stack on invalid json passed as --resource arg
| `1.9-119 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=68e7afdf41085c258a500e7d052113eaf1cc71d9>`_ Fix the rid allocator in svcmgr update --resource ... --resource ...
| `1.9-118 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e64959db77770330977df0441e5fa7185c832890>`_ Next round of pylint fixes on osvcd.py
| `1.9-117 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8471d01cd05d17c04d6b0c6ad7437da21adc435>`_ Fix rdf data result return in symmetrix del disk codepath
| `1.9-116 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=17801d51b791973b6fd11834822c05d104a9ce8c>`_ Batch of pylint fixes for osvcd
| `1.9-115 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b155e733c9c00c139d2a31965c5371260ec1e5da>`_ Fix FS provisonner
| `1.9-114 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d26ea48a3ebbd8355461dccc07570388d71ae5a4>`_ batch of pylint fixes for osvcd
| `1.9-113 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7260fef023ff62dfe4434f9160d960b284b3baa6>`_ Use a lazy for Daemon::config, like OsvcThread::config
| `1.9-112 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=89330f2a6624472dddf8699fc53e33148a26d0d4>`_ Fix a LANG=C + python3 config loading stack in osvcd
| `1.9-111 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9f0411d9e21199e7dc3395c6cff2edb7bedeb2cd>`_ Export --env var=val in the os environment before services build
| `1.9-110 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d476d981eb57fd133bf75f19815c785432b121d7>`_ Accept a custim secret kwarg in daemon_send()
| `1.9-109 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=087cbfc9565ad60909527383b7cf6bc2bec4e819>`_ Add sender blacklist to the daemon
| `1.9-108 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bde1e960449b88af252bcf8f5c7dcf14a587df19>`_ Add a disk heartbeat to osvcd
| `1.9-107 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=207a94f47012de9b37f0d3e2f2c4a9e6c1255c25>`_ Add a whitespace between unicons and mon status
| `1.9-106 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=54515dc37d871828a4ee787ee5db8f9ee9b1a9bf>`_ osvcd enhancements
| `1.9-105 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d659b9975d199b643d9ca3e43535f75d5947a0cb>`_ Add --wait and --time to the async service commands
| `1.9-104 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bffeb31bb7dcd8296ad2a6f62f6ed41b7bcadd57>`_ Fix push resinfo for app resources
| `1.9-103 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c3571f897ed4daa0d15abf41eee686f34c23aadd>`_ Fix the container abort start routine when hostname != name
| `1.9-102 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c81f14b4547e52f1fa5fa118f82a22231f4abfbb>`_ Revert "Fix the container abort start routine when hostname != name"
| `1.9-101 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2030c657d8a493f197c8416e88ddb960a810809>`_ Fix the container abort start routine when hostname != name
| `1.9-100 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b2aefecd4dc7d5fb177bd36f0c439ca44423589>`_ Stop trying to guess the containers' hostname
| `1.9-99 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0eaf58c0ec9dbc3f7d907d5cd100fc1f995a46ea>`_ Hot remove heartbeat threads on node.conf relevant changes
| `1.9-98 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72392e1839c8c6b86e6ede68867ee7810e422091>`_ Don't set cluster.name temporarily to "join"
| `1.9-97 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1f15ce3848a95825b642c2c0d7ef75af01f5613e>`_ Fix ping-pong effect on print action with "-c"
| `1.9-96 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8399f849f07a193ebb5ad5bb04f8f06c73f0d682>`_ Fix symclone driver
| `1.9-95 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6588854ae0e38d6706e90db6721f06e855a345c>`_ osvcd fixes and enhancements
| `1.9-94 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b972c929af8275587990c8e29addd912ca327e6>`_ Fix the deb depends syntax in the make_deb script
| `1.9-93 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=627193246ba52fdac3bf0cfb586469da48dce129>`_ osvcd enhancements
| `1.9-92 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=23a8706ed5c79b41359d16c12260a69924fc298a>`_ Add service-level triggers
| `1.9-91 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eff5ab75d1bfe4db2cdec6d9c4280f1f129c8602>`_ Add psmisc as a deb depends
| `1.9-90 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d918c3aa463fbcfd9fbfb5abfae6ced6c7ce3d60>`_ Stop logging app resources in a separate log file per app
| `1.9-89 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7cb97e55cc29887e9b3df91d4ad60b9357cd128e>`_ symclone drivers enhancements
| `1.9-88 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=53921e6a8aa532810d4a50f11e0ad09232b76055>`_ Fix the Svc::action() prototype
| `1.9-87 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1e1ea095a1834846f71bb6db6957469db765ebbf>`_ Remove all per-service run flag
| `1.9-86 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c650102b6a7dbf1e57ada69eed70bed2887bc26>`_ Don't silently abort all actions on service if constraints keys are not found
| `1.9-85 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4ae99b44a2afcf0c46cff03c82d410908716aff1>`_ Fix osvcd error codepaths when the service status fallback doesn't work
| `1.9-84 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff9760c505ff311ce4e5af70ce2254ff7e9a56d4>`_ Don't stack if svcmon is called without root privs
| `1.9-83 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64e33a5a178807e30cdd771ca6896d1a55549467>`_ Fix beating => stale transition of the UcastRx thread
| `1.9-82 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2d7020d97c237bbc879ed8df16700b3456395d1>`_ osvcd enhancements
| `1.9-81 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86a7d6cdaecb38ca35a75349dc65fe15b6e987f9>`_ osvcd enhancements
| `1.9-80 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d53e3ce4c6f050c1736e91d66134bad4e619569>`_ Try harder to find the inactive MD
| `1.9-79 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=750861e5e9cfb3731af7d86cd1f9466a2ae3f1aa>`_ Fix "nodemgr daemon status" utf8 issue on non interactive commands
| `1.9-78 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7fb0ae72011ce469735eb4d4868b614a209360e4>`_ Implement cluster-wide freeze/thaw actions
| `1.9-77 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=626173880762c3b6de4c36b9ba69acfab5ba0b92>`_ Clean up pre 1.9 specifics
| `1.9-76 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f4f9a703b407d8ff5875bfa569a5912bc5a6db3>`_ osvcd enhancements
| `1.9-75 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=102ce1345777fff74a5135794c5b14aceb2a4477>`_ Add osvcd heartbeat tx on-demand
| `1.9-74 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f8f04f42299336694a08cdef2b025664a794c920>`_ Implement cluster-wide stop and start ops
| `1.9-73 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=53486bdb0f1842c703c9e65b5aa0a5b84f31ef56>`_ Rename the heartbeats listener/sender to rx/tx
| `1.9-72 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0069cb20edc24f44b1293f4de1508edf0d14f30b>`_ Fix hb beating evaluation not run on some error codepath
| `1.9-71 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=802815a4d9622d5d382966a20634b57400f44aad>`_ Add service placement constraints
| `1.9-70 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=95fc8857cfd9c21f9d37f703710a123cd87b566a>`_ Handle references to the [node] section of node.conf
| `1.9-69 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45bf3e486d7860854fa223442782067a3c1aac9a>`_ Support more eval expressions
| `1.9-68 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=50627d2863c91409a1e7c596c3841d7787906b36>`_ Add the DEFAULT.placement keyword
| `1.9-67 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34656341b55df453f5359d31cf0dc6f9fe3c06be>`_ Fix hb statistics
| `1.9-66 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=652096b52b6a5ec05cdedc1c1fd7d6bca852ae61>`_ Update systemd unit file
| `1.9-65 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=642eecfd53bd3ccadbd59ea28d13be6796f633fe>`_ Implement daemon boot/shutdown behaviour
| `1.9-64 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=335ae4f35e01da5eda8c64694cf54c547fe019ca>`_ Fix "nodemgr daemon status" when no hb is defined
| `1.9-63 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0f5ae3f48888a256d23787b52ba4a93f32e8b78b>`_ Add the service DEFAULT.affinity keyword
| `1.9-62 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3ba2bc184137070d0f4e5939b4f2277a9fe81b32>`_ Handle standby resource startup in the osvcd monitor thread
| `1.9-61 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed4bea778b34710227f22f46da5d2820aff9bca8>`_ Fix the --refresh flag unduly set in encap commands
| `1.9-60 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f0780488c8f87c2b91cb5d3e95711c4d21c5ddfd>`_ Remove the 'autostart_node' keyword
| `1.9-59 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a713a000272e7fc61a151879172892f6dc7523f>`_ Read the disk mapping file both ways
| `1.9-58 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d9cdd7a50dfa323b86cd1fdd153bbe37138c736e>`_ Add ordered nodes and drpnodes properties to the Svc class
| `1.9-57 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=222a0119daa18c7ee0b5ce43a9a1a8b55e4304a6>`_ Embed the vm hostname in the service json status data
| `1.9-56 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b068eede4932a4bb27b0e095681630125da2b9f4>`_ Index the "encap" json status dict by rid instead of container name
| `1.9-55 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9715b870dda9cd3bdf48538bea0c0bec975dbf66>`_ Fix duplicated svcmon status lines in the collector
| `1.9-54 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=abeb3d034ef5ac145d697c0a5d95120a1f0101ff>`_ osvcd enhancements
| `1.9-53 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b69d9d277af8b4ee4de3480623b6d4d1636abaa>`_ osvcd enhancement
| `1.9-52 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63bf4c2d95e29c5df66acdff29455561b310f18c>`_ Fix status.json not updated on scoped actions
| `1.9-51 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6edb22430e9846e7587bdf2baedc34cac677bccb>`_ Import missing unset_lazy in svc.py
| `1.9-50 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=efc79b795728e8b4d2b5f51b24d694ffe3736791>`_ Really fix Popen() leaking the osvcd listener socket to the children
| `1.9-49 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19f27d4428ecfc88ddb55132043764c6cf81009f>`_ Be thorough on close_fds and global scoping in osvcd
| `1.9-48 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=78de1120af98232aa8944348bcafba7ff6c54ad4>`_ Fix "validate config", broken by the handle_references move to Svc
| `1.9-47 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ddb6b6ed37b9075c94f971cb1dc9f6f424f7d401>`_ Core 1.9 changes
| `1.9-46 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=13c66bbdeb72ed0bc5e45481c854d22feddd68ed>`_ Don't stack in daemon status when a node metrics are not found
| `1.9-45 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f9fec3e732ff842565f535d38e9d8f78ef248e0d>`_ Fix mon status not being updated in the daemon status date
| `1.9-44 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3361389cba26d0d7b552901c965c36f371f5d09d>`_ Fix flex instance stuck in starting mon status
| `1.9-43 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0509457df5a7a1a87d1dea15768c4a450841870d>`_ osvcd enhancements
| `1.9-42 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fe83ea1cbacb63c0040d7717e48a759760cd8e6e>`_ Fix a stack on missing node hb data in the monitor stuct
| `1.9-41 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d1a3f5637aec5e19d5ea4da40e1d932e474e65b1>`_ osvcd enhancements
| `1.9-40 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a51db4f1a72f0445ba597a4c1a858e61d03212a1>`_ Implement real instance status aggregation algorithms
| `1.9-39 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cde681e1db3b8b92066aa58c5c0a29c034c4a0a5>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-38 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d0359ea370e4179c6bbd208e90fdf748d77a7e60>`_ Report the conn addr:port in the unicast heartbeat sender error log
| `1.9-37 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=00fac71651f383646993c11f24cadce30948be27>`_ Implement a docker service aware is_down in the docker resource driver
| `1.9-36 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3e600b9fa744203b3dc09fd3d61914cc95d9d23e>`_ Add a bin/pkg/make_doc wrapper to refresh templates
| `1.9-35 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c86eab3ece54df62ce92c9b62e887a971825ab28>`_ osvcd enhancements
| `1.9-34 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d688f4ce337368606a17877f4998173837f6a99b>`_ osvcd enhancements
| `1.9-33 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1ed7077b957f1fc23e257828d3d1d0e96c5e49ed>`_ Fix python2/3 compat in the osvc services config swap around
| `1.9-32 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9cf11974962d3bdc7e668b24abda9d434d9e599d>`_ osvcd enhancements
| `1.9-31 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=029c287b640f72571d8663532ec931f4e788917b>`_ Don't try to disklist in disk.zpool presync if the pool is not imported
| `1.9-30 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1efc94cb57dbbe91ee617d5523fb0650e7e8afca>`_ Honor the --dry-run option in heartbeart shortcut actions
| `1.9-29 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d26651cb0af36186de8ffc3a2586b77c17e77e30>`_ osvcd enhancements
| `1.9-28 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8126c5648cca0b68308f185c19672e3d2069b67e>`_ Lowercase the osvcd threads status
| `1.9-27 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=31dcf02f46c4df9250dcbbfb8f4d45e31006cda0>`_ Set the SO_REUSEADDR osvcd listener socket option
| `1.9-26 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f9dc8245fdcda7460e6fe9d578701c1b0c4e381>`_ osvcd enhancements
| `1.9-25 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85bc58395e829539cd6f5bbfd46f9d767d727dec>`_ Support pycrypto as the primary aes cipher implementation
| `1.9-24 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b3a29de3f9ed338aaf37050278d9c26e656b2f2>`_ Implement ascii fallbacks for non-UTF8 terms
| `1.9-23 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=acccbfc2380d88d76c8f107b0d2b96d7757c2da0>`_ Avoid stacking when uuid is not set
| `1.9-22 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=77231aea287616ceef04cdb34c96a92f6c591180>`_ osvcd enhancements
| `1.9-21 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6592b359e69c78d258b5250b945a4fcc58e3cd60>`_ Don't raise on flex_{min,max}_nodes config errors
| `1.9-20 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9fe3a3d96d6ac590ec040ddc6f4ca5e3eba1397b>`_ Service delete handling in the daemon monitor
| `1.9-19 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98e4dae0f3331bb92e4b8b9b89624bfa4f0f3411>`_ Don't try to update the status cache on service delete
| `1.9-18 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=77b054bda88ecae3b0c19561674151e486090604>`_ daemon enhancements
| `1.9-17 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb480c6f8d7071b217e21edeb4f9cc715f672eb4>`_ 'nodemgr daemon status' enhancements
| `1.9-16 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aab3e61ec06e9a672b5f8ce6c706175f6b3899a4>`_ disk.raw driver enhancement
| `1.9-15 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=36ebbec778ee22569a189772ee6d9f75f715ab96>`_ Fix services with containers non reporting their status anymore
| `1.9-14 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2c27a982d6e9a92f6c4a46a2fb8fe220f1fd094>`_ Add new 'nodemgr daemon' commands
| `1.9-13 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1447b90d070daa0c7fe74aa3830fa3c61daf9113>`_ Don't refresh a service status.json if built "minimal"
| `1.9-12 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=41b9159ca1d7e5e179e36d905c41252f3214c0a9>`_ Fix inconsistent space/tab indentation in provFs
| `1.9-11 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f8206b416c376d8159d9e7511c6b435b4d51e10f>`_ Add the missing plugs for app start on provision
| `1.9-10 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1cf9c50871eacc98e8316006eb88ed1408279d9c>`_ Add simple provision/unprovision methods to the app resources
| `1.9-9 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2fc7cade90e1ccaa7ab431f3236853f7cea54d78>`_ Start the HFS before enabling the ownership mode
| `1.9-8 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f8eb64442d54d635f01247bc42bc8006d7d7e47>`_ Use "diff -u" format on Darwin and FreeBSD
| `1.9-7 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cffb671294316cd6110467b4b5415bb1110876dc>`_ Document the 'addr' listener parameter in the node.conf template
| `1.9-6 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3454b444d9954f6dc5b5552f02f7fca73fa2b266>`_ Be less verbose with unexpected CLI errors
| `1.9-5 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac46a33a49ccd6c7ecf159dfc19c1e88a821f602>`_ Initial commit of the osvcd agent daemon
| `1.9-4 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfb58ecec47a0e64ec9ec741528ba0824f27d3d5>`_ Add a pure-python AES cipher
| `1.9-3 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e0ae594904e27b82b84d410f1c82690e0a7b1b62>`_ Use left pad the color codes
| `1.9-2 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=37cf4c3dcc3c32f03fbb0f59edf570dd055a650f>`_ Plug the Darwin disk.loop provisioner
| `1.9-1 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2be798fe0d3976020737054a96ca34bf7d02008f>`_ Fix a postsync stack in the SRDF driver
| `1.9-0 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5380aeef73548849ce3e80d5c1601f015411f62>`_ Add Darwin HFS provisioning and fixes for the loop driver
