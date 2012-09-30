class AddGoalCategoryIdToGoals < ActiveRecord::Migration
  def up
    add_column :goals, :goal_category_id, :integer
  end
  
  def down
    remove_column :goals, :goal_category_id
  end
end
