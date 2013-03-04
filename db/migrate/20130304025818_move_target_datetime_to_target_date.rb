class MoveTargetDatetimeToTargetDate < ActiveRecord::Migration
  def up
  	change_column :goals, :target_date, :date
  end
  	change_column :goals, :target_date, :datetime
  def down
  end
end