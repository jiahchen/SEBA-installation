#!/bin/bash
source ./scripts/2.0/log.sh

log "Install AT&T Workflow..."
helm install -n att-workflow cord/att-workflow --version=1.2.4 > /dev/null 2>&1

log "Waiting for ATT driver, ATT Service Ready..."
log ":     ATT POD     :     Service Job     :"
until [ 20 = $(kubectl get pod | grep 1/1 | wc -l) ] && \
      [ 3 = $(kubectl get pod | grep Completed | wc -l) ]; do
  log ":        $(kubectl get pod | grep 1/1 | wc -l)/20        :        $(kubectl get pod | grep Completed | wc -l)/3        :"
  sleep 5;
done

VOLTHA_POD=$(kubectl get pod -n voltha | grep voltha | awk {'print $1'})
log "Install ATT workflow success!"
