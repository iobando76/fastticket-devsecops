#!/usr/bin/env bash
set -euo pipefail
URL="${1:?URL requerida}"
TIMEOUT="${2:-60}"
for ((i=1;i<=TIMEOUT;i++)); do
  if curl -fsS "$URL" >/dev/null; then
    echo "OK: $URL"
    exit 0
  fi
  sleep 1
done
echo "ERROR: timeout esperando $URL"
exit 1
