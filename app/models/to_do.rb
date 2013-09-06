class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
  attr_accessor :complete
  
  validates_length_of :title, :maximum => 20
  
  has_many :to_do_states, :dependent => :destroy
  belongs_to :client
  
  def isVisibleAtVisit(visit)
    afterFirstVisit = (visit.visit_date >= getFirstToDoVisitDate())
    beforeLastVisit = (visit.visit_date <= getLastToDoVisitDate())
    incomplete = !self.complete

    return (afterFirstVisit and (incomplete or beforeLastVisit))
  end
  
  def getFirstToDoVisitDate()
    first_date = self.to_do_states.first.visit.visit_date
    self.to_do_states.each do |to_do_state|
      if first_date > to_do_state.visit.visit_date
        first_date = to_do_state.visit.visit_date
      end
    end
    return first_date
  end

  def getLastToDoVisitDate()
    last_date = self.to_do_states.first.visit.visit_date
    self.to_do_states.each do |to_do_state|
      if last_date < to_do_state.visit.visit_date
        last_date = to_do_state.visit.visit_date
      end
    end
    return last_date
  end
  
  def getToDoStateForVisit(visit)
    closest_to_do_state = nil
    self.to_do_states.each do |to_do_state|
      if to_do_state.visit.visit_date == visit.visit_date
        if closest_to_do_state == nil || closest_to_do_state.visit.visit_date < to_do_state.visit.visit_date
          closest_to_do_state = to_do_state
        end
      end
    end
    return closest_to_do_state
  end

  def getClosestToDoStateForVisit(visit)
    closest_to_do_state = nil
    self.to_do_states.each do |to_do_state|
      if to_do_state.visit.visit_date <= visit.visit_date
        if closest_to_do_state == nil || closest_to_do_state.visit.visit_date < to_do_state.visit.visit_date
          closest_to_do_state = to_do_state
        end
      end
    end
    return closest_to_do_state
  end
  
  def setPresentToDoState(to_do_state)
    puts "Setting Present To Do State"
    # if to_do_state.complete
      # self.complete = 1
    # else
      # self.complete = 0
    # end
    self.complete = to_do_state.complete
    puts self.complete
    puts to_do_state.complete
  end
  
  def prepareToDoState(visit)
    to_do_state = getClosestToDoStateForVisit(visit)
    if to_do_state != nil
      setPresentToDoState(to_do_state)
    end
  end
end
