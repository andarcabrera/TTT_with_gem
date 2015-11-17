require 'rspec'
require_relative '../lib/game'

describe Game do
  describe '#new' do
    it 'creates a new game' do
      game = Game.new

      expect(game).to be_a(Game)
    end
  end

  describe '#initialize' do
    it 'generates a playing surface with a 9 spot default' do
      game = Game.new

      expect(game.size).to eq(9)
    end
  end

end