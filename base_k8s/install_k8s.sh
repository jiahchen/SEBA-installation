#!/bin/bash

#echo "Installing docker..."
#sudo apt-get update
#sudo apt-get install -y software-properties-common
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 0EBFCD88
#sudo add-apt-repository \
#       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#       $(lsb_release -cs) \
#       stable"
#sudo apt-get update
#sudo apt-get install -y "docker-ce=17.03*"

#echo "Installing kubeadm..."
#sudo apt-get update
#sudo apt-get install -y ebtables ethtool apt-transport-https curl
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#cat <<EOF >/tmp/kubernetes.list
#deb http://apt.kubernetes.io/ kubernetes-xenial main
#EOF
#sudo cp /tmp/kubernetes.list /etc/apt/sources.list.d/kubernetes.list
#sudo apt-get update
#sudo apt install -y "kubeadm=1.12.4-*" "kubelet=1.12.4-*" "kubectl=1.12.4-*"

sudo swapoff -a
sudo kubeadm init --pod-network-cidr=10.101.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f calico.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-
