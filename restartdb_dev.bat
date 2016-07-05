@echo off

call rake db:drop RAILS_ENV="development" 
call rake db:create RAILS_ENV="development" 
call rake db:migrate RAILS_ENV="development" 
call rake db:seed RAILS_ENV="development" 

