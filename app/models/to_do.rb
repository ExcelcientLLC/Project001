class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
end
