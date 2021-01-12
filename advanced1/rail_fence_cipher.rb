class RailFenceCipher
  def self.encode(message, number_of_rails)
    rails = Array.new(number_of_rails) { [] }
    rail_indexes = generate_rail_indexes(message.length, number_of_rails)

    rail_indexes.each_with_index do |rail_index, message_index|
      rails[rail_index] << message[message_index]
    end

    rails.join
  end

  def self.decode(text, number_of_rails)
    chars = text.chars
    rail_indexes = generate_rail_indexes(text.length, number_of_rails)

    rails = (0...number_of_rails).map do |rail_index|
      chars.shift(rail_indexes.count(rail_index))
    end

    rail_indexes.each_with_object('') do |rail_index, output|
      output << rails[rail_index].shift
    end
  end

  def self.generate_rail_indexes(length, rails)
    cycle = (0...rails).to_a + (rails - 2).downto(1).to_a
    cycle_repeats = (length / cycle.length.to_f).ceil
    (cycle * cycle_repeats)[0...length]
  end
end
