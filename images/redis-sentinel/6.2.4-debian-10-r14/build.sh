#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/redis-sentinel/6.2.4
bash ./build.sh
cp output/redis-sentinel-6.2.4-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../gosu/1.13.0
bash ./build.sh
cp output/gosu-1.13.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/redis-sentinel:6.2.4-debian-10-r14-arm64 ./
