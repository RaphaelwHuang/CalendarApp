class Group < ActiveRecord::Base
  belongs_to :calendar
  has_many :users, :through => :comprises
  has_many :comprises
  attr_accessor :user
end
