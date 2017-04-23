class AddTimesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :starting_time, :datetime
    add_column :events, :ending_time, :datetime
  end
end
