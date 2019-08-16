#!/bin/bash

source ./scripts/log.sh
log "Install CORD Platform..."
helm install -n cord-platform cord/cord-platform --version=6.1.0 --set logging.enabled=false --set nem-monitoring.enabled=false --set att-workflow-driver.kafkaService=cord-kafka > /dev/null 2>&1
#helm install -n cord-platform cord/cord-platform --version=6.1.0 --set att-workflow-driver.kafkaService=cord-kafka > /dev/null 2>&1

log "Waiting for CORD Platform Ready..."
log ":     CORD POD     :"
until [ 15 = $(kubectl get pod | grep 1/1 | wc -l) ] && \
      [ 1 = $(kubectl get pod | grep 2/2 | wc -l) ]; do
  log ":        $(kubectl get pod | grep 1/1 | wc -l)/15        :"
  sleep 5;
done
log "Install CORD Platform Success!"
