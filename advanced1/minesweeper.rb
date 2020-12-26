class ValueError < StandardError; end

class Board
  def self.transform(input)
    fail ValueError unless valid?(input)
    mines = get_mine_locations(input)

    input.map.with_index do |row, row_idx|
      new_row = row.chars.map.with_index do |char, col_idx|
        char == ' ' ? convert_space(mines, row_idx, col_idx) : char
      end
      new_row.join
    end
  end

  def self.valid?(input)
    input.map(&:length).uniq.size == 1 &&
      input[0].match?(/\A\+-*\+\z/) &&
      input[-1].match?(/\A\+-*\+\z/) &&
      input[1..-2].all? { |row| row.match?(/\A\|[* ]+\|\z/) }
  end

  def self.get_mine_locations(input)
    input.each_with_index.with_object([]) do |(row, row_idx), result|
      row.chars.each_with_index do |char, col_idx|
        result << [row_idx, col_idx] if char == '*'
      end
    end
  end

  def self.convert_space(mines, row_idx, col_idx)
    mine_count = mines.count do |mine_row, mine_col|
      (mine_row - row_idx).abs <= 1 && (mine_col - col_idx).abs <= 1
    end
    mine_count.zero? ? ' ' : mine_count
  end
end
