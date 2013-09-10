class TidyUpGoal < ActiveRecord::Migration
  def up
    rename_column :goals, :target_value, :goal_value
  end

  def down
    rename_column :goals, :goal_value, :target_value
  end
end
