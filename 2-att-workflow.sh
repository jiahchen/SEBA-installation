#!/bin/bash

helm install -n att-workflow cord/att-workflow --version=1.0.2
#helm install -n att-workflow cord/att-workflow --version=1.0.2 --set att-workflow-driver.kafkaService=cord-kafka
