class Triangle

  def initialize(rows)
    @rows = rows
    @rows_array = create_empty_array
  end

  def create_empty_array
    @rows_array = []
    @rows.times { |num| @rows_array << Array.new(num + 1) }
    @rows_array
  end


  def rows
    @rows.times do |row|
      @rows_array[row][row] = row + 1
      if row > 1
        row.times do |_row|
        @rows_array[row][row - 1] = (@rows_array[row - 1][row - 1]) +
        (@rows_array[row - 1][row - 2])

      elsif row > 0
        @rows_array[row][row - 1] = row
        @rows_array[row][row] = row
      end

    end
    @rows_array
  end

end

once = Triangle.new(4)
p once.rows
# p once.create_empty_array