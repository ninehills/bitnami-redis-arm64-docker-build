#!/bin/bash
set -o pipefail
set -eu

COMPONENT="mongodb-exporter"
VERSION="0.10.0-0"

BITNAMI_DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"
BITNAMI_PACKAGE="${COMPONENT}-${VERSION}-linux-amd64-debian-10"
ARM64_PACKAGE="${COMPONENT}-${VERSION}-linux-arm64-debian-10"
ARM64_DOWNLOAD="https://github.com/percona/mongodb_exporter/archive/refs/tags/v0.10.0.tar.gz"

[[ -d output/ ]] && rm -r output/
mkdir -p output/
cd output/

wget "${ARM64_DOWNLOAD}" -O mongodb_exporter-0.10.0.tar.gz
tar zxf mongodb_exporter-0.10.0.tar.gz
cd mongodb_exporter-0.10.0/
make docker
docker cp $(docker create --rm mongodb-exporter:main):/bin/mongodb_exporter ./mongodb_exporter
cd ../

wget "${BITNAMI_DOWNLOAD_URL}/${BITNAMI_PACKAGE}.tar.gz" -O ${BITNAMI_PACKAGE}.tar.gz
tar zxf ${BITNAMI_PACKAGE}.tar.gz

cp mongodb_exporter-0.10.0/mongodb_exporter ${BITNAMI_PACKAGE}/files/mongodb-exporter/bin

mv ${BITNAMI_PACKAGE} ${ARM64_PACKAGE}
tar zcvf ${ARM64_PACKAGE}.tar.gz ${ARM64_PACKAGE}

cd ../
