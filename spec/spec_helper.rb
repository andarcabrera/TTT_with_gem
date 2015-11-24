require 'simplecov'
SimpleCov.start do
   add_filter 'spec'
 end

require_relative '../lib/players/human_player'
require_relative '../lib/players/computer_player'
require_relative '../lib/players/player'
require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/game_setup'
require_relative '../lib/player_factory'
require_relative '../lib/player_info'
require_relative '../lib/view'
require_relative '../lib/output'
require_relative '../lib/input'