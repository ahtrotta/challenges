#class Sieve
#  def initialize(max)
#    @max = max
#  end
#
#  def primes
#    (2..@max).each_with_object((2..@max).to_a) do |n, arr|
#      arr.reject! { |num| num % n == 0 unless num == n }
#    end
#  end
#end

class Sieve
  def initialize(max)
    @arr = (2..max).to_a
  end

  def primes
    @arr.each { |num| @arr.reject! { |n| num < n && n % num == 0 } }
  end
end
