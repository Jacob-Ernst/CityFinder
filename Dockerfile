ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-alpine

RUN apk add --update --no-cache \
    bash \
    gcompat \
    git \
    build-base \
    curl \
    postgresql-dev \
    postgresql-client \
    tzdata

# Configure bundler and PATH
ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

# Upgrade RubyGems and install required Bundler version
ARG RUBYGEMS_VERSION
ARG BUNDLER_VERSION
RUN gem update --system $RUBYGEMS_VERSION && \
    gem install bundler:$BUNDLER_VERSION

# Create a directory for the app code
RUN mkdir -p /app

WORKDIR /app
