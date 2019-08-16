#!/bin/bash

#helm delete --purge att-workflow > /dev/null 2>&1
helm delete --purge base-kubernetes > /dev/null 2>&1
helm delete --purge seba-services > /dev/null 2>&1
helm delete --purge voltha > /dev/null 2>&1
helm delete --purge seba > /dev/null 2>&1
helm delete --purge onos > /dev/null 2>&1
helm delete --purge xos-core > /dev/null 2>&1
helm delete --purge cord-kafka > /dev/null 2>&1
helm delete --purge etcd-operator > /dev/null 2>&1
helm delete --purge cord-platform > /dev/null 2>&1
