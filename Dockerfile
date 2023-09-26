FROM ruby:latest

# Install Node.js, npm, yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN gem install bundler && gem install rails && npm install -g yarn
# RUN bundle install

RUN mkdir /app
WORKDIR /app
COPY . .

EXPOSE 3000

COPY docker/start-app /usr/local/bin/start-app
RUN chmod +x /usr/local/bin/start-app

ENTRYPOINT [ "start-app" ]