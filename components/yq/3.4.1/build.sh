#!/bin/bash
set -o pipefail
set -eu

COMPONENT="yq"
VERSION="3.4.1-0"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_arm64"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O yq_linux_arm64

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp yq_linux_arm64 ${BITNAMI_PACKAGE}/files/common/bin/yq
chmod +x ${BITNAMI_PACKAGE}/files/common/bin/yq

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
