class PhoneNumber
  BAD_NUMBER = '0' * 10

  attr_reader :number

  def initialize(input)
    @number = process(input)
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def process(string)
    return BAD_NUMBER if string.match?(/[a-z]/i)
    digits = string.gsub(/\D/, '')

    if digits.length == 10
      digits
    elsif digits.length == 11 && digits[0] == '1'
      digits[1..10]
    else
      BAD_NUMBER
    end
  end
end
