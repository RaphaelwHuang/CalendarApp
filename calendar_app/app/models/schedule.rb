class Schedule < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :event
end
