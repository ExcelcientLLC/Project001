class Goal < ActiveRecord::Base
  attr_accessible :complete, :current_expenditures, :current_value, :target_date, :target_expenditures, :target_value, :visit, :goal_category_id, :name
  
  belongs_to :visit
  belongs_to :goal_category
end
