class WordProblem
  OPERATORS = { 'plus' => :+, 'minus' => :-, 
                'multiplied' => :*, 'divided' => :/ }

  def initialize(input)
    @numbers = input.scan(/-?\d+/).map(&:to_i)
    @operations = input.scan(/plus|minus|multiplied|divided/)
    raise ArgumentError if @numbers.empty? || @operations.empty?
  end

  def answer
    value = @numbers.first
    index = 0

    loop do
      operator = OPERATORS[@operations[index]]
      value = value.send(operator, @numbers[index + 1])
      index += 1
      break value if index == (@numbers.size - 1)
    end
  end
end
