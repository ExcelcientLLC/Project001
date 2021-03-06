class Visit < ActiveRecord::Base
  attr_accessible :visit_date, :client, :disclaimer, :disclaimer_id

  validates_uniqueness_of :visit_date, :scope => [:client_id]

  belongs_to :client

  has_many :goal_states, :dependent => :destroy
  has_many :to_dos
  belongs_to :disclaimer
  
  before_destroy :last_visit?

  def isVisit
    return true
  end

  def getDate
    return visit_date
  end

  def last_visit?
    errors.add(:base, "Cannot delete a Client's last Visit") unless client.visits.count > 1
    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end
  
end
