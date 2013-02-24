class FixTableRelationships < ActiveRecord::Migration
  def up
    remove_column :goals, :visit_id, :integer
    add_column :goals, :client_id, :integer
    add_column :goal_states, :goal_id, :integer
    add_column :goal_states, :visit_id, :integer
  end

  def down
    add_column :goals, :visit_id, :integer
    remove_column :goals, :client_id, :integer
    remove_column :goal_states, :goal_id, :integer
    remove_column :goal_states, :visit_id, :integer
  end
end
