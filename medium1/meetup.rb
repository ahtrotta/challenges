class Meetup
  COUNT = { first: 1, second: 2, third: 3, fourth: 4 }

  def initialize(month, year)
    @date = Date.civil(year, month, 1)
  end

  def day(weekday, specifier)
    case specifier
    when :teenth
      advance_to_teenth(weekday)
    when :last
      advance_to_last(weekday)
    else
      advance_to_nth(weekday, specifier)
    end

    @date
  end

  private

  def advance_to_teenth(weekday)
    loop do
      break if @date.send(weekday.to_s + '?') && (13..19) === @date.day
      @date = @date.next_day
    end
  end

  def advance_to_last(weekday)
    @date = @date.next_month

    loop do
      @date = @date.prev_day
      break if @date.send(weekday.to_s + '?')
    end
  end

  def advance_to_nth(weekday, nth_weekday)
    break_value = COUNT[nth_weekday]
    counter = 0

    loop do
      counter += 1 if @date.send(weekday.to_s + '?')
      break if counter == break_value
      @date = @date.next_day
    end
  end
end
