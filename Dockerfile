FROM alpine:latest

ENV LANG=C.UTF-8 \
    PORT=8086 \
    PASSWORD="fnosnb"

WORKDIR /app

COPY fnos-qb-proxy_debian-arm64 /usr/local/bin/fnos-qb-proxy

RUN chmod +x /usr/local/bin/fnos-qb-proxy && \
    echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories && \
    echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories && \
    apk add --no-cache bash

# 仅保留有效参数：--password 和 --port（移除 --uds）
CMD ["sh", "-c", "fnos-qb-proxy --password $PASSWORD --port $PORT"]
