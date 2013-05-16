module VisitsHelper
    def hasVisit(visits, visit)
      visit_id = visits.index(visit)
      return visit_id != nil
    end

    def previous_visit(visits, visit)
        visit_id = visits.index(visit)
        if visit_id == nil
          return visits.last
        else
          return visits[visit_id-1]
        end
    end
    
    def next_visit(visits, visit)
        visit_id = visits.index(visit)
        if visit_id == nil
          return visits.last
        else
          return visits[visit_id+1]
        end
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

      if event == end_event
          return 100
      end

      span = end_event.getDate() - start_event.getDate()
      diff = event.getDate() - start_event.getDate()

      percentage = (diff.to_i*100)/span.to_i
      return percentage*0.95
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

    def getVisitSubmitText(visit)
      return visit.new_record? ? "Create New Visit" : "Update Visit Date"
    end
    
    def getStylePosition(events, event)
      if event == events.first
          return "left:left;"
      elsif event == events.last
          return "float:right;"
      else
          return "left:%s%%;" % getEventLocationPercentage(events, event).to_s
      end
    end
    
    def getBackgroundColor(event, currentVisit)
      if event == currentVisit
        return "background-color:#fdb813;"
      else
        return ""
      end
    end
    
end
