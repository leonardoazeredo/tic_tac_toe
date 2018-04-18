class Board
  attr_accessor :grid

  HEIGHT = 3
  WIDTH = HEIGHT
  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?; end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

end

def print_and_check
  @b.print_grid
  p @b.row_win?(:X)
end

@b = Board.new
@b.grid[0][0] = :X
print_and_check
@b.grid[0][1] = :X
print_and_check
@b.grid[0][2] = :X
print_and_check
