class Visit < ActiveRecord::Base
  attr_accessible :visit_date
  
  belongs_to :client
  
  has_many :goals
  has_many :to_dos
end
