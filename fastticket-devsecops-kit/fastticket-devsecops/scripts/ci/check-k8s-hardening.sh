#!/usr/bin/env bash
set -euo pipefail
FILES=$(find deploy/k8s -type f -name '*.yaml' -o -name '*.yml')

for f in $FILES; do
  if grep -q 'kind: Deployment' "$f"; then
    grep -q 'runAsNonRoot: true' "$f" || { echo "Falta runAsNonRoot en $f"; exit 1; }
    grep -q 'allowPrivilegeEscalation: false' "$f" || { echo "Falta allowPrivilegeEscalation=false en $f"; exit 1; }
    grep -q 'readOnlyRootFilesystem: true' "$f" || { echo "Falta readOnlyRootFilesystem=true en $f"; exit 1; }
    grep -q 'seccompProfile:' "$f" || { echo "Falta seccompProfile en $f"; exit 1; }
  fi
done

echo 'Validaciones de hardening K8s OK'
