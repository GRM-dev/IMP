# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cp_s = CompanyType.create(name: 'school')
cp_c = CompanyType.create(name: 'company')

LogType.create(name: "Trace", rank: 1)
LogType.create(name: "Info", rank: 2)
LogType.create(name: "Warning", rank: 3)
LogType.create(name: "Error", rank: 4)

r_nu = SiteRole.create(name: 'new_user', rank: 0)
r_u = SiteRole.create(name: 'user', rank: 1)
r_mod = SiteRole.create(name: 'moderator', rank: 2)
r_hmod = SiteRole.create(name: 'head_moderator', rank: 3)
r_admin = SiteRole.create(name: 'administrator', rank: 4)
r_hadmin = SiteRole.create(name: 'head_administrator', rank: 5)

DashboardRole.create(name: 'spectator', rank: 0)
DashboardRole.create(name: 'upper_spectator', rank: 1)
DashboardRole.create(name: 'worker', rank: 10)
DashboardRole.create(name: 'student', rank: 11)
DashboardRole.create(name: 'building_admin', rank: 20)
DashboardRole.create(name: 'building_keeper', rank: 30)

LabRole.create(name: 'spectator', rank: 0)
LabRole.create(name: 'upper_spectator', rank: 1)
LabRole.create(name: 'worker', rank: 10)
LabRole.create(name: 'student', rank: 11)
LabRole.create(name: 'lab_admin', rank: 20)
LabRole.create(name: 'lab_keeper', rank: 30)

Widget.create(name: 'weather')
Widget.create(name: 'laboratories')
Widget.create(name: 'workstations')

c_pl = Country.create(name: 'Poland', code: 'pl')
c_enus = Country.create(name: 'United States', code: 'en-us')
c_se = Country.create(name: 'Sweden', code: 'se')

avatar_def = Avatar.create()

t = User.create(email: 't@t.t', visible_name: 'TestUser', password: '1234', site_role: r_nu, age: DateTime.new(2016,05,06))
levvy = User.create(email: 'levvy@t.t', visible_name: 'Levvy', password: '1234', site_role: r_hadmin, age: DateTime.new(1994,05,02))
rodzyn = User.create(email: 'rodzyndawid@gmail.com', visible_name: 'Dawid Tomas', password: '1234', site_role: r_admin, age: DateTime.new(1998,06,01)) #Yea, we know. This password is awesome! :D
grafik = User.create(email: 'tomekbrylinski.39@gmail.com', visible_name: 'Tomek Bryliński', password: '1234', site_role: r_hmod, age: DateTime.new(1997,10,02))
grafik = User.create(email: 'anakin165@wp.pl', visible_name: 'Hammerek', password: '1234', site_role: r_hmod, age: DateTime.new(1998,06,22))

Building.create(name: 'GRM Office', street: 'orla', city: 'Poznan', shortname: 'GRM', company_type: cp_c, user: levvy, country: c_pl, dashboard: Dashboard.create)
Building.create(name: 'Zespół Szkół i Placówek Kształcenia Zawodowego w Bielawie', street: 'ul. Żeromskiego 41', city: 'Bielawa', shortname: 'ZSiPKZ w Bielawie', company_type: cp_s, user: rodzyn, country: c_pl, dashboard: Dashboard.create)
