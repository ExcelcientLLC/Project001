class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :visit_date

      t.timestamps
    end
  end
end
