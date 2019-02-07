FROM ruby:2.5.1
WORKDIR /srv/infbase
ADD Gemfile* /srv/infbase/
RUN bundle install
RUN gem install foreman
ADD . .
CMD foreman start