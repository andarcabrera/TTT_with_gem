require 'rspec'
require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    context 'generates a playing surface with a custom number of spots' do
      it 'creates 9 spots for a 3 row board' do
        board = Board.new(3)

        expect(board.surface.length).to eq(9)
      end

      it 'creates 16 spots for a 4 row board' do
        board = Board.new(4)

        expect(board.surface.length).to eq(16)
      end
    end
  end

  describe "#fill_spot" do
    it 'fills spot on board with marker' do
      board = Board.new(3)
      spot = '1'
      marker = 'X'
      board.fill_spot(spot, marker)

      expect(board.surface[1]).to eq('X')
    end
  end
end