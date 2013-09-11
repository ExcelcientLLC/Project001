class Disclaimer < ActiveRecord::Base
  attr_accessible :body, :name
  validates_length_of :name, :maximum => 20
  has_one :visit
  
  def self.get_disclaimer
    disclaimer = Disclaimer.all.first
    if disclaimer.nil?
      discalimer = Disclaimer.new
      disclaimer.save
    end
    return disclaimer
  end
end
