#!/bin/bash
source ./scripts/2.0/log.sh
log "Install SEBA service and VOLTHA Platform"
helm install -n seba cord/seba --version=2.0.0-alpha1 > /dev/null 2>&1

log "Waiting for VOLTHA Platform, SEBA Service Ready..."
log ":     SEBA service     :     VOLTHA     :     Service Job     :"
until [ 19 = $(kubectl get pod | grep 1/1 | wc -l) ] && \ 
      [ 8 = $(kubectl get pod -n voltha | grep 1/1 | wc -l) ] && \
      [ 2 = $(kubectl get pod | grep Completed | wc -l) ]; do
  log ":        $(kubectl get pod | grep 1/1 | wc -l)/19        :        $(kubectl get pod -n voltha | grep 1/1 | wc -l)/8       :        $(kubectl get pod | grep Completed | wc -l)/2        :"
  sleep 5;
done

VOLTHA_POD=$(kubectl get pod -n voltha | grep voltha | awk {'print $1'})
log "Install SEBA success! Please make sure VOLTHA running successful!"
