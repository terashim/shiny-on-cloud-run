#!/bin/bash

set -eux

cd "$(dirname ${BASH_SOURCE:-0})/.."

docker compose build
docker compose push
gcloud run services replace service.yaml --project=shiny-on-cloud-run
