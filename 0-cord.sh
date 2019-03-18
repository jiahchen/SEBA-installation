#!/bin/bash

helm install -n cord-platform cord/cord-platform --version=6.1.0 --set logging.enabled=false --set nem-monitoring.enabled=false --set att-workflow-driver.kafkaService=cord-kafka
#helm install -n cord-platform cord/cord-platform --version=6.1.0 --set logging.enabled=false --set nem-monitoring.enabled=false
