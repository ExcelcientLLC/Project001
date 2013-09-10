class AddMinimumContributionToGoal < ActiveRecord::Migration
  def up
    add_column :goals, :annual, :boolean
    rename_column :goals, :target_expenditures, :minimum_contribution
    remove_column :goals, :current_expenditures
  end
  
  def down
    remove_column :goals, :annual
    rename_column :goals, :minimum_contribution, :target_expenditures
    add_column :goals, :current_expenditures, :integer
  end
end
