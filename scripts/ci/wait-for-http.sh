#!/usr/bin/env bash
set -euo pipefail

URL="${1:-}"
TIMEOUT="${2:-60}"

if [ -z "$URL" ]; then
  echo "Uso: wait-for-http.sh <url> <timeout>"
  exit 1
fi

for ((i=1; i<=TIMEOUT; i++)); do
  if curl -fsS "$URL" >/dev/null 2>&1; then
    echo "Servicio disponible en $URL"
    exit 0
  fi
  echo "Esperando $URL ... ($i/$TIMEOUT)"
  sleep 1
done

echo "Timeout esperando $URL"
exit 1
