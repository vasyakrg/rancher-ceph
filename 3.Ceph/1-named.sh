#!/bin/bash

# add named from all nodes + localhost
echo "192.168.9.211 node-1" >>/etc/hosts && echo "192.168.9.212 node-2" >>/etc/hosts && echo "192.168.9.213 node-3" >>/etc/hosts

# execute from all nodes
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && service ssh reload

# add pass for root - all nodes
passwd root

# ssh keygen from node-1
ssh-keygen

# ssh copy no all nodes from node-1
ssh-copy-id root@node-1 && ssh-copy-id root@node-2 && ssh-copy-id root@node-3

# execute from all nodes
sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config && service ssh reload
