#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/redis/6.2.5
bash ./build.sh
cp output/redis-6.2.5-1-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../gosu/1.14.0
bash ./build.sh
cp output/gosu-1.14.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/redis-cluster:6.2.5-debian-10-r32-arm64 ./
