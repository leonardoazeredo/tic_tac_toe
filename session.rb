require_relative 'player'
require_relative 'game'

class Session

  def initialize
    puts 'Welcome to tic tac toe.'
    @players = [
        Player.new('Leo', :X),
        Player.new('Gi', :O)
    ]
    play_a_game
  end

  def play_a_game
    game = Game.new(@players)
    winner = game.play_until_end
    if winner
      puts "#{winner.name} won!"
    else
      puts "The game was a tie!"
    end

  end

end
