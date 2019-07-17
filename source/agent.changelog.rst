Changelog
=========


| `COMMITS=2.0..HEAD <https://github.com/opensvc/opensvc/commit/>`_ COMMITS=2.0..HEAD
| `2.0-74-ge89a9f9e <https://github.com/opensvc/opensvc/commit/Fix>`_ changelog to ensure current repository is used
| `2.0-73-g728288ae <https://github.com/opensvc/opensvc/commit/Fix>`_ a typo in a catched exception name
| `2.0-72-g1924a640 <https://github.com/opensvc/opensvc/commit/Log>`_ exceptions in the monitor thread pre-loop codepath
| `2.0-71-g741fd43f <https://github.com/opensvc/opensvc/commit/Search>`_ and create last_boot_id in <pathvar>/node/
| `2.0-70-g73b0f339 <https://github.com/opensvc/opensvc/commit/Replace>`_ a remaining occurence of Svc::svcname with Svc::name
| `2.0-69-g88ed8802 <https://github.com/opensvc/opensvc/commit/Py2>`_ encoding fix in the set BaseSvc action
| `2.0-68-g3d1bba71 <https://github.com/opensvc/opensvc/commit/Fix>`_ encoding error on adding binary data to a cfg
| `2.0-67-g4a2fbc3f <https://github.com/opensvc/opensvc/commit/Implement>`_ a deepcopy method in Storage()
| `2.0-66-g5755c6d7 <https://github.com/opensvc/opensvc/commit/Change>`_ the internal --to arg name to "to"
| `2.0-65-g68058f3d <https://github.com/opensvc/opensvc/commit/Move>`_ verbose option management in wait() function
| `2.0-64-g91a9bc77 <https://github.com/opensvc/opensvc/commit/Add>`_ elapsed time to om node wait command
| `2.0-63-g5c535f34 <https://github.com/opensvc/opensvc/commit/Fix>`_ the h2 request multiplexing for list of nodes
| `2.0-62-g944f2ce4 <https://github.com/opensvc/opensvc/commit/Add>`_ "slave" and "scale" key to monitor.services when opportune
| `2.0-61-g78edb210 <https://github.com/opensvc/opensvc/commit/Fix>`_ the aes listener socket
| `2.0-60-g118927e9 <https://github.com/opensvc/opensvc/commit/Honor>`_ the nodes@encapnodes keyword value when set
| `2.0-59-g37ce5bea <https://github.com/opensvc/opensvc/commit/Retry>`_ listener socket bind on in-use errors
| `2.0-58-g0b801bd5 <https://github.com/opensvc/opensvc/commit/Add>`_ a "synchronous service status eval" after cf fetch
| `2.0-57-g56dae82f <https://github.com/opensvc/opensvc/commit/om>`_ node wait optmization
| `2.0-56-g3ec511eb <https://github.com/opensvc/opensvc/commit/Return>`_ a deepcopy of DAEMON_STATUS on daemon_status()
| `2.0-55-gf239b340 <https://github.com/opensvc/opensvc/commit/Fix>`_ a stack in the daemon_status handler codepath
| `2.0-54-g2b04628e <https://github.com/opensvc/opensvc/commit/Fix>`_ scaling of services in the root ns
| `2.0-53-g3f162a88 <https://github.com/opensvc/opensvc/commit/Reconfigure>`_ the service before refresh the status upon set/edit/...
| `2.0-52-g97f4d3d4 <https://github.com/opensvc/opensvc/commit/Fix>`_ a pylint error on Node::log lazy masked by Crypt::log attr
| `2.0-51-g4977e2ac <https://github.com/opensvc/opensvc/commit/Fix>`_ the initLogger arguments in a call from svcBuilder
| `2.0-50-g1c783b62 <https://github.com/opensvc/opensvc/commit/Support>`_ create from template in the create_multiplex() lsnr method
| `2.0-49-g7d5bae98 <https://github.com/opensvc/opensvc/commit/Fix>`_ the "om svc1 print config --format json|om svc2 create" pattern
| `2.0-48-gb049c378 <https://github.com/opensvc/opensvc/commit/Use>`_ incremental patching in the "om node wait" codepath
| `2.0-47-g1cf720d4 <https://github.com/opensvc/opensvc/commit/Fix>`_ the service logger log routing
| `2.0-46-gd24e2958 <https://github.com/opensvc/opensvc/commit/Support>`_ non-namespaced objects in the api handlers router
| `2.0-45-gbbbe777d <https://github.com/opensvc/opensvc/commit/Fix>`_ the disk hb dev keyword value lost on reconfigure
| `2.0-44-g46dc6df5 <https://github.com/opensvc/opensvc/commit/Fix>`_ comments after line continuation introduced in the previous patch
| `2.0-43-g83271f48 <https://github.com/opensvc/opensvc/commit/Fix>`_ the pkg type detection for sles15
| `2.0-42-g5ce3c630 <https://github.com/opensvc/opensvc/commit/Use>`_ patch-event based updates in svcmon
| `2.0-41-g7bb7eff5 <https://github.com/opensvc/opensvc/commit/Add>`_ an id to the patch events dataset
| `2.0-40-g618adb5c <https://github.com/opensvc/opensvc/commit/Fix>`_ a spurious error message in the symmetrix driver
| `2.0-39-gaf377c36 <https://github.com/opensvc/opensvc/commit/Root>`_ patch-kind events to the root of the daemon status structure
| `2.0-38-g21cc1fdb <https://github.com/opensvc/opensvc/commit/Stop>`_ using Storage() in the hb drivers
| `2.0-37-g4b800a86 <https://github.com/opensvc/opensvc/commit/Accept>`_ the "template" option in the create handler
| `2.0-36-g462ec26f <https://github.com/opensvc/opensvc/commit/Refuse>`_ to create "dummy" service on "svcmgr create --template"
| `2.0-35-gaf40e7dd <https://github.com/opensvc/opensvc/commit/Preserve>`_ the comments in config files
| `2.0-34-gfc1713d3 <https://github.com/opensvc/opensvc/commit/Allow>`_ create --template to take env customization via stdin
| `2.0-33-g2e406cb2 <https://github.com/opensvc/opensvc/commit/Monitor>`_ thread fixes
| `2.0-32-g4f009da0 <https://github.com/opensvc/opensvc/commit/Avoid>`_ a stack on misnamed scaler slaves
| `2.0-31-g1b4a498d <https://github.com/opensvc/opensvc/commit/Fix>`_ calls to collector rest helpers from the Svc class
| `2.0-30-g0ccdf0fc <https://github.com/opensvc/opensvc/commit/Fix>`_ information leak on agg service status for ns-limited users
| `2.0-29-gb4f0c069 <https://github.com/opensvc/opensvc/commit/Merge>`_ branch 'master' of git+ssh://10.19.0.11/opt/opensvc
| `2.0-27-ge0294441 <https://github.com/opensvc/opensvc/commit/Classify>`_ the collector_cli action as runnable on any node
| `2.0-27-g37fabdd1 <https://github.com/opensvc/opensvc/commit/Add>`_ new handlers
| `2.0-26-gd82706e5 <https://github.com/opensvc/opensvc/commit/Fix>`_ a string wildcard substitution pattern in the listener codepath
| `2.0-25-g83644b70 <https://github.com/opensvc/opensvc/commit/Update>`_ docs, man, completion files
| `2.0-24-gf26d47d8 <https://github.com/opensvc/opensvc/commit/Adapt>`_ internal and exposed properties to the multi-kind reality
| `2.0-23-g9021cd4e <https://github.com/opensvc/opensvc/commit/Filter>`_ events based on user privs
| `2.0-22-gb1719fa0 <https://github.com/opensvc/opensvc/commit/Fix>`_ rbac denies of tls/raw connections requests
| `2.0-21-g770791f0 <https://github.com/opensvc/opensvc/commit/Add>`_ a __str__ method to the ClientHandler class
| `2.0-20-g954e1551 <https://github.com/opensvc/opensvc/commit/Check>`_ rbac before multiplexing
| `2.0-19-gc6cad80d <https://github.com/opensvc/opensvc/commit/Stop>`_ server-sending the index.css, as it will be bundled in the js
| `2.0-18-ge019db00 <https://github.com/opensvc/opensvc/commit/Fix>`_ the user_grant() bypass for raw socket protocol
| `2.0-17-g183c3df2 <https://github.com/opensvc/opensvc/commit/Add>`_ "fullpem" and "pkcs12" actions to sec and usr objects
| `2.0-16-g67785236 <https://github.com/opensvc/opensvc/commit/Fix>`_ and simplify rbac controls
| `2.0-15-g72f0d4a4 <https://github.com/opensvc/opensvc/commit/Add>`_ the /whoami api handler
| `2.0-14-ga09f7e09 <https://github.com/opensvc/opensvc/commit/Correctly>`_ wait for a stream request to finish sending its data before replying
| `2.0-13-gc22a7b65 <https://github.com/opensvc/opensvc/commit/Compute>`_ the Content-Length header in the client-side (get, post, stream)
| `2.0-12-gab0bafb5 <https://github.com/opensvc/opensvc/commit/Avoid>`_ short-looping the merge_hb_data on set_smon() always reporting a change
| `2.0-11-gf10b1090 <https://github.com/opensvc/opensvc/commit/Fix>`_ a pylint harmless error in the lsnr authentication codepath
| `2.0-10-ge0c61d94 <https://github.com/opensvc/opensvc/commit/Fix>`_ undefined variable uses in the node module
| `2.0-9-gdbc74c6d <https://github.com/opensvc/opensvc/commit/Fix>`_ the daemon_service_action() kwargs in the call from sync.rsync
| `2.0-8-g34aa14e6 <https://github.com/opensvc/opensvc/commit/Avoid>`_ running "svcmgr status" on init when there are no objects deployed
| `2.0-7-g396cbf94 <https://github.com/opensvc/opensvc/commit/Fix>`_ py2 compat in osvcd listener
| `2.0-6-g4a526268 <https://github.com/opensvc/opensvc/commit/Catch>`_ socket.error from h2_daemon_get:request()
| `2.0-5-gb18f72ad <https://github.com/opensvc/opensvc/commit/Fix>`_ the "om mon --stats" command
| `2.0-4-gcb1337e5 <https://github.com/opensvc/opensvc/commit/Add>`_ a http/2 listener to the daemon
| `2.0-3-gf9b854b9 <https://github.com/opensvc/opensvc/commit/Fix>`_ a stack on docker container start when environment has unresolved refs
| `2.0-2-g09031a6d <https://github.com/opensvc/opensvc/commit/Define>`_ a http/2 unix socket path
| `2.0-1-gf43683ca <https://github.com/opensvc/opensvc/commit/Add>`_ modules to implement a http/2 server and client
