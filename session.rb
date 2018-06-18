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
      game = Game.new(@players)
      @last_winner = game.winner
      update_scores
      puts announce_winner
      puts score_board
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

  def update_scores
    @last_winner ? @last_winner.increment_score : @ties += 1
  end

  def announce_winner
    @last_winner ? "#{@last_winner.name} won!" : 'The game was a tie!'
  end

  def score_board
    scores_array = [
        announce_winner,
        "",
        "The score after #{games_played} games",
    ]
    scores_array.concat(
      @players.map { |player| "#{player.name} has won #{player.score} times"}
    )
    scores_array << "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times."
    scores_array << ""
  end

  def games_played
    @ties + @players.reduce(0) { |a, e| a + e.score }
  end
end
