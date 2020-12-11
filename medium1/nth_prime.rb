class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1
    count = 1
    number = 3

    loop do
      count += 1 if prime?(number)
      break number if count == n
      number += 2
    end
  end

  def self.prime?(number)
    (2..Math.sqrt(number)).each { |div| return false if number % div == 0 }
    true
  end
end
