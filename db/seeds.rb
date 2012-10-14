# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.delete_all
clients = Client.create([
	{ name: 'Alec Tricity', email: 'alectricity@gmail.com', phone: '748-389-1793',
	address: '8437 Electric Drive', city: 'Denver', state: 'Colorado', zip: '49837',
	comment: 'This guy works as an electrician'},
	{ name: 'Ali Gator', email: 'aligator@yahoo.com', phone: '893-487-3976',
	address: '8496 Litigation Court', city: 'New Orlines', state: 'Louisiana', zip: '89593',
	comment: 'She is a lawyer from New Orlines'},
	{ name: 'Aaron Thetires', email: 'aaronthetires@gmail.com', phone: '748-389-1793',
	address: '8437 Flat Tire Crossing', city: 'Nashville', state: 'Tennissee', zip: '49837',
	comment: 'This guy works at firestone and as a sevice man for Nascar on weekends'},
	{ name: 'Abe Rudder', email: 'aberudder@yahoo.com', phone: '893-487-3976',
	address: '8496 Kinsman Court', city: 'Homeville', state: 'Oklahoma', zip: '89593',
	comment: 'He is related to Kyle so be sure to remember that bit. Also, he is an avid bird watcher'},
	{ name: 'Abbie Birthday', email: 'abbiebirthday@hotmail.com', phone: '845-999-3759',
	address: '8503 21st St.', city: 'New York', state: 'New York', zip: '59049',
	comment: 'She just turned 21 and is off to a great start with her savings for someone so young'},
	{ name: 'Abel N. Willan', email: 'ablenwillan@gmail.com', phone: '748-389-1793',
	address: '8437 Helper Drive', city: 'Boston', state: 'Massachusetts', zip: '49837',
	comment: 'He is always there to help and never lets down a friend in need'},
	{ name: 'Adam Meway', email: 'adammeway@yahoo.com', phone: '893-487-3976',
	address: '8496 Hastey Court.', city: 'New York', state: 'New York', zip: '89593',
	comment: 'He is always in a hurry and sort of bossy in general so be carflul to have what he needs ahead of time'},
	{ name: 'Adam Sapple', email: 'adamsapple@hotmail.com', phone: '845-999-3759',
	address: '8503 31st St.', city: 'Fargo', state: 'North Dakota', zip: '59049',
	comment: 'He is a nice guy. You can recognize him by his prominant adams apple.'},
	{ name: 'Al Gore-Rythim', email: 'algorerythim@yahoo.com', phone: '893-487-3976',
	address: '8496 Mathway Drive', city: 'Boston', state: 'Massachusetts', zip: '89593',
	comment: 'He is a math professor and will calculate everything you do in his head. Give him time and let him double check you.'},
	{ name: 'Al Kaseltzer', email: 'alkaseltzer@hotmail.com', phone: '845-999-3759',
	address: '8503 21st St.', city: 'Los Angelis', state: 'California', zip: '59049',
	comment: 'He may neeed a break mid meeting to take an Alka-Seltzer '}
])
	
