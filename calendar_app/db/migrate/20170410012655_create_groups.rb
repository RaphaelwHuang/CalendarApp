class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :calendar, index: true, foreign_key: true

      t.timestamps null: false
    end

    # create_table :users do |t|
    # 	t.string :name
    # 	t.timestamps
    # end

    create_table :appointments do |t|
    	t.belongs_to :group, index: true
    	t.belongs_to :user, index: true
    	t.timestamps
    end
  end
end
