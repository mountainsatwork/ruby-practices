require "date"
require "optparse"

#title
params = ARGV.getopts('y:', 'm:')
year = params["y"]&.to_i || Date.today.year
month = params["m"]&.to_i || Date.today.month
current_day = "#{month}月 #{year}"
puts current_day.center(20)

#week
weeks = %w(日 月 火 水 木 金 土)
puts weeks.join(" ")

#day
first_day_of_week = Date.new(year, month, 1).wday
blank_date = "   " * first_day_of_week
end_month = Date.new(year, month, -1).day
print blank_date
(1..end_month).each do |date|
  print date.to_s.rjust(2) + " "
  if  Date.new(year, month, date).wday == 6
    puts "\n"
  end
end
