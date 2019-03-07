#!/bin/bash

set -eu

CODESHIP_API_URL=${CODESHIP_API_URL:-https://api.codeship.com/v2}
CODESHIP_PROJECT_REF=${CODESHIP_PROJECT_REF:-master}

main(){
  echo "Obtaining auth token..."

  AUTH_TOKEN=$(
    curl -X POST \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        --user "${CODESHIP_USERNAME}:${CODESHIP_PASSWORD}" \
        "${CODESHIP_API_URL}/auth" | jq --raw-output .access_token
  )

  echo "Auth token retrieved."

  echo "Creating build..."

  curl -X POST \
      -H "Content-Type: application/json" \
      -H "Accept: application/json" \
      -H "Authorization: Bearer $AUTH_TOKEN" \
      --data "{ \"ref\": \"heads/$CODESHIP_PROJECT_REF\" }" \
      "${CODESHIP_API_URL}/organizations/${CODESHIP_ORG_UUID}/projects/${CODESHIP_PROJECT_UUID}/builds"

  echo "Build created."
}

main "$@"