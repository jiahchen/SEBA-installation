# SEBA-POC-Edgecore-TW

Edgecore TW SEBA POC configuration and automation

## - One click Install

### install all by one command
```
make all
```

## - Install Step

### 1. Install Kubernetes
```
make k8s
```
### 2. Install SEBA

```
make cord; make seba; make att-workflow
```

### 3. Prepare OLT, AGG Switch

### 4. Setup pod config
```
make set-config
```

### Enable subscriber

### Ping success
