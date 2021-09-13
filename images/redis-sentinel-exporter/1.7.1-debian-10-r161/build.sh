#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/redis-sentinel-exporter/1.7.1
bash ./build.sh
cp output/redis-sentinel-exporter-1.7.1-1-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/redis-sentinel-exporter:1.7.1-debian-10-r161-arm64 ./
