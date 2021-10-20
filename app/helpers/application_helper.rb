module ApplicationHelper
  def runtime_conversion(minutes)
    hr = minutes / 60
    min = minutes % 60
    "#{hr} hour(s) #{min} minute(s)"
  end
end
