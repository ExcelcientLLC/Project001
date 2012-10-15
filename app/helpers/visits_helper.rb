module VisitsHelper
    def previous_visit(visits, visit)
        visit_id = visits.index(visit)
        return visits[visit_id-1]
    end
    
    def next_visit(visits, visit)
        visit_id = visits.index(visit)
        return visits[visit_id+1]
    end

end
