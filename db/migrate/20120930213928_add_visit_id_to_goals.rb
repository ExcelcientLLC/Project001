class AddVisitIdToGoals < ActiveRecord::Migration
  def up
    add_column :goals, :visit_id, :integer
  end
  
  def down
    remove_column :goals, :visit_id
  end
end
