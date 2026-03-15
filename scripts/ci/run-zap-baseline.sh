#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-http://frontend:4173}"
WORKDIR="$(pwd)/reports/zap"
NETWORK="${ZAP_DOCKER_NETWORK:-fastticket-devsecops_default}"

mkdir -p "$WORKDIR"

docker run --rm \
  --user root \
  --network "$NETWORK" \
  -v "$WORKDIR:/zap/wrk:rw" \
  -t ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
    -t "$TARGET" \
    -r zap-report.html \
    -J zap-report.json \
    -w zap-report.md \
    -m 3
