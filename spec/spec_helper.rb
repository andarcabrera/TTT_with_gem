require 'simplecov'
SimpleCov.start do
   add_filter 'spec'
 end

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/game_view'
require_relative '../lib/output'
require_relative '../lib/input'