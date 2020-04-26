#!/bin/bash

# расчет PG - [https://ceph.io/pgcalc/](https://ceph.io/pgcalc/)
# create pool from node-1
ceph osd pool create kube 128 128

# create user auth from node-1
ceph auth add client.kube mon 'allow r' osd 'allow rwx pool=kube'

# get auth
ceph auth get-key client.kube
