FROM docker.io/bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages ca-certificates curl procps sudo unzip wget
COPY output/mongodb-exporter-0.10.0-0-linux-arm64-debian-10.tar.gz /tmp/bitnami/pkg/cache/
RUN tar -zxf /tmp/bitnami/pkg/cache/mongodb-exporter-0.10.0-0-linux-arm64-debian-10.tar.gz -P --transform 's|^[^/]*/files|/opt/bitnami|' --wildcards '*/files' && \
    rm -rf /tmp/bitnami/pkg/cache/mongodb-exporter-0.10.0-0-linux-arm64-debian-10.tar.gz
RUN apt-get update && apt-get upgrade -y && \
    rm -r /var/lib/apt/lists /var/cache/apt/archives
RUN ln -sf /opt/bitnami/mongodb-exporter/bin/mongodb_exporter /bin/mongodb_exporter

ENV BITNAMI_APP_NAME="mongodb-exporter" \
    BITNAMI_IMAGE_VERSION="0.10.0-debian-10-r58" \
    PATH="/opt/bitnami/mongodb-exporter/bin:$PATH"

EXPOSE 9216

WORKDIR /opt/bitnami/mongodb-exporter
USER 1001
ENTRYPOINT [ "mongodb_exporter" ]
