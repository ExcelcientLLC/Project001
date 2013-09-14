class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
  attr_accessor :complete
  
  validates_length_of :title, :maximum => 20
  
  belongs_to :client
  belongs_to :visit
  
  def isVisibleAtVisit(visit)
    return ((self.visit.nil?) or (self.visit.visit_date >= visit.visit_date))
  end
  
  def prepareToDoState(visit)
    self.complete = ((not (self.visit.nil?)) and (visit.visit_date >= self.visit.visit_date))
  end
  
  def saveState(visit)
    if self.complete
      self.visit = visit
      self.save
    end
  end
end
