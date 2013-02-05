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

    def getVisitLocationPercentage(visits, visit)
        start_visit = visits.first
        end_visit = visits.last

        if visit == start_visit
            return 0
        end

        span = end_visit.visit_date - start_visit.visit_date
        diff = visit.visit_date - start_visit.visit_date

        return (diff.to_i*100)/span.to_i
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

    def getGoalImgURL(goal)
	case goal.goal_category_id 
	when 1
		return "boat.jpg"
	when 2
		return "car.jpg"
	when 3
		return "house.jpg"
	else 
		return "default.jpg"
	end
    end
end
