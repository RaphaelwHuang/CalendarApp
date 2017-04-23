# Author: RH
# Changes: Added the validation for the end_time

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :schedules

  validates :name, length: { minimum: 0 },
            presence: true




end
