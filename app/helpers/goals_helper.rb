module GoalsHelper
  def getMaxDateForGoal(goal)
    finalVisitDate = goal.goal_states.last.visit.visit_date
    
    if finalVisitDate > goal.target_date
      return finalVisitDate
    end
    return goal.target_date
  end
end
