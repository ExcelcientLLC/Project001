class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :first_name, :last_name, :phone, :state, :zip
  
  has_many :visits
  has_many :goals

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

  #def self.search(search)
#    if search
 #     find(:all, conditions: ['first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%"], order: 'email ASC')
  #  else
      #find(:all, order: 'last_name ASC')
#    end
 # end

def self.search(search)
  if search
    where('first_name LIKE ?', "%#{search}%")
  else
    scoped
  end
end
  
end
