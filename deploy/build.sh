#!/bin/bash

set -eux

cd "$(dirname ${BASH_SOURCE:-0})/.."

docker compose build
