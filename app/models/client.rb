class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :first_name, :last_name, :phone, :state, :zip
  
  has_many :visits
end
