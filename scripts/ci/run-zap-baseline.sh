#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-http://localhost:4173}"

mkdir -p reports/zap

docker run --rm \
  --network host \
  -v "$(pwd)/reports/zap:/zap/wrk/:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t "$TARGET" -r zap-report.html -J zap-report.json -m 3

echo "ZAP baseline completado"
