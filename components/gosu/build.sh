#!/bin/bash
set -o pipefail
set -eu

COMPONENT="gosu"
VERSION="1.13.0-0"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/tianon/gosu/releases/download/1.13/gosu-arm64"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O gosu-arm64

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp gosu-arm64 ${BITNAMI_PACKAGE}/files/common/bin/gosu
chmod +x ${BITNAMI_PACKAGE}/files/common/bin/gosu

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
