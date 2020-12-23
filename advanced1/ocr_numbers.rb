class OCR
  DIGITS = [
    " _ \n| |\n|_|\n", "   \n  |\n  |\n", " _ \n _|\n|_ \n",
    " _ \n _|\n _|\n", "   \n|_|\n  |\n", " _ \n|_ \n _|\n",
    " _ \n|_ \n|_|\n", " _ \n  |\n  |\n", " _ \n|_|\n|_|\n",
    " _ \n|_|\n _|\n"
  ]

  def initialize(text)
    @text = text
  end

  def convert
    digits = separate_digits.map do |digit|
      binary_font_digit = digit.join("\n") + "\n"
      DIGITS.index(binary_font_digit) || '?'
    end
    digits.join
  end

  private

  def separate_digits
    split_text = @text.chomp.split("\n").map do |line|
      line_array = line.scan(/.{1,3}/)
      line_array = [''] if line_array.empty?

      line_array.map do |row|
        row << ' ' until row.length == 3
        row
      end
    end

    split_text.transpose
  end
end

text = <<-NUMBER.chomp
    _
  || |
  ||_|

NUMBER

text2 = <<-NUMBER.chomp
 _
|_|
 _|

NUMBER

text3 = <<-NUMBER.chomp

  |
  |

NUMBER

p OCR.new(text3).convert
