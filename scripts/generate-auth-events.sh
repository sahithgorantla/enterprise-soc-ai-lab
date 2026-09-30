#!/usr/bin/env bash

set -euo pipefail

: "${ELASTIC_PASSWORD:?Set ELASTIC_PASSWORD first}"

ELASTIC_URL="https://172.16.17.1:9200"
INDEX="lab-security-events"

TS=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

for i in $(seq 1 10); do
  curl -sk -u "elastic:${ELASTIC_PASSWORD}" \
    -X POST "${ELASTIC_URL}/${INDEX}/_doc" \
    -H "Content-Type: application/json" \
    -d "{
      \"@timestamp\": \"${TS}\",
      \"event.category\": [\"authentication\"],
      \"event.type\": \"authentication\",
      \"event.action\": \"logon-failure\",
      \"event.outcome\": \"failure\",
      \"user.name\": \"bruteforce-test\",
      \"source.ip\": \"172.16.17.200\"
    }"

  echo
done