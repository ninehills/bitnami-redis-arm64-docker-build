#!/bin/bash
set -o pipefail
set -eu

COMPONENT="redis-exporter"
VERSION="1.24.0-0"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/oliver006/redis_exporter/releases/download/v1.24.0/redis_exporter-v1.24.0.linux-arm64.tar.gz"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O redis_exporter-v1.24.0.linux-arm64.tar.gz
tar zxf redis_exporter-v1.24.0.linux-arm64.tar.gz

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp redis_exporter-v1.24.0.linux-arm64/redis_exporter ${BITNAMI_PACKAGE}/files/redis-exporter/bin

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
