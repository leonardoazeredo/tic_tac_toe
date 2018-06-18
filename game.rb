require_relative 'board'
class Game

  attr_reader :winner

  def initialize(players)
    @players = players
    @board = Board.new
    play_until_end
  end

  def play_until_end
    current_player, other_player = @players
    until @winner || !@board.spaces_left?
      play_turn(current_player)
      current_player, other_player = other_player, current_player
    end
    puts @board.display
    @winner
  end

  def play_turn(player)
    puts @board.display
    puts "It is #{player.name}'s turn."
    loop do
      target_cell = player.get_move
      break if @board.place_marker(target_cell, player.marker)
      puts 'Invalid move.'
    end
    @winner = player if @board.winner?(player)
  end
end
