class TestAddGoalName < ActiveRecord::Migration
  def up
  	add_column :goals, :name, :string
  end

  def down
  	remove_column :goals, :name
  end
end
