# SEBA-POC-Edgecore-TW

Edgecore TW SEBA POC configuration and automation

## Install step

### Install Kubernetes
```
cd ./base_k8s
./install_k8s.sh
./helm.sh
```

### Install SEBA
```
./0-cord.sh
```

- Please use "kubectl get pod" to wait all pod running

```
./1-seba.sh
```

- please use "kubectl get pod -n voltha" to check all voltha pod running
- use "kubectl get pod" to check 2 completed job. It will error and rre re-running for several times

```
./2-att-workflow.sh
```

- check completed job

### Then check your environment variable in pod-config/fabric.yml, pod-config/openolt.yml, pod-config/subscriber.yml

```
./3-setup_podconfig.sh
```

### Enable subscriber
### Set static IP on RG
### Ping success
