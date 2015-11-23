require 'rspec'
require 'spec_helper'
require_relative '../lib/game'
require_relative '../lib/board'

describe Game do

  let(:markers) { ['X', 'Y'] }
  let(:board) { Board.new(markers) }
  let(:player1) { double('player1', :marker => 'X') }
  let(:player2) { double('player2', :marker => 'Y') }
  let(:factory) { double('factory', :players => [player1, player2]) }
  let(:view) { double('view', :board_to_s => nil, :welcome => nil, :winner_message => nil, :tied_message => nil, :spot_selection => nil, :dotted_line => nil) }
  let(:output) { double('output', :print => nil) }
  let(:g) { Game.new(:board => board, :markers => markers, :factory => factory, :view => view, :output => output) }

  describe "move" do
    it 'advance the player by placing their marker on the board' do
      allow(player1).to receive(:pick_spot).and_return('1')
      g.move(player1)

      expect(g.playing_surface[1]).to eq('X')
    end

    it 'prompts player to pick a spot until they pick a valid spot' do
      surface =  ["X", "Y", "X", "Y", "4", "5", "6", "7", "8"]
      g.set_surface(surface)
      allow(player1).to receive(:pick_spot).and_return('2', '3', '4')
      g.move(player1)

      expect(g.playing_surface[4]).to eq('X')
    end
  end

  describe '#game_over?' do
    context 'it checks if the game is finished' do
      it 'checks if the game was won by one of the players' do
         surface = ["X", "X", "X", "Y", "4", "Y", "6", "7", "8"]
         g.set_surface(surface)

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
        allow(player1).to receive(:pick_spot).and_return('0', '1', '2', '3')
        allow(player2).to receive(:pick_spot).and_return('3', '4', '5', '6')
        allow(output).to receive(:print)

        g.play_game

        expect(g.playing_surface).to eq(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
       end

       it 'prompts each player to move until the game ends in a tie' do
        allow(player1).to receive(:pick_spot).and_return('1', '4', '5', '6', '8')
        allow(player2).to receive(:pick_spot).and_return('0', '2', '3', '7')

        g.play_game

        expect(g.playing_surface).to eq(["Y", "X", "Y", "Y", "X", "X", "X", "Y", "X"])
       end
    end

    describe "#winner" do
      it 'returns the winner of the game' do
        allow(player1).to receive(:pick_spot).and_return('0', '1', '2', '3')
        allow(player2).to receive(:pick_spot).and_return('3', '4', '5', '6')
        g.play_game

        expect(g.winner).to eq(player1)
      end
    end
  end

  def tied_board
    surface = ["X", "Y", "X", "X", "Y", "Y", "Y", "X", "Y"]
    g.set_surface(surface)
  end
end