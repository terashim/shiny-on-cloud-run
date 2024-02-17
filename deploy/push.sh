#!/bin/bash
# ShinyアプリのDockerイメージをArtifact Registryにプッシュする

set -eux

cd "$(dirname ${BASH_SOURCE:-0})"

source ./params.sh
docker push $IMAGE_TAG
