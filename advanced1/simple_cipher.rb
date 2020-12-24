class Cipher
  LETTERS = ('a'..'z').zip(0..25).to_h.freeze

  attr_reader :key

  def initialize(input = generate_key)
    self.key = input
  end

  def key=(input)
    raise ArgumentError unless input.match?(/\A[a-z]+\z/)
    @key = input
  end

  def encode(text)
    shift_text(text, :+)
  end

  def decode(text)
    shift_text(text, :-)
  end

  private

  def generate_key
    (0..99).each_with_object('') { |_, key| key << LETTERS.keys.sample }
  end

  def shift_text(text, operation)
    text.each_char.with_index.with_object('') do |(char, index), result|
      key_value = LETTERS[@key[index % @key.size]]
      new_value = (LETTERS[char].send(operation, key_value)) % LETTERS.size
      result << LETTERS.key(new_value)
    end
  end
end
