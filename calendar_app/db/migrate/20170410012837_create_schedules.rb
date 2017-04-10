class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :calendar, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
