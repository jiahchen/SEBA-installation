#!/bin/bash

`
helm install --version 0.13.3 --set 'configurationOverrides.offsets\.topic\.replication\.factor=1' --set 'configurationOverrides.log\.retention\.hours=4' --set 'configurationOverrides.log\.message\.timestamp\.type=LogAppendTime' --set replicas=1 --set persistence.enabled=false --set zookeeper.replicaCount=1 --set zookeeper.persistence.enabled=false --set att-workflow-driver.kafkaService=cord-kafka -n cord-kafka incubator/kafka
sleep 600
helm install -f ./pod-config/pod.yml --version 0.8.3 -n etcd-operator stable/etcd-operator
sleep 600
helm install -n voltha -f pod-config/pod.yml cord/voltha
sleep 600
helm install -n onos -f pod-config/pod.yml cord/onos
sleep 600
helm install -f pod-config/pod.yml -n xos-core cord/xos-core
sleep 600
helm install -f pod-config/pod.yml -n seba-services cord/seba-services
sleep 600
helm install -f pod-config/pod.yml -n base-kubernetes cord/base-kubernetes
sleep 600
helm install -f pod-config/pod.yml -n att-workflow cord/att-workflow
