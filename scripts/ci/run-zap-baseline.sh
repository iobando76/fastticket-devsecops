#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-http://localhost:4173}"
WORKDIR="$(pwd)/zap-output"

mkdir -p "$WORKDIR"

docker run --rm \
  --user root \
  -v "$WORKDIR:/zap/wrk:rw" \
  -t ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
    -t "$TARGET" \
    -r zap-report.html \
    -J zap-report.json \
    -w zap-report.md \
    -m 3
