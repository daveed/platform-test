FROM ruby:2.4.1-slim

ENV BUILD_PACKAGES="build-essential" \
    DEV_PACKAGES="libpq-dev" \
    APP_HOME="/var/www/fender-auth"

RUN \

  # linux packages
  apt-get update -qq && apt-get install -y $BUILD_PACKAGES $DEV_PACKAGES && \

  # app directory
  mkdir -p $APP_HOME

# gems link
WORKDIR $APP_HOME

# ruby gem container
ENV BUNDLE_PATH /box

ADD . $APP_HOME

# expose app server
EXPOSE 3000
