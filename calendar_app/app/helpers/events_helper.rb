# Author: RH
# Changes:
#   RH - Added check current user support
require 'date'

module EventsHelper
  def find_month
    Time.now.strftime("%B")
  end

  def find_day
    week = Time.now.strftime("%U").to_i
    wkBegin = Date.commercial(2017, week, 1).day
    wkEnd = Date.commercial(2017, week, 7).day
    year = Time.now.year.to_s

    "From " + find_month + " " + wkBegin.to_s + ", " + year + " to " + find_month + " " + wkEnd.to_s + ", " + year
  end

  def find_week
     Time.now.strftime("%U")
  end

  def check_user(event)
    @user = current_user
    event.user_id == @user.id
  end

end
