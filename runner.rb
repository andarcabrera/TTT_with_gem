require 'ttt'
require_relative 'lib/console_game'
require_relative 'lib/human_move'
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
human_move = HumanMove.new(input, output, view)
ttt_game = TTT::Game.new(factoy.player, human_move, board_setup.board_size)

args = {:ttt_game => ttt_game, :input => input, :view => view, :output => output}

game = ConsoleGame.new(args)
game.play_game