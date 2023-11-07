FROM ruby:latest

COPY . /reportsapp
WORKDIR   /reportsapp
RUN bundle install

CMD ["rails", "s"] 
