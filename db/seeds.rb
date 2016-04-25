# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CompanyType.create(name: 'school')
CompanyType.create(name: 'company')

t = User.create(email: 't@t.t', visible_name: 'TestUser', password: '1234', permission_level: 0)
levvy = User.create(email: 'levvy@t.t', visible_name: 'Levvy', password: '1234', permission_level: 5)
rodzyn = User.create(email: 'rodzyndawid@gmail.com', visible_name: 'Dawid Tomas', password: '1234', permission_level: 4) #tak wiem, hasło zajebiste :D
grafik = User.create(email: 'tomekbrylinski.39@gmail.com', visible_name: 'Tomek Bryliński', password: '1234', permission_level: 4)

Building.create(name: 'GRM Office', street: 'orla', city: 'Poznan', shortname: 'GRM', company_type_id: 2, user: levvy, dashboard: Dashboard.create)
Building.create(name: 'Zespół Szkół i Placówek Kształcenia Zawodowego w Bielawie', street: 'ul. Żeromskiego 41', city: 'Bielawa', shortname: 'ZSiPKZ w Bielawie', company_type_id: 1, user: rodzyn, dashboard: Dashboard.create)