class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :name, :phone, :state, :zip
end
