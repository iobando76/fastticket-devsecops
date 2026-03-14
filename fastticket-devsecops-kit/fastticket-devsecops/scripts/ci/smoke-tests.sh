#!/usr/bin/env bash
set -euo pipefail

echo "[Smoke] API root"
curl --fail --silent http://localhost:5000/ | grep -qi 'api\|funcionando\|eventos'

echo "[Smoke] Frontend root"
curl --fail --silent http://localhost:4173/ | grep -qi '<html'

echo "[Smoke] Eventos endpoint"
STATUS=$(curl -s -o /tmp/eventos.json -w '%{http_code}' http://localhost:5000/api/eventos)
if [[ "$STATUS" != "200" && "$STATUS" != "500" ]]; then
  echo "Respuesta inesperada en /api/eventos: $STATUS"
  exit 1
fi

echo "Smoke tests completados"
