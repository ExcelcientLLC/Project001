class Disclaimer < ActiveRecord::Base
  attr_accessible :body, :name
  validates_length_of :name, :maximum => 20
end
