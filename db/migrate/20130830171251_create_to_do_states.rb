class CreateToDoStates < ActiveRecord::Migration
  def change
    create_table :to_do_states do |t|
      t.boolean :complete

      t.timestamps
    end
  end
end
