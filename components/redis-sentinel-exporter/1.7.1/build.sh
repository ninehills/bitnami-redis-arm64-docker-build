#!/bin/bash
set -o pipefail
set -eu

COMPONENT="redis-sentinel-exporter"
VERSION="1.7.1-1"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/ninehills/redis_sentinel_exporter/releases/download/v1.7.1/redis_sentinel_exporter_arm64"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O redis_sentinel_exporter_arm64
chmod a+x redis_sentinel_exporter_arm64

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp redis_sentinel_exporter_arm64 ${BITNAMI_PACKAGE}/files/${COMPONENT}/bin/redis_sentinel_exporter

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
