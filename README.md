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


## For GitLab CI

Here is an example `.gitlab-ci.yml` for Rails application.

```yaml
image: huacnlee/rails-docker-build:latest
services:
   - postgres:9.5-alpine
   - elasticsearch:5-alpine
   - redis:3.2.7-alpine

cache:
  paths:
    - vendor/bundle
    - node_modules

variables:
  BUNDLE_PATH: vendor/bundle
  POSTGRES_HOST: postgres
  POSTGRES_DB: my-rails-app-test
  POSTGRES_PASSWORD: ""
  RAILS_ENV: test
  ELASTICSEARCH_HOST: elasticsearch:9200
  REDIS_URL: redis://redis:6379/1

before_script:
  - yarn -s
  - bundle install --quiet

build:
 stage: build
 script:
   - bunlde exec rake db:migrate
   - bunlde exec rails test
```