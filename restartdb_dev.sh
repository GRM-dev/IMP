#!/bin/sh

rake db:drop RAILS_ENV="development" --trace
rake db:create RAILS_ENV="development" --trace
rake db:migrate RAILS_ENV="development" --trace
rake db:seed RAILS_ENV="development" --trace

