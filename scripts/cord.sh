#!/bin/bash

source ./scripts/log.sh
log "Install CORD Platform..."
helm install -n cord-platform cord/cord-platform --version=6.1.0 --set logging.enabled=false --set nem-monitoring.enabled=false --set att-workflow-driver.kafkaService=cord-kafka > /dev/null 2>&1

log "Waiting for CORD Platform Ready..."
until [ 15 = $(kubectl get pod | grep 1/1 | wc -l) ]; do
  log "$(kubectl get pod | grep 1/1 | wc -l)/15 pods running..."
  sleep 5;
done
log "Install CORD Platform Success!"
