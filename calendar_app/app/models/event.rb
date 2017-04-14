class Event < ActiveRecord::Base
  validates :name, length: { minimum: 0 },
            presence: true

  validates :start_day, inclusion: { in: %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday),
                                     message: "%{value} is not a valid week day" }

  validates :end_day,  inclusion: { in: %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday),
                                    message: "%{value} is not a valid week day"  }
end
