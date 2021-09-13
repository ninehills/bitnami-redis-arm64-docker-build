#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/redis-exporter
bash ./build.sh

cd $now_dir
cp ../../../components/redis-exporter/output/redis-exporter-1.24.0-0-linux-arm64-debian-10.tar.gz ./output/

docker build -f ./Dockerfile -t iregistry.baidu-int.com/public/bitnami/redis-exporter:1.24.0-debian-10-r9-arm64 ./
