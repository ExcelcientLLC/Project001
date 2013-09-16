class AddStartingVisitToToDo < ActiveRecord::Migration
  def up
    add_column :to_dos, :starting_visit_id, :integer
  end
  
  def down
    remove_column :to_dos, :starting_visit_id
  end
end
