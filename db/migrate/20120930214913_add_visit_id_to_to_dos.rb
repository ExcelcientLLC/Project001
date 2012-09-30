class AddVisitIdToToDos < ActiveRecord::Migration
  def up
    add_column :to_dos, :visit_id, :integer
  end
  
  def down
    remove_column :to_dos, :visit_id
  end
end
