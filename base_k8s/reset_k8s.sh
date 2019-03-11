#!/bin/bash

sudo kubeadm reset --force
rm -rf ~/.kube/
sudo bash -c "rm -rf /var/lib/cni/networks/*"
sudo bash -c "mkdir /var/lib/cni/networks/cbr0"
sudo bash -c "mkdir /var/lib/cni/networks/flannel-net"
