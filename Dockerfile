FROM ruby:2.5.1
# I REALLY HATE Nodejs
RUN apt-get update && apt-get install -y curl software-properties-common && curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
WORKDIR /srv/infbase
ADD Gemfile* /srv/infbase/
RUN bundle install
RUN gem install foreman
ADD package* /srv/infbase/
RUN npm install
ADD . .
EXPOSE 3000
CMD foreman start