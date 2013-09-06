class FixToDoRelationships < ActiveRecord::Migration
  def up
    remove_column :to_dos, :visit_id, :integer
    add_column :to_dos, :client_id, :integer
    add_column :to_do_states, :to_do_id, :integer
    add_column :to_do_states, :visit_id, :integer
  end

  def down
    add_column :to_dos, :visit_id, :integer
    remove_column :to_dos, :client_id, :integer
    remove_column :to_do_states, :to_do_id, :integer
    remove_column :to_do_states, :visit_id, :integer
  end
end
