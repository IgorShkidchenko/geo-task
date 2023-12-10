FROM ruby:3.2.1-alpine

RUN apk add build-base tzdata git postgresql-dev

ENV APP_DIR /app

WORKDIR $APP_DIR

COPY Gemfile $APP_DIR
COPY Gemfile.lock $APP_DIR

RUN gem i bundler -v $(tail -1 Gemfile.lock | tr -d ' ')

RUN bundle config set force_ruby_platform true
RUN bundle install
