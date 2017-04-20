class Group < ActiveRecord::Base
  has_many :comprises
  has_many :events
  has_many :users, through: :comprises
  has_many :administrates
  has_many :admins, through: :administrates, source: :user
  # attr_accessor :user, :admin
end