class CreateDisclaimers < ActiveRecord::Migration
  def change
    create_table :disclaimers do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
