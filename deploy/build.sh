#!/bin/bash
# ShinyアプリのDockerイメージをビルドする

set -eux

cd "$(dirname ${BASH_SOURCE:-0})"

source ./params.sh
docker build -t $IMAGE_TAG ..
