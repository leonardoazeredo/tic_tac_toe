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
    [
        lambda{|i| i},
        lambda {|i| -(i+1)}
    ].any? do |proc|
      (0...HEIGHT).all? do |i|
        @grid[i][proc.call(i)] == marker

      end
    end
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

  def [](y,x)
    @grid[y][x]
  end

  def []=(y,x,something)
    if @grid[y][x] != " " && [:X,:O].include?(something)
      @grid[y][x] = something
    else
      false
    end
  end
def winner?(marker)
  row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
end
end
#
# def print_and_check
#   @b.print_grid
#   puts "Row with all Xs: #{@b.row_win?(:X)}"
#   puts "Row with all Os: #{@b.row_win?(:O)}"
#   puts "Column with all Xs: #{@b.column_win?(:X)}"
#   puts "Column with all Os: #{@b.column_win?(:O)}"
#   puts "Diagonal with all Xs: #{@b.diagonal_win?(:X)}"
#   puts "Diagonal with all Os: #{@b.diagonal_win?(:O)}"
# end
#
# @b = Board.new
# @b[0,0] = :X
# print_and_check
# @b[1,1] = :X
# print_and_check
# @b[2,2] = :X
# print_and_check
