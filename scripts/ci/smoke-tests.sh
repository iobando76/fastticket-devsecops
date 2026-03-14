#!/usr/bin/env bash
set -euo pipefail

echo "Smoke test backend"
curl --fail http://localhost:5000/

echo "Smoke test frontend"
curl --fail http://localhost:4173/

echo "Smoke tests OK"
