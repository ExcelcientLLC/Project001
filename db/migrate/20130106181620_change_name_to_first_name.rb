class ChangeNameToFirstName < ActiveRecord::Migration
  def change
    rename_column :clients, :name, :first_name
  end
end
