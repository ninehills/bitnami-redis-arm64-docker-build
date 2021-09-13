FROM docker.io/bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="arm64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux" \
    PATH="/opt/bitnami/redis-sentinel/bin:/opt/bitnami/common/bin:$PATH"

COPY prebuildfs /
COPY output/redis-sentinel-exporter-1.7.1-1-linux-arm64-debian-10.tar.gz /tmp/bitnami/pkg/cache/
# Install required system packages and dependencies
RUN install_packages ca-certificates curl gzip procps tar wget
RUN tar -zxf /tmp/bitnami/pkg/cache/redis-sentinel-exporter-1.7.1-1-linux-arm64-debian-10.tar.gz -P --transform 's|^[^/]*/files|/opt/bitnami|' --wildcards '*/files' && \
    rm -rf /tmp/bitnami/pkg/cache/redis-sentinel-exporter-1.7.1-1-linux-arm64-debian-10.tar.gz
RUN chmod g+rwX /opt/bitnami


ENV BITNAMI_APP_NAME="redis-sentinel-exporter" \
    BITNAMI_IMAGE_VERSION="1.7.1-debian-10-r161" \
    PATH="/opt/bitnami/redis-sentinel-exporter/bin:$PATH"

EXPOSE 9355
WORKDIR /opt/bitnami/redis-sentinel-exporter/bin

USER 1001
ENTRYPOINT [ "redis_sentinel_exporter" ]
