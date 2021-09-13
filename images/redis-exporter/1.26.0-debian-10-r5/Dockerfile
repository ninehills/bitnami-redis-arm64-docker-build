FROM docker.io/bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="arm64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux"

COPY prebuildfs /
COPY output/redis-exporter-1.26.0-0-linux-arm64-debian-10.tar.gz /tmp/bitnami/pkg/cache/
# Install required system packages and dependencies
RUN install_packages ca-certificates curl gzip procps tar wget
RUN tar -zxf /tmp/bitnami/pkg/cache/redis-exporter-1.26.0-0-linux-arm64-debian-10.tar.gz -P --transform 's|^[^/]*/files|/opt/bitnami|' --wildcards '*/files' && \
    rm -rf /tmp/bitnami/pkg/cache/redis-exporter-1.26.0-0-linux-arm64-debian-10.tar.gz
RUN chmod g+rwX /opt/bitnami

ENV BITNAMI_APP_NAME="redis-exporter" \
    BITNAMI_IMAGE_VERSION="1.26.0-debian-10-r5" \
    PATH="/opt/bitnami/redis-exporter/bin:$PATH"

EXPOSE 9121

WORKDIR /opt/bitnami/redis-exporter
USER 1001
ENTRYPOINT [ "redis_exporter" ]
