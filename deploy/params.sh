#!/bin/bash
# ビルドとデプロイに関わるパラメータ

set -eux

cd "$(dirname ${BASH_SOURCE:-0})"

PROJECT=shiny-on-cloud-run
REGION=asia-northeast1
SERVICE_NAME=shiny
REPOSITORY=asia-northeast1-docker.pkg.dev/shiny-on-cloud-run/demo
VERSION=0.1.0
IMAGE_TAG=$REPOSITORY/shiny:$VERSION
MIN_INSTANCES=0
MAX_INSTANCES=4
PORT=8080
TIMEOUT=3600
