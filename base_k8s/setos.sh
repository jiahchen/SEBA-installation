#!/bin/bash

# Also can choose 'mirrors.tuna.tsinghua.edu.cn'
sudo sed -i 's/us.archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

echo "Installing docker..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable"
sudo apt update
sudo apt install -y docker-ce=18.06.0~ce~3-0~ubuntu containerd.io


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
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-
