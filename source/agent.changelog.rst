Changelog
=========


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
