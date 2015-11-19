require 'rspec'
require 'spec_helper'
require_relative '../lib/player'
require_relative '../lib/board'

describe Player do

  let(:input) { double('input') }
  let(:output) { double('output', :move_prompt => nil, :print => nil) }
  let(:view) { double('view', :move_prompt => nil, :invalid_spot => nil) }
  let(:player) { Player.new('X', input, output, view) }
  let(:board) { Board.new(['X', 'Y']) }

  describe '#pick_spot' do
    it 'picks a spot to place its marker' do
      allow(input).to receive(:get_user_input).and_return('1')

      expect(player.pick_spot(board)).to eq('1')
    end

    it 'picks an available spot on the board' do
      board.surface = ["X", "Y", "X", "X", "4", "5", "6", "7", "Y"]

      allow(input).to receive(:get_user_input).and_return('1', '2', '3', '4')
      expect(player.pick_spot(board)).to eq('4')
    end
  end

end