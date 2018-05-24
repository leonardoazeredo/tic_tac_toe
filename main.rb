require_relative 'player'
require_relative 'game'

players = [
  Player.new('Leo', :X),
  Player.new('Gi', :O)
]

game = Game.new(players)

puts 'Welcome to tic tac toe.'
winner = game.play_until_end

puts "#{winner.name} won!"
