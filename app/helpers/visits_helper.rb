module VisitsHelper
    
    def hasItem(items, item)
      item_id = items.index(item)
      return item_id != nil
    end

    def previous_item(items, item)
      item_id = items.index(item)
      if item_id == nil
        return items.last
      else
        return items[item_id-1]
      end
    end
    
    def next_item(items, item)
      item_id = items.index(item)
      if item_id == nil
        return items.last
      else
        return items[item_id+1]
      end
    end

    # def tryToAddVisitSpacer(visits, visit) 
    #   if visit != visits.last
    #       return "---"
    #   else
    #       return ""
    #   end
    # end

    def getEventDateString(event)
      if event.getDate == DateTime.now.to_date
        return "Today"
      else
        return event.getDate.strftime("%b %Y")
      end
    end

    def getEventLocationPercentage(events, event)
      start_event = events.first
      end_event = events.last

      # if event == start_event
      #   @lastPercent = -0.8;
      #   return -0.8
      # end

      span = end_event.getDate() - start_event.getDate()
      diff = event.getDate() - start_event.getDate()
      
      if span == 0
        if event == start_event
          percentage = 0
        elsif event == end_event
          percentage = 100
        end
      else
        percentage = (diff.to_i*100)/span.to_i
      end
      return percentage#*getRightMostOffset(events)
    end

    def constructEventLocations(events)
      @lastPercent = -5
      @offset = -0.8
      @positions = constructEventLocationsRecursive(events, events.first)
      @positions = @positions.reverse
      return @positions
      #return positions.reverse
    end

    def constructEventLocationsRecursive(events, event)
      percentage = getEventLocationPercentage(events, event)
      if (@lastPercent > percentage - 2) 
        percentage = @lastPercent + 2
      end
      @lastPercent = percentage

      if event == events.last
        return [100 + @offset]
      end
      positions = constructEventLocationsRecursive(events, next_item(events, event))
      if (percentage + 2 > positions.last) 
        percentage = positions.last - 2
      end
      positions.push(percentage + @offset)
      return positions
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
      # if event == events.first
      #     return "left:left;"
      # #elsif event == events.last
      # #    return "left:%s%%;" % (getRightMostOffset(events)*100).to_s
      # else
          return "left:%s%%;" % @positions[events.index(event)]
      # end
    end
    
    def getBackgroundColor(event, currentVisit)
      if event == currentVisit
        return "background-color:#F3FD00;"
      else
        return ""
      end
    end
    
end
