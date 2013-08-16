class AddDisclaimersToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :disclaimer_id, :integer
  end
end
