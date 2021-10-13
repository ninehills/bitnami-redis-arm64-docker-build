#!/bin/bash
set -o pipefail
set -eu

COMPONENT="render-template"
VERSION="1.0.0-3"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/bitnami/render-template/releases/download/v1.0/render-template-arm64"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O render-template-arm64

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp render-template-arm64 ${BITNAMI_PACKAGE}/files/common/bin/render-template
chmod +x ${BITNAMI_PACKAGE}/files/common/bin/render-template

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
