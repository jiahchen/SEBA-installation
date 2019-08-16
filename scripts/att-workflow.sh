#!/bin/bash
source ./scripts/log.sh

log "Install AT&T Workflow..."
helm install -n att-workflow cord/att-workflow --version=1.0.2 > /dev/null 2>&1

log "Waiting for ATT driver, ATT Service Ready..."
log ":     ATT POD     :     Service Job     :"
until [ 26 = $(kubectl get pod | grep 1/1 | wc -l) ] && \
      [ 3 = $(kubectl get pod | grep Completed | wc -l) ]; do
  log ":        $(kubectl get pod | grep 1/1 | wc -l)/37        :        $(kubectl get pod | grep Completed | wc -l)/3        :"
  sleep 5;
done

VOLTHA_POD=$(kubectl get pod -n voltha | grep voltha | awk {'print $1'})
log "Install ATT workflow success!"
