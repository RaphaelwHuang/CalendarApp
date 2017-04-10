class CreateAdministrates < ActiveRecord::Migration
  def change
    create_table :administrates do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
