class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(text)
    @rows = get_rows(text)
    @columns = get_columns(@rows)
    @saddle_points = get_saddle_points(@rows, @columns)
  end

  private

  def get_rows(text)
    text.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def get_columns(rows)
    end_index = rows.first.size
    (0...end_index).map { |index| rows.map { |row| row[index] } }
  end

  def get_saddle_points(rows, columns)
    saddle_points = []

    rows.each_with_index do |row, row_index|
      row.each_with_index do |element, column_index|
        if row.max == element && columns[column_index].min == element
          saddle_points << [row_index, column_index]
        end
      end
    end

    saddle_points
  end
end
