FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV RAILS_ROOT /usr/src/d-app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
# RUN gem install rails
# RUN rails new . --api
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY . .
RUN bundle install