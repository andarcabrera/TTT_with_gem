require 'rspec'
require 'spec_helper'
require 'ttt'
require_relative '../lib/human_move'

describe HumanMove do

  let(:input) { double('input') }
  let(:output) { double('output', :move_prompt => nil, :print => nil) }
  let(:view) { double('view', :move_prompt => nil, :invalid_entry_spot => nil) }
  let(:board) { double 'board' }
  let(:human_move) { HumanMove.new(board, input, output, view) }

  describe '#pick_spot' do
    it 'picks a spot to place its marker' do
      allow(input).to receive(:get_user_input).and_return('1')
      allow(board).to receive(:available_spots).and_return(['1', '2'])

      expect(human_move.pick_spot(board)).to eq('1')
    end

    it 'requests a spot choice until a valid spot is provided' do
      allow(input).to receive(:get_user_input).and_return('1', '2', '3', '4')
      allow(board).to receive(:available_spots).and_return(['4', '5'])

      expect(human_move.pick_spot(board)).to eq('4')
    end
  end

end