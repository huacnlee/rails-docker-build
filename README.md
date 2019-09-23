# Rails Docker Build

Docker Image for Rails application build in CI.

## Including packages

- PostgreSQL, MySQL, SQLite dev support
- Ruby 2.6, Rails 6 support
- ImageMagick
- Node.js
- Yarn
- Docker
- AWS CLI
- Python Dev
- Git, Curl, Cmake

## Base version

- Alpine Linux 3.10
- Ruby 2.6.4
- Bundler 2.0.2
- Node.js 12.4.0
- Yarn 1.16.0

## For GitLab CI

Here is an example `.gitlab-ci.yml` for Rails application.

```yaml
image: huacnlee/rails-docker-build:latest
services:
   - postgres:9.5-alpine
   - elasticsearch:5-alpine
   - redis:3.2.7-alpine

.default-cache:
  cache:
    key: "rails-docker-normal-cache"
    paths:
      - .bundle/
      - vendor/ruby/
      - vendor/cache/
      - .yarn-cache/
      - node_modules/
      - tmp/cache/webpacker/
      - tmp/cache/assets/
    policy: pull

variables:
  BUNDLE_PATH: vendor/bundle
  POSTGRES_HOST: postgres
  POSTGRES_DB: my-rails-app-test
  POSTGRES_PASSWORD: ""
  RAILS_ENV: test
  ELASTICSEARCH_HOST: elasticsearch:9200
  REDIS_URL: redis://redis:6379/1


install:
  stage: install
  extends: .default-cache
  cache:
    policy: pull-push
  script:
    - ls -lh vendor
    - ls -lh node_modules
    - bundle config mirror.https://rubygems.org https://gems.ruby-china.com
    - bundle package
    - yarn config set registry https://registry.npm.taobao.org/
    - bundle install --path vendor -j $(nproc)
    - yarn install --cache-folder .yarn-cache

build:
 extends: .default-cache
 stage: build
 script:
   - bundle install --path vendor -j $(nproc)
   - yarn install --cache-folder .yarn-cache
   - bunlde exec rake db:migrate
   - bunlde exec rails test

build_assets:
 extends: .default-cache
 stage: build
 cache:
   policy: pull-push
 script:
   - bundle install --path vendor -j $(nproc)
   - yarn install --cache-folder .yarn-cache
   - bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=fake_secure_for_compile
```