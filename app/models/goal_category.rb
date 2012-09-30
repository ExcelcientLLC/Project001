class GoalCategory < ActiveRecord::Base
  attr_accessible :icon, :name, :priority
  
  has_many :goals
end
