require 'simplecov'
SimpleCov.start do
   add_filter 'spec'
 end

require_relative '../lib/human_player'
require_relative '../lib/computer_player'
require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/view'
require_relative '../lib/output'
require_relative '../lib/input'