# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 't@t.t', visible_name: 'TestUser', password: '1234')
User.create(email: 'rodzyndawid@gmail.com', visible_name: 'Dawid Tomas', password: '1234')