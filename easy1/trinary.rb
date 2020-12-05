class Trinary
  def initialize(num_str)
    @num_str = num_str
  end
  
  def to_decimal
    return 0 unless @num_str.match?(/\A[0-2]+\z/)

    @num_str
      .to_i
      .digits
      .each_with_index
      .inject(0) { |sum, (dig, i)| sum + (dig * (3**i)) }
  end
end
