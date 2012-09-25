class CreateGoalCategories < ActiveRecord::Migration
  def change
    create_table :goal_categories do |t|
      t.string :name
      t.binary :icon
      t.integer :priority

      t.timestamps
    end
  end
end
