require_relative 'player'
require_relative 'game'

puts players = [
  Player.new('Leo', :X),
  Player.new('Gi', :O)
]

p game = Game.new(players)
