class GoalState < ActiveRecord::Base
  attr_accessible :current_expenditures, :current_value, :visit

  belongs_to :goal
  belongs_to :visit
end
