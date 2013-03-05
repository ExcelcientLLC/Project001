class Goal < ActiveRecord::Base
  attr_accessible :complete, :target_date, :target_expenditures, :target_value, :client, :goal_category_id, :name, :current_value, :current_expenditures
  attr_accessor :current_value, :current_expenditures
  
  has_many :goal_states
  belongs_to :client
  belongs_to :goal_category

  def isVisibleAtVisit(visit)
    return self.complete == false
  end

  def getGoalStateForVisit(visit)
    closest_goal_state = nil
    self.goal_states.each do |goal_state|
      if goal_state.visit.visit_date == visit.visit_date
        if closest_goal_state == nil || closest_goal_state.visit.visit_date < goal_state.visit.visit_date
          closest_goal_state = goal_state
        end
      end
    end
    return closest_goal_state
  end

  def getClosestGoalStateForVisit(visit)
    closest_goal_state = nil
    self.goal_states.each do |goal_state|
      if goal_state.visit.visit_date <= visit.visit_date
        if closest_goal_state == nil || closest_goal_state.visit.visit_date < goal_state.visit.visit_date
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
    goal_state = getClosestGoalStateForVisit(visit)
    if goal_state != nil
      setPresentGoalState(goal_state)
    end
  end

  def getJQPlotCompatibleData()
    retval = []
    self.goal_states.each do |goal_state|
      retval.push([goal_state.visit.visit_date, goal_state.current_value])
    end
    retval.push([self.target_date, self.target_value])
    return [retval]
  end
end
