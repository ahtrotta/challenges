class Triangle
  def initialize(max_row)
    @max_row = max_row
  end

  def rows
    (1...@max_row).each_with_object([[1]]) do |_, triangle|
      triangle << ([1] + triangle.last.each_cons(2).map(&:sum) + [1])
    end
  end
end
