class Anagram
  def initialize(input)
    @input = input.downcase
  end

  def match(list)
    input_letter_count = letter_count(@input)

    list.select do |word|
      word = word.downcase
      input_letter_count == letter_count(word) && word != @input
    end
  end

  private

  def letter_count(word)
    word.chars.uniq.map { |c| [c, word.count(c)] }.to_h
  end
end
