class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.string :start_day
      t.time :end_day

      t.timestamps null: false
    end
  end
end
