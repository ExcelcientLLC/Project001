class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
  
  belongs_to :visit
end
