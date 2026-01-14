FROM ruby:3.3.5

# Install system dependencies INCLUDING Node.js
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]
