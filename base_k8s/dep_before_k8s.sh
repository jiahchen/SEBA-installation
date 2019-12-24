#!/bin/bash

source ./scripts/log.sh

KUBE_VER="1.14.10-00"

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

log "Install Kubelet, Kubeadm, Kubectl..."
apt-get install -y kubelet=${KUBE_VER}
apt-get install -y kubectl=${KUBE_VER}
apt-get install -y kubeadm=${KUBE_VER}

log "All Requirement Install Success!"
