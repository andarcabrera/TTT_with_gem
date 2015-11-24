require 'rspec'
require 'spec_helper'
require_relative '../lib/board_setup'

describe BoardSetup do

  let(:input) { double('input')}
  let(:output) { double('output', :print => nil)}
  let(:view) { double('view', :ask_for_board_setup => nil, :invalid_entry => nil)}

  let(:setup) { BoardSetup.new(input, output, view) }
  describe "#board_size" do
    it 'returns size of 9 for selection 1' do
      allow(input).to receive(:get_user_input).and_return('1')

      expect(setup.board_size).to eq(9)
    end

    it 'returns size of 16 for selection 2' do
      allow(input).to receive(:get_user_input).and_return('2')

      expect(setup.board_size).to eq(16)
    end

    it 'asks for board size selection until it receives valid input' do
      allow(input).to receive(:get_user_input).and_return('3', 'v', '1')

      expect(setup.board_size).to eq(9)
    end
  end
end