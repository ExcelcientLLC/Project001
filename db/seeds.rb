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
	{name: 'Boat'},
	{name: 'Car'},
	{name: 'House'}
])  

clients = Client.create([
	{ id: 0, first_name: 'Test01', last_name: 'OneVisit', email: 'Test01@gmail.com', phone: '748-389-1793',
	address: '8437 Electric Drive', city: 'Denver', state: 'Colorado', zip: '49837',
	comment: 'This test client has no visit data, thus no goals with our current db'},
	{ id: 1, first_name: 'Test02', last_name: 'NoGoals', email: 'Test02@yahoo.com', phone: '893-487-3976',
	address: '8496 Litigation Court', city: 'New Orleans', state: 'Louisiana', zip: '89593',
	comment: 'Test client with visits but no goals'},
	{ id: 2, first_name: 'Test03', last_name: 'GoalsNoToDos', email: 'Test03@gmail.com', phone: '748-389-1793',
	address: '8437 Flat Tire Crossing', city: 'Nashville', state: 'Tennissee', zip: '49837',
	comment: 'Test Client with visits and goals, no to-dos'},
	{ id: 3, first_name: 'Test04', last_name: 'VisitsGoalsToDos', email: 'Test04@yahoo.com', phone: '893-487-3976',
	address: '8496 Kinsman Court', city: 'Homeville', state: 'Oklahoma', zip: '89593',
	comment: 'Test client with multiple visits, goals, and todos'}
])

visits = Visit.create([ 
	{visit_date: Date.today - rand(10).days, client: clients[0]},	#Visits 0

	{visit_date: Date.today + rand(10).days, client: clients[1]},	#Visits 1

	{visit_date: Date.today - rand(10).days, client: clients[2]},	#Visits 2
	{visit_date: Date.today + rand(10).days, client: clients[2]},
	{visit_date: Date.today - rand(100).days, client: clients[2]},
	{visit_date: Date.today + rand(100).days, client: clients[2]},
	{visit_date: Date.today - rand(3).days, client: clients[2]},
	{visit_date: Date.today + rand(3).days, client: clients[2]},

	{visit_date: Date.today - rand(10).days, client: clients[3]},	#visits 8
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[3]},
	{visit_date: Date.today - rand(10).days, client: clients[3]}
])

Goal.create([
	{name: 'Goal01a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 1, visit: visits[2] },
	{name: 'Goal02a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 2, visit: visits[2] },
	{name: 'Goal03a', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: 3, visit: visits[2] },
	{name: 'Goal01', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[8] },
	{name: 'Goal02', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[8] },
	{name: 'Goal03', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[8] },
	{name: 'Goal04', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[8] },
	{name: 'Goal05', target_date: Date.today + rand(100).days, target_value: rand(3000), 
		current_value: rand(100), target_expenditures: rand(100), current_expenditures: rand(50), 
		complete: false, goal_category_id: rand(3)+1, visit: visits[8] }
])


ToDo.create([
	{title:'ToDo item 1', description:'Something to do', complete:false},
	{title:'ToDo item 2', description:'To Do Harder', complete:false},
	{title:'ToDo item 3', description:'Some final thing to do', complete:false}
])
