# bitnami-redis-arm64-docker-build
Build bitnami redis docker image on arm64

## TODO

- [x] bitnami/redis: https://github.com/bitnami/bitnami-docker-redis
- [ ] bitnami/redis-sentinel: https://github.com/bitnami/bitnami-docker-redis-sentinel
- [ ] bitnami/redis-sentinel-exporter: already deleted
- [ ] bitnami/redis-cluster: https://github.com/bitnami/bitnami-docker-redis-cluster
- [x] bitnami/redis-exporter: https://github.com/bitnami/bitnami-docker-redis-exporter
- [ ] bitnami/bitnami-shell: https://github.com/bitnami/bitnami-docker-bitnami-shell
- [ ] support multi version

## 1. 基础镜像

使用 https://github.com/bitnami/minideb ，已经提供 arm64 镜像

## 2. 组件（components）

Bitnami 的镜像使用类似于：

    RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "redis" "6.2.4-0" --checksum 58126d2082f8d9b76bd1a932972492b69d729d7e0f130b9ae3e359107448eba2

的方式安装组件，所以需要编译 arm64 的不同组件，编译完成后，修改 `DOWNLOAD_URL="https://downloads.bitnami.com/files/stacksmith"`为
arm64的下载地址。

分别在M1 Macbook或者Arm Linux上执行 `componets/<name>/build.sh`，然后将对应的包上传到BOS上。

### 2.1 wait-for-port

- src：<https://github.com/bitnami/wait-for-port>
- fork: https://github.com/ninehills/wait-for-port

Fork后手动触发github actions，编译产出就有arm64的包，手动release为如下链接：

<https://github.com/ninehills/wait-for-port/releases/download/v1.0/wait-for-port-linux-arm64.tar.gz>


### 2.2 gosu

- src: <https://github.com/tianon/gosu/releases>

官方提供arm64的包

### 2.3 redis

- src: <https://github.com/redis/redis/releases>

需要自行编译为arm64

### 2.4 redis-exporter

- src: <https://github.com/oliver006/redis_exporter/>

官方提供arm64的包，只需要集成


