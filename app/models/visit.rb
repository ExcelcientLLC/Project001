class Visit < ActiveRecord::Base
  attr_accessible :visit_date, :client

  #validates_uniqueness_of :visit_date
  
  belongs_to :client
  
  has_many :goals
  has_many :to_dos

  def isVisit
    return true
  end

  def getDate
    return visit_date
  end

  def getDateString
    date = getDate()
    if date.to_date == DateTime.now.to_date
      return "Today"
    else
      return date.strftime("%B %Y")
    end
  end
end
