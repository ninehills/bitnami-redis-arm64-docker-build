#!/bin/bash
set -o pipefail
set -eu

COMPONENT="redis-sentinel"
VERSION="6.2.4-0"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"

docker build -f ./Dockerfile.build ./ -t redis-build:${VERSION}

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

docker cp $(docker create --rm redis-build:${VERSION}):/usr/local/bin ./bin

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp bin/* ${BITNAMI_PACKAGE}/files/${COMPONENT}/bin/

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
