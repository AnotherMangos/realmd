FROM ubuntu:14.04

ARG BUILD_PATH

RUN apt-get update && \
    apt-get install -y libmysql++-dev mysql-client realpath && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

WORKDIR /config

COPY ${BUILD_PATH}/realmd /bin

COPY ${BUILD_PATH}/realmd.conf .

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]