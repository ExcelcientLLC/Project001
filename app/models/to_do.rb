class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
  attr_accessor :complete
  
  validates_length_of :title, :maximum => 20
  
  belongs_to :client
  belongs_to :visit
  belongs_to :starting_visit, :class_name => "Visit"
  
  def isVisibleAtVisit(visit)
    afterFirstVisit = (visit.visit_date >= self.starting_visit.visit_date)
    incomplete = self.visit.nil?
    if incomplete
      beforeLastVisit = true
    else
      beforeLastVisit = (visit.visit_date <= self.visit.visit_date)
    end

    return (afterFirstVisit and (incomplete or beforeLastVisit))
  end
  
  def prepareToDoState(visit)
    self.complete = ((not (self.visit.nil?)) and (visit.visit_date >= self.visit.visit_date))
  end
  
  def saveState(visit)
    if self.complete == "1"
      self.visit = visit
      self.save
    else
      self.visit = nil
      self.save
    end
    
    if self.starting_visit.nil? or self.starting_visit.visit_date > visit.visit_date
      self.starting_visit = visit
      self.save
    end
  end
end
