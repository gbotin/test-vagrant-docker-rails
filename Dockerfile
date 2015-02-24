FROM ruby:2.2.0
MAINTAINER Geoffrey Botin <geoffrey.botin@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev apt-utils

RUN apt-get install -qy nodejs npm

WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
ADD . /app

WORKDIR /app

RUN gem install foreman

EXPOSE 3000

CMD ["foreman", "start"]
