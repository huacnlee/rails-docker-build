FROM ruby:2.4.1-alpine

RUN apk --no-cache update

RUN apk --update add ruby-dev

RUN apk --update add build-base libffi-dev

RUN apk --no-cache add python-dev python py-pip py-setuptools ca-certificates groff less
RUN pip install --upgrade pip

RUN pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*
