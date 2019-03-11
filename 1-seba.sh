#!/bin/bash

#helm install -n voltha cord/voltha --version=1.0.4
#helm install -n seba-service cord/seba-services --version=1.0.6
#helm install -n base-kubernetes cord/base-kubernetes --version=1.0.3
helm install -n seba cord/seba --version=1.0.0
