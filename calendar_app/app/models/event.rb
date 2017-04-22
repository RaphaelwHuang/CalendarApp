# Author: RH
# Changes: Added the validation for the end_time

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :schedules

  validates :name, length: { minimum: 0 },
            presence: true

  validates :start_day, format: { with: /(mon|tues|wednes|thurs|fri|satur|sun)(day)/i,
                                     message: "%{value} is not a valid week day" }

  validates :end_day, format: { with: /(mon|tues|wednes|thurs|fri|satur|sun)(day)/is,
                                    message: "%{value} is not a valid week day"  }

  validate :check_time

  def check_time
    errors.add(:end_time, "should be the greater than start time.") if end_time.to_i <= start_time.to_i  
  end

end
