#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/mongodb-exporter/0.10.0
bash ./build.sh
cp output/mongodb-exporter-0.10.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/mongodb-exporter:0.10.0-debian-10-r58-arm64 ./
