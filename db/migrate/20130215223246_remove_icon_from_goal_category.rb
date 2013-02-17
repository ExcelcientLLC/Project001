class RemoveIconFromGoalCategory < ActiveRecord::Migration
  def up
    remove_column :goal_categories, :icon
  end

  def down
    add_column :goal_categories, :icon, :string
  end
end
