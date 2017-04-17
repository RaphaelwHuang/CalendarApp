class Group < ActiveRecord::Base
  belongs_to :calendar
  has_many :comprises
  has_many :users, through: :comprises
  has_many :administrates
  has_many :admin, through: :administrates, source: :users
  attr_accessor :user, :admin
end