#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/wait-for-port/1.0
bash ./build.sh
cp output/wait-for-port-1.0.0-3-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../redis/6.2.4
bash ./build.sh
cp output/redis-6.2.4-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../gosu/1.13.0
bash ./build.sh
cp output/gosu-1.13.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/redis:6.2.4-debian-10-r13-arm64 ./
