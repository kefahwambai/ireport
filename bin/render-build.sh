#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# bundle exec rake assets:clean
# bundle exec rake db:seed
bundle exec rake db:migrate
