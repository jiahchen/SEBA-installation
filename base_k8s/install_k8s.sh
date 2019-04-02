#!/bin/bash
source ./scripts/log.sh

log "Install Kubernetes..."
sudo swapoff -a
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

log "Install Calico CNI..."
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

log "Taint Master node could be deploy containers..."
kubectl taint nodes --all node-role.kubernetes.io/master-

log "Waiting for Node to be ready.."
while kubectl get nodes | grep NotReady >& /dev/null; \
do \
  sleep 5; \
done
log "Kubernetes Install Success!"
