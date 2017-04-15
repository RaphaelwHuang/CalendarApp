class Event < ActiveRecord::Base
  validates :name, length: { minimum: 0 },
            presence: true

  validates :start_day, format: { with: /(mon|tues|wednes|thurs|fri|satur|sun)(day)/i,
                                     message: "%{value} is not a valid week day" }

  validates :end_day,  format: { with: /(mon|tues|wednes|thurs|fri|satur|sun)(day)/is,
                                    message: "%{value} is not a valid week day"  }
end
