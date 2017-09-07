:orphan:

.. _agent.cluster.data:

Example Cluster Data
********************

::

        $ sudo nodemgr daemon status --format json 
        {
            "hb#1.rx": {
                "config": {
                    "addr": "224.3.29.71",
                    "intf": "any",
                    "port": 10001,
                    "src_addr": "0.0.0.0",
                    "timeout": 15
                },
                "created": "2017-09-04T07:59:44Z",
                "peers": {
                    "aubergine": {},
                    "clementine": {
                        "beating": false,
                        "last": "2017-09-07T20:07:59Z"
                    },
                    "nuc": {
                        "beating": false,
                        "last": "1970-01-01T00:00:00Z"
                    }
                },
                "state": "running",
                "stats": {
                    "beats": 95238,
                    "bytes": 288850946,
                    "errors": 0
                }
            },
            "hb#1.tx": {
                "config": {
                    "addr": "224.3.29.71",
                    "intf": "any",
                    "port": 10001,
                    "src_addr": "0.0.0.0",
                    "timeout": 15
                },
                "created": "2017-09-04T07:59:44Z",
                "peers": {
                    "aubergine": {},
                    "clementine": {
                        "beating": true,
                        "last": "2017-09-07T20:29:34Z"
                    },
                    "nuc": {
                        "beating": true,
                        "last": "2017-09-07T20:29:34Z"
                    }
                },
                "state": "running",
                "stats": {
                    "beats": 92596,
                    "bytes": 280678928,
                    "errors": 2140
                }
            },
            "hb#2.rx": {
                "config": {
                    "addr": "0.0.0.0",
                    "port": 10004,
                    "timeout": 15
                },
                "created": "2017-09-04T07:59:44Z",
                "peers": {
                    "aubergine": {},
                    "clementine": {
                        "beating": false,
                        "last": "1970-01-01T00:00:00Z"
                    },
                    "nuc": {
                        "beating": true,
                        "last": "2017-09-07T20:29:36Z"
                    }
                },
                "state": "running",
                "stats": {
                    "beats": 53423,
                    "bytes": 126953610,
                    "errors": 0
                }
            },
            "hb#2.tx": {
                "config": {},
                "created": "2017-09-04T07:59:44Z",
                "peers": {
                    "aubergine": {},
                    "clementine": {
                        "beating": false,
                        "last": "1970-01-01T00:00:00Z"
                    },
                    "nuc": {
                        "beating": true,
                        "last": "2017-09-07T20:29:34Z"
                    }
                },
                "state": "running",
                "stats": {
                    "beats": 54084,
                    "bytes": 163944768,
                    "errors": 20874
                }
            },
            "listener": {
                "config": {
                    "addr": "0.0.0.0",
                    "port": 1214
                },
                "created": "2017-09-04T07:59:44Z",
                "state": "running",
                "stats": {
                    "sessions": {
                        "accepted": 9,
                        "auth_validated": 9,
                        "clients": {
                            "127.0.0.1": {
                                "accepted": 9,
                                "auth_validated": 9,
                                "rx": 1476,
                                "tx": 36740
                            }
                        },
                        "rx": 1476,
                        "tx": 36740
                    }
                }
            },
            "monitor": {
                "created": "2017-09-07T20:08:16Z",
                "frozen": "thawed",
                "nodes": {
                    "aubergine": {
                        "env": "DEV",
                        "frozen": false,
                        "load": {
                            "15m": 0.35,
                            "1m": 0.77,
                            "5m": 0.55
                        },
                        "monitor": {
                            "status": "idle",
                            "status_updated": "2017-09-04T07:59:43.995865Z"
                        },
                        "services": {
                            "config": {
                                "collector": {
                                    "cksum": "3031d76a956539bb63c200a5ef584698",
                                    "scope": [
                                        "aubergine"
                                    ],
                                    "updated": "2017-07-05T16:21:07.004012Z"
                                },
                                "ha1": {
                                    "cksum": "7f03bc7ddffca7663b95e899572ec0eb",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T10:44:12.811203Z"
                                },
                                "pridns": {
                                    "cksum": "571f52e14eb12d8b0c135102247e8676",
                                    "scope": [
                                        "aubergine"
                                    ],
                                    "updated": "2017-08-07T07:00:40.755769Z"
                                },
                                "registry": {
                                    "cksum": "d8e83546490d79b07c476479f37ca551",
                                    "scope": [
                                        "aubergine"
                                    ],
                                    "updated": "2017-07-05T16:09:59.925585Z"
                                },
                                "testapplim": {
                                    "cksum": "b08cf2714f023cecd83352953cd10821",
                                    "scope": [
                                        "aubergine"
                                    ],
                                    "updated": "2017-08-28T09:09:31.396487Z"
                                },
                                "testbnp": {
                                    "cksum": "3ec7080164f54d3acfbd2620572de28f",
                                    "scope": [
                                        "aubergine"
                                    ],
                                    "updated": "2017-06-16T15:41:05.000000Z"
                                },
                                "testdrbd": {
                                    "cksum": "9e48a6a9705eed1cda8a761026c4c84c",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T12:18:48.945726Z"
                                },
                                "testmd": {
                                    "cksum": "938ff51eb01cf3bc30ea3ae0e34d2a14",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T10:11:46.310281Z"
                                }
                            },
                            "status": {
                                "collector": {
                                    "app": "n/a",
                                    "avail": "up",
                                    "constraints": true,
                                    "container": "up",
                                    "disk": "n/a",
                                    "encap": {},
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "up",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.491532Z"
                                    },
                                    "mtime": 1504816144.333626,
                                    "overall": "up",
                                    "resources": {
                                        "container#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container collector.container.0@registry.opensvc.com/busybox:latest",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container collector.container.1@registry.opensvc.com/opensvc/collector_db:build11",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#2": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container collector.container.2@registry.opensvc.com/opensvc/collector_nginx:build1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#3": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container collector.container.3@registry.opensvc.com/opensvc/collector_redis:build1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#4": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container collector.container.4@registry.opensvc.com/opensvc/collector_web2py:build10",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "ip#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "10.0.3.3@lxcbr0@container#0",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "container#0",
                                                "docker"
                                            ],
                                            "type": "ip.docker"
                                        },
                                        "sync#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker img sync to nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "sync.docker"
                                        },
                                        "sync#1": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "rsync /unxdevweb/apps/ to nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        },
                                        "sync#2": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "s3 backup",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "sync.s3"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.333626Z"
                                },
                                "ha1": {
                                    "app": "n/a",
                                    "avail": "up",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "up",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.490798Z"
                                    },
                                    "mtime": 1504816144.31643,
                                    "overall": "up",
                                    "resources": {
                                        "app#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "true",
                                            "log": "info: check is not set\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        },
                                        "ip#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "128.0.0.2@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "ip#1": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "128.0.0.3@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "sync#i0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        },
                                        "task#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "task",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "task"
                                        },
                                        "task#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "task",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "task"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "up",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.316430Z"
                                },
                                "pridns": {
                                    "app": "n/a",
                                    "avail": "up",
                                    "constraints": true,
                                    "container": "up",
                                    "disk": "up",
                                    "encap": {},
                                    "frozen": false,
                                    "fs": "up",
                                    "ip": "up",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.488503Z"
                                    },
                                    "mtime": 1504816144.241822,
                                    "overall": "up",
                                    "resources": {
                                        "container#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container pridns.container.0@10.0.3.4/busybox:latest",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container pridns.container.1@10.0.3.4/opensvc/powerdns:latest",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "disk#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /srv/pridns.img",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "fs#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "btrfs LABEL=pridns.fs.1@/srv/pridns/docker",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#2": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "btrfs LABEL=pridns.fs.1@/srv/pridns/data",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "ip#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "10.0.3.11@lxcbr0@container#0",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "container#0",
                                                "docker"
                                            ],
                                            "type": "ip.docker"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.241822Z"
                                },
                                "registry": {
                                    "app": "n/a",
                                    "avail": "up",
                                    "constraints": true,
                                    "container": "up",
                                    "disk": "n/a",
                                    "encap": {},
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "up",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.490139Z"
                                    },
                                    "mtime": 1504816144.309894,
                                    "overall": "up",
                                    "resources": {
                                        "container#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container registry.container.0@busybox",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container registry.container.1@distribution/registry:master",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#2": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container registry.container.2@nginx:latest",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#3": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "docker container registry.container.3@10.0.3.4/busybox",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "ip#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "10.0.3.4@lxcbr0@container#0",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "container#0",
                                                "docker"
                                            ],
                                            "type": "ip.docker"
                                        },
                                        "task#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "task",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [
                                                "gc"
                                            ],
                                            "type": "task"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.309894Z"
                                },
                                "testapplim": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.488980Z"
                                    },
                                    "mtime": 1504816144.246249,
                                    "overall": "n/a",
                                    "resources": {
                                        "app#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "foo",
                                            "log": "info: check is not set\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.246249Z"
                                },
                                "testbnp": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.489381Z"
                                    },
                                    "mtime": 1504816144.259747,
                                    "overall": "n/a",
                                    "resources": {
                                        "disk#2": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "vg testbnp",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.vg"
                                        },
                                        "fs#1": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "ext4 /dev/testbnp/root@/srv/testbnp",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.259747Z"
                                },
                                "testdrbd": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.487553Z"
                                    },
                                    "mtime": 1504816144.182687,
                                    "overall": "n/a",
                                    "resources": {
                                        "disk#00": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "loop /opt/testdrbd/dd1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#10": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "drbd testdrbd.1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.drbd"
                                        },
                                        "disk#30": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "vg testdrbd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.vg"
                                        },
                                        "fs#01": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "ext4 /dev/testdrbd/lv01@/srv/testdrbd/lv01",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "sync#i0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.182687Z"
                                },
                                "testmd": {
                                    "app": "n/a",
                                    "avail": "warn",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "warn",
                                    "frozen": false,
                                    "fs": "up",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-04T07:59:44.488054Z"
                                    },
                                    "mtime": 1504816144.21961,
                                    "overall": "warn",
                                    "resources": {
                                        "app#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "foo",
                                            "log": "info: needed resources avail status is warn, skip check\ninfo: not evaluated (instance not up)\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        },
                                        "disk#00": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#01": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd2",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#02": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd3",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "tag1",
                                                "tag3"
                                            ],
                                            "type": "disk.loop"
                                        },
                                        "disk#03": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd4",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "tag1",
                                                "tag2"
                                            ],
                                            "type": "disk.loop"
                                        },
                                        "disk#04": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd5",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#05": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd6",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#06": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd7",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#10": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md af5b241e:676a31cb:5e83c2fa:3e1ea018",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "bar"
                                            ],
                                            "type": "disk.md"
                                        },
                                        "disk#100": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw100",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "down",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#101": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw101",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "down",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#102": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw102",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#103": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw103",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#10pr": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "disk.scsireserv",
                                            "log": "",
                                            "monitor": true,
                                            "optional": true,
                                            "status": "undef",
                                            "tags": [
                                                "foo"
                                            ],
                                            "type": "disk.scsireserv"
                                        },
                                        "disk#11": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md 46e7fc95:795dcfe1:56c5faa2:ee67ec63",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.md"
                                        },
                                        "disk#12": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md d538ac6d:9d8c0837:a604e50b:458f4856",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.md"
                                        },
                                        "disk#201": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "pool testmd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.zpool"
                                        },
                                        "disk#30": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "vg testmd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.vg"
                                        },
                                        "fs#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "dir /opt/testmd/bind_dev",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "dir /tmp/testmd.d",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#2": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "zfs testmd/testds1@/opt/testmd/testds1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#3": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "/opt/testmd/bind_dev@/opt/testmd/bind_mnt",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "ip#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "128.1.11.1@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "sync#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "zfs of testmd/testds1 to nodes",
                                            "log": "warn: Last sync on 2017-01-16 04:01:15.191159 older than 1500 minutes\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "warn",
                                            "tags": [],
                                            "type": "sync.zfs"
                                        },
                                        "sync#i0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "warn: passive node needs update\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "warn",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "warn",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:04.219610Z"
                                }
                            }
                        },
                        "updated": "2017-09-07T20:29:38Z"
                    },
                    "nuc": {
                        "env": "DEV",
                        "frozen": false,
                        "load": {
                            "15m": 0.09,
                            "1m": 0.11,
                            "5m": 0.12
                        },
                        "monitor": {
                            "status": "idle",
                            "status_updated": "2017-09-03T17:17:02.867937Z"
                        },
                        "services": {
                            "config": {
                                "ha1": {
                                    "cksum": "7f03bc7ddffca7663b95e899572ec0eb",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T10:44:12.811203Z"
                                },
                                "hostap": {
                                    "cksum": "70b1b1d749e47a51ba06dab098ae2bcf",
                                    "scope": [
                                        "nuc"
                                    ],
                                    "updated": "2017-07-01T15:41:37.917364Z"
                                },
                                "proxy": {
                                    "cksum": "3bc9abfd9352da4e9f0518de8cf1d63f",
                                    "scope": [
                                        "nuc"
                                    ],
                                    "updated": "2017-07-06T09:05:06.750525Z"
                                },
                                "testdrbd": {
                                    "cksum": "9e48a6a9705eed1cda8a761026c4c84c",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T12:17:32.142566Z"
                                },
                                "testmd": {
                                    "cksum": "938ff51eb01cf3bc30ea3ae0e34d2a14",
                                    "scope": [
                                        "aubergine",
                                        "nuc"
                                    ],
                                    "updated": "2017-08-30T10:11:35.015242Z"
                                }
                            },
                            "status": {
                                "ha1": {
                                    "app": "n/a",
                                    "avail": "up",
                                    "constraints": "True",
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "up",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "idle",
                                        "status_updated": "2017-09-03T17:18:08.186571Z"
                                    },
                                    "mtime": 1504816141.548677,
                                    "overall": "up",
                                    "resources": {
                                        "app#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "true",
                                            "log": "info: check is not set\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        },
                                        "ip#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "128.0.0.2@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "ip#1": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "128.0.0.3@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "sync#i0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        },
                                        "task#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "task",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "task"
                                        },
                                        "task#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "task",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "task"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "up",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:01.548677Z"
                                },
                                "hostap": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-03T17:17:03.056242Z"
                                    },
                                    "mtime": 1504816141.627414,
                                    "overall": "n/a",
                                    "resources": {
                                        "app#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "hostapd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:01.627414Z"
                                },
                                "proxy": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-03T17:17:03.055601Z"
                                    },
                                    "mtime": 1504816141.622136,
                                    "overall": "n/a",
                                    "resources": {
                                        "container#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker container proxy.container.0@ubuntu:16.10",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#1": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker container proxy.container.1@opensvc/collector_db:build9",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#2": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker container proxy.container.2@opensvc/collector_nginx:build1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#3": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker container proxy.container.3@opensvc/collector_redis:build1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "container#4": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "docker container proxy.container.4@opensvc/collector_web2py:build10",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "container.docker"
                                        },
                                        "ip#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "192.168.0.253@br0@container#0",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [
                                                "container#0",
                                                "docker"
                                            ],
                                            "type": "ip.docker"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:01.622136Z"
                                },
                                "testdrbd": {
                                    "app": "n/a",
                                    "avail": "n/a",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "n/a",
                                    "frozen": false,
                                    "fs": "n/a",
                                    "ip": "n/a",
                                    "monitor": {
                                        "status": "idle",
                                        "status_updated": "2017-09-03T17:17:03.053995Z"
                                    },
                                    "mtime": 1504816141.535821,
                                    "overall": "n/a",
                                    "resources": {
                                        "disk#00": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "loop /opt/testdrbd/dd1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#10": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "drbd testdrbd.1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.drbd"
                                        },
                                        "disk#30": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "vg testdrbd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.vg"
                                        },
                                        "fs#01": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "ext4 /dev/testdrbd/lv01@/srv/testdrbd/lv01",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "sync#i0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "n/a",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:01.535821Z"
                                },
                                "testmd": {
                                    "app": "n/a",
                                    "avail": "warn",
                                    "constraints": true,
                                    "container": "n/a",
                                    "disk": "warn",
                                    "frozen": false,
                                    "fs": "up",
                                    "ip": "n/a",
                                    "monitor": {
                                        "local_expect": "started",
                                        "status": "start failed",
                                        "status_updated": "2017-09-03T17:17:33.120010Z"
                                    },
                                    "mtime": 1504816141.59589,
                                    "overall": "warn",
                                    "resources": {
                                        "app#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "foo",
                                            "log": "info: needed resources avail status is warn, skip check\ninfo: not evaluated (instance not up)\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "app"
                                        },
                                        "disk#00": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#01": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd2",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#02": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd3",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "tag1",
                                                "tag3"
                                            ],
                                            "type": "disk.loop"
                                        },
                                        "disk#03": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd4",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "tag1",
                                                "tag2"
                                            ],
                                            "type": "disk.loop"
                                        },
                                        "disk#04": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd5",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#05": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd6",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#06": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "loop /opt/testmd/dd7",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.loop"
                                        },
                                        "disk#10": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md b742617b:d8a76908:5ec4db5e:5e4d920b",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [
                                                "bar"
                                            ],
                                            "type": "disk.md"
                                        },
                                        "disk#100": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw100",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "down",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#101": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw101",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "down",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#102": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw102",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#103": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "testmd.raw103",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "disk.raw"
                                        },
                                        "disk#10pr": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "disk.scsireserv",
                                            "log": "",
                                            "monitor": true,
                                            "optional": true,
                                            "status": "undef",
                                            "tags": [
                                                "foo"
                                            ],
                                            "type": "disk.scsireserv"
                                        },
                                        "disk#11": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md c4f79d3d:64d4f8df:8b2d28eb:65997b84",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.md"
                                        },
                                        "disk#12": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "md e6a6703e:3919c7e9:fe47185f:6e9d777a",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.md"
                                        },
                                        "disk#201": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "pool testmd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.zpool"
                                        },
                                        "disk#30": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "vg testmd",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "disk.vg"
                                        },
                                        "fs#0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "dir /opt/testmd/bind_dev",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "dir /tmp/testmd.d",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#2": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "zfs testmd/testds1@/opt/testmd/testds1",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "fs#3": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "/opt/testmd/bind_dev@/opt/testmd/bind_mnt",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "up",
                                            "tags": [],
                                            "type": "fs"
                                        },
                                        "ip#0": {
                                            "disable": true,
                                            "encap": false,
                                            "label": "128.1.11.1@lo",
                                            "log": "",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "n/a",
                                            "tags": [],
                                            "type": "ip"
                                        },
                                        "sync#1": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "zfs of testmd/testds1 to nodes",
                                            "log": "warn: Last sync on 2017-01-16 04:01:15.191159 older than 1500 minutes\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "warn",
                                            "tags": [],
                                            "type": "sync.zfs"
                                        },
                                        "sync#i0": {
                                            "disable": false,
                                            "encap": false,
                                            "label": "rsync svc config to drpnodes, nodes",
                                            "log": "warn: passive node needs update\n",
                                            "monitor": false,
                                            "optional": false,
                                            "status": "warn",
                                            "tags": [],
                                            "type": "sync.rsync"
                                        }
                                    },
                                    "share": "n/a",
                                    "stonith": "n/a",
                                    "sync": "warn",
                                    "task": "n/a",
                                    "updated": "2017-09-07T20:29:01.595890Z"
                                }
                            }
                        },
                        "updated": "2017-09-07T20:29:36Z"
                    }
                },
                "services": {
                    "collector": {
                        "avail": "up",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "ha1": {
                        "avail": "warn",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "pridns": {
                        "avail": "up",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "registry": {
                        "avail": "up",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "testapplim": {
                        "avail": "n/a",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "testbnp": {
                        "avail": "n/a",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "testdrbd": {
                        "avail": "n/a",
                        "frozen": "thawed",
                        "overall": ""
                    },
                    "testmd": {
                        "avail": "down",
                        "frozen": "thawed",
                        "overall": "warn"
                    }
                },
                "state": "running"
            },
            "scheduler": {
                "created": "2017-09-04T07:59:44Z",
                "state": "running"
            }
        }
