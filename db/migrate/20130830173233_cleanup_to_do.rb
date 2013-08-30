class CleanupToDo < ActiveRecord::Migration
  def up
    remove_column :to_dos, :complete, :boolean
  end

  def down
    add_column :to_dos, :complete, :boolean
  end
end
