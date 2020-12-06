class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    sum = get_divisors(number).sum

    if sum == number
      'perfect'
    elsif sum < number
      'deficient'
    else
      'abundant'
    end
  end

  def self.get_divisors(num)
    (2..Math.sqrt(num)).each_with_object([1]) do |divisor, divisors|
      if divisor == Math.sqrt(num)
        divisors << divisor
      elsif num % divisor == 0
        divisors << divisor << (num / divisor)
      end
    end
  end
end
