# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.delete_all
clients = Client.create([
	{ name: 'Aaron Thetires', email: 'aaronthetires@gmail.com', phone: '748-389-1793',
	address: '8437 Flat Tire Crossing', city: 'Nashville', state: 'Tennissee', zip: '49837',
	comment: 'This guy works at firestone and as a sevice man for Nascar on weekends'},
	{ name: 'Abe Rudder', email: 'aberudder@yahoo.com', phone: '893-487-3976',
	address: '8496 Kinsman Court', city: 'Homeville', state: 'Oklahoma', zip: '89593',
	comment: 'He is related to Kyle so be sure to remember that bit. Also, he is an avid bird watcher'},
	{ name: 'Abbie Birthday', email: 'abbiebirthday@hotmail.com', phone: '845-999-3759',
	address: '8503 21st St.', city: 'New York', state: 'New York', zip: '59049',
	comment: 'She just turned 21 and is off to a great start with her savings for someone so young'}
])
	
