require 'rspec'
require_relative '../lib/game'

describe Game do

  let(:markers) { ['X', 'Y'] }
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:players) { [player1, player2] }
  let(:g) { Game.new(:markers => markers, :players => players) }

  describe "#initialize" do
    it 'initializes the game with a default size of 3' do

      expect(g.size).to eq(3)
    end

    it 'initializes the game with a custom size' do
      g = Game.new(:size => 4, :markers => markers, :players => players)

      expect(g.size).to eq(4)
    end

    it 'initializes the game with markers' do

      expect(g.markers).to include('X', 'Y')
    end
  end

  describe "move" do
    it 'advance the player by placing their marker on the board' do
      allow(player1).to receive(:marker).and_return('X')
      allow(player1).to receive(:pick_spot).and_return('1')
      g.move(player1)

      expect(g.playing_surface[1]).to eq('X')
    end

    it 'prompts player to pick a spot until they pick a valid spot' do
      g.board.surface = ["X", "Y", "X", "Y", "4", "5", "6", "7", "8"]
      allow(player1).to receive(:marker).and_return('X')
      allow(player1).to receive(:pick_spot).and_return('2', '3', '4')
      g.move(player1)

      expect(g.playing_surface[4]).to eq('X')
    end
  end

  describe '#game_over?' do
    context 'it checks if the game is finished' do
      it 'checks is the game was won by one of the players' do
         g.board.surface = ["X", "X", "X", "Y", "4", "Y", "6", "7", "8"]

         expect(g.game_over?).to be true
      end

      it 'checks is the game ended in a tie' do
         tied_board

         expect(g.game_over?).to be true
      end
    end
  end

  describe "#take_turns" do
    context 'prompts each player to move until the game is over' do
      it 'prompts each player to move until the game is won by a player' do
        allow(player1).to receive(:marker).and_return('X')
        allow(player2).to receive(:marker).and_return('Y')
        allow(player1).to receive(:pick_spot).and_return('0', '1', '2', '3')
        allow(player2).to receive(:pick_spot).and_return('3', '4', '5', '6')
        g.play_game

        expect(g.playing_surface).to eq(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
       end

       it 'prompts each player to move until the game ends in a tie' do
        allow(player1).to receive(:marker).and_return('X')
        allow(player2).to receive(:marker).and_return('Y')
        allow(player1).to receive(:pick_spot).and_return('1', '4', '5', '6', '8')
        allow(player2).to receive(:pick_spot).and_return('0', '2', '3', '7')
        g.play_game

        expect(g.playing_surface).to eq(["Y", "X", "Y", "Y", "X", "X", "X", "Y", "X"])
       end
    end
  end

  def tied_board
    g.board.surface = ["X", "Y", "X", "X", "Y", "Y", "Y", "X", "Y"]
  end
end