#!/usr/bin/env bash
set -euo pipefail

test -f deploy/k8s/backend-deployment.yaml
test -f deploy/k8s/frontend-deployment.yaml

grep -q "runAsNonRoot: true" deploy/k8s/backend-deployment.yaml
grep -q "readOnlyRootFilesystem: true" deploy/k8s/backend-deployment.yaml
grep -q "allowPrivilegeEscalation: false" deploy/k8s/backend-deployment.yaml

grep -q "runAsNonRoot: true" deploy/k8s/frontend-deployment.yaml
grep -q "readOnlyRootFilesystem: true" deploy/k8s/frontend-deployment.yaml
grep -q "allowPrivilegeEscalation: false" deploy/k8s/frontend-deployment.yaml

echo "Controles básicos de hardening OK"
