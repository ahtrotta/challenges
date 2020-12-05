#class SumOfMultiples
#  def initialize(*nums)
#    @nums = (nums.empty? ? [3, 5] : nums)
#  end
#
#  def to(lim)
#    all_multiples = @nums.map do |n|
#                      multiples = []
#
#                      until n >= lim
#                        multiples << n
#                        n *= n
#                      end
#
#                      multiples
#                    end
#    all_multiples.flatten.uniq.sum
#  end
#end
#
#class SumOfMultiples
#  def initialize(*nums)
#    @nums = nums
#  end
#
#  def to(lim)
#    (1...lim).select { |n| @nums.any? { |divisor| n % divisor == 0 } }.sum
#  end
#
#  def self.to(lim)
#    self.new(3, 5).to(lim)
#  end
#end

require 'set'

class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(lim)
    mults = @nums.each_with_object(Set.new) do |mult, set|
      (1..(get_max_multiplier(mult, lim))).each { |n| set << (mult * n) }
    end

    mults.to_a.sum
  end

  def self.to(lim)
    self.new(3, 5).to(lim)
  end
  
  private
  
  def get_max_multiplier(num, lim)
    (lim / num) == (lim.to_f / num) ? ((lim / num) - 1) : (lim / num)
  end

end
