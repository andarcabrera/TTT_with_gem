require 'rspec'
require 'spec_helper'
require_relative '../lib/computer_player'
require_relative '../lib/board'

describe ComputerPlayer do

  let(:input) { double('input')}
  let(:output) { double('output', :print => nil)}
  let(:view) { double('view', :computer_thinking => nil)}
  let(:computer) { ComputerPlayer.new('Y', input, output, view)}
  let(:board) { Board.new(['X', 'Y']) }

  context 'it picks the best spot on the board' do
    it 'picks the winning spot if it can win in the same round' do
      board.surface = ["Y", "Y", "2", "X", "4", "5", "X", "7", "X"]

      expect(computer.pick_spot(board)).to eq("2")
    end

    it 'picks the winning spot if it can win in the same round' do
      board.surface = ["Y", "X", "2", "Y", "4", "5", "6", "7", "X"]
      board.solved_board?

      expect(computer.pick_spot(board)).to eq("6")
    end

    it 'picks the spot that would make the other player a winner' do
      board.surface = ["X", "X", "2", "Y", "4", "5", "Y", "7", "X"]

      expect(computer.pick_spot(board)).to eq("2")
    end

    it 'picks a random spot on the board if no winning combination available' do
      board.surface = ["0", "1", "2", "3", "Y", "5", "6", "7", "X"]

      expect(computer.pick_spot(board)).not_to be nil
    end

    it 'random spot is included in the available spots' do
      board.surface = ["X", "1", "2", "3", "Y", "5", "6", "X", "8"]
      available = board.available_spots
      spot = computer.pick_spot(board)

      expect(available).to include(spot)
    end

    xit 'selects spot with the best chance of winning' do
      board.surface = ["X", "Y", "2", "3", "X", "5", "6", "7", "Y"]
      expect(computer.pick_spot(board)).to eq('3')
    end
  end
end