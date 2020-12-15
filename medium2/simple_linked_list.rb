class Element
  attr_reader :datum, :next

  def initialize(datum, next_node = nil)
    @datum = datum
    @next = next_node
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head
  
  def initialize
    @size = 0
  end

  def self.from_a(arr)
    new_list = self.new
    return new_list unless arr
    arr.reverse.each_with_object(new_list) { |el, list| list.push(el) }
  end

  def empty?
    @size == 0
  end

  def push(value)
    @size += 1
    @head = Element.new(value, @head)
  end

  def pop
    value = @head&.datum
    @size -= 1 if value
    @head = @head&.next
    value
  end

  def peek
    @head&.datum
  end

  def to_a
    result = []
    node = @head
    return result unless node

    loop do
      result << node.datum
      break result if node.tail?
      node = node.next
    end
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end
