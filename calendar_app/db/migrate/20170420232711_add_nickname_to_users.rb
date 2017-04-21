class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :bio, :string
    add_column :users, :hometown, :string
    add_column :users, :major, :string
    add_column :users, :school, :string
    add_column :users, :grade, :string
    add_column :users, :job, :string
  end
end
