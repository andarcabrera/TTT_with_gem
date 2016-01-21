require 'ttt'
require_relative 'lib/game'
require_relative 'lib/players/human_player'
require_relative 'lib/players/computer_player'
require_relative 'lib/player_factory'
require_relative 'lib/player_info'
require_relative 'lib/game_setup'
require_relative 'lib/board_setup'
require_relative 'lib/input'
require_relative 'lib/output'
require_relative 'lib/view'

system( "create_db" )

input = Input.new
output = Output.new
view = View.new
setup = GameSetup.new(input, output, view)
board_setup = BoardSetup.new(input, output, view)
info = PlayerInfo.new(input, output, view, setup)
factory = PlayerFactory.new(input, output, view, info)
board = TTT::Board.new([], board_setup.board_size)

args = {:board => board, :view => view, :output => output, :factory => factory}

game = Game.new(args)
game.play_game