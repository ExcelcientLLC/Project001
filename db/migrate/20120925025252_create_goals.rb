class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :target_date
      t.integer :target_value
      t.integer :current_value
      t.integer :target_expenditures
      t.integer :current_expenditures
      t.boolean :complete

      t.timestamps
    end
  end
end
