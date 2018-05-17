require_relative 'player'
require_relative 'game'

puts players = [
    Player.new('Leo', :X),
    Player.new('Gi', :O)
]

p game = Game.new(players)

puts 'Welcome to tic tac toe.'
puts "It is player one's turn."
puts game.display_board
puts 'Player one, pick a move.'
puts game.play_turn(players[0])
puts game.display_board
