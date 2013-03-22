class Goal < ActiveRecord::Base
  attr_accessible :complete, :target_date, :target_expenditures, :target_value, :client, :goal_category_id, :name, :current_value, :current_expenditures
  attr_accessor :current_value, :current_expenditures
  
  has_many :goal_states
  belongs_to :client
  belongs_to :goal_category

  def isVisibleAtVisit(visit)
    afterFirstVisit = (visit.visit_date >= getFirstGoalVisitDate())
    beforeLastVisit = (visit.visit_date <= getLastGoalVisitDate())
    incomplete = !self.complete

    puts "After First Visit", afterFirstVisit
    puts "Before Last Visit", beforeLastVisit
    puts "Incomplete Goal", incomplete

    return (afterFirstVisit and (incomplete or beforeLastVisit))
  end

  def getFirstGoalVisitDate()
    first_date = self.goal_states.first.visit.visit_date
    self.goal_states.each do |goal_state|
      if first_date > goal_state.visit.visit_date
        first_date = goal_state.visit.visit_date
      end
    end
    return first_date
  end

  def getLastGoalVisitDate()
    last_date = self.goal_states.first.visit.visit_date
    self.goal_states.each do |goal_state|
      if last_date < goal_state.visit.visit_date
        last_date = goal_state.visit.visit_date
      end
    end
    return last_date
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

    return [getJQPlotExtrapolation, getJQPlotCurrentContributions, getJQPlotTargetContribution]
  end

  def getJQPlotCurrentContributions()
    retval = []
    self.goal_states.each do |goal_state|
      retval.push([goal_state.visit.visit_date, goal_state.current_value])
    end 
    return retval
  end

  def getJQPlotExtrapolation()
    retval = []
    retval.push([self.goal_states.last.visit.visit_date, self.goal_states.last.current_value])
    retval.push([self.target_date, self.target_value])

    return retval
  end

  def getJQPlotTargetContribution()
    retval = []
    retval.push([self.goal_states.first.visit.visit_date, 0])
    retval.push([self.target_date, self.target_value])
  end
end
