FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rdf-doi
WORKDIR /rdf-doi
COPY Gemfile /rdf-doi/Gemfile
COPY Gemfile.lock /rdf-doi/Gemfile.lock
RUN bundle install
COPY . /rdf-doi