class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.string :start_day
      t.string :end_day

      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
