class CleanupGoal < ActiveRecord::Migration
  def up
    remove_column :goals, :current_value, :integer
    remove_column :goals, :current_expenditures, :integer
    remove_column :goals, :continuity_id, :integer
  end

  def down
    add_column :goals, :current_value, :integer
    add_column :goals, :current_expenditures, :integer
    add_column :goals, :continuity_id, :integer
  end
end
