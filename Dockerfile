FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential ruby-dev libpq-dev tzdata nodejs yarn

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler && bundle install

COPY . ./app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
