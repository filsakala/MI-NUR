module ApplicationHelper

  def date_format(date)
    return "" if !date
    date.strftime("%d.%m.%Y")
  end

  def datetime_format(datetime)
    return "" if !datetime
    datetime.strftime("%d.%m.%Y %H:%M")
  end
end
