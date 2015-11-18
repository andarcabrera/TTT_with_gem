require 'rspec'
require_relative '../lib/game'

describe Game do

  let(:markers) { ['X', 'Y'] }
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:players) { [player1, player2] }

  describe "#initialize" do
    it 'initializes the game with a default size of 3' do
      g = Game.new(:markers => markers, :players => players)

      expect(g.size).to eq(3)
    end

    it 'initializes the game with a custom size' do
      g = Game.new(:size => 4, :markers => markers, :players => players)

      expect(g.size).to eq(4)
    end

    it 'initializes the game with markers' do
      g = Game.new(:size => 4, :markers => markers, :players => players)

      expect(g.markers).to include('X', 'Y')
    end
  end

  describe "move" do
    it 'advance the player by placing their marker on the board' do
      g = Game.new(:markers => markers, :players => players)
      allow(player1).to receive(:marker).and_return('X')
      allow(player1).to receive(:pick_spot).and_return('1')
      g.move(player1)

      expect(g.playing_surface[1]).to eq('X')
    end

    it 'does not advance the player if the spot selected is not available' do
      g = Game.new(:markers => markers, :players => players)
      g.board.surface = ["X", "1", "2", "3", "4", "5", "6", "7", "8"]
      allow(player1).to receive(:marker).and_return('Y')
      allow(player1).to receive(:pick_spot).and_return('0')
      g.move(player1)

      expect(g.playing_surface[0]).to eq('X')
    end

    it 'prompts player to pick a spot on the board on their turn' do
      g = Game.new(:markers => markers, :players => players)
      allow(player1).to receive(:pick_spot).and_return('2')

      expect(g.pick_spot(player1)).to eq('2')
    end
  end
end