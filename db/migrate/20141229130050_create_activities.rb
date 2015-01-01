class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|

      t.string :title
      t.datetime :activity_begin
      t.datetime :activity_end
      

      t.timestamps
    end
  end
end
