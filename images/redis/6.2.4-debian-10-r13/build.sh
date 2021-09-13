#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/wait-for-port
bash ./build.sh
cd ../redis
bash ./build.sh
cd ../gosu
bash ./build.sh

cd $now_dir
cp ../../../components/wait-for-port/output/wait-for-port-1.0.0-3-linux-arm64-debian-10.tar.gz ./output/
cp ../../../components/redis/output/redis-6.2.4-0-linux-arm64-debian-10.tar.gz ./output/
cp ../../../components/gosu/output/gosu-1.13.0-0-linux-arm64-debian-10.tar.gz ./output/

docker build -f ./Dockerfile -t iregistry.baidu-int.com/public/bitnami/redis:6.2.4-debian-10-r13-arm64 ./
