class AddLastNameToClients < ActiveRecord::Migration
  def up
    add_column :clients, :last_name, :string
  end
end
