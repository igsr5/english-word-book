FROM ruby:2.7.1

RUN apt-get update -qq && \
apt-get install -y build-essential \
libpq-dev \
nodejs \
shared-mime-info \
&& rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /web

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
