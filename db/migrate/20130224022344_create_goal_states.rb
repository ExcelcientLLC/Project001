class CreateGoalStates < ActiveRecord::Migration
  def change
    create_table :goal_states do |t|
      t.integer :current_value
      t.integer :current_expenditures

      t.timestamps
    end
  end
end
