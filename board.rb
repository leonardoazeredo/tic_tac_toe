class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, :" ") }
  end

  def row_win?
    @grid.any? do |row|
      row.all? do |cell|
        cell == :X
      end
    end
  end

  def collumn_win?; end

  def digonal_win?; end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

  b = Board.new
  b.print_grid
  b.grid[0][0] = :X
  b.print_grid
  p b.row_win?
  b.grid[0][1] = :X
  b.print_grid
  p b.row_win?
  b.grid[0][2] = :X
  b.print_grid
  p b.row_win?

end
