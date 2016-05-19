#!/bin/sh

rake db:drop RAILS_ENV="production" 
rake db:create RAILS_ENV="production" 
rake db:migrate RAILS_ENV="development" 
rake db:seed RAILS_ENV="production" 

