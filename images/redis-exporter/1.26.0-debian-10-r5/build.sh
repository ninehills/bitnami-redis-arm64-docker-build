#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/redis-exporter/1.26.0
bash ./build.sh
cp output/redis-exporter-1.26.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/
bash ./build.sh

cd $now_dir

docker build -f ./Dockerfile -t bitnami/redis-exporter:1.26.0-debian-10-r9-arm64 ./
