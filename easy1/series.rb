#class Series
#  def initialize(num)
#    @num = num
#  end
#
#  def slices(n)
#    raise ArgumentError if n > @num.length
#    @num.chars.map(&:to_i).each_cons(n).to_a
#  end
#end

class Series
  def initialize(num)
    @digits = num.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @digits.size
    (0..(@digits.size - n)).map { |i| @digits[i, n] }
  end
end
