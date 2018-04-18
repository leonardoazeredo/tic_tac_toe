class Board

  attr_accessor :grid

  def initialize
    @grid = [
      [:" ", :" ", :" "],
      [:" ", :" ", :" "],
      [:" ", :" ", :" "]
    ]
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