FROM ruby:2.6.1-alpine3.8

RUN apk --no-cache update

RUN gem install bundler

RUN apk --update add build-base libffi-dev ruby-dev nodejs yarn tzdata libc-dev openssl linux-headers postgresql-dev mysql-dev sqlite-dev  \
    libxml2-dev libxslt-dev git curl python-dev python py-pip py-setuptools ca-certificates docker imagemagick groff less
RUN pip install --upgrade pip

RUN pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

