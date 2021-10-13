#!/bin/bash
set -o pipefail
set -eu 

[[ -d output/ ]] && rm -r output/
mkdir -p output/

now_dir=$PWD

cd ../../../components/mongodb/4.4.8
bash ./build.sh
cp output/mongodb-4.4.8-1-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../gosu/1.13.0
bash ./build.sh
cp output/gosu-1.13.0-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../yq/3.4.1
bash ./build.sh
cp output/yq-3.4.1-0-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../wait-for-port/1.0
bash ./build.sh
cp output/wait-for-port-1.0.0-3-linux-arm64-debian-10.tar.gz $now_dir/output/

cd ../../render-template/1.0.0
bash ./build.sh
cp output/render-template-1.0.0-3-linux-arm64-debian-10.tar.gz $now_dir/output/

cd $now_dir

docker build -f ./Dockerfile -t bitnami/mongodb-sharded:4.4.8-debian-10-r9-arm64 ./
