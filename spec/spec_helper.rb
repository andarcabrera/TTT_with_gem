require 'simplecov'
SimpleCov.start do
   add_filter 'spec'
 end

require_relative '../lib/human_move'
require_relative '../lib/console_game'
require_relative '../lib/game_setup'
require_relative '../lib/player_factory'
require_relative '../lib/player_info'
require_relative '../lib/view'
require_relative '../lib/output'
require_relative '../lib/input'