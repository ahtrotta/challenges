#class Phrase
#  def initialize(string)
#    @string = string
#  end
#
#  def word_count
#    words = @string.gsub(/[^\w\s']/i, ' ').downcase.split
#    words.each_with_object(Hash.new(0)) do |word, hash|
#      word = word[1..-2] if word[0] == "'" && word[-1] == "'"
#      hash[word] += 1
#    end
#  end
#end

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    @string.scan(/[\w']+/).each_with_object(Hash.new(0)) do |word, hash|
      word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      hash[word.downcase] += 1
    end
  end
end

p Phrase.new('here is a simple^%*#@*$&    test\nstring,of words').word_count
