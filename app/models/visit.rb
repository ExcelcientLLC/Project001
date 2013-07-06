class Visit < ActiveRecord::Base
  attr_accessible :visit_date, :client

  validates_uniqueness_of :visit_date, :scope => [:client_id]
  
  belongs_to :client
  
  has_many :goals
  has_many :to_dos
  
  before_destroy :last_visit?

  def isVisit
    return true
  end

  def getDate
    return visit_date
  end

  def last_visit?
    errors.add(:base, "Cannot delete a Client's last Visit") unless client.visits.count == 0
    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end
  
end
