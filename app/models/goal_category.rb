class GoalCategory < ActiveRecord::Base
  attr_accessible :avatar, :icon, :name, :priority
  
  has_many :goals
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #                  :url  => "/assets/goal_categories/:id/:style/:basename.:extension",
  #                  :path => ":rails_root/app/asset:goal_categories/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  validates_length_of :name, :maximum => 20
  before_destroy :category_with_goals?
  
  def category_with_goals?
    errors.add(:base, "Cannot delete Goal Category with active Goals") unless goals.count == 0
    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end
end
