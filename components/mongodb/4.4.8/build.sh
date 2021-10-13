#!/bin/bash
set -o pipefail
set -eu

COMPONENT="mongodb"
VERSION="4.4.8-1"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://fastdl.mongodb.org/linux/mongodb-linux-aarch64-ubuntu1804-4.4.8.tgz"
ARM64_DOWNLOAD_DIR="mongodb-linux-aarch64-ubuntu1804-4.4.8"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O ${ARM64_DOWNLOAD_DIR}.tgz
tar zxf ${ARM64_DOWNLOAD_DIR}.tgz

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

rm -f ${BITNAMI_PACKAGE}/files/mongodb/bin/*
cp ${ARM64_DOWNLOAD_DIR}/bin/* ${BITNAMI_PACKAGE}/files/mongodb/bin/

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
