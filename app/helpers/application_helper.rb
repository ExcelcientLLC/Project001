module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction)
  end
  
  def newImageButton(destination, remote=true, method='get')
    link_to image_tag("Nuvola_Red_Plus_small.png", size: "28x28"), destination, :remote => remote, :method => method
  end
end