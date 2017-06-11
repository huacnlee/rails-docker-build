FROM alpine:3.4

RUN apk --no-cache update && \
    apk --no-cache add bash python py-pip py-setuptools ca-certificates groff less && \
    apk --no-cache add ruby ruby-rdoc && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

RUN gem install bundler --no-document

WORKDIR /data

#CMD ["/bin/bash", "--login"]
#CMD ["gem", "install", "bundler", "--no-document"]
