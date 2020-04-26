#!/bin/bash

# enable dashboard from node-1
ceph mgr module enable dashboard

# go to http://node-1:7000

# create application-tatg and close warnings from node-1
ceph osd pool application enable kube rbd
