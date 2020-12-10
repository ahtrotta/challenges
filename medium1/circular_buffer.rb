class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = Array.new(size)
    @write_index = 0
    @read_index = 0
  end

  def read
    raise BufferEmptyException if empty?

    value = @buffer[@read_index]
    @buffer[@read_index] = nil
    @read_index = (@read_index + 1) % @size
    value
  end

  def write(element)
    raise BufferFullException if full?
    write!(element)
  end

  def write!(element)
    return nil if element.nil?

    @read_index = (@read_index + 1) % @size if full?
    @buffer[@write_index] = element
    @write_index = (@write_index + 1) % @size
    nil
  end
  
  def clear
    initialize(@size)
  end

  private

  def empty?
    @buffer.all?(&:nil?)
  end

  def full?
    @buffer.none?(&:nil?)
  end
end
