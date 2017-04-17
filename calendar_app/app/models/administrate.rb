class Administrate < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  # belongs_to :admin, class_name: "User"
  validates_uniqueness_of :group_id, :scope => [:user_id]
end
