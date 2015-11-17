require 'rspec'
require_relative '../lib/board'

describe Board do

  let(:markers) { ['X', 'Y'] }

  describe '#initialize' do
    context 'generates a playing surface with a custom number of spots' do
      it 'creates 9 spots for a 3 row board' do
        board = Board.new(markers, 3)

        expect(board.surface.length).to eq(9)
      end

      it 'creates 16 spots for a 4 row board' do
        board = Board.new(markers, 4)

        expect(board.surface.length).to eq(16)
      end
    end

    context 'board is initialized with markers' do
      it 'returns the markers' do
        board = Board.new(['X', 'Y'], 3)

        expect(board.markers).to include('X', 'Y')
      end
    end
  end

  describe "#fill_spot" do
    it 'fills spot on board with marker' do
      board = Board.new(markers, 3)
      spot = '1'
      marker = 'X'
      board.fill_spot(spot, marker)

      expect(board.surface[1]).to eq('X')
    end
  end

  describe "#available_spot" do
    it 'returns true is spot is available' do
      board = Board.new(markers, 3)
      board.surface = ["X", "2", "3", "4", "5", "6", "7", "Y", "9"]

      expect(board.available_spot(2)).to be true
    end
  end
end