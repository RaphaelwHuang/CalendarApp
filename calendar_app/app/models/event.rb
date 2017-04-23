
# Author:
# Changes: Added the validation for the end_time

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :name, length: { minimum: 1, maximum: 20 },
            presence: true



end
