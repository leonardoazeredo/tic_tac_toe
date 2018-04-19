class Board
  HEIGHT = 3
  WIDTH = HEIGHT
  
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

  def diagonal_win?(marker)
    ((0...WIDTH).all? do |i|
      @grid[i][i] == marker
    end) ||
      ((0...WIDTH).all? do |i|
        @grid[i][WIDTH - 1 - i] == marker
      end)
  end

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
  puts "Row with all Xs: #{@b.row_win?(:X)}"
  puts "Row with all Os: #{@b.row_win?(:O)}"
  puts "Column with all Xs: #{@b.column_win?(:X)}"
  puts "Column with all Os: #{@b.column_win?(:O)}"
  puts "Diagonal with all Xs: #{@b.diagonal_win?(:X)}"
  puts "Diagonal with all Os: #{@b.diagonal_win?(:O)}"
end

@b = Board.new
@b.grid[0][2] = :X
print_and_check
@b.grid[1][1] = :X
print_and_check
@b.grid[2][0] = :X
print_and_check
