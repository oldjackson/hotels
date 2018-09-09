FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hotels
WORKDIR /hotels
COPY Gemfile /hotels/Gemfile
COPY Gemfile.lock /hotels/Gemfile.lock
RUN bundle install
COPY . /hotels
