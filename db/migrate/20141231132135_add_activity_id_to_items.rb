class AddActivityIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :activity_id, :integer
  end
end
