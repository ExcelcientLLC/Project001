# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.delete_all
Visit.delete_all
Goal.delete_all
GoalCategory.delete_all


GoalCategory.create([
	{name: 'Boat', priority: 5},
	{name: 'Car', priority: 3},
	{name: 'House', priority: 2}
])  

clients = Client.create([
	{ id: 1, first_name: 'Test01', last_name: 'Tricity', email: 'alectricity@gmail.com', phone: '748-389-1793',
	address: '8437 Electric Drive', city: 'Denver', state: 'Colorado', zip: '49837',
	comment: 'This guy works as an electrician'},
	{ id: 2, first_name: 'Test02', last_name: ' Gator', email: 'aligator@yahoo.com', phone: '893-487-3976',
	address: '8496 Litigation Court', city: 'New Orlines', state: 'Louisiana', zip: '89593',
	comment: 'She is a lawyer from New Orleans'},
	{ id: 3, first_name: 'Test03', last_name: 'Thetires', email: 'aaronthetires@gmail.com', phone: '748-389-1793',
	address: '8437 Flat Tire Crossing', city: 'Nashville', state: 'Tennissee', zip: '49837',
	comment: 'This guy works at firestone and as a sevice man for Nascar on weekends'},
	{ id: 4, first_name: 'Test04', last_name: 'Rudder', email: 'aberudder@yahoo.com', phone: '893-487-3976',
	address: '8496 Kinsman Court', city: 'Homeville', state: 'Oklahoma', zip: '89593',
	comment: 'He is related to Kyle so be sure to remember that bit. Also, he is an avid bird watcher'},
	{ id: 5, first_name: 'Test05', last_name: 'Birthday', email: 'abbiebirthday@hotmail.com', phone: '845-999-3759',
	address: '8503 21st St.', city: 'New York', state: 'New York', zip: '59049',
	comment: 'She just turned 21 and is off to a great start with her savings for someone so young'},
	{ id: 6, first_name: 'Test06', last_name: 'Willan', email: 'ablenwillan@gmail.com', phone: '748-389-1793',
	address: '8437 Helper Drive', city: 'Boston', state: 'Massachusetts', zip: '49837',
	comment: 'He is always there to help and never lets down a friend in need'},
	{ id: 7, first_name: 'Test07', last_name: 'Meway', email: 'adammeway@yahoo.com', phone: '893-487-3976',
	address: '8496 Hastey Court.', city: 'New York', state: 'New York', zip: '89593',
	comment: 'He is always in a hurry and sort of bossy in general so be carflul to have what he needs ahead of time'},
	{ id: 8, first_name: 'Test08', last_name: ' Sapple', email: 'adamsapple@hotmail.com', phone: '845-999-3759',
	address: '8503 31st St.', city: 'Fargo', state: 'North Dakota', zip: '59049',
	comment: 'He is a nice guy. You can recognize him by his prominant adams apple.'},
	{ id: 9, first_name: 'Test09', last_name: 'Gore-Rythim', email: 'algorerythim@yahoo.com', phone: '893-487-3976',
	address: '8496 Mathway Drive', city: 'Boston', state: 'Massachusetts', zip: '89593',
	comment: 'He is a math professor and will calculate everything you do in his head. Give him time and let him double check you.'},
	{ id: 10, first_name: 'Test10', last_name: 'Kaseltzer', email: 'alkaseltzer@hotmail.com', phone: '845-999-3759',
	address: '8503 21st St.', city: 'Los Angelis', state: 'California', zip: '59049',
	comment: 'He may neeed a break mid meeting to take an Alka-Seltzer '}
#	{ id: 11, first_name: 'Alex Blaine', last_name: 'Layder', email: 'alexblainelayder@yahoo.com', phone: '893-487-3976',
#	address: '8496 Procrastination Court', city: 'Portland', state: 'Oregon', zip: '89593',
#	comment: 'He always says he will explain later but never gets around to it. Persist.'},
#	{ id: 12, first_name: 'Alf', last_name: 'Abet', email: 'alfabet@hotmail.com', phone: '845-999-3759',
#	address: '8503 A St.', city: 'New York', state: 'New York', zip: '59049',
#	comment: 'An english teacher'},
#	{ id: 13, first_name: 'Andy', last_name: 'Gravity', email: 'andygravity@gmail.com', phone: '748-389-1793',
#	address: '8437 Huston ct.', city: 'Orlando', state: 'Florida', zip: '49837',
#	comment: 'This guy stayed on the space station longer than anybody else'},
#	{ id: 14, first_name: 'Anita', last_name: 'Bath', email: 'anitabath@yahoo.com', phone: '893-487-3976',
#	address: '8496 Dirty Road.', city: 'Cheyenne', state: 'Wyoming', zip: '89593',
#	comment: 'She is a rancher and sometimes comes in coverd in dust'},
#	{ id: 15, first_name: 'Ann B.', last_name: 'Dextrous', email: 'annbdextrous@hotmail.com', phone: '845-999-3759',
#	address: '8503 31st St.', city: 'Fargo', state: 'North Dakota', zip: '59049',
#	comment: 'She does everyting with two hands.'},
#	{ id: 16, first_name: 'Anna', last_name: 'Mull', email: 'annamull@yahoo.com', phone: '893-487-3976',
#	address: '8496 Zoo Drive', city: 'Boston', state: 'Massachusetts', zip: '89593',
#	comment: 'She is a cat lady.'},
#	{ id: 17, first_name: 'Anne T.', last_name: 'Lope', email: 'annetlope@hotmail.com', phone: '845-999-3759',
#	address: '8503 21st St.', city: 'Los Angelis', state: 'California', zip: '59049',
#	comment: 'She can run really fast.'}
])
#Visit.delete_all
visits = Visit.create([ 
	{visit_date: Date.today - rand(10).days, client: clients[0]},
	{visit_date: Date.today - rand(10).days, client: clients[1]},
	{visit_date: Date.today - rand(10).days, client: clients[2]},
	{visit_date: Date.today + rand(10).days, client: clients[2]},
	{visit_date: Date.today - rand(100).days, client: clients[2]},
	{visit_date: Date.today + rand(100).days, client: clients[2]},
	{visit_date: Date.today - rand(3).days, client: clients[2]},
	{visit_date: Date.today + rand(3).days, client: clients[2]},
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[4]},
	{visit_date: Date.today - rand(10).days, client: clients[5]},
	{visit_date: Date.today - rand(10).days, client: clients[6]},
	{visit_date: Date.today - rand(10).days, client: clients[7]},
	{visit_date: Date.today - rand(10).days, client: clients[8]},
	{visit_date: Date.today - rand(10).days, client: clients[9]}
])

	
#Goal.delete_all
#Goal.create( target_date: Date.today - rand(10).days, target_value: 9000, current_value: 5,
#	 target_expenditures: 40, current_expenditures: 30, complete: false, visit: visits.first)
Goal.create([
	{name: 'Goal01a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 1, visit: visits[0] },
	{name: 'Goal02a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 2, visit: visits[0] },
	{name: 'Goal03a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 3, visit: visits[0] },


	{name: 'Goal01', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[1] },
	{name: 'Goal02', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[2] },
	{name: 'Goal03', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[3] },
	{name: 'Goal04', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[4] },
	{name: 'Goal05', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[5] }


#	{name: 'Goal02', target_date: Date.today + rand(100).days, target_value: 9000, current_value: 5,
#		target_expenditures: 40, current_expenditures: 30, complete: false, visit: visits[1]},
#	{name: 'Goal03', target_date: Date.today + rand(100).days, target_value: 9000, current_value: 5,
#		target_expenditures: 40, current_expenditures: 30, complete: false, visit: visits[2]}
])
	
#GoalCategory.delete_all
#GoalCategory.create( name: 'Boat', priority: 5)  
	
