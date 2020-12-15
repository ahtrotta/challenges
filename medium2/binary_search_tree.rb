class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    if data <= @data
      @left ? @left.insert(data) : @left = self.class.new(data)
    else
      @right ? @right.insert(data) : @right = self.class.new(data)
    end
    nil
  end

  def each(&block)
    return self.to_enum unless block
    @left.each(&block) if @left
    block.call(@data)
    @right.each(&block) if @right
  end
end
