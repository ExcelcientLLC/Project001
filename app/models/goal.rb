class Goal < ActiveRecord::Base
  attr_accessible :complete, :target_date, :target_expenditures, :target_value, :client, :goal_category_id, :name, :current_value, :current_expenditures
  attr_accessor :current_value, :current_expenditures
  
  has_many :goal_states
  belongs_to :client
  belongs_to :goal_category

  def getGoalStateForVisit(visit)
    closest_goal_state = nil
    puts self.goal_states
    self.goal_states.each do |goal_state|
      puts goal_state
      if goal_state.visit.visit_date <= visit.visit_date
        if closest_goal_state.visit.visit_date < goal_state.visit.visit_date
          closest_goal_state = goal_state
        end
      end
    end
    return closest_goal_state
  end

  def setPresentGoalState(goal_state)
    self.current_value = goal_state.current_value
    self.current_expenditures = goal_state.current_expenditures
  end

  def prepareGoalState(visit)
    puts "Preparing Goal States"
    goal_state = getGoalStateForVisit(visit)
    setPresentGoalState(goal_state)
  end
end
