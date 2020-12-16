module Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    width = LETTERS.index(letter)

    top_lines = (0..width).map do |index|
      half = (' ' * (width - index)) + LETTERS[index] + (' ' * index)
      half + half.reverse[1..-1] + "\n"
    end

    (top_lines + top_lines.reverse[1..-1]).join
  end
end
