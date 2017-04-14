class ChangeEndDayFormatInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :end_day, :string
  end
end
