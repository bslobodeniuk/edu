# kubeplugin Usage Guide

This guide provides instructions on how to use the `kubeplugin` script for monitoring resource usage in Kubernetes clusters.

## Prerequisites

Before using the `kubeplugin` script, ensure the following requirements are met:

1. **Access to a Kubernetes Cluster**: You should have access to a Kubernetes cluster.
2. **kubectl**: The `kubectl` command-line tool must be installed and configured for Kubernetes.
3. **Executable Script**: Make sure the `kubeplugin` script is executable. This can be achieved with `chmod +x kubeplugin`.

## Using the Script

Follow these steps to use the `kubeplugin` script:

### Step 1: Open a Terminal

Open a terminal window on your system.

### Step 2: Navigate to the Script's Directory

Change your current directory to the location where the `kubeplugin` script is stored.

```bash
cd /path/to/kubeplugin
```

### Step 3: Execute the Script
Run the kubeplugin script with the required arguments:

namespace: The namespace in the Kubernetes cluster to check.
resource-type: The type of resource (e.g., pods) for which you want to retrieve information.

```bash
./kubeplugin <namespace> <resource-type>
```
Example

```bash
./kubeplugin kube-system pods
```

This command outputs the CPU and memory usage information for all pods in the kube-system namespace.

### Understanding the Output

The script outputs information in the following format:

```yaml
Resource: [resource-type], Namespace: [namespace], Name: [name], CPU: [cpu usage], Memory: [memory usage]
```
Each line represents a separate resource within the specified namespace, detailing its CPU and memory usage.

### Tips

Verify you have the necessary permissions to execute kubectl commands in your Kubernetes cluster.
If you encounter any errors, ensure the accuracy of the arguments and confirm your cluster access rights.

### Script output:
```agsl
./kubeplugin kube-system pods
Resource: pods, Namespace: kube-system, Name: coredns-77ccd57875-ptnsb, CPU: 4m, Memory: 23Mi
Resource: pods, Namespace: kube-system, Name: local-path-provisioner-957fdf8bc-gkll8, CPU: 1m, Memory: 13Mi
Resource: pods, Namespace: kube-system, Name: metrics-server-648b5df564-rkhln, CPU: 11m, Memory: 29Mi
Resource: pods, Namespace: kube-system, Name: svclb-traefik-542a9604-qg2hj, CPU: 0m, Memory: 0Mi
Resource: pods, Namespace: kube-system, Name: traefik-64f55bb67d-f8gmb, CPU: 1m, Memory: 37Mi
```


