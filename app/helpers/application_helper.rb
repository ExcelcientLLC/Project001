module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction)
  end
  
  def tryToPageBreak(list, record, countFirstPage, countAfter)
    index = list.index(record) - countFirstPage
    
    if list.last != record
      if index%countAfter == countAfter-1 # Takes advantage of the fact that index = -1 will return true regardless of mod base
        return "<div style=\"page-break-before:always\"></div>".html_safe
      end
    end
    return ""
  end
  
  def modelFormHeader(record)
    modelName = titileizedModelName(record)
    headerText = distinguishMessageForRecord(record, "Create %s" % modelName, "Update %s" % modelName)
    headerHTML = "<h1>%s</h1>" % headerText
    return headerHTML.html_safe
  end
  
  def distinguishMessageForRecord(record, newMessage, oldMessage)
    if record.new_record?
      return newMessage
    else
      return oldMessage
    end
  end
  
  def submitButtonForRecord(form, record)
    modelName = titileizedModelName(record)
    submitButtonWithDifferentMessages(form, record, "Save" % modelName, "Save" % modelName)
  end
  
  def submitButtonWithDifferentMessages(form, record, newMessage, oldMessage)
    return form.submit distinguishMessageForRecord(record, newMessage, oldMessage)
  end
  
  def deleteImageButton(destination, message, model, remote=true)
    link_to image_tag("Nuvola_filesystems_trashcan_full.png", size: "40x40"), destination, method: :delete, :remote => remote, confirm: message, :title => "Delete this %s" % titileizedModelName(model)
  end
  
  def newImageButton(destination, model, remote=true, method='get')
    link_to image_tag("Nuvola_Red_Plus_small.png", size: "28x28"), destination, :remote => remote, :method => method, :title => "Create new %s" % titileizedModelName(model)
  end
  
  def titileizedModelName(record)
    record.class.model_name.human.titleize
  end
  
  def goalButton(visit)
    button_to "Meetings", client_visit_path(visit.client, visit), :method => :get
  end
end