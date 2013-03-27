class Visit < ActiveRecord::Base
  attr_accessible :visit_date, :client

  #validates_uniqueness_of :visit_date
  
  belongs_to :client
  
  has_many :goals
  has_many :to_dos

  def getDate
    return :visit_date
  end

  def getDateString
    if event.date.to_date == DateTime.now.to_date
      return "Today"
    else
      return event.date.strftime("%B %Y")
    end
  end
end
