class Integer
  ROMAN_NUMERALS = [
    ['M', 1000], ['CM', 900], ['D', 500], ['CD', 400], ['C', 100], 
    ['XC', 90], ['L', 50], ['XL', 40], ['X', 10],  ['IX', 9], ['V', 5], 
    ['IV', 4], ['I', 1] 
  ]

  def to_roman
    number = itself

    ROMAN_NUMERALS.each_with_object('') do |(numeral, value), result|
      loop do
        reduced = number - value

        if reduced >= 0
          result << numeral
          number = reduced
        else
          break
        end

      end
    end
  end
end
