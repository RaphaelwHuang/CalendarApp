class Group < ActiveRecord::Base
  belongs_to :calendar
  has_many :comprises
  has_many :schedules
  has_many :users, through: :comprises
  has_many :administrates
  has_many :admins, through: :administrates, source: :user
  # attr_accessor :user, :admin
end