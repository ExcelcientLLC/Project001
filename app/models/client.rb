class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :first_name, :last_name, :phone, :state, :zip
  
  has_many :visits, :dependent => :destroy
  has_many :goals, :dependent => :destroy
  has_many :to_dos, :dependent => :destroy

  def getVisibleGoals(visit)
    goals = []

    self.goals.each() do |goal|
      if goal.isVisibleAtVisit(visit)
        goal.prepareGoalState(visit)
        goals.push(goal)
      end
    end

    return goals
  end
  
  def getVisibleGoalsTimeline(visit)
    goals = []

    self.goals.each() do |goal|
      if goal.isVisibleAtVisitTimeline(visit)
        goal.prepareGoalState(visit)
        goals.push(goal)
      end
    end

    return goals
  end
  
  def getVisibleToDos(visit)
    to_dos = []

    self.to_dos.each() do |to_do|
      if to_do.isVisibleAtVisit(visit)
        to_do.prepareToDoState(visit)
        to_dos.push(to_do)
      end
    end

    return to_dos
  end
  
  def getSortedVisits()
    visits = self.visits
    visits.sort! { |a,b| a.visit_date <=> b.visit_date }
    return visits
  end

  #def self.search(search)
#    if search
 #     find(:all, conditions: ['first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%"], order: 'email ASC')
  #  else
      #find(:all, order: 'last_name ASC')
#    end
 # end

def self.search(search)
  if search
    where('first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%")
  else
    scoped
  end
end
  
end
