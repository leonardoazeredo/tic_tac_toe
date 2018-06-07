require_relative 'player'
require_relative 'game'

class Session
  def initialize

    @players = [
      Player.new('Leo', :X),
      Player.new('Gi', :O)
    ]
    @ties = 0
    play_loop
  end

  private

  def play_loop
    puts 'Welcome to tic tac toe.'
    loop do
      puts 'Starting a new game!'
      play_a_game
      puts display_scores
      break unless play_again?
    end
    puts 'Goodbye!'
  end

  def play_again?
    print "Play again?(y/n)\n"
    loop do
      answer = gets.strip[0].upcase
      case answer
      when 'Y'
        return true
      when 'N'
        return false
      else
        print "Invalid option!(type 'y' or 'n')"
      end
    end
  end

  def play_a_game
    game = Game.new(@players)
    winner = game.play_until_end
    if winner
      puts "#{winner.name} won!"
      winner.increment_score
    else
      puts 'The game was a tie!'
      @ties += 1
    end
    display_scores
  end

  def display_scores
    scores_array = ["","The score after #{games_played} games"]
    scores_array <<
      @players.map do |player|
        "#{player.name} has won #{player.score} times"
      end
    scores_array << "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times."
    scores_array << ""
  end

  def games_played
    @ties + @players.reduce(0) { |a, e| a + e.score }
  end
end
