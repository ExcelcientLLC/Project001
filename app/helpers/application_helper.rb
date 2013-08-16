module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction)
  end
  
  def modelFormHeader(record)
    modelName = titileizedModelName(record)
    headerText = distinguishMessageForRecord(record, "New %s" % modelName, "Editing %s" % modelName)
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
    submitButtonWithDifferentMessages(form, record, "Create %s" % modelName, "Update %s" % modelName)
  end
  
  def submitButtonWithDifferentMessages(form, record, newMessage, oldMessage)
    return form.submit distinguishMessageForRecord(record, newMessage, oldMessage)
  end
  
  def deleteImageButton(destination, message, remote=true)
    link_to image_tag("Nuvola_filesystems_trashcan_full.png", size: "40x40"), destination, method: :delete, :remote => remote, confirm: message
  end
  
  def newImageButton(destination, remote=true, method='get')
    link_to image_tag("Nuvola_Red_Plus_small.png", size: "28x28"), destination, :remote => remote, :method => method
  end
  
  def titileizedModelName(record)
    record.class.model_name.human.titleize
  end
end