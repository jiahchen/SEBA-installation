#!/bin/bash
source ./scripts/log.sh
HELM_VERSION="2.10.0"
HELM_SHA256SUM="0fa2ed4983b1e4a3f90f776d08b88b0c73fd83f305b5b634175cb15e61342ffe"
HELM_PLATFORM="linux-amd64"

if ! which helm > /dev/null; then
  log "Install Helm client..."
  curl -L -o /tmp/helm.tgz "https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-${HELM_PLATFORM}.tar.gz"
  echo "${HELM_SHA256SUM}  /tmp/helm.tgz" | sha256sum -c -
  cd /tmp; tar -xzvf helm.tgz; sudo mv ${HELM_PLATFORM}/helm /usr/local/bin/helm
  sudo chmod a+x /usr/local/bin/helm
  rm -rf /tmp/helm.tgz /tmp/${HELM_PLATFORM}
fi
log "Helm client already installed!"

log "Create Tiller..."
helm init
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --service-account tiller --upgrade
log "Waiting for Helm to be Ready..."
until helm ls >& /dev/null; \
do \
  sleep 5; \
done

log "Helm Repo add incubator and opencord..."
helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
helm repo add cord https://charts.opencord.org
helm repo update
