# httpbin

[View the project on GitHub Pages](https://natarov.github.io/helm-charts)

httpbin is a simple HTTP Request & Response Service. It can be used to test HTTP libraries and applications by providing endpoints that return various HTTP responses.


## Configuration

The following table lists the configurable parameters of the httpbin chart and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `replicaCount` | Number of replicas for the deployment | `3` |
| `image.repository` | The repository of the Docker image | `kennethreitz/httpbin` |
| `image.pullPolicy` | The image pull policy | `IfNotPresent` |
| `image.tag` | The tag of the Docker image | `latest` |
| `imagePullSecrets` | Secrets for pulling images from private registries | `[]` |
| `nameOverride` | Override the name of the chart | `""` |
| `fullnameOverride` | Override the full name of the chart | `""` |
| `podAnnotations` | Annotations to be added to pods | `{}` |
| `podSecurityContext` | Security context for the pod | `{ runAsUser: 1000 }` |
| `securityContext` | Security context for the container | `{ capabilities: { drop: ["ALL"] }, readOnlyRootFilesystem: true, runAsNonRoot: true }` |
| `resources.requests` | CPU and memory resource requests | `{ cpu: 100m, memory: 128Mi }` |
| `resources.limits` | CPU and memory resource limits | `{ memory: 128Mi }` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Tolerations for the pods | `[]` |
| `affinity` | Pod anti-affinity rules | See `values.yaml` |
| `topologySpreadConstraints` | Constraints to spread pods across zones | See `values.yaml` |
| `service.type` | The type of the service | `ClusterIP` |
| `service.port` | The port of the service | `80` |
| `ingress.enabled` | Enable or disable ingress | `false` |
| `ingress.annotations` | Annotations for the ingress | `{}` |
| `ingress.ingressClassName` | The ingress class name | `""` |
| `ingress.hosts` | Hosts configuration for the ingress | `[ { host: chart-example.local } ]` |
| `ingress.tls` | TLS configuration for the ingress | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install my-release -f values.yaml .
```

## How to Install the httpbin Helm Chart

To install the `httpbin` Helm chart, follow these steps:

1. **Add the GitHub Helm Repository**
   - First, add the GitHub Pages URL to your Helm client:
     ```bash
     helm repo add test-charts https://natarov.github.io/helm-charts
     ```

2. **Update the Helm Repositories**
   - Update your local Helm chart repository cache:
     ```bash
     helm repo update
     ```

3. **Install the Chart**
   - Install the `httpbin` chart with a release name of your choice:
     ```bash
     helm install my-release test-charts/httpbin
     ```

   - You can also customize the installation by specifying parameters:
     ```bash
     helm install my-release test-charts/httpbin --set replicaCount=2
     ```

4. **Verify the Installation**
   - Check the status of your release:
     ```bash
     helm status my-release
     ```

5. **Uninstall the Chart**
   - To uninstall/delete the `my-release` deployment:
     ```bash
     helm delete my-release
     ```

   - This command removes all the Kubernetes components associated with the chart and deletes the release.


## Example `values.yaml` for Enabling Ingress and Using NodeSelector with Taints

To enable ingress and use a nodeSelector with taints, you can create a `values.yaml` file with the following content:

```yaml
# Enable ingress
ingress:
  enabled: true
  hosts:
    - host: example.local

# Use nodeSelector and tolerations for nodes with taints
nodeSelector:
  app: httpbin

tolerations:
  - key: "key1"
    operator: "Equal"
    value: "value1"
    effect: "NoSchedule"
```

You can then install the chart using this `values.yaml` file:

```bash
helm install my-release -f values.yaml my-github-repo/httpbin
```

This configuration enables ingress and ensures that the pods are scheduled on nodes with the specified taints.

