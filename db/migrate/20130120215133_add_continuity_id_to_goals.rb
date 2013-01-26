class AddContinuityIdToGoals < ActiveRecord::Migration
    def up
        add_column :goals, :continuity_id, :integer
    end

    def down
        remove_column :goals, :continuity_id
    end
end
