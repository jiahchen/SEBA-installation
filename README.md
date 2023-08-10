# SEBA-POC-TW

TW SEBA POC configuration and automation

## - Install step

### 1. Install Kubernetes
```
make k8s
```
### 2. Install SEBA
```
make all
```

or

```
make cord; make seba; make att-workflow
```

### 3. Prepare OLT, AGG Switch
```
Please follow ONIE installation
```

### 4. Setup pod config
```
make pod-config
```

### Enable subscriber

### Ping success
