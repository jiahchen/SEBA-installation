# SEBA Makefile

.PHONY: k8s cord seba att-workflow set-config remove-cord remove-k8s clean

K8S_DIR       := ./base_k8s
SCRIPT_DIR    := ./scripts
POD_CONFIG    := ./pod-config
HELM_DIR      := ./helm

k8s:
	sudo $(K8S_DIR)/dep_before_k8s.sh
	$(K8S_DIR)/install_k8s.sh
	$(K8S_DIR)/helm.sh

all: k8s cord seba att-workflow

cord:
	$(SCRIPT_DIR)/cord.sh

seba:
	$(SCRIPT_DIR)/seba.sh

att-workflow:
	$(SCRIPT_DIR)/att-workflow.sh

set-config:
	$(SCRIPT_DIR)/set-config.sh

remove-cord:
	helm delete --purge att-workflow
	helm delete --purge seba
	helm delete --purge cord-platform

remove-k8s:
	$(K8S_DIR)/reset_k8s.sh

clean: remove-cord remove-k8s
