class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :first_name, :last_name, :phone, :state, :zip
  
  has_many :visits

  def self.search(search)
    if search
      find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
