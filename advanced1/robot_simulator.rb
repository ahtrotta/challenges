class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(text)
    text.each_char.map { |instruction| INSTRUCTIONS[instruction] }
  end

  def place(robot, opts)
    robot.at(opts[:x], opts[:y]).orient(opts[:direction])
  end

  def evaluate(robot, text)
    instructions(text).each { |instruction| robot.send(instruction) }
  end
end

class Robot
  DIRECTIONS = %i(north east south west)
  ADVANCES = { north: [:y, :+], south: [:y, :-],
               east: [:x, :+], west: [:x, :-] }

  def initialize
    @x, @y = 0, 0
    @bearing_index = 0
  end

  def bearing
    DIRECTIONS[@bearing_index]
  end

  def coordinates
    [@x, @y]
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    @bearing_index = DIRECTIONS.index(direction)
    self
  end

  def at(x, y)
    @x, @y = x, y
    self
  end

  def turn_right
    @bearing_index = (@bearing_index + 1) % DIRECTIONS.size
  end

  def turn_left
    @bearing_index = (@bearing_index - 1) % DIRECTIONS.size
  end

  def advance
    coordinate, operation = ADVANCES[bearing]
    current_coordinate_value = send(coordinate)
    new_value = current_coordinate_value.send(operation, 1)
    send(coordinate.to_s + '=', new_value)
  end

  private

  attr_accessor :x, :y
end
