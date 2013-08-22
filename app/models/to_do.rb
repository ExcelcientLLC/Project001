class ToDo < ActiveRecord::Base
  attr_accessible :complete, :description, :title
  
  validates_length_of :title, :maximum => 20
  
  belongs_to :visit
end
