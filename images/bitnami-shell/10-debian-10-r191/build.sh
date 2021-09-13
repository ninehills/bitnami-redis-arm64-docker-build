#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

docker build -f ./Dockerfile -t bitnami/bitnami-shell:10-debian-10-r191-arm64 ./
