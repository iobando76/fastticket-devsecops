#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:?Target URL requerida}"
mkdir -p reports/zap

docker run --rm \
  --network host \
  -v "$(pwd)/reports/zap:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t "$TARGET" \
  -J zap.json \
  -r zap.html \
  -m 3 \
  -I

python3 - <<'PY'
import json, pathlib, sys
p = pathlib.Path('reports/zap/zap.json')
if not p.exists():
    print('No se generó reporte ZAP')
    sys.exit(1)
report = json.loads(p.read_text())
site = report.get('site', [])
count = 0
for s in site:
    for alert in s.get('alerts', []):
        risk = str(alert.get('riskcode', '0'))
        if risk in {'2', '3'}:  # medium/high
            count += 1
print(f'ZAP medium/high alerts: {count}')
if count > 0:
    sys.exit(1)
PY
