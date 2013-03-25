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

    def getEventDateString(event)
      if event.date.to_date == DateTime.now.to_date
        return "Today"
      else
        return event.date.strftime("%B %Y")
      end
    end

    def getEventLocationPercentage(events, event)
        start_event = events.first
        end_event = events.last

        if event == start_event
            return 0
        end

        span = end_event.date - start_event.date
        diff = event.date - start_event.date

        return ((diff.to_i*95)/span.to_i)-15
    end

    def getGoalProgress(goal)
        return "$%d%s$%d dollars" % [goal.current_value, " out of ", goal.target_value]
    end

    def getGoalProgressPercent(goal)
        if goal.current_value == nil
            puts "Goal Current Value is nil"
            return 0
        else
            return (goal.current_value*100)/goal.target_value
        end
    end

    def getGoalEndDate(goal)
        return "Reaching goal of $%d in %d" % [goal.target_value, goal.target_date.year]
    end

end
