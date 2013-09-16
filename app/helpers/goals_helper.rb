module GoalsHelper
  def getMaxDateForGoal(goal)
    finalVisitDate = goal.goal_states.last.visit.visit_date
    
    if finalVisitDate > goal.target_date
      return finalVisitDate
    end
    return goal.target_date
  end
  
  def getMinDateForGoal(goal)
    firstVisitDate = goal.goal_states.first.visit.visit_date
    
    goal.goal_states.each do |goal_state|
      if goal_state.visit.visit_date < firstVisitDate
        firstVisitDate = goal_state.visit.visit_date
      end
    end
    
    return firstVisitDate
  end
end
