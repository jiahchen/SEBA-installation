#!/bin/bash

helm delete --purge att-workflow
helm delete --purge base-kubernetes
helm delete --purge seba-services
helm delete --purge voltha
helm delete --purge seba
helm delete --purge onos
helm delete --purge xos-core
helm delete --purge cord-kafka
helm delete --purge etcd-operator
helm delete --purge cord-platform
