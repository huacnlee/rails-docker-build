FROM ruby:2.4.1-alpine

RUN apk --no-cache update

RUN apk --update add ruby-dev

RUN apk --update add build-base libffi-dev
RUN apk add --virtual .builddeps build-base ruby-dev libc-dev openssl linux-headers postgresql-dev \
    libxml2-dev libxslt-dev git curl python-dev python py-pip py-setuptools ca-certificates nodejs
RUN pip install --upgrade pip

RUN pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*
RUN gem install bundler
