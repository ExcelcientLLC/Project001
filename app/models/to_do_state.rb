class ToDoState < ActiveRecord::Base
  attr_accessible :complete, :visit
  
  belongs_to :to_do
  belongs_to :visit

  def setup(other_complete, other_visit, other_to_do)
    updateState(other_complete)
    self.visit = other_visit
    self.to_do = other_to_do
  end

  def updateState(other_complete)
    self.complete = other_complete
  end
end
