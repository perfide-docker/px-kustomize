# SPDX-License-Identifier: BSD 2-Clause "Simplified" License
# SPDX-FileCopyrightText: 2025 P. H. <github.com/perfide>

# --------------------------------------------------------------------------- #
# get kustomize

# From https://kubectl.docs.kubernetes.io/installation/kustomize/docker/
FROM registry.k8s.io/kustomize/kustomize:v5.8.0 AS kustomize

# --------------------------------------------------------------------------- #
# get kustomize

# Using an old helm version because kustomize does not support helm4 yet
FROM docker.io/alpine/helm:3.19.0 AS helm

# --------------------------------------------------------------------------- #
# build final image

FROM docker.io/library/bash:alpine3.23 AS app

ENV UID=5555
ENV GID=5555

RUN addgroup --gid ${GID} pxoci
RUN adduser -D --gecos "" --home "/app" --no-create-home --uid ${UID} -G pxoci pxoci

COPY --from=kustomize \
  /app/kustomize \
  /usr/local/bin/kustomize

COPY --from=helm \
  /usr/bin/helm \
  /usr/local/bin/helm

ENTRYPOINT ["/usr/local/bin/kustomize"]

WORKDIR /app

USER pxoci

# [EOF]
