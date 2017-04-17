module PersonalHelper
  def find_month
    Time.now.strftime("%B")
  end

  def find_day
    week = Time.now.strftime("%U").to_i
    wkBegin = Date.commercial(2017, week, 1).day
    wkEnd = Date.commercial(2017, week, 7).day

    find_month + " " + wkBegin.to_s + " to " + find_month + " " + wkEnd.to_s
  end

  def find_week
    year = Time.now.year.to_s

    year + " WEEK " + Time.now.strftime("%U").to_s
  end

end



