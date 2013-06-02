class Visit < ActiveRecord::Base
  attr_accessible :visit_date, :client

  validates_uniqueness_of :visit_date, :scope => [:client_id]
  
  belongs_to :client
  
  has_many :goals
  has_many :to_dos

  def isVisit
    return true
  end

  def getDate
    return visit_date
  end

end
