#!/bin/bash
set -o pipefail
set -eu

version="$1"
repo="bitnami-docker-redis-exporter"
big_version="1"

wget https://codeload.github.com/bitnami/$repo/zip/refs/tags/$version -O $version.tar.gz
unzip $version.tar.gz
cp -r $repo-$version/${big_version}/debian-10 ./$version
rm -r $version.tar.gz $repo-$version
