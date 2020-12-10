class Meetup
  DATE_RANGES = { 
    first: 1..7, second: 8..14, third: 15..21, 
    fourth: 22..28, teenth: 13..19, last: -7..-1
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, specifier)
    DATE_RANGES[specifier].each do |day|
      date = Date.civil(@year, @month, day)
      return date if date.send(weekday.to_s + '?')
    end
  end
end
