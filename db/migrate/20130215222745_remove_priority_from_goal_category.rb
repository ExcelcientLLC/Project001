class RemovePriorityFromGoalCategory < ActiveRecord::Migration
  def up
    remove_column :goal_categories, :priority
  end

  def down
    add_column :goal_categories, :priority, :integer
  end
end
