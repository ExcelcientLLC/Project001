class GoalState < ActiveRecord::Base
  attr_accessible :current_expenditures, :current_value, :visit

  belongs_to :goal
  belongs_to :visit

  def setup(other_current_value, other_current_expenditures, other_visit, other_goal)
    updateState(other_current_value, other_current_expenditures)
    self.visit = other_visit
    self.goal = other_goal
  end

  def updateState(other_current_value, other_current_expenditures)
    self.current_value = other_current_value
    self.current_expenditures = other_current_expenditures
  end
end
