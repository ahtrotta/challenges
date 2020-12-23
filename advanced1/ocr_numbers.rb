class OCR
  DIGITS = [
    " _ | ||_|", "     |  |", " _  _||_ ", " _  _| _|", "   |_|  |",
    " _ |_  _|", " _ |_ |_|", " _   |  |", " _ |_||_|", " _ |_| _|"
  ]

  def initialize(text)
    @text = text
  end

  def convert
    numbers = separate_digits(@text).map do |digits|
      digits.map { |digit| DIGITS.index(digit.join) || '?' }.join
    end
    numbers.join(',')
  end

  private

  def separate_digits(input)
    input.split("\n").each_slice(4).map do |sequence|
      sequence.first(3).map { |line| divide(line) }.transpose
    end
  end

   def divide(line) 
     line = '   ' if line.empty?
     line.scan(/.{1,3}/).map do |row|
       row << ' ' until row.length == 3
       row
     end
  end
end
