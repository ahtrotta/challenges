class Luhn
  def initialize(number)
    @number = number
  end
  
  def addends
    modified_digits = @number.digits.map.with_index do |dig, index|
      new_dig = (index.odd? ? dig * 2 : dig)
      new_dig > 9 ? new_dig - 9 : new_dig
    end
    modified_digits.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    remainder = self.new(number * 10).checksum % 10
    (number * 10) + ((10 - remainder) % 10)
  end
end
