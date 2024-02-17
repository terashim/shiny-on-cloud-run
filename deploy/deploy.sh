#!/bin/bash
# ShinyアプリのDockerイメージをビルドし、Cloud Runにデプロイする

set -eux
cd "$(dirname ${BASH_SOURCE:-0})"
source ./params.sh

bash ./build.sh
bash ./push.sh

gcloud run deploy $SERVICE_NAME \
    --image=$IMAGE_TAG \
    --max-instances=$MAX_INSTANCES \
    --min-instances=$MIN_INSTANCES \
    --timeout=$TIMEOUT \
    --port=$PORT \
    --session-affinity \
    --allow-unauthenticated \
    --project=$PROJECT \
    --region=$REGION
