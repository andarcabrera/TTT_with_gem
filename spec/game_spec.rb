require 'rspec'
require_relative '../lib/game'

describe Game do
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

      expect(game.players).to be_a(Array)
    end

    it 'updates the player array' do
      game = Game.new
      player = double 'player'
      game.add_player(player)

      expect(game.players.count).to eq(1)
    end
  end
end