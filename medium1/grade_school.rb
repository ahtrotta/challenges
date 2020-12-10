class School
  def initialize
    @students = Hash.new([])
  end

  def to_h
    @students.sort.to_h
  end
  
  def add(name, grade)
    @students[grade] = (@students[grade] + [name]).sort
  end

  def grade(grade)
    @students[grade]
  end
end
