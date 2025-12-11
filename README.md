
A rootless kustomize container with integrated helm

to be able to execute `kustomize build --enable-helm`

Dependenecies:
- https://hub.docker.com/_/alpine
- registry.k8s.io/kustomize/kustomize
- https://hub.docker.com/r/alpine/helm

Build: `podman build . --tag localhost/pxkustomize:1.0.0`

Shell-Alias: `alias kustomize="podman run --rm --volume .:/app localhost/pxkustomize:1.0.0"`
