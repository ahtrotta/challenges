class Palindromes
  def initialize(min_factor: 1, max_factor: 1)
    @min = min_factor
    @max = max_factor
  end

  def generate
    @factors = (@min..@max).each_with_object(Hash.new([])) do |n1, factors|
      (n1..@max).each do |n2|
        product = n1 * n2
        factors[product] += [[n1, n2]] if palindrome?(product)
      end
    end
  end

  def largest
    value, factors = @factors.max
    PalindromeFactors.new(factors, value)
  end
  
  def smallest
    value, factors = @factors.min
    PalindromeFactors.new(factors, value)
  end

  def palindrome?(number)
    number == number.to_s.reverse.to_i
  end
end

class PalindromeFactors
  attr_reader :factors, :value

  def initialize(factors, value)
    @factors = factors
    @value = value
  end
end
