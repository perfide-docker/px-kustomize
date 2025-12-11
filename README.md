
A rootless kustomize container with integrated helm

to be able to execute `kustomize build --enable-helm`

Build: `podman build . --tag localhost/px-kustomize:1.0.0`

Shell-Alias: `alias kustomize="podman run --rm --volume .:/app localhost/px-kustomize:1.0.0"`

Use-prebuild: `alias kustomize="podman run --rm --volume .:/app ghcr.io/perfide-docker/px-kustomize:1.0.0"`

Example call: `kustomize-oci build --enable-helm overlays/staging/somedir/`

Dependencies:
- [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/docker/)
- [helm](https://hub.docker.com/r/alpine/helm)
- [bash](https://hub.docker.com/_/bash)

Other images:
| Image | Size | Comment |
| ----- | ---- | ------- |
| docker.io/alpine/k8s:1.37.2 | 994 MB | Big |
| docker.io/alpine/helm:3.19.0 | 97 MB | No Kustomize |
| registry.k8s.io/kustomize/kustomize:v5.8.2 | 41 MB | No Helm |
| pxkustomize | 89 MB | Perfect fit |
