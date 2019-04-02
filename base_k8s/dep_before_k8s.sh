#!/bin/bash

source ./scripts/log.sh

log "Setup APT source list..."
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update

if ! which docker > /dev/null; then
  log "Install docker..."
  apt-get install -y docker.io
fi

if ! which docker > /dev/null; then
  log "Install Kubelet, Kubeadm, Kubectl..."
  apt-get install -y kubelet kubeadm kubectl kubernetes-cni
fi

log "All Requirement Install Success!"
