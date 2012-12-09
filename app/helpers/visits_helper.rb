module VisitsHelper
    def previous_visit(visits, visit)
        visit_id = visits.index(visit)
        return visits[visit_id-1]
    end
    
    def next_visit(visits, visit)
        visit_id = visits.index(visit)
        return visits[visit_id+1]
    end

    def tryToAddVisitSpacer(visits, visit) 
        if visit != visits.last
            return "---"
        else
            return ""
        end
    end

    def getGoalProgress(goal)
        return "$%d%s$%d dollars" % [goal.current_value, " out of ", goal.target_value]
    end

    def getGoalProgressPercent(goal)
        return (goal.current_value*100)/goal.target_value
    end

    def getGoalEndDate(goal)
        return "Reaching goal of $%d in %d" % [goal.target_value, goal.target_date.year]
    end
end
