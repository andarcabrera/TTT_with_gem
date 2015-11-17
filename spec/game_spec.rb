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

    it 'generates a custom sized playing surface' do
      game = Game.new(4)

      expect(game.size).to eq(16)
    end

    it 'keeps track of players' do
      game = Game.new
      game.add_player

      expect(game.players).to be_a(Array)
    end
  end

end