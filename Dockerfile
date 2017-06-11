FROM alpine:3.4

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
    apk --no-cache add ruby ruby-rdoc && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

WORKDIR /data
