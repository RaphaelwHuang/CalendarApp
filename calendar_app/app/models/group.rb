class Group < ActiveRecord::Base
  belongs_to :calendar
  has_many :comprises
  has_many :users, :through => :comprises
end
