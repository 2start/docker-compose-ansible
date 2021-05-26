FROM docker:latest

RUN apk add --no-cache bash cargo git py3-pip python3-dev libffi-dev openssl-dev curl gcc libc-dev make build-base && \
    pip3 install docker-compose ansible poetry
