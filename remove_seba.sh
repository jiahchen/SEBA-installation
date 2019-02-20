#!/bin/bash

helm delete --purge att-workflow
#helm delete --purge base-kubernetes
#helm delete --purge seba-service
#helm delete --purge voltha
helm delete --purge seba
helm delete --purge cord-platform
