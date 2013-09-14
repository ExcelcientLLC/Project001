class AddToDoCompletionDate < ActiveRecord::Migration
  def up
    add_column :to_dos, :visit_id, :integer
    drop_table :to_do_states
  end

  def down
    remove_column :to_dos, :visit_id
    create_table :to_do_states do |t|
      t.boolean :complete

      t.timestamps
    end
  end
end
