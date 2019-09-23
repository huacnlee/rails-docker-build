FROM ruby:2.6.4-alpine3.10

RUN apk --no-cache update

RUN gem install bundler

RUN apk --update add build-base libffi-dev ruby-dev nodejs-current yarn tzdata libc-dev openssl linux-headers postgresql-dev mysql-dev sqlite-dev  \
    libxml2-dev libxslt-dev git curl python-dev python py-pip py-setuptools ca-certificates docker imagemagick groff less
RUN pip install --upgrade pip

# Add UpYun Cli
RUN curl -sSL https://l.ruby-china.com/downloads/upx-linux-amd64-alpine-v0.2.4 -o upx && \
    mv upx /usr/local/bin && \
    chmod +x /usr/local/bin/upx

RUN pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

