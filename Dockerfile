FROM ruby:2.3.7
LABEL maintainer="matchVote <admin@matchvote.com>"
LABEL version="1.2"

RUN apt-get update \
    && apt-get install -y build-essential libpq-dev nodejs postgresql-client-9.6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

CMD bin/start
