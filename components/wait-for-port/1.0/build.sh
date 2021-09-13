#!/bin/bash
set -o pipefail
set -eu

COMPONENT="wait-for-port"
VERSION="1.0.0-3"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/ninehills/wait-for-port/releases/download/v1.0/wait-for-port-linux-arm64.tar.gz"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O wait-for-port-linux-arm64.tar.gz
tar zxf wait-for-port-linux-arm64.tar.gz

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp wait-for-port-linux-arm64 ${BITNAMI_PACKAGE}/files/common/bin/wait-for-port
chmod +x ${BITNAMI_PACKAGE}/files/common/bin/wait-for-port

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../