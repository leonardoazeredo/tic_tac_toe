class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, :" ") }
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

  Board.new.print_grid
end
