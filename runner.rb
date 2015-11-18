require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/input'
require_relative 'lib/output'
require_relative 'lib/game_view'

ui = UserInterface.new
output = Output.new
view = View.new
player1 = Player.new('X', ui, output, view)
player2 = Player.new('Y', ui, output, view)
players = [player1, player2]
board = Board.new(['X', 'Y'])

args = {:board => board, :markers => ['X', 'Y'], :players => players, :view => view, :output => output}

game = Game.new(args)
game.play_game