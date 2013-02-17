class AddAttachmentAvatarToGoalCategories < ActiveRecord::Migration
  def self.up
    change_table :goal_categories do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :goal_categories, :avatar
  end
end
