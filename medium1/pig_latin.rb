class PigLatin
  def self.translate(input)
    input.split.map { |word| convert(word) }.join(' ')
  end

  def self.convert(word)
    if word.match?(/\A([aeiou]|y[^aeiou]+|x[^aeiou]+)/)
      word + 'ay'
    else
      word.sub(/\A([^aeiou]*qu|[^aeiou]+)(\w+)/, '\2\1ay')
    end
  end
end
