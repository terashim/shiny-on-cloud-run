#!/bin/bash
# ShinyアプリのDockerイメージをローカル環境で起動する

set -eux
cd "$(dirname ${BASH_SOURCE:-0})"

source ./params.sh
LOCAL_PORT=8080

echo "Shinyアプリを http://localhost:$LOCAL_PORT で起動します..."
docker run --rm -p $LOCAL_PORT:$PORT $IMAGE_TAG
