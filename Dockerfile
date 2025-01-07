FROM python:3.13-alpine3.21

ENV TZ=Asia/Shanghai \
    PYTHONUNBUFFERED=1

COPY requirements.txt /requirements.txt

RUN set -ex && \
    apk add --no-cache bash tzdata && \
    pip install --no-cache --upgrade pip && \
    pip install --no-cache -r /requirements.txt
