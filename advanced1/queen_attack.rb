class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
    @board = Array.new(8) { Array.new(8) { '_' } }
    place_queens
  end

  def to_s
    @board.map { |row| row.join(' ') }.join("\n")
  end

  def place_queens
    @board[@white[0]][@white[1]] = 'W'
    @board[@black[0]][@black[1]] = 'B'
  end

  def attack?
    (@white[0] == @black[0]) || (@white[1] == @black[1]) ||
      (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end
end
