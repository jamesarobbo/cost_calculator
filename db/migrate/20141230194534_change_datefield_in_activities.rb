class ChangeDatefieldInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :activity_begin, :date
    change_column :activities, :activity_end, :date
  end
end
