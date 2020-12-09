class SecretHandshake
  MOVES = ['jump', 'close your eyes', 'double blink', 'wink']
  ZERO = %w(0 0 0 0 0)

  def initialize(input)
    @input = input
  end

  def commands
    instructions = convert_to_instructions(@input)
    reverse = (instructions.shift == '0')

    commands = MOVES.select.with_index do |_, index|
      instructions[index] == '1'
    end

    reverse ? commands.reverse : commands
  end

  private

  def convert_to_instructions(data)
    if data.is_a?(String)
      return ZERO if invalid_input?(data)
      ('%05i' % data).split('')
    elsif data.is_a?(Integer)
      binary_string = data.to_s(2)
      return ZERO if invalid_input?(binary_string)
      ('%05i' % binary_string).split('')
    else
      ZERO
    end
  end

  def invalid_input?(string)
    string.match?(/[^01]/) || string.length > 5
  end
end
