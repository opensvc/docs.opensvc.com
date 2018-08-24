Changelog
=========


| `1.9-1991 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19a5ee3f0fc3d9e29165cfa5642f72ad05f29798>`_ Add a action help preamble expliciting the fact the action is async
| `1.9-1990 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43efe67be8629b79e6f25454626e5c88501d3ff7>`_ Don't block presync on disk.md resource if overall!=up, use avail!=up instead
| `1.9-1989 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c08223d4b555e7c0b9ba59a4e4f631ddb02b7de>`_ Add intra-section references
| `1.9-1988 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=20f95d765388a982f79724c9bc2f8a8c18003a24>`_ Add unit testing for service configuration references
| `1.9-1987 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=36f888f7fb3178c90c521dd18449d4fe53206820>`_ Fix a stack on empty triggers
| `1.9-1986 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11fd97d3d1f8c46715778522f6469b80c75a06eb>`_ Add compatibility with previous priv dockerd socket location
| `1.9-1985 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d4ec0ec590801abcc789f46af3346d58938ab643>`_ Allow the --tag option with "nodemgr collector untag"
| `1.9-1984 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c95e8943ddc8983bf05094fd4ecd41467ab8cdaf>`_ Fix undue After-to-Wants change in the last opensvc-agent unit patch
| `1.9-1983 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98eabb028539809d9fac87f3d05c415572ff6266>`_ Fix the resource status not being updated at the end of a shutdown action
| `1.9-1982 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71bd89fcaaa5ce4cef2168f185a521b78975db18>`_ Fix systemd reaping the block devices in parallel with opensvc shutdown
| `1.9-1981 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b2e912293445364ff33806d233a1628643570c1>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1980 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af73a6664a95254d72c5eb195361ac7451a14f22>`_ Beautify the disk.scsireserv resource log when paths are down
| `1.9-1979 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=78b0b922c9623bf56b8c8910851477cbd33c7b45>`_ Fix stack in Freenas array driver
| `1.9-1978 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ff18e722b4a2c9e48887f4be5cc082fce0e9315>`_ Implement a disk.drbd shutdown method
| `1.9-1977 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1f2caef4f0d45d91932c3631bee920ddac171745>`_ Fix reference handling of values with utf8 chars on python2
| `1.9-1976 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bae7fa3451269ff034f05f97223943aa837c13c8>`_ Daemon monitor thread fixes
| `1.9-1975 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3fd9ec650edae44b547e9bc383638dcd5cf8a344>`_ Don't refresh the status.json on cfg changing actions at the end of the action
| `1.9-1974 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1aa7603df6b6d0eb339373dc4be9558efca3767>`_ Add a local boolean kwarg to service_command
| `1.9-1973 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c6968b81be5574ab6559de5f62c01462bd7ea729>`_ Handle store_rx_data() exceptions in ucast and mcast hb drivers
| `1.9-1972 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=76a2f2edf1426b7235b9eb30897ffb26a7cf7e02>`_ Don't forget peer data if we never got data
| `1.9-1971 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e7cbe9d021b1bd270e366cd4e39207c3e5950ff8>`_ Fix wrong method name in the disk heartbeat driver and add a log on missing nodes
| `1.9-1970 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf6e5809535d870d6234780ec7b3004debd7779b>`_ disk heartbeat driver enhancements
| `1.9-1969 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6340fad88fa9ef76edd52a67f34ac32aa8bf78ee>`_ Remove a debug log at info level in the disk hb rx driver
| `1.9-1968 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ab177898e7041832c451ecb38899190229d610c>`_ Disk heartbeat rx fix for an init corner case
| `1.9-1967 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bb41508beff8235c1dee39bed892092b4b069b81>`_ Heartbeat patch receive tweak
| `1.9-1966 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c64f93a2499252783d721c436bee913b89b61a2e>`_ freenas array driver enhancements
| `1.9-1965 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=290f5090ddfd4a32149991a8f8633d5724cda3b0>`_ Remove unused add_docker_vol() calls from the service builder
| `1.9-1964 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ca156d7c9c94285a2254f4be1dc1ce553aa552cb>`_ Add the kill keyword to the app.simple resources
| `1.9-1963 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2c41b0bc1a0a9534e7a1ed7eb686fc657e786b85>`_ Fix the app.simple false warning about dups when the process has forked children
| `1.9-1962 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=db83550c9dc2fe8a8b359bfbb0223f7a49c3a47b>`_ Support "svcmgr print sub|base devs" with fs.zfs resources
| `1.9-1961 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e10532f36ad50c4b088a646707fdb6eb305600c>`_ Re-expose the --force option for the "nodemgr sysreport" command
| `1.9-1960 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc78d3125ba1ec4bb5a21be8f5a757bda6ae7d56>`_ Fix pylint error in the hp-ux mpath checker
| `1.9-1959 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e5f26735a2b5c6a3b8c2396f62d16b65ad102d76>`_ Fix pylint error in the Linux mpath checker
| `1.9-1958 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=70a30dd43da4fce56666dac4e4a260a71d1df329>`_ Fix pylint errors in disk.drbd
| `1.9-1957 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1694693ee1bd05f356cd6f761a85c1f9ea234dd8>`_ Fix a wrong variable name used in Resourceset::has_encap_resources()
| `1.9-1956 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be7d05b9d4829ac42fde5eb19837a2cd60865703>`_ Fix pylint errors in ip windows driver
| `1.9-1955 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dba2d1866e7e5571961964c95874762e99402f96>`_ Fix pylint errors in fs windows driver
| `1.9-1954 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=943f174b0b9f60585620bcbb4f90b8a0d80abfdd>`_ Fix pylint-detected errors in rcUtilities
| `1.9-1953 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=445d26293cae62a027a63048a0660231c1f55b7e>`_ Fix an undefined variable in an error codepath of SunOS' get_os_ver()
| `1.9-1952 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5e58ee352c2c0bd55800cace53d32401eadb7d3>`_ Fix a qcall() call invalid argument in the jfs2 snap driver
| `1.9-1951 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8d606c626e109fe1823b348e0ae4d81dc93d77ed>`_ Remove unused and faulty code from sync.dcssnap and Svc class
| `1.9-1950 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9699c96dad3f8fe8870bc6f0ff1bf909f9a4c42b>`_ Fix pylint errors in disk.scsireserv parent driver class
| `1.9-1949 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa3f10e3de16530047d7675cc501f59a7cd53af7>`_ Add "scale_up" and "scale_down" events
| `1.9-1948 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=263325f30829ef8f8d044ca1b8a5b153994f5960>`_ Fortify the event data builder
| `1.9-1947 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5307791a6b15839eebf503f1d959e0c7791a4f4f>`_ Fix an event format string
| `1.9-1946 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e666618a69c80d8988222811c935c1df107ef4bb>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1945 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=96819484fb59789fc9de4d20008811fb89e574d0>`_ More events framework work
| `1.9-1944 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22fd7ce3e708684d3be3b76d93833bbcd3e76b21>`_ Change default compression mode in Freenas driver
| `1.9-1943 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63d5ed3f457d60ef02c1bd25c66f09f5a5b124f8>`_ Change to default IEC units in Freenas array driver
| `1.9-1942 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=02b40d26e5dce2c14899d3b7060f7207afe9af16>`_ Add custom daemon events and event hooks
| `1.9-1941 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5c10bef7ccca57d6e2c17050aab68f9e4a0a149>`_ Add a conf_section() ExtConfig method
| `1.9-1940 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fbdd29ddfcd53b77217d271a1159ebc6670b58ce>`_ Refresh the docs
| `1.9-1939 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=29e3c4bb3d784f45dc8c3c3b398c9863e461c210>`_ Fix the doc and rst generator for sections without a type keyword
| `1.9-1938 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac159b2c68871b4749f12c9effcb313e6e405a19>`_ Fix a sync.zfs drivers issue on nodes with a non-ascii locale
| `1.9-1937 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d6c58414c364bd94ee6c116edfdb5f11dd081fa>`_ Refresh the service status from the mon thread if its config csum changed
| `1.9-1936 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b61a61468c8da092d8161eb47a7b44109a2233a>`_ Fix another stack in Freenas array driver
| `1.9-1935 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e064e83c04bca316519fbf7cbf6ba94c16beca8f>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1934 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6c2934f05d0e709872505302ba0803828b0aab73>`_ Fix stack in Freenas array driver
| `1.9-1933 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d138b0a00e05adc4cae8fe53a7eaf79311a7c27>`_ Allow ip.docker to allocate the container's eth0 if available
| `1.9-1932 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0fc79f408a8f118e5ad982fb9f2127f39f1333ef>`_ Commit the hb resources templates after the timeout type change to "duration"
| `1.9-1931 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=95ac8c76c252e2518c432e325d8a59eb68b2feba>`_ Remove the STATUS_TYPES list
| `1.9-1930 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=383483869fa787722fb51a49aab01f0feea36ed4>`_ Support sections with no tags, encap, pg_ and _requires keywords
| `1.9-1929 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d69ca58035df94152e5e1df3cd652e56f807cac5>`_ Add a Resource::section_kwargs method
| `1.9-1928 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fa006aae0eaedc77c05fb821e1d6b789bcd8cec5>`_ Don't embed a "provisioned" structure in the instance status if empty
| `1.9-1927 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b65abf2202fd253dc3c73977b4d325c054e1714>`_ Fix corner-case disk resource ordering issue
| `1.9-1926 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e00058781db1840a68e59de331afc2518364d08b>`_ Fix a svcmgr create stack
| `1.9-1925 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=025b893cef676ee27ee7aab6fd93fdf6abc8bdea>`_ Don't run resource monitor is the provisioned state is unknown
| `1.9-1924 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c3c00f774cb794811c7f640dd35af3911509ca0d>`_ Add resource status and logs to the toc messages logged
| `1.9-1923 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=daae2a5a75f31090aa0516bb00e00e738891e0d8>`_ Fix rpm lint errors
| `1.9-1922 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0853e4883eb9e8ad4c810b14ea41349a398496df>`_ Remove the bin/ directory of jsonpath_ng
| `1.9-1921 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bdcc32c7e54b52ef29b35f83f2741881195c8a1a>`_ Add a method to format keyword resource arguments from a section
| `1.9-1920 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2dc8a28b68ab7000189489d0ddaed42bcc888714>`_ Fix drbd standby resource not rollbacking to the secondary role
| `1.9-1919 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5b1b15e406e6f227bf42485465f02e850d0c3e25>`_ Fix a py3 cast to bytes error
| `1.9-1918 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=223b471200259a88bbd239f836a5ba3727984bb5>`_ Fix multicast heartbeat keywords scoping
| `1.9-1917 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52e17bdde26380fdd7de626052f22e3a05a856a2>`_ Simplify the keyword dictionnaries declarations
| `1.9-1916 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e4bb5c66163f570af4e98339482c1711c9946c9>`_ Fix a stack when the collector is not resolvable
| `1.9-1915 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=214b7640538b4e5dcd2c74871fd449c802153ee2>`_ Don't discard a collector xmlrpc if the daemon cannot handle it
| `1.9-1914 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae706ed13e81e6e60bfe8bf50f0f49ed339a9ec2>`_ Fix a potential stack in the scaler orchestrator
| `1.9-1913 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f47bad5a001fbdc71e51efbd8f93323cd343167>`_ Ignore data patches when we expect a full dataset
| `1.9-1912 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43c54c3c1b78f3d1a8d5b31bad72d9ed4dddc923>`_ Don't retry connect() ad-vitam on timeout in daemon_send()
| `1.9-1911 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52c3d7e7e13b66195c2156dbeed1eeb4c92181ef>`_ Fix jstat checker stacking on expected environment content
| `1.9-1910 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1d1793adab3e415eeb01dc04d4fbf75e820e41c9>`_ Fix flex service agg avail status: warn+warn=>warn instead of down
| `1.9-1909 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f162e04920393bb21be081b9facaa4761ef9f0b1>`_ Continue to the next select()-ed lsnr client socket on timeout
| `1.9-1908 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1d7cc975a47ec53ba9f99559dcb6588fcfdabfa8>`_ Handle EREFUSED connect() errors in daemon_send()
| `1.9-1907 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e8f93ec7f9e9a1c0ae131ed4abe7a377dd2c0aa7>`_ Don't update the service status data on non-state-changing actions
| `1.9-1906 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=14e9ce7e188a8cade64156eeab739b1e21601ba6>`_ Fix docker default name unduly set to <svcname> instead of <svcname>.<rid>
| `1.9-1905 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b8c937d0e52ba6ba3806b1dfc66ce183f82db49e>`_ Add the {clusterid} reference
| `1.9-1904 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e93a817cb764ebb4d082f9e50edf7efcf2b198ac>`_ Fix a stack when setting min_avail_swap=0 on a swapless node
| `1.9-1903 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4162a1fe573f19eb60869e75a1206e8e4241c5ea>`_ Remove machine scope customization
| `1.9-1902 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b145e3b94ac10546e049138d99bb63c4701ae6a4>`_ Fix the opensvc-agent systemd service
| `1.9-1901 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8585333c0b49f1267a5f7a00a53467824ed56cbc>`_ Remove postinstall cleanup in /etc/systemd/system
| `1.9-1900 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=94fe55a693afe0ab55a1bf1b67f5de3b71588f5c>`_ Add the stop_timeout and start_timeout to all container ressources
| `1.9-1899 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2c68c7b9043aa7761dcbb2707beb68907b4c9309>`_ Add jsonpath support to the service selector
| `1.9-1898 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f6764c9219091c2738e0a3ce022f3d680458b85>`_ Add -x deny-zbe-boot to the zoneadm attach command on container start
| `1.9-1897 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a89fa8747867f24c3c9b9eec114c81cc316c31e3>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1896 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=57461735d97350db2d58c6e1205fb08d76d86b4b>`_ Feed a b"n\n" to mdadm create so it does not wait a confirmation to erase members
| `1.9-1895 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=77afd1cb3215810b3934782ee7be3cebd7545279>`_ Fix the missing resource parameter in systemd_reload_daemon()
| `1.9-1894 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=481ba1143418ecc0f01a65967abf1595a47fe5d7>`_ Reload systemd daemon after machine custo removal
| `1.9-1893 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=56d1426614e83ed9e6fdee5a722a4c3dd7d9de15>`_ Add TimeoutStopUsec and After libvirtd and dockerd to our units
| `1.9-1892 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=235fc777a69ea7a99f56520cf6549ce0f84fbdbd>`_ Machine scope tuning enhancements
| `1.9-1891 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a12af0b4b0ccd5a166de05ce033802f4a2f71d53>`_ Fix variable init value to string
| `1.9-1890 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a0345411db45e2ca61b536f79cbbd4dd686d96dc>`_ Fix the system shutdown killing the kvm before container stop
| `1.9-1889 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2691b17e2d4859e04895610f3e19367c41452907>`_ Remove the arping program dependency
| `1.9-1888 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1d46a8ab088183accf89fcb4c6db3cfb7851c39b>`_ Allow sync update on 'Periodic' rcg if not asked by the scheduler
| `1.9-1887 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=862311d1539c1a4acfe60e9e4066dcac1e73509e>`_ Make sure the HOME envvar is set in the sync.hp3par driver cli codepath
| `1.9-1886 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43dedbe3e641fe256457c30146c767f9d90208c2>`_ make_rst and make_doc tweaks
| `1.9-1885 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=33e9232cb37514e8789d24ffd12298f6105701ab>`_ Drop one indent in the svc_type loop in bin/pkg/make_rst_examples
| `1.9-1884 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f621daa4cfe1b5766fb3e121f2ace307d141e7d7>`_ Do not filter examples generation for DEFAULT, subset, app and task sections
| `1.9-1883 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=01fe7efc49230616f00e6be84cd217f26facfc2b>`_ Fix the template generation for the resource supporting the None type (ip, sync)
| `1.9-1882 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5bb9b4a8d511f603c512ac7c06ee8d7fa5d45b9a>`_ Remove the obsolete stonith doc templates
| `1.9-1881 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a25b73c39aadaca18a27e3ba1b974fbd78ac05bc>`_ Add the user, group and cwd keywords to the app driver
| `1.9-1880 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3a6a0f1cbfdb2c1a15f708e57c0e1d9300dc4da>`_ Don't stack in the Vxvol driver when a holder device is not in the devtree
| `1.9-1879 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=08c727f68109b9edfd7a3a868fe9f2432c081464>`_ Log a distinctive error when the 'package' comp obj can't get a 'dpkg -l'
| `1.9-1878 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ad425a9b8ff84849d25e85d09b2c407fddbb27f>`_ Don't stack on missing rcg definition in the sync.hp3par driver
| `1.9-1877 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c068b1dc2e556187819e55bb6c4deb7223733335>`_ Better handling of libvirt vm states other than shut off/running
| `1.9-1876 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f741534b5cdecdc949e556293f52a50a8b300467>`_ Add the resource label to the resource orchestrator logs
| `1.9-1875 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9840813e1eb3edadfb51f34708029b49e8baaf24>`_ Fix the 'started' local expect flag unduly being dropped
| `1.9-1874 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6544a45b6518d3a72e9b3ab7ec010941e80a3f6e>`_ Fix resources id containing "pr" not honored by the service builder
| `1.9-1873 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9d930f942d8732d5961dfd074c1c82b4f8f4478b>`_ Don't degrade the provisioned state for unprovisioned and disabled resources
| `1.9-1872 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a29a0255d7d012bbac0ff160491d9b2a90464f84>`_ Log unmonitored resources state degradation when they happen
| `1.9-1871 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e373e69ac41eb5a5999e5cf5c1004e9e970d0c77>`_ Mark resources initialized sooner
| `1.9-1870 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d92af37e98c5d6ec6f5bea1a5a110ef55bcda28b>`_ Don't start all lv after vxdg import if the service has at least one of its vol
| `1.9-1869 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1da7652f1c04162f656ae0325fb3d6e7bc556de>`_ Change the disk.vxdg sub_devs() algo so it works with deported dgs
| `1.9-1868 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eea6f82fa934a81f2596f67e0aa8144179f65320>`_ Support disk.scsireserv over vxdg and vxdmp
| `1.9-1867 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1f1d792737ce72ddf631dfdd8f9b8afbc139dc7>`_ Support alloc={disk#0.sub_devs[0]},{disk#0.sub_devs[2]} in disk.vxvol create_options
| `1.9-1866 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e72e7ef7f55584fbd1226a437eb2895a777ac441>`_ Fix lazy references not initializing service resources
| `1.9-1865 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=24da3829005142fa0a327b9d5703722e7b491583>`_ Fix undue disk.vxdg error on down dg
| `1.9-1864 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=53fe328b8976051d686689ae54d4de0b1a9e3d44>`_ Fix a stack on "print sub disks" in the disk.vxdg driver
| `1.9-1863 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2465f7c21e073f98f1caecea4c5e26fdc07fd899>`_ Update resource templates in docs/
| `1.9-1862 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=76a839ec4e38e24721a619f03a735de0e2cdb9c6>`_ Return the bdev pat instead of the rdev path as the disk.vxvol exposed devs
| `1.9-1861 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9257e8cf85859073e12f0e9d4688c235897cbf67>`_ Flag the fs.size provisioning keyword as optional
| `1.9-1860 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf112bb2b654f5a0ae54ef5d0038919a3fff753f>`_ Add vxdg degradation warnings in the resource status logs
| `1.9-1859 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c21b0c56fcfb87e89924df968f549ff869547881>`_ Fix the fs.vxfs provisioner on Linux
| `1.9-1858 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c3706e26914326377ebc9590e5a346c2940e6b9>`_ Don't err a provision action on pv already setup but not assigned to a vxdg
| `1.9-1857 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5bc145749afd3cc11afe76bd4e4216842eedd63d>`_ Add the docs for the vxdg and vxvol resources
| `1.9-1856 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=627775009eff8f2554aff4dda97136f019ab4c2e>`_ Add the disk.vxvol resource driver and provisioning driver
| `1.9-1855 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6c795ddd5450aa49b7eef88f26c868f48c6a3b2e>`_ Fix the disk.vxdg driver name in the driver itself
| `1.9-1854 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c5a102091b7dce642a9e59359ee3fca64a6dd80>`_ Rename the disk.veritas resource driver to disk.vxdg
| `1.9-1853 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e98bf2a06ef8ad848cad08e639f850d71e10ffe>`_ Add the veritas vg provisioner
| `1.9-1852 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=91577d25b952fb29df397f28408bba8a58ef1d3f>`_ Revert "Fix the shutdown/stop of encap services in container with nostatus"
| `1.9-1851 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5c5f40813b4b03cead0c0ab5cfc6ab55fc3f46d>`_ Fix the shutdown/stop of encap services in container with nostatus
| `1.9-1850 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=068d431de4f2ce01874fda15b5ce78fa6c3fe80b>`_ Fix the resource monitor not toc'ing for resources with restart=0
| `1.9-1849 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf51f07c8d249c702c6019840684cd5e509654b3>`_ Also log in the service log all resource orchestration information
| `1.9-1848 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dbcc8abf502e82944119ed851094a579eab83247>`_ Don't freeze the encap service on stop
| `1.9-1847 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=10a5fa412274894e748fd825e5cf732b6fc5ddde>`_ Wait for the multiuser zone state in the start code path
| `1.9-1846 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5a9c3f4f840a53060b73ae71a8d18ea46ea6bdc>`_ Add more cases for local_expect=started reset
| `1.9-1845 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f7259c3cf986e7ae576538685694c1bd7514e4b>`_ Fix a case of failover service not failing over
| `1.9-1844 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3eb99c447b503110ca84138d012e53717c62ad52>`_ Add a jstat checker
| `1.9-1843 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dae3cdb75e798e807127eb187e9e14ff89788d85>`_ Don't use snapshot-reparented alt_src for sync#i0
| `1.9-1842 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f061f43957c859beef8d50bcc254e52bed79dc78>`_ Python3 compat fix for nodemgr pushsym
| `1.9-1841 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16b7740544014659d94e4ef2b95142a87f1b2e47>`_ Start using the six module now that it's merged
| `1.9-1840 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c6fa4afa2aac6fae14a9872097336d1e3440bac6>`_ Add the six module, required by jsonpath_ng
| `1.9-1839 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c23a2ee11a62a0dec2bebe7a2fee5d16b0c982bc>`_ More detailled error log on failed post remote action
| `1.9-1838 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5704ef875e8415c720415061e2a94f4cc952397>`_ Fix wrong return code when catching Svc excError from Node::do_svcs_action()
| `1.9-1837 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b043cd3f10f9b21d786eaa5184851ec53e3e822>`_ Fix the delayed scheduled tasks executing too often
| `1.9-1836 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0a71b446cb08658955742be1f8b342d94121d630>`_ Fix pushasset erasing data in the collector, when it has no value set for
| `1.9-1835 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c957c392bd5950ada2eddfd38b4566b8ff02f6a0>`_ Don't log a stack on xmlrpc timeout
| `1.9-1834 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf16941a04db6d3cbbdb0b06bc49eb535d9c8109>`_ Don't retry connect() on socket errors other than "temporarilly unavail"
| `1.9-1833 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7df90d2f728743035b343039ebea3f453599a338>`_ Kill more efficiently subprocesses when stopping threads
| `1.9-1832 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0f840da04d6aac51a88e857f1b1c6ab8faae9abc>`_ Start the scheduler thread after the monitor
| `1.9-1831 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2db5986f6ea182a6ac667b026c6b580084081069>`_ Fix a use before set error in the comm module
| `1.9-1830 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42ec418ea0d29e0d289d0f561505ca11690ecede>`_ Fix the agent/daemon connection refused
| `1.9-1829 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=adfb1adecfd1f34d1baaf9e294bd68205e1e8a28>`_ Fix a stack in the cni driver
| `1.9-1828 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba58a8a42f52483ff3679a47788a99c1c61a6e08>`_ Add the "nodemgr wait --filter ..." command.
| `1.9-1827 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eac16508dc016217ac521ba707d0ad4a19721221>`_ Add missing doc templates
| `1.9-1826 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1d1d874c09b6ebd1de7706ce918553298848ea69>`_ Fix the "nodemgr daemon status --filter ..." not filtering
| `1.9-1825 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ffba78deaefd74a207392f634e884c457bc23756>`_ Add the nodemgr and svcmgr --filter option
| `1.9-1824 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30120b134ec2928b341c7a2e5186640ff0b8c8ec>`_ Fix a container.zone error on zoneadm command executed from osvcd
| `1.9-1823 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d97e2742745f264d09920245247b353184f0dbc>`_ Fix nodemgr pushpkg in sol11 zones
| `1.9-1822 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a361f7827bfe53f5c026c9bba49e05c1a9fc390f>`_ Misc fixes in comm module and listener
| `1.9-1821 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f6a1f2c0f879424638e2c6e0c79bb1665fee04ef>`_ Drop TMPDIR before running a pkgadd
| `1.9-1820 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3f78b6a161a633322d1c7497caf89e2aab7f763b>`_ Now that we have a svc id, use that as the nspid in the ip.cni driver
| `1.9-1819 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=04bff9ad31d58f4af78f664f38802e7baaad931e>`_ Make sure the created scaler slaves are thawed before provision
| `1.9-1818 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2879e3d89621e3b128aacb352c482934b93a1c91>`_ Support expose=<port>/<protocol> keyword in ip.cni resources
| `1.9-1817 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed0887593f64c4c429fa043d0fb8844a4ddb1071>`_ Fix ip.cni status info not reported since ipname became optional
| `1.9-1816 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f690d8090ca30e6a7c09b1e0c56bb3922ea63ff7>`_ Add the 'nodemgr rejoin' command
| `1.9-1815 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0a00aaa9fec1ead5bd2c29ddd748553376a62124>`_ Flag the ip.cni resources as always provisioned
| `1.9-1814 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d2caa25d7499cf256d208a552d609177446e26c6>`_ Teach the app drivers to switch to netns wrapping if an ip.cni resource is defined
| `1.9-1813 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b85d92d00311a4ea0b6f46f03d01d7b26658997>`_ Set a dummy container id for cni when no container_rid is set
| `1.9-1812 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d19abd3ea32bffe1eb45973cf745b954adb29df1>`_ Add json format support to svcmgr ls
| `1.9-1811 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8cf72b036f27ad1d9720bf5744f06a5476016ceb>`_ Fix a typo in a log entry of the add.simple resource
| `1.9-1810 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16c8a3f4a8f67e0c274788e459b34f43e9fa2b02>`_ Avoid a stack in svcmon watch mode when the daemon data is None
| `1.9-1809 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d5d9c584a24f1ed75fed3e52d9bb34bf5560a578>`_ Add SunOS support for the app.simple resource driver
| `1.9-1808 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f309e199fdc00036e893eb533940cdcae09aa2d5>`_ Add a app.simple resource driver to handle non-daemonizing programs
| `1.9-1807 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c66aa0bc1519c81e8f96e34819f402e63d1a9399>`_ pylint fixes for the container.lxc driver
| `1.9-1806 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ec9781561f789c66bd9af89df50d1290df5818a8>`_ Strip lxc3 storage driver prefix from the lxc.rootfs.path keyword value
| `1.9-1805 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d8caa115b85ef86fd678522b6b13bc3b1bdc80f0>`_ Lxc 3.0 support
| `1.9-1804 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4885fbb68f8e23effa2f35f981d40300cb99c6e5>`_ Make the ipname and ipdev parameters optional for the ip.cni driver
| `1.9-1803 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e031fbec26c8a968d3783074411b4255614c8440>`_ Fix the error handling of the start/stop codepaths of the disk.zpool driver
| `1.9-1802 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=70cb82fadfadb443ad049ab30ecf95c6d15874f3>`_ Avoid the svcmon -w blinking
| `1.9-1801 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b6e048333d48497d16ae60e489171d15337c4eb>`_ Silence the "limit %s = %s" app log when not in a start/stop action
| `1.9-1800 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=67076313e89a1a3f3b16dd0ee13eb643b56b674e>`_ Fix the pr status on passive nodes with no devs keyword set
| `1.9-1799 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=12dabfd66f7b2a2733e0683a075eaf5e82a99f27>`_ Set --cache with pvscan when waiting for the vg to appear
| `1.9-1798 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=325ae16d461f8e3839262971b872d38c926a9d5e>`_ Fix the end rejoin grace period condition
| `1.9-1797 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=606411cdc53f35348c5c84e11c60e5c01d2e040e>`_ Display the rejoin nmon status in the svcmon output
| `1.9-1796 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8237c4ca3232de1f7d53d941f769575b3396caa3>`_ Sort the nodes in the "svcmgr print status" output
| `1.9-1795 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0fa94dc90db0498bb64f9b79935ef8eb5d8e856f>`_ Sort more sync.rsync label and status log information
| `1.9-1794 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b0f02ac3e19610ef69eaf457d8823b16464aa9ac>`_ Fix an utf8 error on logging in users comp object
| `1.9-1793 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30852ab6147112542fc19dfa93d81773c9bb66fd>`_ Make the duration converter return None when fed None
| `1.9-1792 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=01f5305e22833a09222cdb597a92709f5e32c985>`_ Fix shlex converters fed with a list
| `1.9-1791 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6ab5df216a44b2e248b2c5bee0eb2d20119d6b3>`_ Fix keyword default values not being converted to their defined type
| `1.9-1790 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b8f812b4d4befe1f0dd736e6ae6623f3d56fa197>`_ Fix keyword default value being altered because of reference-passing
| `1.9-1789 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=556da0a955c6e00f5e9feae06b2cfb660c7207b8>`_ Fix daemon trusting the service pre-boot status cache upon startup
| `1.9-1788 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d3bcb6269df91fb6ff98ac7bc7bbce354845c962>`_ Fix for conf_get() in py2 with utf-8 in svc config file
| `1.9-1787 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34eeac68e77b4174d02f4fee5d498bb2460984da>`_ Remove support for collectors not supporting node authentication
| `1.9-1786 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5b4095cb0a81ef6759bf60fe8cf7e217e039106e>`_ Fix the updatepkg from nodemgr dequeue actions triggered by the listener
| `1.9-1785 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a09ed4ed832474d1d495cad9ee325a3481708571>`_ Simplify the dns thread code, defining only one <clustername> zone
| `1.9-1784 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c0ad670a46b220e7186aca410786bb92f53f75da>`_ Fix posting utf8 from file with py3-interpreted nodemgr collector cli
| `1.9-1783 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3c2d6c431b1edc0ea5b956031a5dbecc6956703>`_ Fix implementation of the dns thread lookup method with ANY qtype
| `1.9-1782 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e392d126f1499a5de7addc6cf95de51e1bed6751>`_ Fix a KeyError in the dns thread cache
| `1.9-1781 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63048af8d4373ae6aec8a7e5b0de3ae26808dd7c>`_ Cache the zones in the dns thread
| `1.9-1780 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2599c67ed9f3ce26945e145f5fa4c84f9c911370>`_ Fix an infinite recursion build issue with zoned fs
| `1.9-1779 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6bff6ccca5d4cd1a928358adfed3fcedee74abe6>`_ Fix a stack in the quorum logging codepath
| `1.9-1778 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5e091d2d31dc34ffd4c88937af00fb60938b70b>`_ Add a small pause on collector thread exceptions in loop
| `1.9-1777 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4671e5340dc7c34e7649535fb61fd9e3e58d4975>`_ avoid serving multiple SRV entries pointing to the same ip:port
| `1.9-1776 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d41d6c29f12764dcad82668cb06c2579d1eb1fc2>`_ Ignore getservbyport() OSError
| `1.9-1775 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=341986cec7af5de5716cf7bb6c52d92886df00e0>`_ Fix the async create+provision
| `1.9-1774 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=79d068618a329052766b7959e04ceba5a94628f4>`_ Don't use "zpool list -p" in the zpool pool driver
| `1.9-1773 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=802294b200f4b2f8fd755ed064998d7a8e11d59d>`_ Fix wrong fs dependency test before starting a private docker daemon
| `1.9-1772 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9f56913d35fe46cf862bc2ceca709a11c9114bae>`_ Fix "svcmgr <action> --rid <group>"
| `1.9-1771 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1318258740742356ad2cef334005b65abc601a03>`_ Generate _<unresolved port>._<protocol>... SRV records
| `1.9-1770 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4a6a5ce6c335a5aebfb35eba3501a3959f6861e>`_ Fix push resinfo causing undue docker image pull tries
| `1.9-1769 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ef228fe66879523e905e8a993c0e3164cad8769>`_ ignore references in the content of a {safe://...} reference
| `1.9-1768 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ccbaec18f6264337853a04d61cccf59caaeb8a69>`_ Fix a stack in bin/pkg/make_rst_examples when a resource has no type key
| `1.9-1767 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27cbe00f18af8815a938ec3778c5016954a60be9>`_ Directory pool driver enhancements
| `1.9-1766 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e05485fc946ce8ca9bcab0ac405067dd5131fc41>`_ Add the "status_log" app resource keyword
| `1.9-1765 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=14193d847585abaa6bd2228a27dfd371c805187b>`_ Merge joinee pools on "nodemgr daemon join"
| `1.9-1764 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4cbcbc5a94d09cbecdb56d0cc702407bfdc6f239>`_ Fix the "nodemgr pushasset" formatted command from the updatepkg codepath
| `1.9-1763 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a8d39e6f8d479d8bd372cf9e99e75166b925d3fa>`_ Remove clean_pyc() from the postinstall
| `1.9-1762 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f536f4e857d4298ef579daa076e30b048cfb6e9>`_ Move clean_pyc() before install_rc in the postinstall
| `1.9-1761 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80d5dee4b372159664eeccf261356c29779e295a>`_ Improve key format tolerance on custom app info
| `1.9-1760 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fb5016ef81edb3efb369da166d4e74b151fd38bd>`_ Add the "directory" pool driver and use that as the default pool instead of loop
| `1.9-1759 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b152fc9426ac97b005984511ad18ca838fc70894>`_ Add storage pool translators
| `1.9-1758 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d57864d7b2a303fde82777ea845e53ef50a47bcc>`_ Don't display the "loop file does not exist" status log on unprovisioned resources
| `1.9-1757 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5b715fcac13909296b6f4c58841b3e81c4a0d8b5>`_ Fix a keywords module potential stack
| `1.9-1756 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=086d2c60dd2ea3a2e2fb43da5aa0cec8fce0f0f7>`_ Add the {rid} and {rindex} references
| `1.9-1755 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f38ab83674c31987fdfe4c8b483f2669db13e68b>`_ Drop the scaler id from the slave upon scale
| `1.9-1754 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83ee26fe5b3437c7fc2adbf610a1fa1d547f95a0>`_ Thaw the service after create+provision
| `1.9-1753 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9607d41a0f7ecf5bad9776ce543545ee9c654a1b>`_ Auto-generate a service uuid
| `1.9-1752 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=64f897869be599ed85327880f87b557ef4d527ca>`_ Drop compat codepath with older collector from xmlrpc lib
| `1.9-1751 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=33ebde101ade1b21fe54aa834d18664dd081f1bf>`_ Remove unused push_all() from xmlrpc lib
| `1.9-1750 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b018bacd126a9e566333d2cf28f6cdaae1e49f2>`_ Flag the "push status" action
| `1.9-1749 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=097f2184715011d59eb5d9a62d611710f9dfd686>`_ Add the "svcmgr push status" command
| `1.9-1748 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=247bd10b7ff2bf7bc570ae624e15655a32094b7d>`_ fix warning on delete service instance
| `1.9-1747 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f2e0354bf2c01c8ebc0308f162ed855c03bb4e1>`_ Fix the tasks last scheduled run timestamp not updated
| `1.9-1746 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e0d0a5de6da1e6ed9b44be09f071d69caeff2bbf>`_ Fix a stack in push resinfo when a pushed key value is None
| `1.9-1745 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=51921b9d4423b04d00cff69652c85f21a68e4f42>`_ Fix a case of corrupted listener responses
| `1.9-1744 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=57ca05f36c2922e2cab31029dbb2c82b1d82c9ee>`_ Fix for the file compliance object
| `1.9-1743 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c18c8eefebfa40a478bc6b1da201aee5e99b278c>`_ Always set --purge-collector from clusterwide async service delete
| `1.9-1742 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=36aca82b93acb14c6d0eb39c5c10314fb70251c2>`_ Add the --purge-collector delete action option
| `1.9-1741 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7de4e758528a7b65d05c12842222066919bf5fda>`_ Autoconvert Collector() options to a Storage object if opportune
| `1.9-1740 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42c95995220d3ea316405a49caeecbdf187e00ac>`_ Fix the deleted instances detection in the collector thread
| `1.9-1739 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d25e42ed274efdeac8af099eed5443c7015d72a6>`_ Fix resource label cache never refreshed
| `1.9-1738 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=96963e1387a05fe6c4eb0acd33a16bb9d1dddfa0>`_ Add "svcmgr push resinfo --sync" support
| `1.9-1737 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a4eb0c910bbb82633ee6398b32f4f42ad20cf424>`_ Fix "systemctl start" agent ignored by sytemd
| `1.9-1736 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3c16629b056a386007a529b04f8e2b75defccc19>`_ Fix wrong exception catched in the bogus rid in config case
| `1.9-1735 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62f497db10baaf4a6a399b14d1d5fe0113e136f6>`_ Fix a stack on logging in a xmlrpc error codepath
| `1.9-1734 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ef1c175a32f18633ee92b3f93239e316d555559>`_ Catch disappearing instances when determining if a daemon_status should be sent
| `1.9-1733 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=883b6e1540c1b9a15f6ac957876f604c2fbbf667>`_ Fix "push foo" action interpreted as "push"
| `1.9-1732 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ecf18969be8f1cc2b81857f3b206f687436d92e2>`_ Add a missing resources init in the get_resourcesets() codepath
| `1.9-1731 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ba70d38bb560201ab194a3ae284ac46d42d5294>`_ Make sure action_rid is never set to [""]
| `1.9-1730 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=edd2bedd8d4a00a5a636fc7906e296f7923d84c6>`_ Fix a unicode error in the lcall() codepath
| `1.9-1729 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b22096cfa0d4367fa632b3241a1ce6628fcef90>`_ Add the cluster_id information to the daemon status data reported to the collector
| `1.9-1728 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=196f6cb556c3740efddc6c52386f701f3e1fbdf2>`_ Use os.uname() instead of execv(uname) on Linux asset inventory methods
| `1.9-1727 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d00432ceaf3bd264605136e2df1ebcf5e93a24c7>`_ Service build optimization
| `1.9-1726 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea500bfa65be53f39b8a25821964e33036827612>`_ Raise NA instead of CompErr when ansible is not installed
| `1.9-1725 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bb09bd5c0af17f7e75dc08baf768bbae9b3144b>`_ Remove percent chars from the package changelog
| `1.9-1724 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f3324bd12b68f241e5359abec02b2f5b5b7791b6>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1723 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1ebf7118219c76b8a957715be2e336766ab0aa0d>`_ Disable %install rpm helpers
| `1.9-1722 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3990de030c77a370e64d8fd583ce3d8ec2b439b8>`_ Fix postinstall issues reported by pylint
| `1.9-1721 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=619419580f877e6a13424f3ae143bf14b6d870fe>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1720 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5b9a41323c21653d4e9fd20d15fce61384df7c52>`_ Add 'replace' mode to fileinc.py compliance object
| `1.9-1719 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34c472afcaba5dbe7070d4a282d9f1e293f4ded4>`_ Fix a lv snap cleanup stack
| `1.9-1718 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb826196c30ab8ebe0a843783a28e79843d64bf4>`_ Use ip(8) on Linux in ip resource start/stop when ifconfig is not installed
| `1.9-1717 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8c15de677b567958d7a8350e697387242800c207>`_ Fix a stack in the docker registry autologin logging codepath
| `1.9-1716 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=941ab5258909045c753adc54eaa8e58bc47b07ca>`_ Add the "none" placement policy
| `1.9-1715 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=96e655ba3ec34d336c328c4fe12632eaee8331e4>`_ Fix the scheduler lazy configured tasks not initialized in the scheduler thread
| `1.9-1714 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f7ebee135fc91635a4fd876e72694d54244428e>`_ Restore the silent app check behaviour
| `1.9-1713 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=628b6fc9e2d3e3808634eb31de4710508b7f5037>`_ Fix the master-slaves async action propagation
| `1.9-1712 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff0a9f618b587b17dfb93fad19b70f2459dda977>`_ app resource driver enhancements
| `1.9-1711 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d359934cc787a5cb79600c2959d9ccc97c50f6e1>`_ lcall() enhancements
| `1.9-1710 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e52d2197d0570b97dcbf2ef1dfbc78fa33bc296>`_ Display the stack in the service log
| `1.9-1709 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c3a59747b5e251b6e2d371ef485d6c8cb9ac5084>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1708 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9bbe8e021885d02bb2bf2cb9adae86dc031a8df3>`_ Remove the 'minimal' build parameter
| `1.9-1707 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=24952da8547cae36b65caf745c31816a3f32b9fb>`_ Fix stack with ansible_playbook compliance object
| `1.9-1706 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf1493217e002b591243a079b2e6a7c9af4a748c>`_ Sort the devs lists logged in the disk.raw resources status
| `1.9-1705 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1417949ed5eecaa39a7252e7289ed923d6a586c4>`_ Make the "nodemgr events" command work on mono-node clusters
| `1.9-1704 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05c5652adcfc1fce0effb3d680f5f0415c0f142a>`_ Fix the service svcmgr exe link unduly recreated on async delete action
| `1.9-1703 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6a46c51873c38fea6979071e4a4b589d01a86dd0>`_ Service selector enhancements
| `1.9-1702 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2db3f762a6d732ed1186ba27a7b169f74d847ed5>`_ Fix a stack in nodemgr events caused by integer fragments in the key path
| `1.9-1701 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a0e9bf789a4793017375bfd822f9e1a46bbca04e>`_ Switch the status.last format to json and store the resource label in there
| `1.9-1700 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=341bec57173c46091048a7cddd3987ab736c1b88>`_ Sort the disk.scsireserv devs in the label
| `1.9-1699 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eb4a1c0e7cec28b33f6f67d94077421f3b9514d4>`_ Revert "Run set_label() on status load from status.last"
| `1.9-1698 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16bb4e6dc08c82b01c198727fa5594a24bb08315>`_ Fix a stack in "nodemgr events" when formatting changes on integers
| `1.9-1697 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b39b02e104eb021e935b0e840f54c389f3d2220>`_ Run set_label() on status load from status.last
| `1.9-1696 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f432afca2aadcafba803c2838c8840e1e58c745>`_ Fix a stack in "nodemgr events" caused by key deletion events format
| `1.9-1695 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4cc375bc1429e3e8cbb23c8e62a011751cbe0334>`_ Discard csum keys from the csum computation
| `1.9-1694 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f6a5820cee4ea9a810c8b43408005e908f952b75>`_ Add more stdout flush
| `1.9-1693 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b0d81cc47192c8e7db7d59b2d46589d3a4a6f980>`_ Switch to a human-friendly output for "nodemgr events"
| `1.9-1692 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=471ef80c7bacc5128c64d0f73d9725293e0bc299>`_ Fix the encap forest disappearing from "print status" after resource monitor
| `1.9-1691 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bbf54567408900427b14c1797c05d751a3b9b2e8>`_ Fix send daemon status aggregate changes usage
| `1.9-1690 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7361120f6055ed904bf667709fd9732e4c590746>`_ Improve postinstall logging
| `1.9-1689 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e9ecb0dad39f984f2b76896a284906b97eba8f7>`_ Store status log text lines splited
| `1.9-1688 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9d3e926ee9fbec542385a9b0de28dc1e564ce04c>`_ Avoid double write of status.json in the update_status_data() codepath
| `1.9-1687 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=59d8eb0ff81d6ef5891f9b9f66177763c76f2c9a>`_ Sort status data keys during csum computation
| `1.9-1686 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=69fed28a6aa242cf61d44567fa4b77a8a0821235>`_ Fix missing imports reported by pylint
| `1.9-1685 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bca0029ee159d3e3707ccd3dfa3052288f1a81c9>`_ Fix a log statement in the scheduler
| `1.9-1684 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=da261f6e05244c897cd73e79c512af8a1c2897f8>`_ Fix wrong svcmgr option set in the commands formatted by the scheduler
| `1.9-1683 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3323b1e6ae6216e99ad37d9bce53baffa9993455>`_ Refactor the scheduler command merging
| `1.9-1682 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c738ecd5f83967fae3729f409054b50ed697584f>`_ Fix the node env discovery
| `1.9-1681 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1ccc0e809dede2b19f76706319b7270a3559678c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1680 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4ef50f61a773ce2129b3bc19803e5bc80d566e6c>`_ Fix sync resources reporting "max retries (0)"
| `1.9-1679 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aed865da8c6eb2c2ba64528c918256e1bdb21cfc>`_ Fix the daemon status data send buffering
| `1.9-1678 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d7a6fde893e88c8403b09b10bd6802f4bce1461>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1677 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=18dc47a040ddb3387927f6d92efa167cc43f30e6>`_ Fix the lcall() select() timeout
| `1.9-1676 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=69afc6e5f1fa6ffae0b3d44e5231c35604143bdb>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1675 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ecf2a3cc7bbbc1d297133daabe7a2c8586cc2b31>`_ Set close_fds in lcall()
| `1.9-1674 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c15a57c9bce8f8f6a4665ebe636fd2061f3e28de>`_ Add logging messages during package install
| `1.9-1673 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0afaf7e14fd46b6b42f3e3de81b749b3cc0fb9c7>`_ Improve test reliability by using type instead of which
| `1.9-1672 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f42c91a923712896ce1e6e0736999608406ddf0>`_ Catch locking errors from the scheduler in the service action codepath
| `1.9-1671 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9670260848a60deb7e70f208fe398a0669f61484>`_ Add resourceset nose test
| `1.9-1670 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=db9ae51fddf50025d77eb2c4435b465168a7ac20>`_ Don't aggregate children availstatus into the service availstatus
| `1.9-1669 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed1445df1c2dd849e3214b2a00471e4639c178ed>`_ Fix "svcmgr -s foo create" returning 2 instead of 0
| `1.9-1668 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=198afacf8b7817fa07ed4eabdbb310c4d2fc27b8>`_ Update PYTHONPATH in nose tests
| `1.9-1667 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b2c0ff979dd24ff51fadc3b54f448c2ff0cc1ac>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1666 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be406c72f4905f45ef84fb1f9a9fd09e0fb7b868>`_ Allow "set [un]provioned" actions on resources tagged "noaction"
| `1.9-1665 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8e5ba7b4e8e15848be8e27f0cd2c824b3afe6898>`_ Remove --no-pager option from nodemgr logs test
| `1.9-1664 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1af1c4e7a16360d27f844ae850f05610b4747d61>`_ Build in minimal mode for "print status" without --refresh
| `1.9-1663 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=273232b077c7227c82a1c0f9e137617ef59970a6>`_ Fix an error in "print config --format json --eval"
| `1.9-1662 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e10d4c1c9092a05cee2f85fefb3589d547e22afc>`_ Add the global expect information to svcmon
| `1.9-1661 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=733f76d1c4a1324869a2116bf0da51bef0b21c75>`_ Catch a KeyError on daemon_status() in early daemon init stage
| `1.9-1660 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b2ac9afc1e05249c0a744bcabc540755fe310f8a>`_ Fix "print config --eval --format json" errors with keyword inheritance
| `1.9-1659 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ed29b21b81e13254eb652071e4eda32641059b5>`_ Remove the build_services() from svcmon
| `1.9-1658 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5ca5ec7133000ba7c87b6a21d1e92d6d2a7ed00>`_ Fix svcmon empty output regression
| `1.9-1657 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83dd868fd9d5b7d338d12332f3b83ee8828b4ce8>`_ Fix the node env caching in rcEnv
| `1.9-1656 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19e0cdbf22c06455dcad7bef564e011a49539411>`_ Move list_services() from svcBuilder to rcUtilities
| `1.9-1655 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4edd21b8c3246d1ed177f1dcd0a7160e0c2f7b11>`_ Avoid stack in xmlrpc calls when the socket to collector times out
| `1.9-1654 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1159b0240f5e354703b0fcebd75e666f499d183e>`_ Fix fs ordering method
| `1.9-1653 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=15cde163117867e4d21af5216385fed320181c78>`_ Fix fs ordering method
| `1.9-1652 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=051edfa9a1660179e548e06da8d8b979d053f7e7>`_ Fix "set/unset provisioned" not working for zoned/dockerized resources
| `1.9-1651 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=456a78033b42af092e447d298b2f9ef2103e70a7>`_ Optimize the service selector for the "-s <svcname>" case
| `1.9-1650 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f4a30f6fd460dde81e471e2f1540eae06f193be>`_ Use --parallel on merged commands in the scheduler thread
| `1.9-1649 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=abeb368c34d31605603c4b705d75ca9ab598fa25>`_ Remove the .debug.log handling
| `1.9-1648 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d7f8dff3132335f4b6f8d35f314079789a60c110>`_ Factorize the scheduler queued tasks
| `1.9-1647 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f36167b6476b831c7953c5143163c5bffebbe97>`_ Fix docker registry autologin as service stack when the node is not registered
| `1.9-1646 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a0985216c78f8a972896e5ab882d5c56e2606766>`_ Never consider swap-overloaded a node without swap configured
| `1.9-1645 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eeb29083916dd6189f6999d8aaea2d2a5f7e3040>`_ Treat the "status" action as a print action
| `1.9-1644 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=53d7025e4a64339283c08b5d5dc164f927222c1c>`_ Save a daemon_status() in the async action validation codepath most of the time
| `1.9-1643 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=002a64d8b822369173ce1f48d42b9e85ac57d27c>`_ Fix a syslog handler stack
| `1.9-1642 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ecbfc752a5c4cfc499593699919415b19942324>`_ Switch the listener backlog from 5 to 128
| `1.9-1641 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6db028005c3f18d30e764dad79ccd2d671978995>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1640 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d9df9a2e027f91f621bc56becfe47dc37215479b>`_ Remove a debug statement from the listener send() codepath
| `1.9-1639 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fbc5995bc0d208954cdab65a2e29efdb9b89e386>`_ Solaris 11 fixes for the mcast heartbeat
| `1.9-1638 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f097ce0905b3bb0aac390b9ff1913fea0727fef1>`_ Fix unix socket overflow on send on solaris
| `1.9-1637 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d5faef8b7b721315374402280899bf70e7f79749>`_ Set nofile earlier in the nodemgr codepath
| `1.9-1636 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3f75b7ec986cde3d91250e8174392bc9183b94e7>`_ Fix error message string
| `1.9-1635 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=748c468fb2508e0feb92dc250bf3c7facd50dc41>`_ Set nofile at daemon startup
| `1.9-1634 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=06395521aba251ea9c23503d311f208584ad3c7e>`_ Fix a stack in solaris python3.6 os.urandom(n) with n>1024
| `1.9-1633 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dd57e4603c86dbf5d1e8a96823bf2d50f5e68c89>`_ Coherence fix between the disk.md provisioner and starter
| `1.9-1632 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2c162de66c27c7fc4191a3b722e1d6b8d04e6ae9>`_ Fix the disk.md driver for el 7.4
| `1.9-1631 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5708a56f1ad8e96c337de38b8c5982415a1c55aa>`_ Fix the maintenance_grace_period keyword doc
| `1.9-1630 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf7d93f9083818c83cb28bf8bbf2fa9909d21201>`_ Don't TOC if no node is candidate to takeover
| `1.9-1629 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=91d310f150f0c737e36b0e99100851c293960553>`_ Do the node removal on peers upon "delete --local" synchronously
| `1.9-1628 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3c9bcd7cd1831fe5e2b5673926bbf5ce185a87ea>`_ Revert "Fix another case of serving a svc config file after a delete --local on a peer"
| `1.9-1627 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9cc8f8c349ab21abdbe45c559a0b047f53d10150>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1626 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c1e77ea3e8e2b5e81e26527a807506d521c8d1c2>`_ Fix the ready_period node keyword default value in docs
| `1.9-1625 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=59d1c5f32e0a45ef0b5c9a91948547a63a660571>`_ Support the "set --kw ... --eval" action
| `1.9-1624 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=179c642caf34f196371fc208fc1b5e5b65f689f4>`_ Fix another case of serving a svc config file after a delete --local on a peer
| `1.9-1623 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=25053e020d0ebfbfbcb3779e174941f6629721c8>`_ Fix test expressions in preuninstall script
| `1.9-1622 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=81bd9476a2bf1d5f3a41d3dcfecea825fd821c18>`_ Automatically reset the monitored and stdby resources restart counter when up
| `1.9-1621 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c2a245367b17dfbe277a0f0ca18e6b73e917ec35>`_ Fix the zfs vdev cache format
| `1.9-1620 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1829d29554c0edb21041df39e024b98e63fa0f11>`_ Stop pull docker images from the status eval codepath
| `1.9-1619 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5e8ac8c53db08d490af38e3920c63b60f3e3a58>`_ Make the fs.docker start method a noop
| `1.9-1618 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a35c16af7f332647064b4d7838483ad40cb9bcb1>`_ Allow safe://<id> references in compliance rules
| `1.9-1617 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=00474eacc105cd23fbedddc0d82575dba4320990>`_ Add safe file update to the collector cli
| `1.9-1616 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3659b2d3e79628991ead86a2b90c5be0c87a1cc3>`_ Fix a stack in the docker login call
| `1.9-1615 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ee479fd9aec21ef0f1b9c08fc8e7b329934b4c62>`_ Handle automatically the registry login as service
| `1.9-1614 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=80dea0b17d466e5b04a76820f4f7c2d27bfa5438>`_ Fix the disk.zfs unprovision on stopped instance case
| `1.9-1613 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=126b9bada928cbb8c7997206661016d1fe3698e4>`_ Fix tar compliance object
| `1.9-1612 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a82c01461caa6624d50c885e308493aa0bd14e9c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1611 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d83ff51e966d10c35230b05cfa99b9fd93417840>`_ Don't try (and fail) to import a zpool that does not exist on unprovision
| `1.9-1610 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=90d2c5938809df49ce0e7c5a1f96b29fa86e225d>`_ Add the "volume_tar" compliance object
| `1.9-1609 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9767fed5fa98647be3620560415999d10c3634f7>`_ Fix tar compliance object
| `1.9-1608 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e021c2a3bf149a342de489abe38a96af1a070e4>`_ Use https to use the rest api if not specified in node.dbopensvc
| `1.9-1607 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=daadcfa8500d1ff6ad4fd7160cd6d70e778e88a4>`_ Fix daemon stop blocking on the collector thread stop
| `1.9-1606 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=907a4bfb91e2bfb30c13f7d44c8f42e096396caf>`_ Fix disk.scsireserv resource ordering on "provision" action
| `1.9-1605 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0d25b88d632e6a68dd48129fbccd542d34c3ce48>`_ Fix the tags default in docs and set a better example
| `1.9-1604 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab008fa79590e2c9425fd603cb99cca4ff904113>`_ Automatically set optional=true for "noaction" resources
| `1.9-1603 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0aaaaad649ed5a8b09785be617a576372ff8ecb7>`_ Make sure the daemon daemon is started before fs.docker provision
| `1.9-1602 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72e3740a9b3218f6fda29728434440ab4f18d457>`_ Report n/a instead of undef for fs.docker status
| `1.9-1601 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63b4440633f6a0355ca0191fcb5651d2868d357d>`_ Give fs.docker resources a mount_point property
| `1.9-1600 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=713b4fa142337e608320f8fffb22ac9b52fbb60f>`_ Remove the docker instances on unprovision, even with shared docker data dir
| `1.9-1599 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=115a76e4d969e2c6f7e41000c6ce18fe4883e75c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1598 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6d82982413cb22e28cf17e65497613d8ab0eaa7c>`_ Send the cluster_id in the push and pushasset payload
| `1.9-1597 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6a7dfe0a93030a59a695bb6fdcfb6e96544a3f8b>`_ Use different intervals for ping and daemon_status in the collector thread
| `1.9-1596 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=65dc23b9139fd3c5693113a3460a41366ffb2f93>`_ Rename tar compliance object. Add immutable flag.
| `1.9-1595 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11183ff52d98379de6ccea106612f92671460381>`_ Replace the addr hash by a labelizing of addr
| `1.9-1594 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34a21ccfafab12519e4f8b80fb88e36d9f6106cf>`_ Add "list" method support in the dns remote backend
| `1.9-1593 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e6955656eaffa69fe9bb392736fb63d4e8d96f37>`_ Fix ansible compliance module
| `1.9-1592 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4547741652d8c57b8cf28817671627d457b14ee3>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1591 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b871525fd869de138d6fb9e0327ab12df8d4269>`_ Add a tar file compliance object
| `1.9-1590 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d95f8df56f0eba75c82c4c75d14914be2293675>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1589 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ca1b1b47507e353ada8303b07832ce1dab5ee0de>`_ Don't skip all scheduler actions on not-provisioned services
| `1.9-1588 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a342449df392dd8bf9d5076c16618d71bdcde487>`_ Update zfs sync template
| `1.9-1587 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2ccb3ee49b79a68762cf885deba0a6712bbb150c>`_ Add 'local' target in zfs sync ressource
| `1.9-1586 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5dd0182bbed6ae50ef0ad7afe8ff7f4231ee2c5>`_ Add the "get_node_config" listener action
| `1.9-1585 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b430739cc486c6cc68b806a9b97849e805a0895>`_ Fix the daemon start codepath when a fs.docker resource is defined
| `1.9-1584 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7472519700391e79f376694335a93394bef30ce2>`_ Fix the pdns remote backend undue case-sensitivity
| `1.9-1583 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=efc71e908637b918273d2da27b5eb84035b2480b>`_ Fix deeper mounts umount on fs.zfs resources on Linux
| `1.9-1582 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3926c54f1afb79eada949e97bb5da4fc6f797041>`_ Support the container.name keyword with docker containers
| `1.9-1581 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6c51a78f51d27ab91b9bdc9c1021448d216522ff>`_ Yet another fix for the cni portmapping runtime config formatter
| `1.9-1580 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c4256c6f875fabaf20e895ac2752b3eb305f1ded>`_ Fix cni portmapping "invalid container port" errors
| `1.9-1579 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0bc03f4b7be8be5bafb8d004b857cdaf3289d169>`_ Add --nolock to svcmgr
| `1.9-1578 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ca9a3bd84a45acaca163d45a6e10447c1cafc0f>`_ Fix a wrong zfs dataset status evaluation case
| `1.9-1577 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f9d7c9147afb63fd7ff5ccc74e40e658aaa60cd>`_ Tweak the resource sort so that zfssnap are done before zfs send/recv
| `1.9-1576 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9464bed4962b6ca4aca21647332d57ce8be3169b>`_ Fix sync.zfssnap resources not synced
| `1.9-1575 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b91fba343d6dc1d1ecc5b3ebf419fb08edd66b7>`_ Fix a stack in the ip.docker dedicated interface codepath
| `1.9-1574 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c059481848466176d1a9e528c98743eaffb05f3b>`_ Allow the expose keyword on all ip resources, not only on ip.cni
| `1.9-1573 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf047f0d159d0d6c3355de402db95728055d5678>`_ Add the task.snooze keyword
| `1.9-1572 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ec2858971d0f88059dc6597fa20050761c2793a>`_ Test the mount point value before using it in the fs provisioner
| `1.9-1571 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9efea7f4897aa678c9aec8a572ea5f508b5c3f57>`_ Catch is_provisioned errors
| `1.9-1570 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=800d71344e46b0c444a232db8d1cef22a420c455>`_ Always account arbitrators votes in the split handler
| `1.9-1569 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f660b113ad90f1d536ac18c335d58b50d93b955f>`_ Fix a variable name error in the quorum race codepath
| `1.9-1568 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f569c190b93eecfd663cb5ce0a196438d876987c>`_ Quorum enhancements
| `1.9-1567 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cca11f58900a8dfcb4f2e6ba8300e4721892fe89>`_ Display the collector speaker node in svcmon
| `1.9-1566 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85034b393a610d5ced121dad596298618f06856e>`_ Start counting generations at 1
| `1.9-1565 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27ab5dcb82104605b9855410c31ebd326e075855>`_ Fix a possible stack in the get_service_config() monitor method
| `1.9-1564 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=93385729fe525f4a7bccaf9a5bec8ce9388d3815>`_ Report errors in the zpool provisioner
| `1.9-1563 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=03fdd1a04e6a2e7f2f3fc6344dc2c23271b8d863>`_ Better error reporting when the fs dev and mnt keywords are not set
| `1.9-1562 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ec1d75d718ab3e6eeafedbbd1128364af8940fd>`_ Fix the colorization of errors in resource logs
| `1.9-1561 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6b23086f57097b7cce3c08490ac7575b510b3f2d>`_ Fortify the fs.directory driver in face of undefined path
| `1.9-1560 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=28ecc3f7553c3bc896ac1b1ac5ac53d83f0b5ee2>`_ Fix a stack in the zfs codepath of the SunOS devtree
| `1.9-1559 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f44a11520e6b7dc690079a4362e9435994e6471b>`_ Send dequeue action intermediate result when an action ran for more than 2s
| `1.9-1558 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30086c3e0ed1786fc1060aa5cd62bae9ebde01d7>`_ Fix ignored collector notifications
| `1.9-1557 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3978f771ffb2b6a83a4b11542b44b94c269f0e46>`_ Add agent version check
| `1.9-1556 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7d6f2eda0d6f3d688cbc3a38c964dc03c0d92d1>`_ Fix a stack on daemon join when no node section is set in the config file
| `1.9-1555 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=61981997f167b570a9f582e789efc55345d08974>`_ Avoid fast looping resource restart when the starter reports success but actually failed
| `1.9-1554 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bdfc3b7ade3bb3df6f156bf3e0d0214866eeb353>`_ Honor the encap frozen flag in the resource restart codepath
| `1.9-1553 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=135ee74518f098853f26f83d9f2b91330104d7ee>`_ Don't log "already started/stopped" as errors
| `1.9-1552 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4ed163891868188427577cc23618c124d983f7b>`_ Fix the reference from safe on python2
| `1.9-1551 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a54653bfd743686d503cc53c5a12d26d4cc02b2>`_ Fix wrong reference to the peer attribute in the provision codepath
| `1.9-1550 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d52e49800179a93c8742c754eb1d83a233641c2>`_ Add the missing docker tag exclusion to the provision action
| `1.9-1549 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ef60cf6ce830212fd59feef46ec9d8805c2b4b15>`_ Flag the clear action as a master-by-default action
| `1.9-1548 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1287612b0e397cde226b98dc0b19e329c8ad64f7>`_ Don't rollback after provision if mono-instance
| `1.9-1547 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=034d06bc3d9b38e07fda17c5c7e53bf2dda5d3c3>`_ Restore docker tag excludes in sub_set_action() calls
| `1.9-1546 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5f37298797dcb73135866aa420d2192c4309688>`_ Handle encap resource restart from the global
| `1.9-1545 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22b7fd839a3a3802bd13effbf3383be7a895f268>`_ Fix encap commands in docker containers initiated by the daemon
| `1.9-1544 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8a866f4c7228a5abe21ee2c91e0247d2d1d25bfb>`_ Better handling of disabled or unset collector in rest calls and safe references
| `1.9-1543 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6dbf4e8c3d3aa5870fdee4927d0ec333d7ea95bf>`_ Allow deploying an encap service in docker containers
| `1.9-1542 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=649cd661ce3dbeebad440c5922cdf6488d98841d>`_ Allow Container class children to define ::name as a lazy property
| `1.9-1541 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=48b3d6a472838f2c4eacf7bc6410b25d451d49f1>`_ Better handling of the fs unprovisionner
| `1.9-1540 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=727b40baf5222b6f08b6329a922e3ac84477ba63>`_ Fix a spurious errlog on Linux bind mount fs resource status eval
| `1.9-1539 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cebdd04c48be4326a87eb26231bc1a329314dd04>`_ Don't transition a failover instance to ready when a peer is transitioning
| `1.9-1538 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfc331bcd8495c885db23aeb18107377f53fc1a6>`_ docker provisionner enhancements
| `1.9-1537 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d08017ab635efecdc3f47466413e70bc2a859794>`_ Better reporting of ini parsing errors on service build
| `1.9-1536 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3d6341af291da233b1c8dd18f71aaa1c0b5ef8ef>`_ Catch all service build errors from the monitor thread
| `1.9-1535 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d760d69be3cedc51820ee35a153eb7931091e286>`_ Fix the populate keyword description
| `1.9-1534 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0912a83f8b01a3e3c2ba7669aa95b1f543a1003f>`_ Fix doubled log entries in the nodemgr and svcmgr logs backlog
| `1.9-1533 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=24377254d5d1ae2bb695b6ec7bd05136470bc6a2>`_ track missing fs.docker template in docs
| `1.9-1532 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b3cac320d6afbd96107e62df86acbc7fddd02181>`_ Add more information in the daemon_send() error logs
| `1.9-1531 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=90165830a3c9ef2ecfcb9f81ac8b4327932f2b68>`_ Python3 compat fix for the the collector cli
| `1.9-1530 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6072bf285a69b7f96e07277f2d7e6b5eac6c47a1>`_ Obfuscate all secrets used as references from services logs
| `1.9-1529 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=715da41511d88225e77e6cd9b40b51328d1c2eca>`_ Use the monitor_schedule to define the status eval freq of resources with a restart
| `1.9-1528 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=10b9333a0918f468a41f798a283c118bee663bb5>`_ Read from the sockets using a 4k buffer instead of byte-by-byte
| `1.9-1527 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e507481bb6aaad9d67dfddfa12d6e85d0f4adf4>`_ Don't execute the toc action when max retries is reached on non-monintored resources
| `1.9-1526 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16fd7e94a5884908c3f1e57ba90f8a852f1bc8c2>`_ Switch the "send %s log to %s" message from info to debug
| `1.9-1525 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ece97df792828ca9251229642657804655fb418c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1524 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9f7c5238bfeb32fbf9be4ec2d86de1fd1c62ad8e>`_ Handle gracefully servers with no swap
| `1.9-1523 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3c5f961905115778dcdf505ad621e36fd008ee47>`_ Fix stack due to local variable referenced before assignment
| `1.9-1522 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=01bbd2b65cc08f4d74d3769246f07ad7505ea7e0>`_ Fix nodemgr daemon join
| `1.9-1521 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9d0738d47a8495e346818e70bdcf5742f37ce6d4>`_ Merge the remote cluster.dns value on nodemgr daemon join
| `1.9-1520 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4dca5050640884dd6dae220547cc8914835fb34e>`_ Eval {dns[0]} as "" if no cluster.dns is set
| `1.9-1519 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fc48b0d626da104fadc9885f76bbb47d8914ffb4>`_ Fix a possible stack in the keyword dereference codepath
| `1.9-1518 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=12f340ac3a9311e521e573719b77b3ef8255a864>`_ Allow resource restart when monitor=false
| `1.9-1517 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b7d2f7d05d5bee838f2b9ddd982e15deda9067d4>`_ Honor the cni.config keyword value in nodemgr network ls
| `1.9-1516 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8c127e8be0a6d5c008d5f3487560f8253ba6b6f1>`_ Fix error with DEFAULT.show_disabled=false
| `1.9-1515 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98e3b0f3601ca79159e53d579d767951650f0d5a>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1514 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5cc8ad91be9e7892b17ce74e485b7dc202969bd9>`_ Explain restart conditions in the restart keyword doc
| `1.9-1513 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=172bbde62bd97a501da7bb6d686a579e9ad544e4>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1512 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bbc83438678a1df51b5cd5ace7a1f4898eba3963>`_ Add MS Windows metrics for scoring
| `1.9-1511 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0e32f99691c86474245a8adfe40cad84890bc98c>`_ Fix the sync#i0 default schedule honoring
| `1.9-1510 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1af7c23add9bbe975c922f33d27c35593ab6af05>`_ Fix the syslog logger on Solaris & python 3.6
| `1.9-1509 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3490ded75270ea09edb3106b87e3296515edfc0d>`_ make bdecode() utility function ignore decoding errors
| `1.9-1508 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c5a29fc49069d417a15d99f4277652f14d7df20f>`_ Disallow --local with "daemon join" and "daemon status" nodemgr actions
| `1.9-1507 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf0bcfa1da88fde36ccdbe2ee1590d566403a154>`_ Don't check snapd snaps in fs_u and fs_i checkers
| `1.9-1506 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a8345049f28fec75f8e4c4e2f99e0b868341cb60>`_ Fix an occasional "1 too many snap" warning on sync.zfssnap
| `1.9-1505 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=09ccc8dbe9c2649965133de6729039ec1e60d146>`_ Fix a potential checkers stack
| `1.9-1504 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=25e2ff6fbb7ff3f37fb915ea916b6559564346fe>`_ Fix the documented syslog level default
| `1.9-1503 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=49164d027ad345916abe56d547a052546676bb7f>`_ Add snooze/unsnooze nodemgr and svcmgr actions
| `1.9-1502 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4d7261ca4d3923e5bbaaf2527bd6c221f86254ee>`_ Fix python3 compat of pushpkg on Solaris
| `1.9-1501 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3ea85bf4bed57a70db3bf6c64faec866f8240867>`_ python3 fixes for the devtree on Solaris
| `1.9-1500 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27aefb0e14672304fee87ace970217ac668ea515>`_ Add adminfile for Solaris package removal
| `1.9-1499 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87dc16dd7ffc6979949d64741e51143a278d9ee6>`_ Fix encap resources not displayed in print status when tags=nostatus
| `1.9-1498 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=40987871251a309ba25b00e3331452c9680a88c0>`_ Fix the encap service getting frozen on config push
| `1.9-1497 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b281cd44f4b00d4cd22da8629a2251ee0117f72>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1496 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=42705c8bec5da9c92b137a091c43ba2816f32db5>`_ Support zfs dataset in legacy mountpoint mode
| `1.9-1495 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=97852a6605226167c8ff3f1aabc1c72c1f0bb122>`_ Fix MS Windows hardware inventory
| `1.9-1494 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=da5868053fefdae039df9fdf87cafddda0126553>`_ Service avail status aggregation tweaks
| `1.9-1493 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=736afc99c8c96f81797c06c753641322c2132b0e>`_ Catch listener response send errors
| `1.9-1492 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=573ec3db67384abaa76dc784a41b25ccce113591>`_ Fix python3 compat of the get_solaris_version() utility function
| `1.9-1491 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=407ce097fba6ff7163bb58ec49b7da5319d80bb8>`_ Improve MS Windows hardware inventory
| `1.9-1490 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1d5ed3b9c02686986acb88a7c627072de17cb00>`_ Fix python3 compat for the ip inventory on Solaris
| `1.9-1489 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2c273832794e0816332817f454f65eaabee5076>`_ Add p5p archive format for Solaris IPS packaging
| `1.9-1488 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11eb0b50df420ad2898970309fc14f4cb03c5034>`_ Silent error messages when Solaris fmri is not installed
| `1.9-1487 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c7ea70bb2319c9b789e2b93ad39b49f338611e74>`_ Ensure Solaris postinstall is executed only once after package install
| `1.9-1486 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=701540481b066f625f94739ea89e974a634d2e36>`_ Update initial fmri firstboot property value
| `1.9-1485 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85c3768816dab276a6918ee30dafe18ce489a52b>`_ Add preremove script to Solaris packages
| `1.9-1484 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5649d7d0593c49d42ba39fc6e450072ce3c85c4>`_ Fix regression in Solaris postinstall
| `1.9-1483 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cde13ad47c94926547618811321e445f31630c22>`_ Suppress the optparse options consumed by nodemgr before routing to collector cli
| `1.9-1482 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=316f9080d75c7a6d18eb1cc7eef5f4b63fc0e64d>`_ Move the zfssnap actions to pre_action()
| `1.9-1481 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d789f0c18c2486972b33ad2fc5be9763de9bc13c>`_ Fix nodemgr call to ensure compat between OS
| `1.9-1480 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=304c315d122f825b4213c30942f4450ce21fb284>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1479 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3bf976db5cc316a48dca66a5d3cf84f00bfb2c6f>`_ Fix memory overflow on sync when the sync pipe endpoints fails
| `1.9-1478 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=079ed387c1850598cf1b513eb8f2aa4cfc60e3b8>`_ Fix nodemgr command not found during postinstall
| `1.9-1477 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1033ed357c100c7accd770b2265f5d3e1ef68ef3>`_ Fix the log line coalescing upon sending to the collector
| `1.9-1476 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7944a06bfdb00d4a95a323da7b7aa06f396a79f4>`_ Remove the svcmgr startstanby from the opensvc-services unit start
| `1.9-1475 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9043c611d1727d9f43e39cdf0eec650c5d558efa>`_ Raise excEncapUnjoignable from encap cmd when ssh exits with 255
| `1.9-1474 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0deabc10d012064a72a230dc50be3e4af4a6b35a>`_ Fix misformatted slave startstandby action
| `1.9-1473 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b12465ee3a4afe5d8809a7f54ff940750c56625>`_ Add a schedule interval test to the test suite
| `1.9-1472 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=45591f871b7a8f9024632eab344d22c7459acf30>`_ Simplify the default schedules, omitting the interval part when possible
| `1.9-1471 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e9a6df8cbc59f4a47b74ac126a2fdb6f5dd2c444>`_ Change the default min_mem_avail from 10% to 2%
| `1.9-1470 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cd264c79ae46854184735a744b68336eb797a167>`_ Add the @10 schedule syntax the test suite
| `1.9-1469 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=59c8ecba3c1e370bfb5652f5511d1bbabb96ae29>`_ Use max_parallel in the scheduler instead of hardcoding a 6-parallelism
| `1.9-1468 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e818ffde951c7f8bbd8086456e490bf8bc3ad9d>`_ Fix the schedule interval converted to sec instead of minutes
| `1.9-1467 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac1a0d64c2dcdf88da10cd83c0af21d2e4ec8eab>`_ Don't log requirement not met as an error
| `1.9-1466 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff8bf3116bafd73c19e1bb0d68ccf257fbb29f6f>`_ Execute remote postsync without collecting logs and async
| `1.9-1465 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=09612e3b9a503a34a0029d676e926bcc4a33bc96>`_ Fix the 23:00-01:00 type schedules
| `1.9-1464 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2e97d5bb6e1bd9530a2068b64f9ec3008df6d9d7>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1463 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c926d4cea200ab78202b01f1b692ea0ef4f7488a>`_ Fix a syntax error in the Linux mem avail computation on el6
| `1.9-1462 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1c022a1c529a5eee769c3c2bd5d0165a95d2534>`_ Add MS Windows devices and mem inventory to pushasset
| `1.9-1461 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9eea0f8866a33154c106634f677e7dc6ab83e53f>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1460 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7372d6fa3bd202ba57039c65e506018c8ee428c8>`_ Fix a stack in the rid selector and encap services
| `1.9-1459 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1ffd9b80b180ed1ca3852aa9cd9bc50bf5ca4f8>`_ Micro-optimization in one rpc caller
| `1.9-1458 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=74ea2b3205cece270d62a94ff84eb590184b658c>`_ Fix stack during mpath checks on Windows 2003
| `1.9-1457 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ccee1fa9c18e95f68d04e39e0b348b61bfb92ad5>`_ Update postinstall
| `1.9-1456 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c5d7ecf738a55dd7e9c4071cbc63489bb0e5749>`_ Update path used for MS Windows service object
| `1.9-1455 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d1ae8b05d035e50eeef5307bdf7c8f608eed37e3>`_ Add nosetests file to MS Windows packaging exclude list
| `1.9-1454 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f0f78ea3f0ae5f5b77b0ca767b7e41addf41f0e5>`_ Remove deprecated MS Windows versioning scheme
| `1.9-1453 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1960095d9892f8b1a26322706bb6b03f18791a97>`_ Update MS Windows package build makefile
| `1.9-1452 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e441fc29162e36f1df22d5fbddb8fadc44ad4cfb>`_ Update known to work tools version
| `1.9-1451 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f0b2e3bb7b170133f5cb16267a8e1db5fd66943a>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1450 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d74b04dac64e4373d017fe70eac2c949a9be1414>`_ Update MS Windows ico file
| `1.9-1449 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f6f2d006185ebb9ef611c6c4dd6a6b39df312504>`_ Update the schedule documentation to reference the interval as duration expression
| `1.9-1448 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3676a6a63ceb56ec36acb377be2526c15b80cffd>`_ Change the scheduler log entry from "dequeue action" to "run"
| `1.9-1447 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4d8ec6df861994ae1e2b2252b355b40052a0e493>`_ Support duration expressions in the interval part of schedule expressions
| `1.9-1446 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6c5dead974a3bb59b146be6cbfd7de38a42a47dc>`_ Make sure the files downloaded from the safe are written with mode 0600
| `1.9-1445 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb42c0cff08be0aaf73c2e8cfd75d632b771f65d>`_ Better handling of the api http errors in nodemgr collector cli
| `1.9-1444 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=14fcc4dc1485bfd68208b815442ea4c352279514>`_ Use Node::conf_get() for all cf-only pushasset entries
| `1.9-1443 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8de9effb9df6aef36e3d8a07f5030dc1981500bd>`_ Install the osvcd daemon as a winservince from the postinstall
| `1.9-1442 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ec4445a91fa169f8a555e4f84c59e6c0c8510ab9>`_ Change the CWD to <pathsvc> in the winservice
| `1.9-1441 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0b42c5914583a6b84439f46f9156ecbcb5608d9f>`_ Don't log a decrypt error for "dequeue_actions" messages from the colletor
| `1.9-1440 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f672bc882da688009a452b52abc593482ca1450>`_ Fix osvcd running as a winservice
| `1.9-1439 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a379874de52b33a9d270f4353e33c61b2669c81c>`_ Fix the double run execution of tasks not exiting
| `1.9-1438 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=108317caee56bbfebf5da4267779dce213b578bc>`_ Fix the cmd files on windows
| `1.9-1437 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=690895c6196d27d736fbeebd7260c811e3c29f78>`_ Rollback debug statements introduced in the postinstall scripts
| `1.9-1436 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=16f3dfff592ab96692924463b12ba1c4101a37bc>`_ Add fs and ip drivers for Windows
| `1.9-1435 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=49af404e45604a8b4d327429ff19b53b1bf7a2d3>`_ Fix windows mpath checker
| `1.9-1434 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa5e2394ddb81c6a3a87cac141b1f5e8afb71482>`_ Fix last boot reporting on Windows
| `1.9-1433 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d60712752ade21d0e27cd9c4d96622f4c1cdd3f4>`_ Windows fixes
| `1.9-1432 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d68ad4045d4a9a1d25ff3a45448b7f4be1c7d202>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1431 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8400c1833d7f841f612e50fd4db52dcd0c05011a>`_ Acquire per-sync-resource locks for sync all --rid <rids>
| `1.9-1430 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=00b6b13d7e44f67b11e422a50cae7a79af52ae7c>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1429 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b827e44e1d5b3615d19e7f2efefb423378443a84>`_ Fix build readme file
| `1.9-1428 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d58bc341242014e31f981fcce36170d092c8ecd4>`_ Embed intent, pid and progress info in LockAcquire and LockTimeout exceptions
| `1.9-1427 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ea71a63af875649ca33d6c23ffe52f84029bf53>`_ Allow lxc containers to report their cpu information
| `1.9-1426 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ea5cd5285f905f665bf740e4b2829f76744838d>`_ Support references to the safe content
| `1.9-1425 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43b4d75352a6b317e26f9586a86a770fdd500b8b>`_ Don't stack in heartbeats when a message is None
| `1.9-1424 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=03bd06fd7f6a7dfb3f1dd4f42b2dfe1708e3c22c>`_ Fortify the hb.disk driver in face of garbage data in the slots
| `1.9-1423 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e67773c5619ace575d71df03984d25ff5968ea10>`_ Add alpine asset os release and vendor detection
| `1.9-1422 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=09d99c89d836e052bbb97ab731f602c458ddd6ee>`_ Fix a nosetest undue error
| `1.9-1421 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0c1068fb6c5f6d4c0993c7637214b79fc266426b>`_ Fix ast parser for python 3.4+
| `1.9-1420 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7af6c866cc389e3e27f52edf07b34018cac07112>`_ Fix uninitialized _dm_h in the linux devtree
| `1.9-1419 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22dd989ef152c77d198045c9016a3a535fe94f2e>`_ Remove a debug statement from the sync checker
| `1.9-1418 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4dbbf7bb2b5a7dd137e7b4236f879766210407ec>`_ Don't alert on incompatible versions until we have the real compat version of peer
| `1.9-1417 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d2275faf97c5b7f826b5243917e22f08da2357cc>`_ Preserve the evaluated reference type when possible
| `1.9-1416 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5dc9b7fe62b46e83e744d57c74247412445e4f5f>`_ Support "--eval" and "--impersonate <node>" with svcmgr "print config" and "get"
| `1.9-1415 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=de4795ce4a415fafac1113cc68707454da1715b8>`_ Support options.format=json in the get_service_config listener action
| `1.9-1414 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f91b602f3216c0f81d9592fd7eaf060f425a88db>`_ Force the generation of a cluster secret right from the postinstall
| `1.9-1413 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc71b72c6b344a616cc2a707993fa852e3205ccf>`_ Fix the container.docker restart action when --rm is set
| `1.9-1412 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d041402950575408d553cbfdcb1bcd18616fd7c>`_ Fix reported gen on peers
| `1.9-1411 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b008282999e6b2e8d78b4af65e29c06e58401499>`_ Fix the generation resync code when the peer gen resets
| `1.9-1410 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=49381927d3a705b56bacbc13e7d2ad01bf8918ef>`_ python3 fix for the listener unix socket codepath
| `1.9-1409 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=99ee53abe99ab391abdb29bd8c8b93306fdd2abf>`_ Fix two stack in the xmlrpc codepaths
| `1.9-1408 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4eb527bc10d97e53257d60189c2d336313c6a289>`_ Support svcmon --node <peer>
| `1.9-1407 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=93acf2d95ccb6f156910cc1779c35d3ce223ac2a>`_ Use the lsnr ux socket for local communications
| `1.9-1406 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=67bc49b2a84a096114d7818ce3fb1df30c226f0a>`_ Make the listener thread listen on a unix domain socket too
| `1.9-1405 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa30c9cfe339bc49cb0d8f0a565045bc85aefa65>`_ Set the executable permission on bin/preuninstall
| `1.9-1404 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e8524a7cd28f13c09a56d8e8febd835e2c87f037>`_ Add the "unprovision" keyword for all resources
| `1.9-1403 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2614bf010d86cf24fe25af513864c7beb1e6bb51>`_ Fix the wrong provisioner picking for fs.docker
| `1.9-1402 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=92782f66a66ff3563f14b4ab514fb89e92d2e977>`_ Switch the disk.docker driver to the fs driver group
| `1.9-1401 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1d26c295333b659ec2fffa118b0a2530fa65755>`_ Fix "thaw node now the cluster is complete" happening more than once
| `1.9-1400 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5a07e18e7b6ecdb76a542e57f5a81d3f7a8c759e>`_ Reduce the container.docker wait for up timeout from 30 to 2 secs
| `1.9-1399 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=933c1d4a356bd9b103f588c68deda9f937fe328f>`_ Cache the comp_get_data() result
| `1.9-1398 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a422455ccf0a9d02e52ec975b74134f1a986ce91>`_ Add the "volume_file" compliance object
| `1.9-1397 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f9e8d63ce34c05f5cb0ee5c15f26ac4b75465938>`_ Don't log safe file diff on check and honor non-verbose in the fix codepath
| `1.9-1396 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=37cc7669b7b7e90fda4bbfbdaeaa6a3e2c161ad4>`_ Fix a stack in the monitor thread during large scale purge
| `1.9-1395 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ed2b6707cebd0011f8961d9ecbf1330ef7025cc>`_ Add the disk.docker resource unprovisioner
| `1.9-1394 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d7dedb2e7830bb36950fa2a5ec7c868ef56bfeaf>`_ Add a disk.docker resource driver
| `1.9-1393 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b9ef3d55b9544962605fac008792f3ada6171c93>`_ Remove the docker run --rm from run_args if not supported by the docker version
| `1.9-1392 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=278ab6d0392a5b23019ce8f5a758e0e0b2b5a0ee>`_ Tweak the events format
| `1.9-1391 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ec154cf080041902dba0d169ff0ef8069ac05ce>`_ Add the "nodemgr events" action
| `1.9-1390 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f094b35a3f42da7cd431e13cc9e26347d3b40b6>`_ Add a event queue and listener action to follow events
| `1.9-1389 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=925da1774d18e05bd592d3f3c8777690fbc57bfd>`_ Fix random decrypt() errors in logs
| `1.9-1388 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b1d2ab704209e4cc2810cd39b23613dc5002dfb>`_ Don't set --dns docker run args if --net=host
| `1.9-1387 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ebbe3c0136eae16a7fedf1d095e24cc1821ed76f>`_ Fix the {clustername} reference
| `1.9-1386 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a6b15f0884a9a0914504d3725e23a2c52f8e552c>`_ Implement indexing and counting of hardcoded references
| `1.9-1385 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1b7b1bb43ccb08260212d910a40263bed7bdfa3>`_ Limit the scaling expension to batchs of 3 slaves max
| `1.9-1384 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=48e830167668f47f7d31bce8dba58eafb5efb33d>`_ Wait for all peers "idle" state before ending the grace period
| `1.9-1383 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae089c195f14120eb51ecea35ecb95d14a44139f>`_ Don't wait for a result from "nodemgr updatepkg --node <peer>"
| `1.9-1382 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3e5d48a43729ac0026174b7f8d2aba2c862ba6c0>`_ Fix a potential stack in the scaler orchestrator
| `1.9-1381 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=34bcb4edf4775a83dbe91325818ed862205b36b0>`_ Udate doc, man and completions
| `1.9-1380 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72c102b4b6a91c655b89e3d4a5e1e3a357fa129c>`_ Fix the disk.veritas driver initialization
| `1.9-1379 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ec52fbda390bd1c27b1f5360a2ad2bc1a59f51d2>`_ nodemgr command enhancements
| `1.9-1378 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2222ca92fe6682e88de3b15285c90cc3b2570f65>`_ Fix the opensvc-services systemd service not being run at reboot/shutdown
| `1.9-1377 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=48d6d92cbff609e612bacb146657331456a71c0f>`_ Add missing bin/init/systemd.opensvc-services.service file
| `1.9-1376 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f2487c8458b49706afbd7fb471bb91e67107bad5>`_ Split the systemd opensvc-agent unit
| `1.9-1375 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba0749d9c240fb3349a35551f4342f30d0715cbd>`_ Fix regression with "svcmgr create" without stdin, config or template set
| `1.9-1374 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a918ce4d1f06626614c25e281be1a2ac95b003d>`_ Fix "svcmgr create --provision" when the config is fed through stdin
| `1.9-1373 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f4d6f10c2e90becf87ccb8149aa363c99475acd>`_ Remove extra "status" case in the debian init script
| `1.9-1372 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3ec4a9a0147ff1f5f1821b6d54f6815889fe0e5f>`_ Scaler response enhancements when a node dies
| `1.9-1371 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c6cec2ab4c4c4e33ffa522646f3876fe41a88f79>`_ Fix concurrent json "print config" when scaling up
| `1.9-1370 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5137b402ba26451874ed5ec4e86729393a4a5639>`_ Fix the flex scale-down removing one too many slave
| `1.9-1369 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=99cd9a4ba4bbf656ea645eecc92a69960d37a833>`_ Remove most of the gratuitous fsync() calls and file writes
| `1.9-1368 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5d1b84eab26be1fdbaf8dbad7944b8563f3c1e8>`_ End the rejoin grace period when all nodes are reachable (or expiration)
| `1.9-1367 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3fd7d5d57ecf39e421c8cb2267d7e6eb06fd1822>`_ scaler enhancements
| `1.9-1366 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62a1da18f31e733214cfb9446c82271fa1c39a1a>`_ svcmon output enhancements
| `1.9-1365 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=685819881624951341f47e3843c2e098bf9cbcd1>`_ Use "svcmgr create" json injection to create scaler slaves from the daemon
| `1.9-1364 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9960372e2ea4466ba441448697d85a4ee6a626b5>`_ Allow json injection through "svcmgr create" stdin
| `1.9-1363 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=735c9f9affb07d886779a18946af61e8624d2608>`_ Fix svcmgr delete --wait hanging for one minute if triggered before svc discovery
| `1.9-1362 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b46f89edab4df8ed8302b41b47b2478fb5a5528>`_ Fix the load avg placement policy
| `1.9-1361 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ceb3db804646eb0b522bdbee7e961d8155618b5>`_ Make sure we freeze new service instance before the daemon can orchestrate
| `1.9-1360 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aa81306a8f59366e9ff9dba631af9306f59d0f89>`_ Avoid scalers going under-target during rescale
| `1.9-1359 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=501a6e66c76f8c1ed9766dff3e725780e8c18fc3>`_ Stop flex instances on overloaded nodes in priority
| `1.9-1358 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dba16b9e025a50ee1df2711008f095ccc2b35dec>`_ Orchestrator enhancements
| `1.9-1357 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=429b6df44e29548f1833c93868eb369086709497>`_ Convert max_parallel to a Node lazy prop
| `1.9-1356 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d5d798451abcc40ae093bd87020053067668f628>`_ Lower the damon_send() socket timeout and fix the timeout evaluation precision
| `1.9-1355 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=66748bf6b72b324aceddf047f6632d482d960aa7>`_ Fix the parallelism limiting in the scheduler thread
| `1.9-1354 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3510290550863ad413342c8b24e4810932e2669b>`_ Add the scalers current number of instances up in the svcmon output
| `1.9-1353 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b58c98950d900872049e839e66d1996a2ed8bf37>`_ Impose a max transitions limit to the monitor thread
| `1.9-1352 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9eeb3f2a089e042fafaeb8444799cd3a4ff5e459>`_ Tweak the log message when posting a remote service action
| `1.9-1351 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c5be1afb4f6e2daee88dc7a0dd29e4980808be58>`_ Scheduler enhancements
| `1.9-1350 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a2783b1e2b3e78226240eb8821eb7ea990f5860>`_ Reinstate the meta_write_slot() fix
| `1.9-1349 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=901175de7fe8ed0c47ea37f4cc51cd41d069462e>`_ Fix the "svcmgr dns update" codepath
| `1.9-1348 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a126171ddcc86da5eb39754b6ec940b8c9766a67>`_ Drop --name from a container.docker resource run_args
| `1.9-1347 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ffd1afebcadce965e16539339018db19e35b5724>`_ Honor --debug in "svcmgr logs" action
| `1.9-1346 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6cb97e9e8f4e305948fe9e0f56ef58390b26fe40>`_ Add the node.min_avail_mem and node.min_avail_swap node keywords
| `1.9-1345 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e53652a16c16b377e5c09bc44ad854a14b0514e>`_ Show the global expect in svcmon if no transition in progress
| `1.9-1344 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dcabb1c86b67771c86a9a524d6fbe8eeab9ff984>`_ Wake up the monitor thread after nodemgr freeze/thaw --local
| `1.9-1343 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f1c0267f0a6439b355d3104eb6d6ebed36d3f0e>`_ Fix undue "misformatted encrypted message" log upon empty message
| `1.9-1342 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=090d010763280609005049e8a544eee5af1ab62d>`_ Switch get_message() to produce unencoded data
| `1.9-1341 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af033608124a43b211ce25f187bee93f987e99ae>`_ Add a Rlock protection on relay hash
| `1.9-1340 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ce55c2319ded0a844613390842ccd794bd43e8d>`_ comm module enhancements
| `1.9-1339 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1f25c24cb5b8583d6fc18ba2897f725c88f2c2f>`_ Fix disk hb oscillations
| `1.9-1338 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b69bc5eaf585dcf2c9f50293fc5ce73b4dd8a917>`_ Fix relay hb oscillations
| `1.9-1337 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8319a9c2e834104418cb11f44cd6bace575fe8ac>`_ Fix the Resource::unset_lazy() prototype
| `1.9-1336 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea040f8cc06383556ae87ca904da91e8591509a5>`_ Fix the lower-casing of the references
| `1.9-1335 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0d0e8b005dce586c3c2a86ead859894bac17fb59>`_ Fix "svcmgr print conf"
| `1.9-1334 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30eb6492e5feb4e7e896a5e795b939f461ae2ae3>`_ Support uppercase intra-service references
| `1.9-1333 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=507572ef09031a7f594f93f656c944ccfc5abe87>`_ Return the string as-is from the size converter if it ends with "%"
| `1.9-1332 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=927557c0d12269232ede057c790a45311150b618>`_ Support "svcmgr delete --rid <rid>" where rid is a no longer supported resource
| `1.9-1331 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=67193cf7aa62a6da25556f9caffb6d130abcc09e>`_ Don't stack formatting fs label when a unresolved reference causes a None device
| `1.9-1330 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d6f076395baafeca2b1f90a0a28188745614fdd1>`_ Support action abreviations when unambiguous
| `1.9-1329 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=209c1a628c69bcd280e85957721915a21cfc6ca5>`_ Add "json" as a default format for collector cli commands
| `1.9-1328 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=58d3cf58c3aa7aacb0523a03a38af619efad92d1>`_ Add a unset_lazy method to Svc and Resource classes
| `1.9-1327 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=325d9eca6181a0d4494c852771f6ee61a5db7819>`_ Add the scale target to the svcmon output
| `1.9-1326 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f576f7de564d74655d6b5b3e5edbe7a0551a9b6>`_ Add the "score" placement policy
| `1.9-1325 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c1d2334270ef174480a047324cc06e668c94980c>`_ Fix the reverse deprecated keywords handling
| `1.9-1324 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5a5d0275d6d388a80355b25634e99cb94c6aff03>`_ Refresh the services object cache on node.conf change
| `1.9-1323 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4a04dcf98d32d479ff018e1ea58ecf1cb8bdb7cb>`_ Enhancements for "nodemgr logs" and "svcmgr logs"
| `1.9-1322 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=11946a1e4b6c3cf7b0c6ddb3248084165a6243c8>`_ Use the node score as weight in the SRV records
| `1.9-1321 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c425552306e03bb0f80d8f471af6cb0eb0871e27>`_ Round up the sizes less than 5% under their next order of magnitude
| `1.9-1320 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba9807a0a96115dbed66d10249bc25e7a125599c>`_ Use the system's docker daemon if no data dir is set nor docker_daemon_private
| `1.9-1319 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1c9df2ad08d7c97ef98ee05fd3c76e56cd381546>`_ Fix the scoring algo for the score to stay between 0-100
| `1.9-1318 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a466ca89529471ddb6cf2ec31dd0f7b05c09ce0b>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1317 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5586734247b0adcb3f88e54f9578f186fa9f2fb7>`_ Add a node scoring algorithm
| `1.9-1316 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c7cc5e4ecf9d6237778e78e971890e0a2f8ea521>`_ Implement switch to specify which python version nosetests should run on
| `1.9-1315 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4a97ad9e58db310476c1a2b7712648471b07d795>`_ python 2.6 compat fixes for the json_delta module
| `1.9-1314 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be70d477b3fce16dd06651ef5ebb86907bbf7759>`_ Add mem stats to SunOS
| `1.9-1313 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2d379c9701788a7db210fff598bfbff281327145>`_ Add the mem and swap info to the node dataset on Linux
| `1.9-1312 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=92ec953c21de111ae4e3855564bc585c3fed9cb1>`_ Add a compact mode to print_size()
| `1.9-1311 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=aab4ed8a023d9dfb2ddbdff0a0cab0ae1c180707>`_ Fix postinstall stack
| `1.9-1310 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ec7de3e2ef108c9b586137b17f95ca512ff699ee>`_ Fix postinstall actions for crontab
| `1.9-1309 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f220c5337d8cb7c42af48fb5bfbc6ebd1ba251f>`_ Fix the StringIO import errors in the nosetests3 runs
| `1.9-1308 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05f0e8a3e197fe1445b917e3bc0d797c87a7ffbf>`_ Honor the "insecure" from config in nodemgr collector cli
| `1.9-1307 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5b4f4fc238add37589b0101393b2e6b58251aa0b>`_ Fix all libs import errors reported by nose with python3
| `1.9-1306 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=680f7c1be07265de19e36116591d8370e38b7edb>`_ Fix the ready-state period expiration precision
| `1.9-1305 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f0e782dc9f3c1294a06a75d0249a6a5316000164>`_ Buffer non-immediate monitor wake-ups for 0.5 seconds
| `1.9-1304 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7794b643e7a563ed2edfadf93131a1846da96598>`_ Fix ip.cni resources restart
| `1.9-1303 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=384c68d7a01c48a0133ea97d6e2331321d03ac13>`_ python3 compat fixes for the dns daemon thread
| `1.9-1302 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b428346da1172966156d4e846f1483cd0e0eeda>`_ Don't set --dns and --dns-search in docker run when --net=container: is set
| `1.9-1301 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0d102a5c4315da4934c2596700b89129a8a61937>`_ Don't rm private docker instances on unprovision
| `1.9-1300 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2019cdfddc4c0330632435aa2f3b3070e87db964>`_ Implement a delta-replication log for node-to-node datasets exchanges
| `1.9-1299 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3b05d4abacdcf8e148b42c92e3319a29bce063d2>`_ Fix a potential key error in the svcmon and collector thread codepaths
| `1.9-1298 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba7f6350118653eda990d8bb7001375905b33622>`_ python3 compat fix for ip.cni
| `1.9-1297 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea9636c5d4dce71fd30e208e67b44e844e474d20>`_ Optimize fs resource status on Linux
| `1.9-1296 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1b151f4aa75b5c3dcb9455587827f986ecaf8989>`_ Don't set -i 15 -c 4 options on symrdf query
| `1.9-1295 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e0b24e6c092efa390cd132e53016156be634caa>`_ python3 compat fix for the wait_for_devs_ready() utility function
| `1.9-1294 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a623307881288571096b4e57b68923207a679e7b>`_ Use the realpath of the pv parsed from Linux pvs command
| `1.9-1293 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=38c1809f567348f200cbe6002a4970b26d1a2fab>`_ One more python3 compat fix to sync.symsrdf
| `1.9-1292 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b7ffe555dc305cda1c5fb590e6e6b15edf9c2a64>`_ Fix python 3 compat of the sync.symrdf driver
| `1.9-1291 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d6e51752ead08c55c390aca837558a0b66cd719b>`_ Reinstate the prstatus svcmgr action
| `1.9-1290 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=512a5539d722b806c82e146657fc0c2b1b18d2b8>`_ Add the "init" node mon state
| `1.9-1289 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8eaaa8c0d537f16f9927e320d6996d3303c8fb24>`_ Fix more case of svcmon not behaving when the cluster data is incomplete
| `1.9-1288 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff9008f5e67f80cc287ad23528868452e9bb4da6>`_ Enhancements to the dns thread management
| `1.9-1287 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=848450efb9038d65a365c65c5696bd108bec2663>`_ Fix the scaler avail status aggregation
| `1.9-1286 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6237939fce630d1be2e6cd3169bdbb611f7b9951>`_ Don't add sync#i0 in more cases
| `1.9-1285 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=00a460b96a474a3129cbd576a5288817d382f470>`_ Catch i/o errors on disk tx heartbeat fsync() and dedup this error log
| `1.9-1284 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c57406ceb6dbcb27f7222ae8edfe9a2346b954c0>`_ Don't use ip addresses in the SRV record target field
| `1.9-1283 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5f1d67ad9867b8351c55c5e9bd334a72fc68264b>`_ Fix the ip.cni portmappings
| `1.9-1282 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=95b74dba2e7c11f0ebcafc30c6ec00b1807b7e38>`_ Support the expose keyword in all ip resources and use it to map SRV records
| `1.9-1281 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=29530348ed745b4b7cd31390282d3278f991f833>`_ Add the "svc" subdomain between <app> and <clustername>
| `1.9-1280 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6ab9dd3ca768a3a7b81226996932aba83de0dd54>`_ Embed the lowercase app code in the dns names
| `1.9-1279 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=09cd71ef5c44f47e05a877a9707f920364945962>`_ Fix a potential stack in svcmon renderer with corrupt daemon data
| `1.9-1278 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8c633880979040ec353f0d78c3f69d983272fb27>`_ Fix svcmon factorization of not-scaler slaves
| `1.9-1277 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=75386b3903a823c3a8896f1a2923d1b7bbd69c0a>`_ Add a powerdns remote backend thread to osvcd
| `1.9-1276 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d22594e7735da18889f3c11ca0c51e8934471e4f>`_ Fix a stack generated by coloured json outputs
| `1.9-1275 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ff1d402719fddf8c7a9ae2223a025f9e22fde68>`_ Fix another stack in ref_cache purge when it does not exist
| `1.9-1274 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f486d51b66f151545a3b28a17208ad7d877820b1>`_ Add multiple location for systemd unit file
| `1.9-1273 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e0da3a129ef17af27d325fa3ea33a666b11e3e7e>`_ Fix a stack in ref_cache purge when it does not exist
| `1.9-1272 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ee36ee1cfb337db5bc3510841f0d7ee8d07f5684>`_ Don't log "send service collector container info" when the service has no encap
| `1.9-1271 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87bf7c6e1b94c025a586c8f55451380386336a98>`_ Allow orchestrate=ha on 1-node clusters
| `1.9-1270 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=68eb7a4096f590b4db369ae88759ad779c8a99e1>`_ Fix the scaler unduly setting min/max nodes to 0 on the last slave
| `1.9-1269 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=95444f403f6ba4825c29150e1b668be394a80d7f>`_ Fix svc.scaler.slaves value evaluation
| `1.9-1268 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=429c23fca0cabc74c3d2a93283af3c5acab5c2b5>`_ Simplify the scaler code and fix the aggregated status
| `1.9-1267 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf6f693dfe675aea5931740858b6b196173d34f7>`_ Purge the keyword ref_cache and all lazy attributes on unset/set
| `1.9-1266 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b47bda8ca8c25362f70804536e0ae35511130ce>`_ Intrepret the scale value as the number of target instances
| `1.9-1265 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2d5bc3162a280f12cc28badeab7b62ddb85988fe>`_ Use a LooseVersion sort in svcmon instead of alphanum sort
| `1.9-1264 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=49516ff5e728d035efcec7679ae69f3c1be32a65>`_ Skip remote "set --kw node-=<local node>" on delete originating from osvcd
| `1.9-1263 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a55181bc94b92be6a264885ddb0d8def22fbeddd>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1262 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5ee2ebdc14214fea6207b576c126fdd09536beb5>`_ Add a docker instance rm in the container.docker unprovision codepath
| `1.9-1261 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f39b2fb10ebbd4cca417dc5e1ba7c80dc1ba8570>`_ Remove --rm option due to -d flag compat issue with old docker versions
| `1.9-1260 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=216b683334e423d501f4b0fe207ca6420a02bba0>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1259 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62431faf3abfac370358934c5ed2bb25c63d7ec1>`_ Align provisioned ip to docker0 subnet
| `1.9-1258 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=671f32fc333982cefbdf05d1a6fd539fa8210f3e>`_ Implement a wait_service_config_consensus() method
| `1.9-1257 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bb5b52b5cc92cd6ba75d87b3d2494ee6eb18b582>`_ Allow async stop on a service with instances in warn availstatus
| `1.9-1256 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e97f96d25ae06a6bf202e79e312f380632857e01>`_ Try to stop docker on stop/unprov even if we the container was already stopped
| `1.9-1255 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4fcf14d4c85ffc475be00231f887f0801ae60d7f>`_ Fix a stack in comp objects when parsing an empty variable
| `1.9-1254 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7492d9e4034d1db434b4ab6a9d2184b1748525ac>`_ Parallelize scaler slaves actions during a scale transition
| `1.9-1253 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3efd3325459eac8ac168bb8d1052efa4cd0bc5c7>`_ Don't set docker run --cgroup-parent option when using the system's dockerd
| `1.9-1252 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f6eab3d8f59c987dc2c40cfd0f0c7be66dc7dd3>`_ Implement status_info for ip.cni
| `1.9-1251 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8af75c68734fc16feae7958c714fdb120e5b0d11>`_ Implement a wait_global_expect_unset() monitor thread method
| `1.9-1250 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be752cc36fae6b2bb8861174f42c70633c1c1572>`_ Fix a stack in the listener thread service action method
| `1.9-1249 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c87f16c95fa1046285602e805a6ecc3762d9cfee>`_ Fix a case of the rejoin grace period never expiring
| `1.9-1248 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ddea3f22890be4f5952533d68726b63958376e2d>`_ Set the remote svc config mtime on the fetched copy
| `1.9-1247 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c40242c4514506de81ccf09a136981a8080b455a>`_ Better handling of temporary files purge in tmp/
| `1.9-1246 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=17bb3429bfba93b9be3781bab08d5a00c74c79d9>`_ Add the shift placement policy
| `1.9-1245 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=502aaabeea5d50499a9bb793cf83df5d2924bde3>`_ Display "scaler" in the svcmon output instead of <topology>/<orchestrate>
| `1.9-1244 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2508d0aef49b658b25a6ddbc57f27e4f2aa1aa61>`_ Interpret scale=0 as a scaler without slaves yet
| `1.9-1243 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=89d1182536435b9c08c647cc0cb610e1191e1c53>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1242 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4124e498be3f6a738504198db013372e352052a3>`_ Change the scale action from manual to auto orchestration
| `1.9-1241 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2dd828a0f9dabae8ede899975761fb330c645dfc>`_ Fix text output in make_rst_examples
| `1.9-1240 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c70d3936b3405b6616979438f85ae093ebbd2a91>`_ Add missing newlines
| `1.9-1239 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8e4a12ce98acac235d5d5681d214febb970c5489>`_ Add the missing checkSync checker module
| `1.9-1238 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7ac8fafad082236b5dd8b85c8c72380589e7816>`_ Fix "nodemgr push disks" not pushing data when format is not specified
| `1.9-1237 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8eab8eff202d68f70dee58c5a57096aec5bacb47>`_ Fix the children computation in the svcmon codepath
| `1.9-1236 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d17c59fc675d1bfe811d5470c0c638c443406b92>`_ Plug fd leaks in the lock module error paths
| `1.9-1235 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0f889a179d1bc05f677cdf46390c81a874e31976>`_ Consolidate ACTION_TGT_STATE and ACTION_PROGRESS in a single structure
| `1.9-1234 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d5f7b5e837d26c875247ba184b11868fc8715eb>`_ Add the "scale" service configuration keyword and "scale" action
| `1.9-1233 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7841b58b20463bef9d488928ad98f1f09d3ce133>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1232 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5719a23d00ce33110b963c6db7df1bf8cedde23>`_ Relocate systemd unit file to /usr/lib/systemd/system
| `1.9-1231 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5dd4a0a857fd2abc3ad135b97eb64e145fc1d8ed>`_ Avoid repeating heartbeat errors
| `1.9-1230 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ec1a325d3824e7771ec3e4d316b32c93b0e9bcfe>`_ Use nonblocking socket in the listener handler too
| `1.9-1229 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f4284ca8ebda5f2d5ce485810f047613baff981f>`_ Add the cluster.id node keyword to the node dict
| `1.9-1228 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=805c77cd5edd0bbc92f596e0de344ea19a45dfd3>`_ Change the "thread queue length" message to debug level
| `1.9-1227 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d2edbad023dcca80fdda520ffb134e26f03bfe38>`_ Bump up the max hb handler threads to 4nb_nodes
| `1.9-1226 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=13b179d0a9c2b56253b1a5cd0279be888cc4cfdf>`_ Fix a stack on "nodemgr schedule reboot status" when armed by no schedule set
| `1.9-1225 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b9481cfdf20cd0b10e6671edc48aa06015fc70f4>`_ Fix a unset variable error in ed8641733172f494fe8d7a99690907f5ba7709d7
| `1.9-1224 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=726a52b737dd0719699e51ea06fc90637b3cb37d>`_ Fix a type error in ed8641733172f494fe8d7a99690907f5ba7709d7
| `1.9-1223 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2ee7d240e42c2356c68abd3e5dcb5392c29d6dc0>`_ Fix a typo in ed8641733172f494fe8d7a99690907f5ba7709d7
| `1.9-1222 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8eac5f192f8a60e85609bcea834f33a7fdd67d58>`_ disk.md with scsi pr provisioning enhancement
| `1.9-1221 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=386ef1500d8951ba2ec9251afe0e30008ceea2d5>`_ Merge the scsi pr co-resource shared and standby keywords
| `1.9-1220 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3d9cf144095cb796cf9f15234fe0f1e022495daa>`_ Fix wrong exposed dev reported by inactive and unprovisioned disk.md resources
| `1.9-1219 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ed8641733172f494fe8d7a99690907f5ba7709d7>`_ Discard paths from disk.md sub_devs parsed from mdadm -E --scan -v
| `1.9-1218 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b444c8280d3f2ed7417885796c9cde791a997b83>`_ Add a select and non-blocking socket handling to recv_message()
| `1.9-1217 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bb8dc5065224d99f2d7b9276d5f81fdd30eab5d>`_ Better handling of service with docker resources while docker is not installed
| `1.9-1216 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e88915426c61ca47d9674449c8c66d44e089e769>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1215 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=83ecf6c54417d571fb146bd47ba74be054e1bac5>`_ Ignore the cluster "daemon status" data key in svcmon threads renderer
| `1.9-1214 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a85dfbd943f145069eda28dac9b4c690ed3ba3f6>`_ Add manpages references to systemd unit file
| `1.9-1213 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7844e2cf4626df921ebd568aa41d4489f3c1e1d>`_ Add systemd dependency on multi-user.target
| `1.9-1212 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dd7ea67ce260555334deb5ad3269f78664bfbcc5>`_ Add a cluster.id node property
| `1.9-1211 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8647d1edcc10686c5bdb414547dab27ba67a50a1>`_ Display the orchestrate value in svcmon
| `1.9-1210 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=90d56e55ea7b53e2b919842304bc59efd1088d30>`_ Fix a stack in the svcmon codepath when a disk hb has not initialized dev
| `1.9-1209 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=62f08bdc3d1c49fae5a12178cf816b736e76f112>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1208 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6265e9000033e08b80a3bcca74ef0ee672e12f5c>`_ Merge the joined node env on "nodemgr daemon join"
| `1.9-1207 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2267a95f15dd4937d7cb660414444f30cccbb0f3>`_ Fix error message if pushpkg is not supported
| `1.9-1206 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8afb770f0a4697336fa641717bf72379afef5f18>`_ Fix hb.disk reconfiguration on device change
| `1.9-1205 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=19e268b33dc80a2dee699666d40344428b2da88e>`_ Don't refuse to build a service with incompatible svc_env/node_env
| `1.9-1204 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f0106968d5285d38dcf8f9f66cc6944c18f100e1>`_ Tweak flex min/max cpu default thresholds
| `1.9-1203 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab5fadf1a9ae17ebe49400feb2341dc7d12ea9cf>`_ Tweak the fs ordering algorithm
| `1.9-1202 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b4e3e0e862066f47077e7aa845edfe3d52ceeb7>`_ Add a "daemon running?" test before trying to send a stop message
| `1.9-1201 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb2d8ddf03805ca70184e104c9d456553ec9791f>`_ Fix and indent/whitespace mismatch in osvcd monitor thread
| `1.9-1200 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b6f4447cc6e9e86d047fd48046c880187af77466>`_ Don't merge remote frozen instance state if the global expect is "thawed"
| `1.9-1199 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=73f7bfa51f00c24fc137e4e8fd05f1cf62bd600a>`_ Add log entry to postinstall function restart_daemon()
| `1.9-1198 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a8673d137a5f3665c81df2f19e0be905d992085>`_ Fix OPENSVC_AGENT_UPGRADE assignment syntax
| `1.9-1197 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98b2aa6b26e7e4ee07231eec40dc8f43185839f4>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1196 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0213ac8e097cadb11da9483fcfbf73c6a9c8d272>`_ Better handling of the cluster upgrades
| `1.9-1195 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=94fd0401eec4fabb1469081c794e6791cad7e812>`_ Add OPENSVC_AGENT_UPGRADE environment variable
| `1.9-1194 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6a6c43e01f2a94e71518e32847f5d3bfcbe9fc04>`_ Don't report a end time for log lines sent to the collector
| `1.9-1193 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=60676ede03aea37238f559d09442e11aea6c2801>`_ Aggregate the logs before sending to the collector
| `1.9-1192 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=26c702e0c7b978f80e7ee1e33133b3b9645f19a9>`_ Fix a stack in the monitor thread in better_peers_ready()
| `1.9-1191 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f475742c6f92dd5b67ba298ee18e39cb4ba8031>`_ Fix wrong variable name in the monitor thread code
| `1.9-1190 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2bf00a1c7a6c6f36c9496a439fc6de547e9e03b1>`_ Fix a "delete --unprovision" issue with nodes={clusternodes}
| `1.9-1189 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=10279c2104ee315ee6c0d67245a893214a51d398>`_ Fix the "action" column content in the logs sent to the collector
| `1.9-1188 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e009514ac8155440c4e83c8f45a95ce6e6e06feb>`_ Don't preemptively store call() output in mem when cache=False
| `1.9-1187 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ad6af5e3d0aee8f337b675cb56104ac43183bc63>`_ Fix giveback not starting the instance on the leader of failover services
| `1.9-1186 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3bff7568b592a9d5cb338d56c7bf0a0a612f43f8>`_ Fix invalid return values in the listener router handlers
| `1.9-1185 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=91a99895a1d4cc4fa3e030e9e66b7eb8c3277c37>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1184 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6773a167137ecd9cac310b93e5433b1337e7ab93>`_ Misc encap fixes
| `1.9-1183 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2586558d8cb430254ac3ce62c9b44315d95d2003>`_ Fix flex aggregate availstatus "unknown" when max_nodes is not set
| `1.9-1182 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a300f79d78e86eb4db58e1c431b48b653cc280fb>`_ Fix a stack when the svcmgr ls filter references an unknown keyword
| `1.9-1181 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05a0e8885c521af503df4d85998cdf45a4367116>`_ Allow to change the udp port used for Wake-On-LAN
| `1.9-1180 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dcf0a047831fe32da356cdfa7dbf4be2fa7ffd1b>`_ Don't log a stack when failing to acquire the svclock for status eval
| `1.9-1179 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7ac7aff0b82a33b9a67c2824f82d57836e7eaac8>`_ Add a sync checker reporting each sync resource last "bytes" and "speed"
| `1.9-1178 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4aaef7e3f21b419efc21d5178e15ec20decb6b2c>`_ Fix the rsync parser
| `1.9-1177 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c712f00f6c2386a2c4ec9c24f5475bfb90541cea>`_ Fix a default in the relay and disk hb rx
| `1.9-1176 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a78d419bc8a0206d71780b4185d2c3cc2dce297d>`_ Add the "nodemgr unfreeze" action translation to "nodemgr thaw"
| `1.9-1175 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ca81ac892ea55c123365ef11c2ed4d03dbd1f7e4>`_ Don't try to start an already started instance in the giveback last stage
| `1.9-1174 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=639d5f8c2917cc5085548eb1e41366c50dc9bdf1>`_ Giveback action fixes
| `1.9-1173 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6c31a8e2754a462ef46072b58ba76ad3acd1bd4e>`_ Compute the speed and transfered bytes of each async sync resource
| `1.9-1172 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb9e45fefc091545b132b9ce018437523704c3ab>`_ Fix a printed error in the app resource resinfo codepath
| `1.9-1171 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f5ed233bbb455abc0fbd3973cc13dbe25e49b6a0>`_ print_size() converter enhancement
| `1.9-1170 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3db7017e1954c7d33b5f7c52818ca039b3e72d1d>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1169 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3d52d637f5c42ec13de9981f381eaf28d404d688>`_ Check the instance avail status instead of overall before allowed sync
| `1.9-1168 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=168abf669cbb885c1df9418f0b9d4aedccca1257>`_ Fix typo issue in nosetests
| `1.9-1167 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2ebdc630d23c758f0bba6f36bfd55bb702af5a6f>`_ Force python3 pyc files renewal during postinstall
| `1.9-1166 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7ccb9ece2e50b430919f92ccb43718fad87ae02>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1165 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=fad4878a5fcf57553dc41f5cfa612970696989e0>`_ Consolidate Svc::resourcesets and Svc::resourcesets_by_type
| `1.9-1164 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bff1aa669cd38adaf3c6e820254f11bd2f8cba7>`_ Fix the lock progress. Missing truncate call.
| `1.9-1163 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ef28d7529fca9a0903e9654875b1735b2337c2f8>`_ Add nose dependency on python-requests
| `1.9-1162 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc3bf9067afbba6f4c2ee176dfb7556ddd2b92da>`_ Add nose coverage plugin prerequisite
| `1.9-1161 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86d8479b2e4a7bf82499d445c4c3a68478cd0e28>`_ Add node html output plugin prerequisite
| `1.9-1160 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dea84b413affef85a7b91eaa302aca8904cfd936>`_ Force pyc files renewal during postinstall
| `1.9-1159 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4f8f2a3f62c3a865ab774801c43d9958db31fb78>`_ Add the R resource flag in print status
| `1.9-1158 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=daea8c6c07f414a221d0b54da89ddb09cee2c98e>`_ Fix python3 compat of the lock data write
| `1.9-1157 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c87ff0e5a2a5c4ca486c47b137c8d2e9de436f4f>`_ Add missing function docstrings in rcUtilities
| `1.9-1156 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=04d08d3065dba029f6b590dde74c9e1cbc63b3bb>`_ pylint fixes for the lock module
| `1.9-1155 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7952d52be9b88d3df9451f0957fc17a1ed525341>`_ One more delete tweak
| `1.9-1154 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dcc80301bffd2838007327514546df40d2ed5ee7>`_ More delete tweaks
| `1.9-1153 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ad93d495b51997aa9c2c6e5764885bd573bdbc4a>`_ Add a protection against popping too many handlers from the hb rx threads
| `1.9-1152 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1bde8f235f7a82e497cfcc23026027d955114283>`_ Refresh the status.json after merging the provisioned states
| `1.9-1151 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=785aba602c37505992d746e75e9e0a1c4a28dc28>`_ Fix placement_ranks_nodes_order() for drp nodes
| `1.9-1150 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7add5eaad41fad746aafd42e304d5909ff9b0eb>`_ Add the promote_rw to disk, fs and container resources
| `1.9-1149 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=78f7e64084cf78b315f22d35a9a0a53559f1cef4>`_ Fix provision with scsireserv=true returning 1 before the rollback end
| `1.9-1148 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5a8bf405c2b8b2807231cdb205dd19470e1af4a6>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1147 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6985b7b354bb2d4c738644fa95c9e13ffdbd29a8>`_ Add "set provisioned" and "unset provisioned" svcmgr actions
| `1.9-1146 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=73c25bb3605e0c3f8576dfd2e6547497a56a5730>`_ Fix copy/paste issue on blocking trigger logging message
| `1.9-1145 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6811f51709dac88c46ce0a41178442a8d3d7de30>`_ Support @nodes and @drpnodes keyword scoping in node.conf
| `1.9-1144 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=17a413007d33490c21725b37468b0bf73c528547>`_ Better handling of unresolved reference in fs mnt keyword
| `1.9-1143 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d2e1992fb2a14a64b9e63f1b0a01d1afb8a3f776>`_ Add the cluster.drpnodes node config keyword and the {clusterdrpnodes} ref
| `1.9-1142 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7f03f319eca6d43f77815a57dec5bcbdbcf39593>`_ Active log compression with python3
| `1.9-1141 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=acc4ebff3b9d1ce6cb7ed37f820f5c97fc0633c5>`_ Remove more lingering log file on service instance delete
| `1.9-1140 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b43db41830eb7a00663c80e5570539bab5625080>`_ Support scoping the node.conf cluster.name and cluster.secret keywords
| `1.9-1139 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d5fd54b167ee0f0a1af82ba09188b7aa9e785eab>`_ sync.zfs enhancements
| `1.9-1138 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8796c4d57fc070dcdecedd91ad7d25f40fcc995d>`_ Create missing build infra dirs in bin/pkg/make_rpm
| `1.9-1137 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eb600617916481b3659b3c1fa6616f5fac93de46>`_ Fix a monitor thread stack in ha-flex service delete codepath
| `1.9-1136 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfab62c52d782eb380dad47ab8f3e0e7c5645d04>`_ Fix the slot allocation compat with latest python
| `1.9-1135 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e6320c192c52c3eccc1af78ad38ebef41b108470>`_ Don't exit service-with-docker-resources status eval when docker is not installed
| `1.9-1134 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=be87fc2f5df8f012eb198a842e7de3eb0e23aea1>`_ Move the service cgroups under opensvc/
| `1.9-1133 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=eb2f928e6d5bd87aa4e948c5c748f45ef43d0ad5>`_ Fix the sync.zfs state file drp copy to peer nodes
| `1.9-1132 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e159c70b2b733ef7b4b4d5dfe22d0b56e3cd899>`_ Fix encap constraints always displayed as violation in print status
| `1.9-1131 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=31a5216d48057ba4b6593072666824dbd7640562>`_ Allow scoping of the "constraints" keyword
| `1.9-1130 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=deeed07fdc628c6e44bd775ef09646ea39c7ebe7>`_ Don't raise placement alerts when the non-frozen node list len is < 2
| `1.9-1129 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=473113115ab0dd7a11f72abc7da779d9492dc7a8>`_ Fix a monitor thread stack on rejoin when a peer svc instance is frozen
| `1.9-1128 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7823318a11b2c49c0f453defaf337d03fc938410>`_ Don't validate local action trusting the mon state
| `1.9-1127 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=22bd9eba021f64e252ae6bf2f610c55299d0e64b>`_ Also exclude the app resources from the sync.symsrdfs master status eval
| `1.9-1126 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c10f561466a38fc80ef9d8faddba943f9be78b73>`_ Relax the sync.symsrdfs presync export condition
| `1.9-1125 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=547554d95ae1854c2ab9ebf16812214c672f95df>`_ Remove the "svcmgr -s <svcname> create --interactive" action
| `1.9-1124 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=75fe9dc8c25107a5d541d153574e607015d2dd22>`_ Fix the multicast rx heartbeat not going stale
| `1.9-1123 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5e45bdfee412c38b834d65b8cadae8a54cdc02dd>`_ Fix a stack in the ip collector provisioner when ipdev has no ip configured
| `1.9-1122 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b6d57fadb1b1c853bbab748263c48e5b906f708>`_ Placement aggregation enhancement
| `1.9-1121 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=689a59d85b5b733d8a2ba2c17ad41b49290a4b5f>`_ Add the Svc class part of the async giveback
| `1.9-1120 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=79a4be1b522e60156ff3a81d3d6b06d09e2e4462>`_ Enhance the shared and provision keywords description
| `1.9-1119 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b87ef10a6ee740d60a50b94a8cd809d9805c4bd9>`_ Implement async giveback
| `1.9-1118 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c67a516a0654e1c0b6a3a35a89cd7637006f6fa4>`_ Fix the resourceset action() types and xtypes filters
| `1.9-1117 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e9baf64911d48ef204ccdb288f3b68f471ee4849>`_ Fix delete loop when deleting a service with nodes={clusternodes}
| `1.9-1116 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1255a57e565f7426bc5856472772fd5404e5d688>`_ Clear the devtree cache at the end of provision/unprovision of disk provisioners
| `1.9-1115 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b9e3f729de1358493812fab868f14a8d5906f61>`_ Accept the "unfreeze" action as a "thaw" synonym
| `1.9-1114 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d34864a8d211a39f37522fd3a3364239767b1975>`_ Fix a stack on pre/post action when a resource has no matching resources
| `1.9-1113 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0b13ace7093c6b8db4896adaa5a62411a589d5bc>`_ Fixes for the default per-family subsets
| `1.9-1112 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e5a6892e1f92477aa4fd4d6b1049c7cb039371f8>`_ Fix a sync_all issue
| `1.9-1111 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=913850c9cecf7d7ce4fae34e45d911709ebb897b>`_ Avoid the sync.zfs full sync caused by the "sent" zfs snap rename
| `1.9-1110 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7545747c667cf6690aa25aaeac40cf7fb96feaa0>`_ disk.md sync resync enhancements
| `1.9-1109 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=20080d41b0fd9a2890563ae2c9c297a29d7f20ba>`_ Allow mutiple sync.zfs resources on the same src
| `1.9-1108 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af04d14e2ef0bc7e75b48cf466df577019a47164>`_ Fix redundant action on the same resource
| `1.9-1107 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7444a044269bb3228f0c91d77d87840cf6149feb>`_ Add a zfs dataset rename method to the Dataset class
| `1.9-1106 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3accaa48ae280b582e6c2be945cf311a1d1af32>`_ Sanity check for bdecode
| `1.9-1105 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=db7820151c7971ab8b42d3f5f0698d6e447315b6>`_ Fix the enable/disable actions
| `1.9-1104 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=94ea90fa28677dbd6631f2bb213f59229cbca0f2>`_ Don't start the docker private daemon on stop
| `1.9-1103 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ad4f3b1b6d8e5a5b10ddc828abbd5dcc7dec8ef5>`_ disk.lv provisioner log beautify
| `1.9-1102 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=752100f443951a277c080445424224d2120a25d3>`_ Rename the syncswap action to "sync swap"
| `1.9-1101 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2334705c2884a8da6b6d9a13ad8cf09bea68afde>`_ Optimization in the sync.zfssnap driver
| `1.9-1100 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfff4b19eabc134496ca79b0eda0946eb1f26d1a>`_ Add the "sync resync" action support in the disk.md driver
| `1.9-1099 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6214bbff299383f8103b2fa2ce401500fbe38bcb>`_ Add a table of the svcmon state flags in the help description
| `1.9-1098 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=60e1e9025d3bdc687a87a9e3559cac4dc3fa906a>`_ Fix a relay bug stacking the daemon if the "relay" kw is not set
| `1.9-1097 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=611a34efa801654cf9d5a196428a753f6263ccd5>`_ Remove undue status logs from the disk.md checker
| `1.9-1096 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6ce87296e47d6262058b23658682a8ec4fbe632f>`_ Fix the svcmgr toc action
| `1.9-1095 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=99363afb3fdb9e62f71085b84263f77ae5861fa5>`_ Consider a standby disk.drbd is stdby up if in secondary state
| `1.9-1094 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d0fb4336fcb88eae374ac089473ab0cc211c2e30>`_ Move the sort resourcesets up to Svc::sub_set_action()
| `1.9-1093 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=02683c50fd7efc3583da20833953860a732bc873>`_ Fix the scsireserv resources ordering
| `1.9-1092 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=de93f773c3d8abb25916ff8195ed275d47bf0749>`_ Add a subset sort in the Svc::set_action()
| `1.9-1091 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3eb9ad929839871447f8b47d0bdd018214b4904a>`_ Fix the fs.dir driver label lazy attr definition
| `1.9-1090 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a5e1daaf237109c729f4aa5e020c6563bf16337d>`_ Get rid of the per-type resourceset
| `1.9-1089 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dc7f29069fc14f911b0104f353bc6c6b73eb3818>`_ Report more warnings in the md resource status checker
| `1.9-1088 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=17038ea2202da224e39bef2d99fb4d5c80e3ab7f>`_ Better status log reporting when a scsi reserv resource is in "undef" state
| `1.9-1087 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=89ce318feacc11620c91063066e92813581c4b65>`_ Fix raw_input() callers with python3
| `1.9-1086 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e70b588b2c1adb04d26edc8c21e68a02e0d1857>`_ Fix the giveback action
| `1.9-1085 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=530cb289da9f4f66b181b374e92819a4c3b546c5>`_ Support "--rid <driver>" in svcmgr actions and restore prstart/prstop actions
| `1.9-1084 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8bfd1515d8df8f9a196229d7df74b2c4ee71be30>`_ Fix the dev_to_paths() on Linux systems with a non-standard dm major
| `1.9-1083 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba91c68d4d6ba1cfda7e2350a4c914269ce4eb63>`_ Do a first communication with daemon in postinstall
| `1.9-1082 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ec879d4b3a0321c10f20f097f5a0c6b5b0c733c>`_ Create the daemon restart flag from the preinstall if it does not exist yet
| `1.9-1081 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4251fbc164f8e0b04a65bf11e9326dafc00ee0bd>`_ Don't display an error on rpm upgrade from 1.8 to 1.9 if no service is present
| `1.9-1080 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=baf1b3f6dd233317c2c251394520e6fd3a81d455>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1079 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3d68b06c754d2a937c28b3a095cde50001b0633>`_ Add missing bin/preuninstall file in the rpm spec file
| `1.9-1078 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=edcf61b79e5291203d674a57f4994ffe25b059d6>`_ preinstall fix
| `1.9-1077 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=860288aa11f429c705fd7cc5fff8d26e91545884>`_ Don't stack on _read_cf when no configuration file exists
| `1.9-1076 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c65350ec8183bfecf9694e40313aef731947dc96>`_ Stop the daemon on package remove
| `1.9-1075 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=263bdc2a2ec563281a432eff564f988dce633f28>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-1074 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86ad5f1e2f28555f6f7a35f2ad2e98c20a310608>`_ Support multiparagraph action descriptions in the --help output
| `1.9-1073 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff2a4fe7708a7137fd5542fb67e03871abd5474d>`_ Generate a simple config examples for each resource
| `1.9-1072 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f187a3f8ba33413c495c2bfe65c484a5951546e2>`_ Refresh the man and bash completion
| `1.9-1071 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e29a2b31d7616661088445935bf39f42b5619662>`_ Remove upper-case letters from the action name in the nodemgr parser
| `1.9-1070 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cbeaf89c4f36f1955788763b53b6ce237ba4c2e5>`_ Fix a stack in a log message formatting
| `1.9-1069 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=df6e957fb30a78f95399047114bf865d4ff1378a>`_ Move the "already targetting that" message to debug
| `1.9-1068 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8011301ca127acd38e1e1b0904889b3a23d57cea>`_ Abort a flex instance ready state if enough better peers are ready
| `1.9-1067 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f960b5eaa0078939fd7238818ffd20b8448bf593>`_ Support multi-level enslaving and represent slave rels in svcmon
| `1.9-1066 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=564e78c275a8786e73bafc9e8e36fad6a7f12741>`_ Faster monitor proc janitoring loop and ready stealing fix
| `1.9-1065 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a541f55b2b037a5d2d247bb0583008d5c79213dd>`_ Fix the enslave children embedding in the service json status
| `1.9-1064 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=43cd7a1f3644eaec01d7c9fec2bf11c7d8a6beaa>`_ Fix the docker daemon shutdown happening too late
| `1.9-1063 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=71da0f8b6615eb3956c9b20538c4f15e38e9f151>`_ Fix the multi-subvol on loopdevice btrfs provisioner
| `1.9-1062 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4990abf9b92a06c177ceae253cc9c0c18de9b2ae>`_ Give the fs loopdevice attr setting its own method
| `1.9-1061 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=602d4ef11a88808107d3007de283dbe386850ef8>`_ Fix the btrfs on loop provisioner on Linux
| `1.9-1060 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=65f7b576073e11893691d44685f90751a5cede6b>`_ Fix the fs on loop status evaluation on Linux
| `1.9-1059 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6973b3d0f0ab919fd298282276ce8ccdc5549183>`_ Fix the btrfs provisioner
| `1.9-1058 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8643c3a2cd87df38c1ca2688e5c2b43ec90397bb>`_ Fix the disk.md presync()
| `1.9-1057 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a21eb64be41a8595d1284f7957846d2794c25f4>`_ Support --kw multi-option in nodemgr and svcmgr get and unset
| `1.9-1056 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=778fd855589b835e7baeeae0e3e1b0dc1985c99a>`_ Allow -r as the svcmgr --refresh short option
| `1.9-1055 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dbb3dd52be81741357808adb6e1cb77d287c7a1e>`_ Catch possible KeyErrors in the resource provisioned state merging
| `1.9-1054 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ba12b23bc6604c16145cfdde7554413ff1da23dc>`_ Shortcut dev_to_paths() for /dev/vd
| `1.9-1053 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=87c60139662b22620171fc18aff7dcddc6c74195>`_ Support lazy references in the linux fs resources dev keyword
| `1.9-1052 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=461db821036c1d30af9fb3baf8c47639aa13bee0>`_ Don't cache None derefence results
| `1.9-1051 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=90555e7a7964b52f2efad59620acb3afacd35be3>`_ Skip the resource provision on not-leader only if the request originates from osvcd
| `1.9-1050 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3fdedad5eea3f92ce9cfcceb8be8d410ab95ac9c>`_ Allow --disable-rollback on pull/create/update actions
| `1.9-1049 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=324531d82d14bbac0290cf1af815f68af0df7c0f>`_ Setup the service monitor data with an initial "idle" status
| `1.9-1048 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=35cdca383046ae1a06d9c8feae493c866d250d89>`_ Fix a potential stack in the "print status" codepath
| `1.9-1047 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4184e9d454312e48442b44700f450723f45d38f7>`_ Fix a potential stack in the svcmon rendering codepath
| `1.9-1046 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0046433578426b8437617cd5a850c9f8af2f3827>`_ Update the doc templates
| `1.9-1045 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7b2080c26d2c02618c30dbfb81fb047e9fad9fd2>`_ Don't noop the ip start method in the provisioner
| `1.9-1044 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6db8751f92b3aab6f93e0c490fc6f6428195b9fd>`_ Fix a rare daemon monitor stack on service delete --unprovision
| `1.9-1043 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=886cd2ae1e4a5e7e609142e13c57937012988ba7>`_ Don't use node auth on "collector cli" if the --user option is specified
| `1.9-1042 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a43ff9fd557cf6ef6ab500400546273433f418c>`_ An missing ipname must cause a down ip resource status
| `1.9-1041 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2ab29bed58a827de7af8c472d470a5e9e7299c50>`_ Fix a daemon-handled provisioning loop
| `1.9-1040 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b427c9d04f953caef575c4c443833f9eda64da9>`_ provisioning fixes
| `1.9-1039 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a7ac647a0f2152a4494c2881845905dd65b650d9>`_ Fix a stack in the update code path
| `1.9-1038 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b037dc5cffd805b54a8084a5fe270cc607117240>`_ Fix the parameters handling of collector cli
| `1.9-1037 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae470fc59216f5c40d5aa96826c2bf07d9f352d7>`_ Python3.6+ fix for the inventory HDS
| `1.9-1036 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=52ff305ca2eeec5b46675e070c2d9e7e7da34dc7>`_ Allow start/stop request on services in warn agg avail but no instance in warn
| `1.9-1035 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cb453da5eec99e77e1c9513de550b9c358322c21>`_ Allow local action on services in failed mon states
| `1.9-1034 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5dcd279220abd9d6c831be3753d9f16902ef19c6>`_ Allow the daemon monitor to freeze/thaw/abort/delete disabled services
| `1.9-1033 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c4df8771d845e23eb9c49ee6e6d64c3e2dadd058>`_ Factorize hb.mcast rx/tx common socket preparation in a parent class method
| `1.9-1032 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ea8f63d794ca4b9a66910d94ed7f89ade41f8544>`_ Fix the sync.rsync timestamp file hosting dir creation
| `1.9-1031 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=feba93056f5d589fa3ed1cfe7874dbb30fb88558>`_ Fix two daemon monitor stack
| `1.9-1030 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2a1e3d05eaf4a00df408920b15176505bbe8a6cd>`_ Python3.6+ fix for the ip.cni driver
| `1.9-1029 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ff7f5a84d3f39781cd92d64e76998a66ff375711>`_ Fix the interface binding in the mcast heartbeat driver
| `1.9-1028 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b5e533ec4c5e942e685189717f4e3e0c5e53819c>`_ Fix a python3.6+ bug in the mcast heartbeat
| `1.9-1027 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a59a4cb6f6009181c9ff7c2ff8afdb5772e9acc3>`_ Bootstrap a collector cli test suite
| `1.9-1026 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=68c96432e0201d4f6758e2a0a3df80dc43e3b535>`_ Don't always setup node auth for root execution of "nodemgr collector cli"
| `1.9-1025 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf89ab69e463bc8ee0771876cc5e168696bbc526>`_ Fix collector cli commands using CmdLs() and CmdShow() internally
| `1.9-1024 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=29606a2b72a1eb7ef6546192c404bea8e64aa620>`_ nodemgr collector cli enhancements
| `1.9-1023 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f15d3fd9c9ed342c447321698bcd86475cf80f65>`_ Fix fs.btrfs sub_devs()
| `1.9-1022 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4aca80a6b744db8719027caabb24b9362b874f87>`_ Add ip.docker and fs.btrfs tests to the provision test suite
| `1.9-1021 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5d480ab4cc8785b61ffe32ab78145cab5931c0e0>`_ Add a ip provision test to the provision test suite
| `1.9-1020 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3a73112a42b29e7935edf90d6fb8ae7d0c096434>`_ Add disk.lv and container.docker tests to the provisioning test suite
| `1.9-1019 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc555cfe7437e7b8dfd22afe8a2f98fe286478c9>`_ Remove in-mem resources and references in the delete resources codepath
| `1.9-1018 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e835ef9fbf7d15d4425850044ccf50b0fcd73df8>`_ Add a Resource() method to remove the provisioned state cache file
| `1.9-1017 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0313c1882a5d0401c943bd7523c9c30b16eb5d8b>`_ disk.md uuid not set should not err on stop
| `1.9-1016 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=93f9b8e00165784a2aaedf74221a135320dc38d1>`_ Don't trust cache in disk.vg is_provisioned() code path
| `1.9-1015 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3f1a5e30dda787eacddb3571081b6408a311abf7>`_ Add compliance commands to the svcmgr and nodemgr test suites
| `1.9-1014 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f5302a7d65378b8c48ce822031c773c2ddbb276>`_ Fix a syntax error in osvcd monitor thread code
| `1.9-1013 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b35b961adf66e909b059cc0769b8cc856a32dbfe>`_ Fix the returncode of nodemgr.main() direct use
| `1.9-1012 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=73a4aea0af0d1fcf2a1f3882049ba32470c831e7>`_ Add more exclusions to .coveragerc
| `1.9-1011 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=02ab66235698f3a59f3ffccdace59e5a221e35c3>`_ Fix a utf8 + python3 stack in the nodeconf compliance object
| `1.9-1010 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e20537fe9de96cbf7dafc973138bc9da438952b4>`_ Really fix the bug 563378a9c40141c7a89ba65bb38b1bc0caea66df should have fixed
| `1.9-1009 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf43c005e54179aa1239a138a22c8b96cd15b0fc>`_ Remove a debug statement from svcmon
| `1.9-1008 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=79ddfc82ce7708298ba1791c05476d664ded0c12>`_ Add a svcmon test suite
| `1.9-1007 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1b7fb455573b0a5592a01fed6e95be2fcf481f0>`_ Fix svcmon return code and argv passing to the main() function
| `1.9-1006 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=563378a9c40141c7a89ba65bb38b1bc0caea66df>`_ Fix a "dict changed size during iteration" error in the daemon monitor thread
| `1.9-1005 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e3a65c547862ec56bafdbdfc9a7c40721d7f0d78>`_ Remove undue test
| `1.9-1004 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c184df54d1fccc6044be182c77e446e1f06c3e33>`_ Add more tests
| `1.9-1003 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=08727c7de7053106945f6af01eda6660ed1aedfb>`_ Fix the --parallel return code aggregation of each worker subprocess
| `1.9-1002 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4a0dccc9ba78f1e6508787cca0825a6207ed69c8>`_ Add docstrings to the svc_fs test suite
| `1.9-1001 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=38977fe9ad20123bda24b1490eb446007b6c8449>`_ Add 'nodemgr print devs' the the nodemgr test suite
| `1.9-1000 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e420b53a2b3c7591ddc415d1d60057ec08012064>`_ Limit the pure-python md5 module fallback to ImportError if hashlib has no md5
| `1.9-999 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=dc0a3905fcd8f15d4bd9727cabc3a76c2a7539df>`_ Add md provision test to the provision test suite
| `1.9-998 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ba325e13988f8a1f3c6afc02d819bcdff0ffb90>`_ Add a provision test suite
| `1.9-997 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f48a02c08d6af555be7f420317f77c6d5528efc9>`_ Don't remove the service if the delete command is scoped
| `1.9-996 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=300b1c3e05ba3dfa2f66c72ffab5b1d96b9c9b3a>`_ Add a realpath kwarg to the is_exe() utility function
| `1.9-995 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae607a57135e6ee85e4041a1f94d1c73bd280c61>`_ Remove a useless include from collector.py
| `1.9-994 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8bbdee9c31f83f3e0e9650ea6508da2223f0976d>`_ Don't err if node.conf or auth.conf are empty on "print config"
| `1.9-993 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1fe91f8ae45a5c8df3251f30f249a4ca86ca7d89>`_ Fix an assert on Solaris
| `1.9-992 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=569773a66e869694a23b014526b67c4bada9d32e>`_ Fix is_exe() utility function wrt symlinks
| `1.9-991 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a29d081a2efc2d56498059fa1834f104590ee2c1>`_ Don't try to eval the next reboot slot date if not scheduled
| `1.9-990 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e3f08cf02dcb36fb92e4e2e7bd210f129fb5971>`_ Fix the daemon listener router
| `1.9-989 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bd01f278669ded7fc4d55963ac469e1053f5cadd>`_ Fix issues when the daemon is not returning valid status data
| `1.9-988 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b1b5efeadca9e6980ecbc4f9e1988042740a66c0>`_ Switch the expr, forest, freeze, import and lock test suites to class
| `1.9-987 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=86641b74ecfad7ff09231840bd628703e2fa527a>`_ Switch status and scheduler test suites to classes
| `1.9-986 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c9a2bc1f790dab720b6935b59c6d611fe07d33be>`_ Switch converters test suite to a class
| `1.9-985 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=de91c2ada0b98c40204bb59c22a7bc94f173e2e2>`_ Switch asset test suite to a class
| `1.9-984 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0045773449c90109d645ce2bb996f741c929a1ed>`_ Switch node test suite to a class
| `1.9-983 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ca72d6375921d808c0e68343ae499d5f0e0d3a14>`_ Switch nodemgr test suite to a class
| `1.9-982 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e5d0acba880846c7f15c11de4e39167a92b5d33>`_ Add docstrings to rcUtilities tests
| `1.9-981 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=798faf52117b19cbc5d2714e6ca1b2fac8ec5e8c>`_ Configure coverage omit and add html and json xunit renderings
| `1.9-980 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=79fd945723fb3ac463776c364fc8427138555744>`_ Add a Node class test suite to reach a better coverage
| `1.9-979 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=749683efdc95d4204c8ef5ad05fadf56060a265c>`_ Add docstrings to all nodemgr tests
| `1.9-978 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1e0362e6b408a975bd3fad04ac2a0b59bb9741f4>`_ Add docstrings to all svcmgr nose tests
| `1.9-977 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=36544baaf81146f5e986a7bfdc45397e8bec6dc4>`_ Test more "svcmgr ls" cases in the nose test suite
| `1.9-976 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9b1472471a52b827bfe28abd83f9ac57a17f52e7>`_ Fix a "svcmgr ls" regression due to new "not found" keyword new expections class
| `1.9-975 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=470a41cb1946a21c0ff13402af2646ead8acd890>`_ Add a test suite for the rcStatus module
| `1.9-974 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0eb69910300c9e1d8a788c215ee9a34e3f25340a>`_ Add a test for the gce connect_to parser in the pushasset codepath
| `1.9-973 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=27892906990c6d819360c72ef113aa1f6a256b10>`_ Add a bin/pkg/make_tests to set the nose tests run parameters
| `1.9-972 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9ebc6db09d43e429ce9eb4062233bb99a640bd5f>`_ Commit the node section template for the now included loc_addr keyword
| `1.9-971 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cfe9e9b1ebadb8957481a318cbb5e535fc64dcf9>`_ Add a .coveragerc file
| `1.9-970 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1391f7f9d257c117bf217a8d2bcc3a464691160e>`_ Fix missing node keyword
| `1.9-969 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=47a112925bb5d68cc73c7fcd4cf16c959e4092fe>`_ Add a test_freezer to the nose tests
| `1.9-968 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=54f5f2e7707b7f643568aa495e4e9c1335b925d4>`_ One more nosetest fix
| `1.9-967 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f7157b5eb46f5bc7dfe04b5bcad32536f6fb16e>`_ Fix the test_svcmgr nosetest
| `1.9-966 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7566fb9aea6fab98b4ebdc0fa90d5a50671e4191>`_ Fix a possible stack in the "svcmgr pull" codepath
| `1.9-965 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0ad61b7f9ea8751acfe49db27a601a3e4ee7f5b3>`_ Allow "svcmgr unset --param foo"
| `1.9-964 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ce3b73b45b742fb7cfaa0c29e7a413748994e2d2>`_ Fix an unset regression with the keywords module patch
| `1.9-963 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=23ee9b74f1d18e12e853e3a1cad90156e662750c>`_ Fix "svcmgr create"
| `1.9-962 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0a2fdfc3781bcd2823314e74be685c286e61f602>`_ Fix a python2 bug in the size converter
| `1.9-961 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c7bb646a9c9d195c2887678f1b64380a1aa6ee31>`_ Factorize the matching resourcesets in sub_set_action()
| `1.9-960 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2f5c39e34ad7f49ed679d055e4981e298baf52eb>`_ Add a ip.provisioner provisioning keyword
| `1.9-959 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=705a8a595bfc8f7febb2665b58f36e5f45da6a2e>`_ Fix unprovision bug on bind mount fs resources
| `1.9-958 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ae12b29603043fdfcbac76650ce0773832da2f72>`_ Fix a size converter bug
| `1.9-957 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e1256f76d4e7129649aa1b76e9159f21ec5df2a7>`_ No need to stop resoure from the disk.loop provisioner
| `1.9-956 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=70d7e8c7a4bee1339fb8646df1b2eea480c40960>`_ Allow freeze and stop local action when mon status is not idle
| `1.9-955 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=63763f6a9c940cf20e53f093236b484c6123f931>`_ Factorize print_config_data() between Node and Svc, in extconfig
| `1.9-954 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85e7c1fad4e7a10cf2f3a4073703bece1f90e748>`_ Remove the windows listener implementation, prepare for a full-featured osvcd svc
| `1.9-953 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=06897de9e59adcafe3c5ee0a2938593ee79b4ff2>`_ Stricter use of the svcdict accessors for DEFAULT.docker keywords
| `1.9-952 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=cf4f849a668ae4753487b6b30bf9594303fdc433>`_ Avoid "can not stat LABEL=pridns.fs.1" errors in final action stage
| `1.9-951 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d27c1ee24d84746740ea60d610773d280832f29a>`_ Fix the ready_period default value
| `1.9-950 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a89403b7ff8fb0e10db0fdf70699bcc8e4d4c272>`_ Track missing node doc template
| `1.9-949 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9e4928a9f6b7cab33a93942f2b425f3cef20f19a>`_ Don't display the provisioning keyword property for node keywords
| `1.9-948 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=72766b541b869c64a29a8b82f38debe6a5af7947>`_ Factorize the config methods in the new extconfig module
| `1.9-947 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2e69b54695653814a66ada1c319065b3dd7c8097>`_ Fix the default node cni. value fallback in the ip.cni driver
| `1.9-946 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a6f8fcbb899d2a2b95c04d44ad7a2539ccf200ac>`_ Add cni.plugins and cni.config node.conf options
| `1.9-945 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05d3ad5a233d2e84a3c96818641ea44cc6b4261d>`_ Return 1%FREE and friends unchanged in the size converter
| `1.9-944 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8d309743b22e92e154246e53ebf28c24ee0257d6>`_ python3 fixes for the hb.disk driver
| `1.9-943 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=554f96e8187ee0376743548840c967e4e9ed1105>`_ Create missing <OSVCVAR>/services/<svcname>/scheduler/ dir from rsync driver
| `1.9-942 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc64e863e595b4f67c7b17e4df0c84af7dbe926e>`_ Fix keyword candidates printing in the validate_config error codepath
| `1.9-941 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=d6e24740828b9f3979800bc8f6fa5f79624b02f0>`_ Fix devtree region hash function on python3
| `1.9-940 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=821de618899434bbfb013545dc14abdd3dd0f2eb>`_ Fix a wrong variable name
| `1.9-939 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=9c7fe7ab80f2d812dee94bd3ca9e42b608ce9710>`_ Align node and svc capabilities wrt config file
| `1.9-938 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=226bb06bb582360888ea19f967f7413324436e60>`_ Fix the reboot pre and blocking_pre triggers
| `1.9-937 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=77220a66a8c780147824291de1426eee1726b49f>`_ Use "template.service." as the service templates prefix
| `1.9-936 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=a4a0b5c5e0f759f1ef990dcb00ef5bfe8001dbfa>`_ Add a node keywords dictionnary and split the node.conf annotated template
| `1.9-935 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2b2f496387f64ed8aecf0022cafcef725868ba1a>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-934 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0f5e578d2a618388a49afe20141bc541abd888ce>`_ docker fixes
| `1.9-933 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=c8511578fc89475a649c8c5f785ae96c9bfcf8cf>`_ Fix a forest structure glitch after load
| `1.9-932 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=31b8139a098e4f5ec0c23d954276c8888b605052>`_ Add the "nodemgr network show --id <cni net id>" command
| `1.9-931 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=20563c467a79ccf34691d40aa35600c80de5929f>`_ Add a forest and forest node .load(data) method
| `1.9-930 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4bba04d542a548309f0756f0705bcaf1fe7580e5>`_ Add a reboot.once boolean keyword to node.conf
| `1.9-929 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf5a653ad63fadb3d0e8af8ef378174e11d1b2ac>`_ Avoid pushing garbage in the resinfo table
| `1.9-928 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=4e1fdb26e504e77d70595b94b9584d8cce4e77ff>`_ Service json status format changes
| `1.9-927 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0999dbb050b4b8d126ee9f5e613fd8f688b19555>`_ service json status enhancements
| `1.9-926 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8f52f37d716b0d51ef3af31f11e4a3e47fa94277>`_ Keep the scheduler thread from running the same command twice
| `1.9-925 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=85569506a6ee6ec24acab819e416fb3a6560c6eb>`_ Add the {etc} and {var} references
| `1.9-924 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8ef4ee820bf17708dc43a40c7a15e1b26c4c45c4>`_ Add "nodemgr network ls [--format=<fmt>]
| `1.9-923 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ac1f20bd8f1d0d0db003723290def31cb9b096ed>`_ Do not require the portmap cni plugin to be declared in the network config
| `1.9-922 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=408faaaa2e9a27dc4b49f64cc37de877811034d2>`_ Fix the auto scaling down of ha flex services
| `1.9-921 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6f69633bab0a5f33f427816f1491d54ee457c65e>`_ Allow to set node.ready_period instead of hardcoding 16s
| `1.9-920 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e7ef88abf1272da163c6683f53da302465ef4d2b>`_ Auto stop ha flex instances when n_up > flex_max_nodes
| `1.9-919 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7d1d0490904721f3cf0979f7e4d07972aee326cd>`_ ip.cni fixes
| `1.9-918 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f1aa1d058d3d8f770592945cb503fe818927c7f4>`_ Allow setting the min log level for the syslog logger
| `1.9-917 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=44ba49e2b3d9141047fcedf1a9b40f382ee700e0>`_ Test the existence of a zfs dataset before destroy
| `1.9-916 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=07220fb183bfcdbb3bf4e7b25e752c8f7db2a4a5>`_ Fix a python 2.5 compat bug in postinstall
| `1.9-915 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8b234a65e3ad94bf5663bd35d31ecd3b6eb4e3d7>`_ Fix mixed ws/tab indentation in the xtremio array driver
| `1.9-914 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=1f86271753e0cd22ed31241e40cdec5f352c4a8d>`_ Add support for multiple clusters handled by a xms in the xtremio array driver
| `1.9-913 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=05fa93c1237c13588b4bf9b822d65cfddc6e12d8>`_ Fix a syntax error in the example section (ansible_playbook.py info)
| `1.9-912 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=40c3f7303c569020e28ef5dc3396fead0aee07ae>`_ Don't report the encap daemon down for containers
| `1.9-911 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=752bac54cd136716047c424a5f8c1bc274850848>`_ python3 compat fix for he scsireserv sg driver
| `1.9-910 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=af5ee823f3172469185d707d184fef9316e03bb6>`_ Support the portmap plugin runtimeConfig injection
| `1.9-909 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b78886ff09f146a0d23b75269b2c64dde34c74e3>`_ Fixes bad variable assignment during modules parsing
| `1.9-908 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=6cbac600385ec9e4c15a72ee01682bead69196d6>`_ Support plugins chaining in the ip.cni driver
| `1.9-907 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=df28d284dc78fcf47fe26e21112da6fb3a558b4c>`_ No need to detach a subprocess when the action is run by the daemon
| `1.9-906 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=7e07b3e0b605794c1001fce8366a682413b51db5>`_ Merge branch 'master' of git+ssh://www.opensvc.com/home/opensvc/opensvc
| `1.9-905 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=96a3335ce1670e67f1b66db588d0f878949274d2>`_ Fix python2.5 to 3+ modes in the postinstall script
| `1.9-904 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab9f9642d6ef55d819a6ca10998f643be73dcc9d>`_ Disable sanity check in scsi reserv when run by the daemon
| `1.9-903 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=0989c8f81174aaf666c3ea3c93841f3ae3bdeaea>`_ Remove the joiner quorum keyword if quorum=false or unset on the joined node
| `1.9-902 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=ab5138ca3c9c6cae29d403ae3e9ba16d9d06b7e6>`_ Fix the quorum value merging in the joiner code path
| `1.9-901 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=98ecefb4146e45a4b688ab90dc0c2a50922a89a9>`_ Fix the quorum key name in the daemon join response from the listener
| `1.9-900 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bc1d35522f6f75fac8a6083b55176d68adadc478>`_ freeze on stop --local only if orchestrate == "ha"
| `1.9-899 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=e4cdf056fb3b61b1c0aaee73bb9cf48f44502a50>`_ Add the quorum info to the cluster data returned by the listener on join
| `1.9-898 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=3fda622961b65e703e4fc1f788b6fb42d16031e4>`_ Change the 'crash' linux toc method to echo 'c' in sysrq-triggger
| `1.9-897 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f7117457d74e208504ce3f19b914720955e9042d>`_ Add client-side part of the arbitrator and quorum config merge on join
| `1.9-896 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=bf1fd4ece7faac75e8b666f3318a567f1962072f>`_ Fix a stack in the quorum suicide logging
| `1.9-895 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b3a7af8de60c149978c379ced8dfc18f5e74c79d>`_ Expose "push encap config" as a service instance action
| `1.9-894 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=684763895acbef134f00d75175172b7434f01b98>`_ Reinstate the "push config" service action
| `1.9-893 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=b56bcb15ee6c650c4522be707d85050eecd41329>`_ Fix a dev_to_paths() bug on Linux
| `1.9-892 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5121ff25b0781b11321141815e7a0635a651f1b8>`_ Merge branch 'master' of git+ssh://git.opensvc.com/home/opensvc/opensvc
| `1.9-891 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=5a2e5eadd8f3acb5ca6ba4ac17eb5bd0dccf9c94>`_ Fix "set --kw drpnodes-=node10" when drpnodes is not set
| `1.9-890 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=30a118474dded0066a98de9724dda25fc9aa27e0>`_ Fix disk.md disklist on sles11 when md members are multipaths
| `1.9-889 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=f967002f1fa33b46eb0ab603ab0a8d951bc53161>`_ Fix a stack in the provision action codepath
| `1.9-888 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=345877e1f5eb267187314a54249de808422eb02e>`_ Add --node autocompletion to bash completion
| `1.9-887 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=664817aabf0c665888a75bf01360721aa97394e6>`_ Merge branch 'master' of git+ssh://git.opensvc.com/home/opensvc/opensvc
| `1.9-886 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=031ca2b921425246f034f468e6c38fce6c92d3e0>`_ Fix a provision stack in the lv driver
| `1.9-885 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=39d0e536ed9760b49e39a926a7ab377a93d65f8b>`_ Don't include netmask in ip resources resinfo if not configured
| `1.9-884 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=240432b169dd1e1d91cc659b8a4e75ea8b02a822>`_ Fix the "down idle,started" instance state after a stop --local
| `1.9-883 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=8dcdba835289767e155b7804ff758acf43c43380>`_ Behave better when the node.conf configuration file is corrupted
| `1.9-882 <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=2066ef4aba73fd46e5b5754369d31c51d2b3a7f7>`_ Exit from the split handler on frozen nodes
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
