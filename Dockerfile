FROM ruby:2.5-slim AS base

RUN apt-get -o Acquire::GzipIndexes=false update -qq && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	curl \
	vim \
	apt-show-versions

RUN mkdir /jump_cloud
WORKDIR /jump_cloud

FROM base

ADD Gemfile /jump_cloud/Gemfile
ADD Gemfile.lock /jump_cloud/Gemfile.lock
ADD jump_cloud.gemspec /jump_cloud/jump_cloud.gemspec
ADD lib/jump_cloud/version.rb /jump_cloud/lib/jump_cloud/version.rb
RUN bundle install

ADD . /jump_cloud
