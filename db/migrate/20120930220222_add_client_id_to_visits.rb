class AddClientIdToVisits < ActiveRecord::Migration
  def up
    add_column :visits, :client_id, :integer
  end
  
  def down
    remove_column :visits, :client_id
  end
end
