# Using Helm Charts from GitHub Pages

This guide explains how to use Helm charts published to GitHub Pages from this repository.

## Prerequisites

- Helm 3.x or later
- Access to a Kubernetes cluster

## Adding the Helm Repository

1. Add this GitHub Pages URL as a Helm repository:
   ```bash
   helm repo add my-charts https://natarov.github.io/helm-charts
   ```

2. Update your Helm repositories to fetch the latest charts:
   ```bash
   helm repo update
   ```

## Installing a Chart

1. Install the chart with a release name of your choice:
   ```bash
   helm install my-release my-charts/<chart-name>
   ```
   Replace `<chart-name>` with the name of the chart you wish to install. (e.g. httpbin)

## Tips for Users

- Ensure your Kubernetes context is set to the correct cluster where you want to deploy the chart.
- You can customize the installation by using the `--set` flag or providing a `values.yaml` file.

## Conclusion

By following these steps, you can easily use Helm charts hosted on GitHub Pages from this repository. This setup allows you to deploy applications quickly and efficiently. 