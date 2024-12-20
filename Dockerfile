FROM ruby:3.0-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache gcompat && \
    apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git bash && \
    apk add --virtual build-packages --no-cache build-base curl-dev

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# nokogiri gem でエラー https://qiita.com/ohakutsu/items/4d14bee46da26f55a9be
RUN bundle config set force_ruby_platform true
RUN bundle install

ADD . /myapp

RUN apk del build-packages

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]