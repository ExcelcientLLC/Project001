class Goal < ActiveRecord::Base
  attr_accessible :complete, :target_date, :target_expenditures, :target_value, :client, :goal_category_id, :name
  
  belongs_to :client
  belongs_to :goal_category
end
