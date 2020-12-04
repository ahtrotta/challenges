class Octal
  def initialize(oct_str)
    @oct_str = oct_str
  end

  def to_decimal
    return 0 if @oct_str.match?(/[89\D]/)
    @oct_str.to_i.digits.map.with_index { |dig, idx| dig * 8**idx }.sum
  end
end
