# Operator Helm Chart

A Helm chart for deploying the Operator application to Kubernetes.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- NGINX Ingress Controller (if using ingress)

## Installation

### Add the repository (if using a Helm repository)

```bash
helm repo add natarov https://natarov.github.io/helm-charts
helm repo update
```

### Install the chart

```bash
# Install with default values
helm install operator ./operator

# Install with custom values
helm install operator ./operator --values custom-values.yaml

# Install in a specific namespace
helm install operator ./operator --namespace my-namespace --create-namespace
```

## Configuration

The following table lists the configurable parameters of the operator chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of replicas | `1` |
| `image.repository` | Docker image repository | `ghcr.io/natarov/operator` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Docker image tag | `latest` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Service port | `80` |
| `service.targetPort` | Service target port | `8080` |
| `ingress.enabled` | Enable ingress | `true` |
| `ingress.className` | Ingress class name | `""` |
| `ingress.hosts` | Ingress hosts configuration | `[{"host": "operator.local", "paths": [{"path": "/", "pathType": "Prefix"}]}]` |
| `resources.limits.cpu` | CPU limit | `100m` |
| `resources.limits.memory` | Memory limit | `128Mi` |
| `resources.requests.cpu` | CPU request | `50m` |
| `resources.requests.memory` | Memory request | `64Mi` |
| `autoscaling.enabled` | Enable horizontal pod autoscaler | `false` |
| `autoscaling.minReplicas` | Minimum replicas for HPA | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for HPA | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Target CPU utilization for HPA | `80` |

### Example custom values

```yaml
replicaCount: 3
image:
  repository: ghcr.io/natarov/operator
  tag: v1.0.0

ingress:
  enabled: true
  hosts:
    - host: operator.example.com
      paths:
        - path: /
          pathType: Prefix

resources:
  limits:
    cpu: 200m
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 128Mi

autoscaling:
  enabled: true
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 70
```

## Upgrading

```bash
helm upgrade operator ./operator
```

## Uninstalling

```bash
helm uninstall operator
```

## Accessing the Application

After installation, the application will be available at:

- **Service**: `http://<service-name>:80`
- **Ingress**: `http://operator.local` (if ingress is enabled)

## Health Checks

The application provides health check endpoints:

- **Readiness**: `GET /health`
- **Liveness**: `GET /health`

## Troubleshooting

### Check pod status
```bash
kubectl get pods -l app.kubernetes.io/name=operator
```

### Check logs
```bash
kubectl logs -l app.kubernetes.io/name=operator
```

### Check service
```bash
kubectl get svc -l app.kubernetes.io/name=operator
```

### Check ingress
```bash
kubectl get ingress -l app.kubernetes.io/name=operator
```

## Repository

This chart is hosted in the [natarov/helm-charts](https://github.com/natarov/helm-charts) repository. 