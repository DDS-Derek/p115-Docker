FROM python:3.14-alpine3.21

ENV TZ=Asia/Shanghai \
    PYTHONUNBUFFERED=1

COPY requirements.txt /requirements.txt

RUN set -ex && \
    apk add --no-cache bash tzdata && \
    apk add --no-cache --virtual=build-dependencies \
        binutils \
        clang \
        gcc \
        build-base \
        g++ \
        cargo \
        rust \
        libffi-dev \
        zlib-dev && \
    pip install --no-cache --upgrade pip && \
    pip install --no-cache -r /requirements.txt && \
    apk del --purge build-dependencies
